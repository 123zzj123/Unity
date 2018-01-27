using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Photon;

public class LobbyManager : PunBehaviour {

    #region Public Field
    public string _gameVersion;
    public Text Reason;
    public Text Connect;
    public GameObject ConnectPanel;
    public GameObject ErrorPanel;
    public GameObject LoaderAnime;
    public GameObject LobbyPanel;
    public GameObject RoomInstance;
    public GameObject WrongRoom;
    #endregion

    #region Private Field
    [SerializeField]
    private InputField PNameField;
    [SerializeField]
    private InputField JoinRoomField;
    [SerializeField]
    private InputField CreatRoomField;
    [SerializeField]
    private Transform ContentTransform;
    [SerializeField]
    private Text NullRoom;
    [SerializeField]
    private GameObject RoomList;
    [SerializeField]
    private Button JoinRandom;
    private static string PlayerNameKey = "PlayerName";
    private List<GameObject> roomInstanceList = new List<GameObject>();
    #endregion

    #region MonoBehaviour CallBacks

    // Use this for initialization
    void Start () {
        PhotonNetwork.automaticallySyncScene = true;
        ConnectPanel.SetActive(true);
        ErrorPanel.SetActive(false);
        PhotonNetwork.autoJoinLobby = true;
        PhotonNetwork.ConnectUsingSettings(_gameVersion);
        LoaderAnime.GetComponent<ExitGames.Demos.DemoAnimator.LoaderAnime>().StartLoaderAnimation();
	}
	
	// Update is called once per frame
	void Update () {
        if(!PhotonNetwork.insideLobby)
        {
            Connect.text = "Connect" + GetCurrentDot();
        }
        else
        {
            if(!PhotonNetwork.inRoom)
            {
                if(PhotonNetwork.GetRoomList().Length == 0)
                {
                    JoinRandom.gameObject.SetActive(false);
                    NullRoom.gameObject.SetActive(true);
                    RoomList.SetActive(false);
                }
                else
                {
                    JoinRandom.gameObject.SetActive(true);
                    NullRoom.gameObject.SetActive(false);
                    RoomList.SetActive(true);
                }
            }
        }
        //Debug.Log(PhotonNetwork.connectionStateDetailed);
	}

    #endregion

    #region Photon.PunBehaviour CallBacks
    public override void OnJoinedLobby()
    {
        ConnectPanel.SetActive(false);
        ErrorPanel.SetActive(false);
        LoaderAnime.SetActive(false);
        LobbyPanel.SetActive(true);
        string defaultName = "Guest" + Random.Range(1, 9999);
        if(PNameField != null)
        {
            if(PlayerPrefs.HasKey(PlayerNameKey))
            {
                defaultName = PlayerPrefs.GetString(PlayerNameKey);
                PNameField.text = defaultName;
            }
        }

        PhotonNetwork.playerName = defaultName;
    }

    //链接建立之前无法链接到Photon服务器
    public override void OnFailedToConnectToPhoton(DisconnectCause cause)
    {
        ConnectPanel.SetActive(false);
        ErrorPanel.SetActive(true);
        LoaderAnime.SetActive(false);
        switch (cause)
        {
            case DisconnectCause.DisconnectByServerTimeout:
                Reason.text = "连接服务器超时";
                break;
            case DisconnectCause.MaxCcuReached:
                Reason.text = "服务器玩家达到上限";
                break;
            case DisconnectCause.DisconnectByServerUserLimit:
                Reason.text = "服务器玩家达到上限";
                break;
            case DisconnectCause.InvalidAuthentication:
                Reason.text = "无效的APPID";
                break;
            case DisconnectCause.SecurityExceptionOnConnect:
                Reason.text = "服务端或客户端的安全设置拒绝连接";
                break;
            default:
                Reason.text = cause.ToString();
                break;
        }
    }

    public override void OnJoinedRoom()
    {
        PhotonNetwork.LoadLevel("task4");
    }

    public override void OnReceivedRoomListUpdate()
    {
        foreach (GameObject g in roomInstanceList)
        {
            g.SetActive(false);
        }
        foreach (RoomInfo game in PhotonNetwork.GetRoomList())
        {
            GameObject g = GetRoomInstance();
            g.GetComponent<Text>().text = game.Name;
        }
    }

    //链接建立之后链接失败
    public override void OnConnectionFail(DisconnectCause cause)
    {
        ConnectPanel.SetActive(false);
        ErrorPanel.SetActive(true);
        LoaderAnime.SetActive(false);
        switch (cause)
        {
            case DisconnectCause.DisconnectByServerTimeout:
                Reason.text = "连接服务器超时";
                break;
            case DisconnectCause.MaxCcuReached:
                Reason.text = "服务器玩家达到上限";
                break;
            case DisconnectCause.DisconnectByServerUserLimit:
                Reason.text = "服务器玩家达到上限";
                break;
            case DisconnectCause.InvalidAuthentication:
                Reason.text = "无效的APPID";
                break;
            case DisconnectCause.SecurityExceptionOnConnect:
                Reason.text = "服务端或客户端的安全设置拒绝连接";
                break;
            default:
                Reason.text = cause.ToString();
                break;
        }
    }
    #endregion

    #region Private Method
    string GetCurrentDot()
    {
        string str = "";
        int numberOfDots = Mathf.FloorToInt(Time.timeSinceLevelLoad * 3f % 4);
        for(int i = 0; i < numberOfDots; i++)
        {
            str += ".";
        }
        return str;
    }
    #endregion

    #region Public Method
    public void Reconnect()
    {
        LoaderAnime.SetActive(true);
        ConnectPanel.SetActive(true);
        ErrorPanel.SetActive(false);
        PhotonNetwork.ConnectUsingSettings(_gameVersion);
    }

    public void JoinOneRoom()
    {
        foreach(RoomInfo game in PhotonNetwork.GetRoomList())
        {
            if(game.Name == JoinRoomField.text)
            {
                PhotonNetwork.JoinRoom(JoinRoomField.text);
            }
            else
            {
                WrongRoom.SetActive(true);
                StartCoroutine(CloseDelay());
            }
        }
        if(PhotonNetwork.GetRoomList().Length == 0)
        {
            WrongRoom.SetActive(true);
            StartCoroutine(CloseDelay());
        }
    }

    public void CreatOneRoom()
    {
        if(CreatRoomField.text != null)
        {
            PhotonNetwork.CreateRoom(CreatRoomField.text, new RoomOptions() { MaxPlayers = 2 }, TypedLobby.Default);
        }
    }

    public void JoinRandRoom()
    {
        PhotonNetwork.JoinRandomRoom();
    }

    public void SetPlayerName()
    {
        PlayerPrefs.SetString(PlayerNameKey, PNameField.text);
        PhotonNetwork.playerName = PNameField.text;
    }

    public void JoinTheRoom(GameObject g)
    {
        PhotonNetwork.JoinRoom(g.GetComponent<Text>().text);
    }

    public GameObject GetRoomInstance()
    {
        for(int i = 0; i < roomInstanceList.Count; i++)
        {
            if(!roomInstanceList[i].gameObject.activeSelf)
            {
                roomInstanceList[i].gameObject.SetActive(true);
                return roomInstanceList[i];
            }
        }
        GameObject newInstance = Instantiate<GameObject>(RoomInstance, ContentTransform);
        roomInstanceList.Add(newInstance);
        newInstance.SetActive(true);
        return newInstance;
    }

    public IEnumerator CloseDelay()
    {
        yield return new WaitForSeconds(1);
        WrongRoom.SetActive(false);
    }
    #endregion
}
