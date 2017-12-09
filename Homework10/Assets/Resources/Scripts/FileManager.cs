using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class FileManager : MonoBehaviour {
    private SceneController sceneController;//场记
    public AssetBundle role;
    public AssetBundle effect;
    public AssetBundle scene;
    public AssetBundle panel;
    public static string RootPath
    {
        get
        {
            if(Application.platform == RuntimePlatform.Android || Application.platform == RuntimePlatform.IPhonePlayer)
            {
                return Application.persistentDataPath + "/";
            }
            else if(Application.platform == RuntimePlatform.WindowsEditor || Application.platform == RuntimePlatform.OSXEditor)
            {
                return Application.dataPath.Replace("Assets", "");
            }
            else
            {
                return Application.dataPath + "/";
            }
        }
    }
    //public delegate void CompleteUpdate();
    //public static event CompleteUpdate CompleteEvent;
    // Use this for initialization
    void Awake()
    {
        sceneController = SSDirector.getInstance().currentScenceController as SceneController;//获取场记
        sceneController.setFileManager(this);
        IniRoleBundle();
        IniSceneBundle();
        IniEffectBundle();
        IniPanel();
    }
    void Start () {
        
    }

    // Update is called once per frame
    void Update () {

	}

    void IniRoleBundle()
    {
        role = AssetBundle.LoadFromFile(Path.Combine(RootPath, "role"));
        if (role == null)
        {
            Debug.Log("Failed to load role AssetBundle!");
            return;
        }
    }

    void IniSceneBundle()
    {
        scene = AssetBundle.LoadFromFile(Path.Combine(RootPath, "scene"));
        if (scene == null)
        {
            Debug.Log("Failed to load scene AssetBundle!");
            return;
        }
    } 

    void IniEffectBundle()
    {
        effect = AssetBundle.LoadFromFile(Path.Combine(RootPath, "effect"));
        if(effect == null)
        {
            Debug.Log("Failed to load effect AssetBundle!");
            return;
        }
    }

    void IniPanel()
    {
        panel = AssetBundle.LoadFromFile(Path.Combine(RootPath, "panel"));
        if(panel == null)
        {
            Debug.Log("Failed to load panel AssetBundle!");
            return;
        }
    }

    /*
    IEnumerator UpdateVersion()
    {
        string updateUrl = "http://localhost:1337/version"; //服务器网址
        WWW www = new WWW(updateUrl);
        yield return www;
        StartCoroutine(WriteRoleInfo(www.text.ToString()));
    }

    IEnumerator WriteRoleInfo(string info)
    {
        string path = RootPath + "RoleInfo.json";
        StreamWriter sw = new StreamWriter(path, false);
        sw.Write(info);
        sw.Close();
        sw.Dispose();
        yield return null;
        //StartCoroutine(ReadRoleInfo("RoleInfo.json"));
    }

    IEnumerator ReadRoleInfo(string fileName)
    {
        string fileContent;
        StreamReader sr = null;
        sr = File.OpenText(RootPath + fileName);
        while ((fileContent = sr.ReadToEnd()) != null)
        {
            break;
        }
        Factory.RoleInfo = fileContent;
        //Debug.Log(fileContent);
        sr.Close();
        sr.Dispose();
        yield return null;
    }
    */
}
