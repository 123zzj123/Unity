using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FileManager : MonoBehaviour {
    public string url;
    public SceneController sceneControler { get; set; }
    // Use this for initialization
    void Awake () {
        print(Application.persistentDataPath);
        sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
        sceneControler.fileManager = this;
        LoadGameInfoJson("game_info.json");
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    // 输入游戏信息文件名，启动协程读取文件  
    public void LoadGameInfoJson(string name)
    {
        url = "file://" + Application.dataPath + "/Data/" + name;
        StartCoroutine(LoadGameInfo());
    }
    IEnumerator LoadGameInfo()
    {
        if (url.Length > 0)
        {
            WWW www = new WWW(url);
            yield return www;
            if (!string.IsNullOrEmpty(www.error))
                Debug.Log(www.error);
            else
                sceneControler.stageGameInfo(www.text.ToString());   // 返回json字符串给scene  
        }
    }
    public void loadLevelJson(string name)
    {
        url = "file://" + Application.dataPath + "/Data/" + name;
        StartCoroutine(LoadLevel());
    }
    IEnumerator LoadLevel()
    {
        if (url.Length > 0)
        {
            WWW www = new WWW(url);
            yield return www;
            if (!string.IsNullOrEmpty(www.error))
                Debug.Log(www.error);
            else
                sceneControler.stageLevel(www.text.ToString());  // 返回json字符串给scene  
        }
    }
}
