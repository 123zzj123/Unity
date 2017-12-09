using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UISceneController : MonoBehaviour, ISceneController
{
    public GameObject MainMenu;
    private int playerNum = 4;
    private int sceneNum = 8;
    public GameObject[] PlayerData;
    public Sprite[] Player;
    public Sprite[] Scene;
    void Awake()
    //创建导演实例并载入资源
    {
        SSDirector director = SSDirector.getInstance();//获取导演实例
        director.setFPS(60);
        director.currentScenceController = this;//设置场记
    }
    // Use this for initialization
    void Start () {
        PlayerData = new GameObject[playerNum];
        Player = new Sprite[playerNum];
        Scene = new Sprite[sceneNum];
        LoadResources();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void LoadResources()
    {
        for(int i = 1; i <= playerNum; i++)
        {
            Player[i - 1] = Instantiate(Resources.Load<Sprite>("Texture/Player" + i));
            PlayerData[i - 1] = Instantiate(Resources.Load("Prefabs/Player" + i + "Data")) as GameObject;
        }
        for(int i = 1; i <= sceneNum; i++)
        {
            Scene[i - 1] = Instantiate(Resources.Load<Sprite>("Texture/Scene" + i));
        }
    }
}
