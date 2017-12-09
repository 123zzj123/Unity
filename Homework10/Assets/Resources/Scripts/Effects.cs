using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effects : MonoBehaviour {
    public float hurt;//伤害
    void Update()
    {
        GetComponent<Rigidbody>().AddForce(transform.forward * 1, ForceMode.Impulse);
    }
    void OnTriggerEnter(Collider collider)
    {
        if (collider.gameObject.tag == "Player")//判断是否为角色
        {
            if (collider.gameObject.GetComponent<Role>().Type != GetComponent<EffectsType>().Type)//是否类型不匹配
            {
                collider.gameObject.GetComponent<Role>().hp -= hurt;//掉血
                collider.gameObject.GetComponent<Rigidbody>().AddForce(-collider.gameObject.transform.forward * 5, ForceMode.Impulse);//产生向后推的力模拟受伤
                this.gameObject.SetActive(false);
            }
        }
        else
        {
            this.gameObject.SetActive(false);
        }
    }
}
