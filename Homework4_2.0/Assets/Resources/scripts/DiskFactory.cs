using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DiskData;

public class DiskFactory : MonoBehaviour
{
    private static DiskFactory _instance;
    public SceneController sceneControler { get; set; }
    public Recorder scoreRecorder;
    public GameObject diskPrefab;
    DiskData2 diskData;
    public List<GameObject> used;
    public List<GameObject> free;
    // Use this for initialization

    private void Awake()
    {
        if (_instance == null)
        {
            _instance = Singleton<DiskFactory>.Instance;
            _instance.used = new List<GameObject>();
            _instance.free = new List<GameObject>();
            diskPrefab = Instantiate(Resources.Load<GameObject>("Prefabs/disk"), new Vector3(40,0,0), Quaternion.identity);
        }
    }
    public void Start()
    {
        sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
        sceneControler.factory = this;
        scoreRecorder = sceneControler.scoreRecorder;
    }

    public GameObject getDisk(int round)
    {
        if (sceneControler.num == 31 && scoreRecorder.Score >= round * 20)
        {
            sceneControler.nextRound();
            sceneControler.num = 0;
        } 
        else if(sceneControler.num == 31 && scoreRecorder.Score < round * 20)
        {
            sceneControler.game = 2;//游戏结束
        }
        GameObject newDisk;
        if (free.Count == 0)
        {
            newDisk = GameObject.Instantiate(diskPrefab) as GameObject;
        }
        else
        {
            newDisk = free[0];
            free.Remove(free[0]);
        }
        diskData = diskPrefab.GetComponent<DiskData2>();
        newDisk.transform.localScale = new Vector3(25 * diskData.size, 25 * diskData.size, 25 * diskData.size);
        newDisk.GetComponent<Renderer>().material.color = diskData.color;
        /*
        switch (round)
        {
            case 1:
                //diskData.size = 0.8f;
                //diskData.color = Color.green;
                newDisk.transform.localScale = new Vector3(25 * diskData.size, 25 * diskData.size, 25 * diskData.size);
                newDisk.GetComponent<Renderer>().material.color = diskData.color;
                break;
            case 2:
                //diskData.size = 0.7f;
                //diskData.color = Color.yellow;
                newDisk.transform.localScale = new Vector3(25 * diskData.size, 25 * diskData.size, 25 * diskData.size);
                newDisk.GetComponent<Renderer>().material.color = diskData.color;
                break;
            case 3:
                //diskData.size = 0.6f;
                //diskData.color = Color.red;
                newDisk.transform.localScale = new Vector3(25 * diskData.size, 25 * diskData.size, 25 * diskData.size);
                newDisk.GetComponent<Renderer>().material.color = diskData.color;
                break;
        }
        */
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
                disk1.SetActive(true);
                free.Add(disk1);
            }
        }
        return;
    }
}

[SerializeField]
public class GameInfo
{
    public string version;
    public int totalRound;

    public static GameInfo CreateFromJSON(string json)
    {
        return JsonUtility.FromJson<GameInfo>(json);
    }
}

[SerializeField]
public class LevelData
{
    public float size;
    public string color;
    public float speed;

    public static LevelData CreateFromJSON(string json)
    {
        return JsonUtility.FromJson<LevelData>(json);
    }
}
