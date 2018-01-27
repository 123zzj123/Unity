using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;

public class NetEffects1 : PunBehaviour {

    public float hurt;//伤害
    void Update()
    {
        if(photonView.isMine)
        GetComponent<Rigidbody>().AddForce(transform.forward * 1, ForceMode.Impulse);
    }
    void OnTriggerEnter(Collider collider)
    {
        if(photonView.isMine)
        {
            if (collider.gameObject.tag == "Player")//判断是否为角色
            {
                if (collider.gameObject.GetComponent<Role>().Type != GetComponent<NetEffects>().Type)//是否类型不匹配
                {
                    StartCoroutine(EffectsNoSee());
                    StartCoroutine(EffectsInactive());
                }
            }
            else
            {
                StartCoroutine(EffectsNoSee());
                StartCoroutine(EffectsInactive());
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
