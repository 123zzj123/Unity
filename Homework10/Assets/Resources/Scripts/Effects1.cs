using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effects1 : MonoBehaviour {
    public int insistTime = 60;//持续时间
    public float hurt;//伤害
    private bool hit = false;//是否击中
    private int count = 0;//用于计时
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        count++;
        if(count == insistTime)
        {
            //重新初始化
            count = 0;
            hit = false;
            this.gameObject.SetActive(false);
            //灭活
        }
    }

    void OnTriggerEnter(Collider collider)
    {
        if(collider.gameObject.tag == "Player")//判断是否为角色
        {
            if (collider.gameObject.GetComponent<Role>().Type != GetComponent<EffectsType>().Type && !hit)//是否类型不匹配，未击中过
            {
                hit = true;
                collider.gameObject.GetComponent<Role>().hp -= hurt;//掉血
                collider.gameObject.GetComponent<Rigidbody>().AddForce(-collider.gameObject.transform.forward * 5, ForceMode.Impulse);//产生向后推的力模拟受伤
            }
        }
    }
}
