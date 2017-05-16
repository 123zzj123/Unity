using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DiskData;

public class DiskFactory : System.Object
{
    private static DiskFactory _instance;
    public SceneController sceneControler { get; set; }
    public List<GameObject> used;
    public List<GameObject> free;
    // Use this for initialization

    public static DiskFactory getInstance()
    {
        if (_instance == null)
        {
            _instance = new DiskFactory();
            _instance.used = new List<GameObject>();
            _instance.free = new List<GameObject>();
        }
        return _instance;
    }

    public GameObject getDisk(int round)
    {
        if (sceneControler.num == 31 && sceneControler.Score >= round * 20)
        //每轮总共发射30个，如果得分达到一定要求进入下一轮，否则GameOver
        {
            sceneControler.round++;
            sceneControler.num = 0;
        } 
        else if(sceneControler.num == 31 && sceneControler.Score < round * 20)
        {
            sceneControler.game = 2;//游戏结束
        }

        GameObject newDisk;
        if (free.Count == 0)
        {
            newDisk = GameObject.Instantiate(Resources.Load("prefabs/Disk")) as GameObject;
            Debug.Log("111");
        }
        else
        {
            newDisk = free[0];
            free.Remove(free[0]);
        }
        switch (round)
        //根据轮数制定飞碟的颜色和大小
        {
            case 1:
                newDisk.transform.localScale = new Vector3(DiskData.round1.size, DiskData.round1.size, DiskData.round1.size);
                newDisk.GetComponent<Renderer>().material.color = DiskData.round1.color;
                break;
            case 2:
                newDisk.transform.localScale = new Vector3(DiskData.round2.size, DiskData.round2.size, DiskData.round2.size);
                newDisk.GetComponent<Renderer>().material.color = DiskData.round2.color;
                break;
            case 3:
                newDisk.transform.localScale = new Vector3(DiskData.round3.size, DiskData.round3.size, DiskData.round3.size);
                newDisk.GetComponent<Renderer>().material.color = DiskData.round3.color;
                break;
        }
        used.Add(newDisk);
        return newDisk;
    }

    public void freeDisk(GameObject disk1)
    {
        for (int i = 0; i < used.Count; i++)
        {
            if (used[i] == disk1)
            {
                used.Remove(disk1);
                disk1.SetActive(true);//被鼠标击中的disk设置为false，所以这里全部激活一遍
                free.Add(disk1);
            }
        }
        return;
    }
}
