using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Role : MonoBehaviour {
    public delegate void destroy();//死亡毁灭委托
    public static event destroy destoryEvent;//事件
    public Roletype Type;//玩家类型
    public int recoverTime;//魔法值恢复时间
    public bool isJump = false;//判断角色是否跳跃中
    public int CDtime1;
    public int CDtime2;
    public int CDtime3;
    public float speed;
    private int count = 0;//用于计时
    private float Hp = 100;//生命值
    private float Mp = 100;//魔法值
    public float hp
    {
        get
        {
            return Hp;
        }
        set
        {
            Hp = value < 0 ? 0:value;
        }
    }
    public float mp
    {
        get
        {
            return Mp;
        }
        set
        {
            Mp = value < 0 ? 0 : value;
            Mp = value > 100 ? 100 : value;
        }
    }
	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
        count++;
        if(count >= recoverTime)
        {
            count = 0;
            Mp += 2;//魔法值恢复
        }

        if(Hp <= 0)
        {
            if(destoryEvent != null)
            {
                destoryEvent();//死亡事件
            }
        }
	}

    // 碰撞开始    
    void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.tag == "plane")//碰撞的是plane    
        {
            isJump = false;
        }
    }
}
