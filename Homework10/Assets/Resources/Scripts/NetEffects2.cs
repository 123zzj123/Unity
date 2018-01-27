using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;

public class NetEffects2 : PunBehaviour {

    public int insistTime = 60;//持续时间
    public float hurt;//伤害
    private bool hit = false;//是否击中
    private int count = 0;//用于计时
                          // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        count++;
        if (count == insistTime)
        {
            //重新初始化
            count = 0;
            hit = false;
            if(photonView.isMine)
            {
                StartCoroutine(EffectsNoSee());
                StartCoroutine(EffectsInactive());
            }
            //灭活
        }
    }

    void OnTriggerEnter(Collider collider)
    {
        if(photonView.isMine)
        {
            if (collider.gameObject.tag == "Player")//判断是否为角色
            {
                if (collider.gameObject.GetComponent<Role>().Type != GetComponent<NetEffects>().Type && !hit)//是否类型不匹配，未击中过
                {
                    hit = true;
                }
            }
        }
    }

    public IEnumerator EffectsNoSee()
    {
        yield return new WaitForSeconds(1f);
        this.transform.position = new Vector3(100, 100, 100);
    }

    public IEnumerator EffectsInactive()
    {
        yield return new WaitForSeconds(2f);
        this.gameObject.SetActive(false);
    }
}
