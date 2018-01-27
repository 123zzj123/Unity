using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;
using UnityEngine.UI;
using System;

public class PlayerManager : PunBehaviour,IPunObservable {
    public GameObject PlayerUiPrefab;
    public float PlayerHp = 100;//生命值
    public float PlayerMp = 100;//魔法值
    public Roletype roleType;
    public String PlayerDoll_Path;
    private List<GameObject>[] PS = new List<GameObject>[3];
    private string[] EffectName = new string[3];
    private Animator animator;
    private Rigidbody rigbody;
    private Role role;
    private bool isDead = false;
    private int count = -1;//间隔时间操作
    // Use this for initialization
    void Start () {
        Debug.Log(PlayerDoll_Path);
        CameraWork _cameraWork = this.GetComponent<CameraWork>();
        animator = this.GetComponent<Animator>();
        rigbody = this.GetComponent<Rigidbody>();
        if (role == null)
        {
            role = this.GetComponent<Role>();
        }
        if (_cameraWork != null)
        {
            if (photonView.isMine)
            {
                _cameraWork.OnStartFollowing(role.LocalPos);
            }
        }
        else
        {
            Debug.LogError("<Color=Red><b>Missing</b></Color> CameraWork Component on player Prefab.", this);
        }

        // Create the UI
        if (this.PlayerUiPrefab != null)
        {
            GameObject _uiGo = Instantiate(this.PlayerUiPrefab) as GameObject;
            _uiGo.SendMessage("SetTarget", this, SendMessageOptions.RequireReceiver);
        }
        else
        {
            Debug.LogWarning("<Color=Red><b>Missing</b></Color> PlayerUiPrefab reference on player Prefab.", this);
        }

        if (photonView.isMine)
        {
            for(int i = 0; i < 3; i++)
            {
                PS[i] = new List<GameObject>();
            }
            if(PlayerPrefs.GetInt("ID") == 1)
            {
                this.photonView.RPC("SetType", PhotonTargets.All, 1);
            }
            else
            {
                this.photonView.RPC("SetType", PhotonTargets.All, 2);
            }
            IniEffectName();
        }
    }
	
	// Update is called once per frame
	void Update () {
        if (photonView.isMine && !isDead)
        {
            if (count >= 0)
            {
                count--;
            }
            this.ProcessInputs();
            PlayerHp = role.hp;
            PlayerMp = role.mp;
            if(this.transform.position.y <= -10)
            {
                this.PlayerHp = 0;
                role.hp = 0;
            }
            if (this.PlayerHp <= 0f)
            {
                this.photonView.RPC("Dead", PhotonTargets.All, null);
            }
        }
    }

    public void ProcessInputs()
    {
        float dis = Input.GetAxis("Vertical");//获取垂直轴的常量，目的在于控制玩家前进后退
        float offsetY = Input.GetAxis("Horizontal");//获取水平轴上的增量，目的在于控制玩家角色的转向
        if (Input.GetKeyDown(KeyCode.J))//J键攻击技能1
        {
            Attack1();
        }
        else if (Input.GetKeyDown(KeyCode.K))//K键攻击技能2
        {
            Attack2();
        }
        else if (Input.GetKeyDown(KeyCode.L))//L键攻击技能3
        {
            Attack3();
        }
        else if (dis == 0 && offsetY == 0)//不移动则休闲状态
        {
            Idle();
        }

        move(dis);
        turn(offsetY);

        if (Input.GetKeyDown(KeyCode.Space))//空格键跳跃
        {
            Jump();
        }
    }

    public void Idle()
    {
        rigbody.useGravity = true;
        animator.SetInteger("state", 0);//播放idle动画
    }
    public void Jump()
    {
        if (!role.isJump)//防止多重跳
        {
            animator.SetInteger("state", 1);//播放run动画
            rigbody.AddForce(new Vector3(0, 10, 0), ForceMode.Impulse);//向上的力
            role.isJump = true;
        }
    }
    public void move(float dis)
    {
        transform.Translate(new Vector3(0, 0, dis * role.speed / 10));
        if (dis != 0)
            animator.SetInteger("state", 1);//播放跑步动画
    }

    public void turn(float offsetY)
    {
        float y = transform.eulerAngles.y + offsetY * 2;
        transform.eulerAngles = new Vector3(0, y, 0);//改变玩家角度实现转向
    }
    public void Attack1()
    {
        AnimatorStateInfo stateinfo = animator.GetCurrentAnimatorStateInfo(0);
        if (role.mp >= 5 && count < 0)
        //魔法值足够且攻击完毕
        {
            this.photonView.RPC("SetAttack1State", PhotonTargets.All, null);
            //播放攻击1动画
            role.mp -= 5;//魔法值减
            count = role.CDtime1;
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect1 = getPS(0);
            Effect1.GetComponent<NetEffects>().SetType(roleType);
            //GameObject Effect1 = factory.getPS(0);
        }
    }

