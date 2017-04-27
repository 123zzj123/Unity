using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SceneController : MonoBehaviour, ISceneController, IUserAction
{
    public GameObject role;
    public GameObject blood;
    public Text FinalText;
    public Text GameText;
    public int game = 0;
    public ScoreRecorder scoreRecorder;
    int size = 5;
    int CoolTimes = 3;
    void Awake()
    //创建导演实例并载入资源  
    {
        SSDirector director = SSDirector.getInstance();
        director.setFPS(60);
        director.currentScenceController = this;
        director.currentScenceController.LoadResources();
    }
    public void LoadResources()  //载入资源  
    {
        Instantiate(Resources.Load("Prefabs/Light"));
        Instantiate(Resources.Load("Prefabs/Entry"));
        blood = Instantiate(Resources.Load("Prefabs/Blood"), new Vector3(40, 40, 40), Quaternion.identity) as GameObject;
        role = Instantiate(Resources.Load("Prefabs/role")) as GameObject;
        int pos_Z = 0, pos_X = 0,k;
        for(int i = 0; i < size; i++)
        {
            pos_X = i * 6;
            if (i <= size / 2)
            {
                k = i;
                pos_Z = -k * 2;
            } 
            else
            {
                k = (size - i - 1);
                pos_Z = - k * 2;
            }
            for (int j = 0; j <= k; j++)
            {
                Instantiate(Resources.Load("Prefabs/Maze"), new Vector3(pos_X, 0, pos_Z), Quaternion.identity);
                Instantiate(Resources.Load("Prefabs/Guard"), new Vector3(pos_X - 3f, 0.8f, pos_Z), Quaternion.identity);
                pos_Z += 4;
            }
        }
    }
    // Use this for initialization
    void Start () {
        game = 2;
        RoleTrigger.gameOver += GameOver;
        StartCoroutine(waitForOneSecond());
    }
	
	// Update is called once per frame
	void Update () {
        if(game == 0)
        {
            blood.transform.position = role.transform.position;
            blood.transform.position += new Vector3(0, 0.2f, 0);
        }
	}
    void GameOver()
    {
        blood.GetComponent<ParticleSystem>().Play();
        game = 0;
        FinalText.text = "Game Over!!!";
    }
    public void ShowDetail() {
        GUIStyle fontstyle1 = new GUIStyle();
        fontstyle1.fontSize = 20;
        fontstyle1.normal.textColor = new Color(255, 255, 255);
        GUI.Label(new Rect(220, 50, 500, 500), "In the Maze you play a role, Try to escape away from\n Guard. Each success escape for one point.if you are\n caught by Guard, Game Over!!! Good Luck",fontstyle1);
    }
    public void ReStart() {
        SceneManager.LoadScene("Task1");
    }
    public IEnumerator waitForOneSecond()
    {
        while (CoolTimes >= 0 && game == 2)
        {
            GameText.text = CoolTimes.ToString();
            print("还剩" + CoolTimes);
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        GameText.text = "";
        game = 1;//游戏开始  
    }
}
