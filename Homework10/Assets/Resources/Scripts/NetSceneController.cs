using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Photon;
using UnityEngine.SceneManagement;

public class NetSceneController : PunBehaviour {
    public static NetSceneController Instance;
    public Image Result;
    public Sprite Win;
    public Sprite Lose;
    private Transform LocalTransform;
    private Role LocalRole;
    // Use this for initialization
    void Start () {
        Instance = this;
        string Scene_Path = "Prefabs/Scene" + PlayerPrefs.GetString("Scene_choice");
        Instantiate(Resources.Load(Scene_Path));//实例化场景
        if (PhotonNetwork.isMasterClient)
        {
            string PlayerName = "player" + PlayerPrefs.GetString("Player1_choice");
            GameObject LocalPlayer = PhotonNetwork.Instantiate(PlayerName, new Vector3(0, 3, 0), Quaternion.identity, 0);
            LocalTransform = LocalPlayer.transform;
            LocalRole = LocalPlayer.GetComponent<Role>();
        }
        else
        {
            string PlayerName = "player" + PlayerPrefs.GetString("Player2_choice");
            GameObject LocalPlayer = PhotonNetwork.Instantiate(PlayerName, new Vector3(5, 3, 5), Quaternion.identity, 0);
            LocalTransform = LocalPlayer.transform;
            LocalRole = LocalPlayer.GetComponent<Role>();
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void setGameOver()
    {
        if (LocalRole.hp <= 0)
        {
            Result.gameObject.SetActive(true);
            Result.sprite = Lose;
        }
        else
        {
            Result.gameObject.SetActive(true);
            Result.sprite = Win;
        }
        LeaveRoom();
    }

    public Transform GetLocalTransform()
    {
        return LocalTransform;
    }

    public void LeaveRoom()
    {
        StartCoroutine(LeaveDelay());
    }

    public IEnumerator LeaveDelay()
    {
        yield return new WaitForSeconds(3);
        PhotonNetwork.LeaveRoom();
    }

    public override void OnLeftRoom()
    {
        SceneManager.LoadScene("task3");
    }
}
