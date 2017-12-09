using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerData : MonoBehaviour {
    private GameObject MainMenu;
    // Use this for initialization
    void Start()
    {
        UISceneController SceneController = SSDirector.getInstance().currentScenceController as UISceneController;
        MainMenu = SceneController.MainMenu;
    }
    public void ReturnMenu()
    {
        GetComponent<Animator>().SetBool("enter", false);
        StartCoroutine(ShowDelay());
    }

    public IEnumerator ShowDelay()
    {
        int CoolTimes = 1;
        while (CoolTimes > 0)
        {
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        MainMenu.SetActive(true);
    }
}
