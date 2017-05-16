using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GenGameObect : MonoBehaviour,ISceneController,IUserAction{
    public SSActionManager actionManager { get; set; }
    public  GameObject[] priests_start = new GameObject[3];
    public GameObject[] priests_end = new GameObject[3];
    public GameObject[] devils_start = new GameObject[3];
    public GameObject[] devils_end = new GameObject[3];
    //用栈存储在两岸的牧师与魔鬼的gameobject
    public GameObject[] boat = new GameObject[2];
    //用数组存储在船上的gameobject
    public GameObject boat_obj;
    //获取船的gameobject
    public Vector3 shoreStartPos = new Vector3(-14, 0, 39.5f);
    //起点的岸的坐标
    public Vector3 shoreEndPos = new Vector3(-14, 0, -22.6f);
    //终点的岸的坐标
    public Vector3 boatStartPos = new Vector3(-14, 0, 22.7f);
    public Vector3 boatEndPos = new Vector3(-14, 0, -5.3f);
    //记录船的两个位置
    public float gap = 2.0f;
    public int boatCapacity = 2;
    //纪录船的容量
    public int boat_position = 0;
    //纪录船的位置
    public int game = 0;
    public int find = 0;

    public Vector3 priestStartPos = new Vector3(-14, 2.2f, 31);
    public Vector3 priestEndPos = new Vector3(-14, 2.2f, -16f);
    public Vector3 devilStartPos = new Vector3(-14, 2, 37);
    public Vector3 devilEndPos = new Vector3(-14, 2, -22f);

    public Vector3 waterPos = new Vector3(0,0,0);
    public Vector3 waterPos1 = new Vector3(50,0,0); 

    void Awake()
    //创建导演实例并载入资源
    {
        SSDirector director = SSDirector.getInstance();
        director.setFPS(60);
        director.currentScenceController = this;
        director.currentScenceController.LoadResources();
    }

    public void LoadResources()
    //载入资源
    {
        // shore  
        Instantiate(Resources.Load("prefabs/begin"), shoreStartPos, Quaternion.identity);
        Instantiate(Resources.Load("prefabs/end"), shoreEndPos, Quaternion.identity);
        Instantiate(Resources.Load("prefabs/water"), waterPos, Quaternion.identity);
        Instantiate(Resources.Load("prefabs/water"), waterPos1, Quaternion.identity);
        // boat  
        boat_obj = Instantiate(Resources.Load("prefabs/Capsule"), boatStartPos, Quaternion.identity) as GameObject;
        // priests & devils  
        for (int i = 0; i < 3; ++i)
        {
            priests_start[i] = (Instantiate(Resources.Load("prefabs/Priest")) as GameObject);
            priests_end[i] = null;
            devils_start[i] = (Instantiate(Resources.Load("prefabs/Devil")) as GameObject);
            devils_end[i] = null;
        }
    }

    void setCharacterPositions(GameObject[] array, Vector3 pos)
    //设置人物位置
    {
        for (int i = 0; i < 3; ++i)
        {
            if(array[i] != null)
            array[i].transform.position = new Vector3(pos.x, pos.y, pos.z + gap * i);
        }
    }

    public void Restart()
    {
        SceneManager.LoadScene("task2");
    }

    public void ShowDetail()
    {
        GUI.Label(new Rect(220, 20, 350, 250), "Priests and Devils is a puzzle game in which you will help the Priests and Devils to cross the river. There are 3 priests and 3 devils at one side of the river. They all want to get to the other side of this river, but there is only one boat and this boat can only carry two persons each time. And there must be one person steering the boat from one side to the other side. In the flash game, you can click on them to move them and click to move the boat to the other direction. If the priests are out numbered by the devils on either side of the river, they get killed and the game is over. You can try it in many ways. Keep all priests alive! Good luck!");
    }

    public void Pause()
    {
        if (game == 0)
        {
            game = 3;
        }
        else if(game == 3)
        {
            game = 0;
        }
    }

    private void OnGUI()
    {
        GUIStyle fontstyle1 = new GUIStyle();
        fontstyle1.fontSize = 50;
        fontstyle1.normal.textColor = new Color(255, 255, 255);
        if (game == 1)
        {
            GUI.Label(new Rect(260, 180, 100, 100), "YOU LOSE!!!", fontstyle1);
        }
        else if(game == 2)
        {
            GUI.Label(new Rect(260, 180, 100, 100), "YOU WIN!!!", fontstyle1);
        }
    }
    public void check()
    //检查游戏是否结束
    {
        int priests_s = 0, devils_s = 0, priests_e = 0, devils_e = 0;
        for(int i = 0; i < 3; i++)
        {
            if(priests_start[i] != null)
            {
                priests_s++;
            }
            if(devils_start[i] != null)
            {
                devils_s++;
            }
            if(priests_end[i] != null)
            {
                priests_e++;
            }
            if(devils_end[i] != null)
            {
                devils_e++;
            }
        }
        if(((priests_s < devils_s) && (priests_s != 0))||((priests_e < devils_e) && (priests_e != 0)))
        {
            print("you lose");
            game = 1;
        }
        else if (priests_s == 0 && devils_s == 0)
        {
            print("you win!!!");
            game = 2;
        }
    }
    // Use this for initialization
    void Start () {
        
    }
	
	// Update is called once per frame
	void Update () {
        setCharacterPositions(priests_start, priestStartPos);
        setCharacterPositions(priests_end, priestEndPos);
        setCharacterPositions(devils_start, devilStartPos);
        setCharacterPositions(devils_end, devilEndPos);
    }
}
