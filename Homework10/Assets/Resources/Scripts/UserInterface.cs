using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IUserAction
    //用户接口
{
    void Idle();//休闲状态
    void Jump();//跳跃状态
    void move(float dis);//移动状态
    void turn(float offsetY);//转弯
    void Attack1();//技能1
    void Attack2();//技能2
    void Attack3();//技能3
    bool isGameOver();//是否游戏结束
}
public class UserInterface : MonoBehaviour {
    private IUserAction action;
    // Use this for initialization
    void Start () {
        action = SSDirector.getInstance().currentScenceController as IUserAction;
    }
	
	// Update is called once per frame
	void Update () {
		if(!action.isGameOver())
        {
            float dis = Input.GetAxis("Vertical");//获取垂直轴的常量，目的在于控制玩家前进后退
            float offsetY = Input.GetAxis("Horizontal");//获取水平轴上的增量，目的在于控制玩家角色的转向
            if (Input.GetKeyDown(KeyCode.J))//J键攻击技能1
            {
                action.Attack1();
            }
            else if (Input.GetKeyDown(KeyCode.K))//K键攻击技能2
            {
                action.Attack2();
            }
            else if (Input.GetKeyDown(KeyCode.L))//L键攻击技能3
            {
                action.Attack3();
            }
            else if(dis == 0 && offsetY == 0)//不移动则休闲状态
            {
                action.Idle();
            }

            action.move(dis);
            action.turn(offsetY);

            if(Input.GetKeyDown(KeyCode.Space))//空格键跳跃
            {
                action.Jump();
            }
        }
	}
}
