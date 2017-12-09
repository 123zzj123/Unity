using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.IO;

public class SceneController : MonoBehaviour, ISceneController, IUserAction
{
    public SSActionManager actionManager { get; set; }
    public DiskFactory factory { get; set; }
    public Recorder scoreRecorder { get; set; }
    public FileManager fileManager { get; set; }
    public UpdateManager updateManager { get; set; }
    public int round = 0;//轮数
    public Text RoundText;//轮数文本
    public Text GameText;//倒计时文本
    public Text FinalText;//结束文本
    public int game = 0;//记录游戏进行情况
    public int num = 0;//每轮的飞碟数量
    public string _version;//版本号
    public int _totalRound;//总共轮数
    GameObject explosion;//爆炸效果
    public int CoolTimes = 3; //准备时间
    private bool completeLoad = true;
    private bool updateFile = false;
    private GameInfo UpdateData;
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
        checkUpdate();
        nextRound();
    }

    // Update is called once per frame
    void Update()
    {
        if (updateFile)
        {
            Debug.Log("更新中");
        }
        RoundText.text = "Round:" + round.ToString();
        if(game == 2)
        {
            GameOver();
        }
    }

    public void nextRound()
    {
        if(++round > _totalRound)
        {
            round = 1;
        }
        string file = "Disk_Level_" + round.ToString() + ".json";
        fileManager.loadLevelJson(file);
    }

    public void checkUpdate()
    {
        string checkUrl = "http://localhost:1337/";
        this.StartCoroutine(checkVersion(checkUrl));
    }

    IEnumerator checkVersion(string url)
    {
        WWW www = new WWW(url);
        yield return www;
        Debug.Log(www.text.ToString());
        if (_version != www.text.ToString() && www.text.ToString() != "")
        {
            updateManager.OpenPanel();
        }
    }
    public void Update1()
    {
        StartCoroutine(UpdateVersion());
    }
    IEnumerator UpdateVersion()
    {
        completeLoad = false;
        updateFile = true;
        string updateUrl = "http://localhost:1337/version"; 
        loadJson(updateUrl);
        while (!completeLoad)
        {
            yield return null;
        }
        this.StartCoroutine(writeFile());
    }
    void loadJson(string url)
    {
        this.StartCoroutine(getData(url));
    }

    IEnumerator getData(string url)
    {
        WWW www = new WWW(url);
        yield return www;
        string json = www.text.ToString();
        GameInfo data = GameInfo.CreateFromJSON(json);
        UpdateData = data;
        _version = data.version;
        _totalRound = data.totalRound;
        completeLoad = true;
    }

    public void stageGameInfo(string json)
    {
        UpdateData = GameInfo.CreateFromJSON(json);
        _version = UpdateData.version;
        _totalRound = UpdateData.totalRound;
    }

    IEnumerator writeFile()
    {
        string jsonUrl = "Assets/Data/Game_Info.json";
        StreamWriter sw;
        sw = new StreamWriter(jsonUrl, false);
        string json = JsonUtility.ToJson(UpdateData);
        sw.WriteLine(json);
        sw.Close();
        sw.Dispose();
        yield return null;
        updateFile = false;
    }


    public void stageLevel(string json)
    {
        LevelData data = LevelData.CreateFromJSON(json);
        Color _color;
        if (!ColorUtility.TryParseHtmlString(data.color, out _color))
        {
            _color = Color.gray;
        }
        factory.diskPrefab.GetComponent<DiskData2>().color = _color;
        factory.diskPrefab.GetComponent<DiskData2>().size = data.size;
        factory.diskPrefab.GetComponent<DiskData2>().speed = data.speed;
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

