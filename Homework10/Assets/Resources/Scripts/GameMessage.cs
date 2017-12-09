using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameMessage : MonoBehaviour {
    private static int PlayerNum = 4;
    private static int SceneNum = 8;
    private Sprite[] Player = new Sprite[PlayerNum];
    private Sprite[] Scene = new Sprite[SceneNum];
    private GameObject[] PlayerData = new GameObject[PlayerNum];
    public GameObject MainMenu;
    private int P1 = 0;
    private int P2 = 0;
    private int Sc = 0;
	// Use this for initialization
	void Start () {
        UISceneController SceneController = SSDirector.getInstance().currentScenceController as UISceneController;
        PlayerData = SceneController.PlayerData;
        Scene = SceneController.Scene;
        Player = SceneController.Player;
    }
	
	// Update is called once per frame
	void Update () {
		
	}

   public void SetGameMessage()
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
        SceneManager.LoadScene("Task1");
    }

    public void NextChoice(GameObject obj)
    {
        switch(obj.name)
        {
            case "Player1":
                P1++;
                P1 %= PlayerNum;
                obj.GetComponent<Image>().sprite = Player[P1];
                break;
            case "Player2":
                P2++;
                P2 %= PlayerNum;
                obj.GetComponent<Image>().sprite = Player[P2];
                break;
            case "Scene":
                Sc++;
                Sc %= SceneNum;
                obj.GetComponent<Image>().sprite = Scene[Sc];
                break;
        }
    }
    public void LastChoice(GameObject obj)
    {
        switch (obj.name)
        {
            case "Player1":
                P1--;
                P1 = P1 < 0 ? PlayerNum - 1 : P1;
                obj.GetComponent<Image>().sprite = Player[P1];
                break;
            case "Player2":
                P2--;
                P2 = P2 < 0 ? PlayerNum - 1 : P2;
                Debug.Log(P2);
                obj.GetComponent<Image>().sprite = Player[P2];
                break;
            case "Scene":
                Sc--;
                Sc = Sc < 0 ? SceneNum - 1 : Sc;
                obj.GetComponent<Image>().sprite = Scene[Sc];
                break;
        }
    }

    public void getDetail(GameObject obj)
    {
        int choice = 0;
        switch(obj.name)
        {
            case "Player1":
                choice = P1;
                break;
            case "Player2":
                choice = P2;
                break;
        }
        PlayerData[choice].GetComponent<Animator>().SetBool("enter", true);
        MainMenu.SetActive(false);
    }
}
