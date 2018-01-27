using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//这里是枚举选择敌人类型
public enum EnemyType
{
    Enemy0,
    Enemy1
}

public class AI : MonoBehaviour {
    public EnemyType enemyType = EnemyType.Enemy0;//AI类型
    private SceneController sceneController;//场记
    private GameObject player1;//玩家
    private GameObject UIPanel2;//AI属性面板
    private Factory factory;//工厂
    private int state = 0;//AI状态
    private int count = -1;//间隔时间操作
    private float AIthinkLastTime;//AI上次思考的时间
    public float step = 1;//移动速度
    private Animator AI_ani;//AI动画状态控制机

    //定义动作常量便于修改可读性
    private const int Move = 0;
    private const int Jump = 1;
    private const int Idle = 2;
    private const int Attack1 = 3;
    private const int Attack2 = 4;
    private const int Attack3 = 5;

    // Use this for initialization
    void Start () {
        sceneController = SSDirector.getInstance().currentScenceController as SceneController;//获取场记
        player1 = sceneController.GetPlayer1();//获取玩家
        UIPanel2 = sceneController.GetUIPanel2();//获取面板
        AI_ani = GetComponent<Animator>();
        factory = Singleton<Factory>.Instance;//获取工厂
	}
	
	// Update is called once per frame
	void Update () {
        UIPanel2.transform.position = new Vector3(transform.position.x + 0.5f, transform.position.y + 2.45f, transform.position.z);//角色属性面板跟随AI
        UIPanel2.transform.rotation = Camera.main.transform.rotation;//属性面板朝向摄像机
        UIPanel2.GetComponentInChildren<MyUISlider>().UpdateVal(GetComponent<Role>().hp / 100);//实时更新玩家的血量
        UIPanel2.GetComponentInChildren<MyUISlider1>().UpdateVal(GetComponent<Role>().mp / 100);//实时更新玩家的魔法值
		switch(enemyType)//根据AI类型选择不同AI策略
        {
            case EnemyType.Enemy0:
                UpdateEnemy0();
                break;
            case EnemyType.Enemy1:
                UpdateEnemy1();
                break;
        }
	}

    void UpdateEnemy0()
    {
        if(!sceneController.isGameOver())//判断是否游戏结束
        {
            if (IsAIthink())//是否AI思考
            {
                SetState();//设置状态
            }
            else
            {
                UpState();//更新状态
            }
        }
        else//游戏结束则播放休闲状态
        {
            AI_ani.Play("Idle");
            AI_ani.SetInteger("state1", 0);
        }
    }
    bool IsAIthink()
    {
        //这里表示AI每1秒进行一次思考
        if (Time.time - AIthinkLastTime >= 1.0f)
        {
            AIthinkLastTime = Time.time;//记录AI上次思考时间
            return true;
        }
        return false;
    }
    void SetState()
    {
        /*
         *通过随机数随机状态 
         */
        float R = Random.value;
        if(R < 0.75)
        {
            state = Move;
        }
        else if(R < 0.85)
        {
            state = Idle;
        }
        else if(R < 1)
        {
            state = Jump;
        }
    }
    void ChooseAttackState()
    {
        //选择攻击状态
        float R = Random.value;
        if (R < 0.1)
        {
            state = Jump;
            count = 80;
        }
        else if(R < 0.4)
        {
            state = Attack1;
            count = GetComponent<Role>().CDtime1;
        }
        else if(R < 0.7)
        {
            state = Attack2;
            count = GetComponent<Role>().CDtime2;
        }
        else
        {
            state = Attack3;
            count = GetComponent<Role>().CDtime3;
        }
    }
    void UpState()
    {
        float distance = Vector3.Distance(player1.transform.position, transform.position);//相对距离
        if(distance <= 2  && count < 0) //距离小于可攻击距离，且可进行下步操作
        {
            ChooseAttackState();
        }
        else if(count >= 0)
        {
            count--;
            return;
        }
        switch (state)
        {
            case Move:
                move();
                break;
            case Jump:
                jump();
                break;
            case Idle:
                idle();
                break;
            case Attack1:
                attack1();
                break;
            case Attack2:
                attack2();
                break;
            case Attack3:
                attack3();
                break;
        }
    }
    void UpdateEnemy1()
    {

    }
    void move()
        //移动
    {
        AI_ani.SetInteger("state", 1);
        this.transform.position = Vector3.MoveTowards(transform.position, player1.transform.position, GetComponent<Role>().speed * Time.deltaTime);
        this.transform.LookAt(player1.transform);
    }
    void jump()
    {
        //跳跃
        if(!GetComponent<Role>().isJump)
        {
            AI_ani.SetInteger("state", 1);
            this.GetComponent<Rigidbody>().AddForce(new Vector3(0, 10, 0), ForceMode.Impulse);
            GetComponent<Role>().isJump = true;
        }
    }
    void idle()
    {
        //休闲动画
        AI_ani.SetInteger("state", 0);
    }
    void attack1()
    {
        //技能1
        AI_ani.SetInteger("state", 2);
        AI_ani.Play("Attack1");
        this.transform.LookAt(player1.transform);
        GameObject Effect4 = factory.getPS(3);
        AI_ani.SetInteger("state", 0);
    }
    void attack2()
    {
        //技能2
        AI_ani.SetInteger("state", 3);
        AI_ani.Play("Attack2");
        this.transform.LookAt(player1.transform);
        GameObject Effect5 = factory.getPS(4);
        AI_ani.SetInteger("state", 0);
    }
    void attack3()
    {
        //技能3
        AI_ani.SetInteger("state", 4);
        AI_ani.Play("Attack3");
        this.transform.LookAt(player1.transform);
        GameObject Effect6 = factory.getPS(5);
        AI_ani.SetInteger("state", 0);
    }
}
