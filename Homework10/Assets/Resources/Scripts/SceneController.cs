using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SceneController : MonoBehaviour, ISceneController, IUserAction
{
    private Factory factory;//工厂
    private FileManager filemanager;//文件管理
    private GameObject player1;//玩家
    private GameObject player2;//AI
    private GameObject UIPanel1;//玩家属性面板
    private GameObject UIPanel2;//AI属性面板
    private bool gameOver = false;//游戏是否结束
    private Animator P_ani;//玩家动画控制机
    private string Player1_Path;
    private string Player2_Path;
    private string Scene_Path;
    private string Player1Doll_Path;
    private string Player2Doll_Path;
    private string Panel1_Path;
    private string Panel2_Path;
    // Use this for initialization
    void Awake()
    //创建导演实例并载入资源
    {
        SSDirector director = SSDirector.getInstance();//获取导演实例
        director.setFPS(60);
        director.currentScenceController = this;//设置场记
        factory = Singleton<Factory>.Instance;//单实例化工厂
    }
    void Start()
    {
        IniPath();
        LoadResources();//载入资源
        IniPlayer();
        Camera.main.transform.parent = player1.transform;//实现相机跟随
        P_ani = player1.GetComponent<Animator>();
        Role.destoryEvent += setGameOver;//委托，角色死亡时游戏结束
        //Debug.Log(Application.persistentDataPath);
    }

    // Update is called once per frame
    void Update()
    {
        UIPanel1.transform.position = new Vector3(player1.transform.position.x + 0.5f, player1.transform.position.y + 2.45f, player1.transform.position.z);//角色属性面板跟随玩家
        UIPanel1.transform.rotation = Camera.main.transform.rotation;//属性面板朝向摄像机
        UIPanel1.GetComponentInChildren<MyUISlider>().UpdateVal(player1.GetComponent<Role>().hp / 100);//实时更新玩家的血量
        UIPanel1.GetComponentInChildren<MyUISlider1>().UpdateVal(player1.GetComponent<Role>().mp / 100);//实时更新玩家的魔法值
        if(player1.transform.position.y <= -10)
        {
            player1.GetComponent<Role>().hp = 0;
        }
        else if (player2.transform.position.y <= -10)
        {
            player2.GetComponent<Role>().hp = 0;
        }
    }

    public void setFileManager(FileManager other)
    {
        filemanager = other;
    }
    public GameObject GetPlayer()
    {
        return player1;//返回玩家
    }
    public GameObject GetUIPanel2()
    {
        return UIPanel2;//返回面板
    }

    private void IniPath()
    {
        Player1_Path = "Prefabs/player" + PlayerPrefs.GetString("Player1_choice");
        Player2_Path = "Prefabs/player" + PlayerPrefs.GetString("Player2_choice");
        Player1Doll_Path = "Prefabs/player" + PlayerPrefs.GetString("Player1_choice") + "Doll";
        Player2Doll_Path = "Prefabs/player" + PlayerPrefs.GetString("Player2_choice") + "Doll";
        Scene_Path = "Prefabs/Scene" + PlayerPrefs.GetString("Scene_choice");
        Panel1_Path = "Prefabs/UIPanel" + PlayerPrefs.GetString("Player1_choice");
        Panel2_Path = "Prefabs/UIPanel" + PlayerPrefs.GetString("Player2_choice");
    }

    private void IniPlayer()
    {
        player1.GetComponent<Role>().Type = Roletype.player1;
        player2.GetComponent<Role>().Type = Roletype.player2;
    }
    public void Idle()
    {
        player1.GetComponent<Rigidbody>().useGravity = true;
        P_ani.SetInteger("state", 0);//播放idle动画
    }
    public void Jump()
    {
        if(!player1.GetComponent<Role>().isJump)//防止多重跳
        {
            P_ani.SetInteger("state", 1);//播放run动画
            player1.GetComponent<Rigidbody>().AddForce(new Vector3(0, 10, 0), ForceMode.Impulse);//向上的力
            player1.GetComponent<Role>().isJump = true;
        }
    }
    public void move(float dis)
    {
        player1.transform.Translate(new Vector3(0, 0, dis * player1.GetComponent<Role>().speed / 10));
        if (dis != 0)
        P_ani.SetInteger("state", 1);//播放跑步动画
    }
    void setGameOver()
        //设置游戏结束
    {
        gameOver = true;
        if(player1.GetComponent<Role>().hp <= 0)//玩家死亡
        {
            Instantiate(Resources.Load(Player1Doll_Path), new Vector3(player1.transform.position.x, player1.transform.position.y, player1.transform.position.z), player1.transform.rotation);
            //实例化布娃娃系统模拟死亡效果
            Camera.main.transform.parent = null;//取消摄像机跟随
            player1.SetActive(false);//灭活原本的玩家
        }
        else//AI死亡
        {
            Instantiate(Resources.Load(Player2Doll_Path), new Vector3(player2.transform.position.x, player2.transform.position.y, player2.transform.position.z), player2.transform.rotation);
            //实例化布娃娃系统模拟死亡效果
            player2.SetActive(false);
            //灭活AI
            P_ani.Play("Idle");
            P_ani.SetInteger("state", 0);
            //玩家播放idle动画
        }
        Debug.Log("gameOver");
    }
    public bool isGameOver()
    {
        return gameOver;
    }
    public void turn(float offsetY)
    {
        float y = player1.transform.eulerAngles.y + offsetY * 2;
        player1.transform.eulerAngles = new Vector3(0, y, 0);//改变玩家角度实现转向
    }
    public void Attack1()
    {
        AnimatorStateInfo stateinfo = P_ani.GetCurrentAnimatorStateInfo(0);
        if (player1.GetComponent<Role>().mp >= 5 && !stateinfo.IsName("Base Layer.Attack1"))
            //魔法值足够且攻击完毕
        {
            P_ani.SetInteger("state", 2);
            P_ani.Play("Attack1", 0);
            //播放攻击1动画
            player1.GetComponent<Role>().mp -= 5;//魔法值减
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect1 = factory.getPS(0);
        }
    }

    public void Attack2()
    {
        AnimatorStateInfo stateinfo = P_ani.GetCurrentAnimatorStateInfo(0);
        if (player1.GetComponent<Role>().mp >= 5 && !stateinfo.IsName("Base Layer.Attack2"))
        //魔法值足够且攻击完毕
        {
            P_ani.SetInteger("state", 3);
            P_ani.Play("Attack2", 0);
            //播放攻击2动画
            player1.GetComponent<Role>().mp -= 5;//魔法值减
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect2 = factory.getPS(1);
        }
    }
    public void Attack3()
    {
        AnimatorStateInfo stateinfo = P_ani.GetCurrentAnimatorStateInfo(0);
        if (player1.GetComponent<Role>().mp >= 10 && !stateinfo.IsName("Base Layer.Attack3"))
        //魔法值足够且攻击完毕
        {
            P_ani.SetInteger("state", 4);
            P_ani.Play("Attack3", 0);
            //播放攻击3动画
            player1.GetComponent<Role>().mp -= 10;//魔法值减
            /*
             * 获取特效并且定位释放
             */
            GameObject Effect3 = factory.getPS(2);
        }
    }
    public void LoadResources()
    {
        player1  = Instantiate(Resources.Load(Player1_Path)) as GameObject;//实例化玩家
        player1.transform.position = new Vector3(0, 0, 0);
        player1.GetComponent<AI>().enabled = false;
        player2 = Instantiate(Resources.Load(Player2_Path)) as GameObject;//实例化AI
        player2.transform.position = new Vector3(5, 0, 5);
        //player2 = Instantiate(filemanager.role.LoadAsset<GameObject>("player2"));//实例化AI
        Instantiate(Resources.Load(Scene_Path));//实例化场景
        //UIPanel1 = Instantiate(filemanager.panel.LoadAsset<GameObject>("UIPanel1"), new Vector3(player1.transform.position.x, player1.transform.position.y, player1.transform.position.z), Quaternion.identity);
        UIPanel1 = Instantiate(Resources.Load(Panel1_Path), new Vector3(player1.transform.position.x + 0.5f,player1.transform.position.y + 2.45f,player1.transform.position.z), Quaternion.identity) as GameObject;
        //UIPanel2 = Instantiate(filemanager.panel.LoadAsset<GameObject>("UIPanel2"), new Vector3(player2.transform.position.x, player2.transform.position.y, player2.transform.position.z), Quaternion.identity);
        UIPanel2 = Instantiate(Resources.Load(Panel2_Path), new Vector3(player2.transform.position.x + 0.5f, player2.transform.position.y + 2.45f, player2.transform.position.z), Quaternion.identity) as GameObject;
    }
}
