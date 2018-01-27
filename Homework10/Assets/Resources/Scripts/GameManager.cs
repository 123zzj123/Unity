using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Photon;
using UnityEngine.SceneManagement;

[RequireComponent(typeof(PhotonView))]
public class GameManager : PunBehaviour{

    #region Public Field
    public GameObject WaitingText;
    public GameObject SceneSprite;
    public GameObject P1Sprite;
    public GameObject P2Sprite;
    public List<Button> buttonList;
    public Text Name1;
    public Text Name2;
    public Sprite[] Player;
    public Sprite[] Scene;
    #endregion

    #region Private Field
    private int ID = 0;
    private static int PlayerNum = 4;
    private static int SceneNum = 8;
    private int P1 = 0;
    private int P2 = 0;
    private int Sc = 0;
    #endregion

    #region MonoBehavior
    // Use this for initialization
    void Start () {
		foreach(Button b in buttonList)
        {
            b.enabled = false;
        }
        Name1.text = PhotonNetwork.masterClient.NickName;
        if(PhotonNetwork.isMasterClient)
        {
            ID = 1;
            WaitingText.SetActive(true);
        }
        else
        {
            ID = 2;
            Name2.text = PhotonNetwork.playerName;
            SetButtonActive();
        }
	}

    // Update is called once per frame
    void Update () {
		
	}
    #endregion

    #region PhotonCall
    public override void OnPhotonPlayerConnected(PhotonPlayer newPlayer)
    {
        if(PhotonNetwork.room.PlayerCount == 2)
        {
            WaitingText.SetActive(false);
            if(ID == 0)
            {
                ID = 2;
            }
            Name2.text = newPlayer.NickName;
            SetButtonActive();
        }
    }

    public override void OnPhotonPlayerDisconnected(PhotonPlayer otherPlayer)
    {
        ID = 1;
        WaitingText.SetActive(true);
        Name1.text = PhotonNetwork.playerName;
        Name2.text = "";
        P1 = 0;
        P2 = 0;
        Sc = 0;
        SceneSprite.GetComponent<Image>().sprite = Scene[Sc];
        P1Sprite.GetComponent<Image>().sprite = Player[P1];
        P2Sprite.GetComponent<Image>().sprite = Player[P2];
    }

    public override void OnLeftRoom()
    {
        SceneManager.LoadScene("task3");
    }
    #endregion

    #region Private Method
    private void SetButtonInactive()
    {
        foreach (Button b in buttonList)
        {
            b.enabled = false;
        }
        buttonList[9].GetComponent<Animator>().enabled = false;
    }

    private void SetButtonActive()
    {
        foreach (Button b in buttonList)
        {
            b.enabled = true;
        }
        buttonList[9].GetComponent<Animator>().enabled = true;
    }
    #endregion

    #region Public Method
    public void LeaveRoom()
    {
        PhotonNetwork.LeaveRoom();
    }

    public void SetGameMessage()
    {
        this.photonView.RPC("SetMessage", PhotonTargets.All, null);
    }

    public void NextChoice(GameObject obj)
    {
        switch (obj.name)
        {
            case "Player1":
                if(ID == 1)
                {
                    this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 1, "next");
                }
                //obj.GetComponent<Image>().sprite = Player[P1];
                break;
            case "Player2":
                if(ID == 2)
                {
                    this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 2, "next");
                }
                //obj.GetComponent<Image>().sprite = Player[P2];
                break;
            case "Scene":
                this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 0, "next");
                //obj.GetComponent<Image>().sprite = Scene[Sc];
                break;
        }
    }

    public void LastChoice(GameObject obj)
    {
        switch (obj.name)
        {
            case "Player1":
                if(ID == 1)
                {
                    this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 1, "last");
                }
                //obj.GetComponent<Image>().sprite = Player[P1];
                break;
            case "Player2":
                if(ID == 2)
                {
                    this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 2,"last");
                }
                //obj.GetComponent<Image>().sprite = Player[P2];
                break;
            case "Scene":
                this.photonView.RPC("SetSceneSprite", PhotonTargets.All, 0, "last");
                //obj.GetComponent<Image>().sprite = Scene[Sc];
                break;
        }
    }

    [PunRPC]
    public void SetSceneSprite(int num, string update)
    {
        switch (num)
        {
            case 0:
                if(update == "next")
                {
                    Sc++;
                    Sc %= SceneNum;
                } else {
                    Sc--;
                    Sc = Sc < 0 ? SceneNum - 1 : Sc;
                }
                SceneSprite.GetComponent<Image>().sprite = Scene[Sc];
                break;
            case 1:
                if (update == "next")
                {
                    P1++;
                    P1 %= PlayerNum;
                } else {
                    P1--;
                    P1 = P1 < 0 ? PlayerNum - 1 : P1;
                }
                P1Sprite.GetComponent<Image>().sprite = Player[P1];
                break;
            case 2:
                if (update == "next")
                {
                    P2++;
                    P2 %= PlayerNum;
                } else {
                    P2--;
                    P2 = P2 < 0 ? PlayerNum - 1 : P2;
                }
                P2Sprite.GetComponent<Image>().sprite = Player[P2];
                break;
        }
    }

    [PunRPC]
    public void SetMessage()
    {
        P1++;
        P2++;
        Sc++;
        string p1choice = P1.ToString();
        string p2choice = P2.ToString();
        string scchoice = Sc.ToString();
        PlayerPrefs.SetString("Player1_choice", p1choice);
        PlayerPrefs.SetString("Player2_choice", p2choice);
        PlayerPrefs.SetString("Scene_choice", scchoice);
        PlayerPrefs.SetInt("ID", ID);
        if(PhotonNetwork.isMasterClient)
        {
            PhotonNetwork.LoadLevel("task5");
        }
    }
    #endregion
}