    public void Attack2()
    {
        AnimatorStateInfo stateinfo = animator.GetCurrentAnimatorStateInfo(0);
        if (role.mp >= 5 && count < 0)
        //魔法值足够且攻击完毕
        {
            this.photonView.RPC("SetAttack2State", PhotonTargets.All, null);
            //播放攻击2动画
            role.mp -= 5;//魔法值减
            count = role.CDtime2;
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect2 = getPS(1);
            Effect2.GetComponent<NetEffects>().SetType(roleType);
            //GameObject Effect2 = factory.getPS(1);
        }
    }

    public void Attack3()
    {
        AnimatorStateInfo stateinfo = animator.GetCurrentAnimatorStateInfo(0);
        if (role.mp >= 10 && count < 0)
        //魔法值足够且攻击完毕
        {
            this.photonView.RPC("SetAttack3State", PhotonTargets.All, null);
            //播放攻击3动画
            role.mp -= 10;//魔法值减
            count = role.CDtime3;
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect3 = getPS(2);
            Effect3.GetComponent<NetEffects>().SetType(roleType);

            //GameObject Effect3 = factory.getPS(2);
        }
    }

    public void IniEffectName()
    {
        int EffectNum;
        if (PlayerPrefs.GetInt("ID") == 1)
        {
            EffectNum = int.Parse(PlayerPrefs.GetString("Player1_choice"));
            EffectNum = (EffectNum - 1) * 3 + 1;
        }
        else
        {
            EffectNum = int.Parse(PlayerPrefs.GetString("Player2_choice"));
            EffectNum = (EffectNum - 1) * 3 + 1;
        }
        for (int i = 0; i < 3; i++)
        {
            EffectName[i] = "NetEffects" + EffectNum;
            EffectNum++;
        }
    }

    public GameObject getPS(int ID)
    {
        for (int i = 0; i < PS[ID].Count; i++)
        {
            if (!PS[ID][i].gameObject.activeSelf)
            {
                PS[ID][i].gameObject.SetActive(true);
                PS[ID][i].GetComponent<Rigidbody>().velocity = Vector3.zero;                
                return PS[ID][i];
            }
        }
        GameObject newPs = PhotonNetwork.Instantiate(EffectName[ID], this.transform.position, Quaternion.identity, 0);
        PS[ID].Add(newPs);
        return newPs;
    }

    [PunRPC]
    public void Dead()
    {
        isDead = true;
        NetSceneController.Instance.setGameOver();
        Camera.main.transform.parent = null;
        Instantiate(Resources.Load(PlayerDoll_Path), new Vector3(this.transform.position.x, this.transform.position.y, this.transform.position.z), this.transform.rotation);
        this.gameObject.SetActive(false);
    }

    void OnTriggerEnter(Collider collider)
    {
        if(photonView.isMine)
        {
            if(collider.gameObject.tag == "Effects")
            {
                if (collider.gameObject.GetComponent<NetEffects>().Type != roleType)//是否类型不匹配
                {
                    if(collider.gameObject.GetComponent<NetEffects1>() != null)
                    {
                        role.hp -= collider.gameObject.GetComponent<NetEffects1>().hurt;
                    }
                    else
                    {
                        role.hp -= collider.gameObject.GetComponent<NetEffects2>().hurt;
                    }
                    GetComponent<Rigidbody>().AddForce(-transform.forward * 5, ForceMode.Impulse);//产生向后推的力模拟受伤
                }
            }
        }
    }

    [PunRPC]
    public void SetAttack1State()
    {
        animator.SetInteger("state", 2);
        animator.Play("Attack1", 0);
    }

    [PunRPC]
    public void SetAttack2State()
    {
        animator.SetInteger("state", 3);
        animator.Play("Attack2", 0);
    }

    [PunRPC]
    public void SetAttack3State()
    {
        animator.SetInteger("state", 4);
        animator.Play("Attack3", 0);
    }
    [PunRPC]
    public void SetType(int num)
    {
        if(num == 1)
        {
            if(role == null)
            {
                role = this.GetComponent<Role>();
            }
            roleType = Roletype.player1;
            role.Type = Roletype.player1;
        }
        else
        {
            if (role == null)
            {
                role = this.GetComponent<Role>();
            }
            roleType = Roletype.player2;
            role.Type = Roletype.player2;
        }
    }

    public void OnPhotonSerializeView(PhotonStream stream, PhotonMessageInfo info)
    {
        if (stream.isWriting)
        {
            // We own this player: send the others our data
            stream.SendNext(this.PlayerHp);
            stream.SendNext(this.PlayerMp);
        }
        else
        {
            // Network player, receive data
            this.PlayerHp = (float)stream.ReceiveNext();
            this.PlayerMp = (float)stream.ReceiveNext();
        }
    }
}
