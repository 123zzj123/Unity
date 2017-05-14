﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SceneController : MonoBehaviour, ISceneController, IUserAction
{
    public IActionManager actionManager { get; set; }
    public DiskFactory factory { get; set; }
    public Recorder scoreRecorder { get; set; }
    public int round = 0;//轮数
    public Text RoundText;//轮数文本
    public Text GameText;//倒计时文本
    public Text FinalText;//结束文本
    public int game = 0;//记录游戏进行情况
    public int num = 0;//每轮的飞碟数量
    GameObject explosion;//爆炸效果
    public int CoolTimes = 3; //准备时间
    // Use this for initialization
    void Awake()
    //创建导演实例并载入资源
    {
        SSDirector director = SSDirector.getInstance();
        director.setFPS(60);
        director.currentScenceController = this;
        director.currentScenceController.LoadResources();
    }
    void Start()
    {
        round = 1;
    }

    // Update is called once per frame
    void Update()
    {
        RoundText.text = "Round:" + round.ToString();
        if(game == 2)
        {
            GameOver();
        }
    }
    public IEnumerator waitForOneSecond()
    {
        while (CoolTimes >= 0 && game == 3)
        {
            GameText.text = CoolTimes.ToString();
            print("还剩" + CoolTimes);
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        GameText.text = "";
        game = 1;
    }
    public void GameOver()
    {
        FinalText.text = "Game Over!!!";
    }
    public void StartGame()
    {
        num = 0;
        if (game == 0)
        {
            game = 3;
            StartCoroutine(waitForOneSecond());
        }
    }
    public void ReStart()
    {
        SceneManager.LoadScene("task1");
        game = 0;
    }
    public void ShowDetail()
    {
        GUI.Label(new Rect(220, 50, 350, 250), "Use your mouse click disk, you will get 1 point for green Disk，2 for yellow Disk，3 for red Disk,you should get 20 points to pass round1,40 to pass round2,60 to pass round3.There are three round.Good Luck!!!");
    }
    public void hit()
    {
        if (game == 1)
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                if (hit.transform.tag == "Disk")
                {
                    explosion.transform.position = hit.collider.gameObject.transform.position;
                    explosion.GetComponent<Renderer>().material = hit.collider.gameObject.GetComponent<Renderer>().material;
                    explosion.GetComponent<ParticleSystem>().Play();
                    hit.collider.gameObject.SetActive(false);
                    print("Hit!!!");
                    hit.collider.gameObject.GetComponent<DiskData2>().hit = true;
                    scoreRecorder.add();
                }
            }
        }
    }
    public void LoadResources()
    {
        explosion = Instantiate(Resources.Load("prefabs/Explosion"), new Vector3(-40, 0, 0), Quaternion.identity) as GameObject;
        Instantiate(Resources.Load("prefabs/Light"));
    }
}

