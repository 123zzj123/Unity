using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public interface IUserAction
{
    void StartGame();
    void ShowDetail();
    void ReStart();
}

public class UserGUI : MonoBehaviour
{
    private IUserAction action;
    // Use this for initialization
    void Start()
    {
        action = SSDirector.getInstance().currentScenceController as IUserAction;
    }
    void OnGUI()
    {
        GUIStyle fontstyle1 = new GUIStyle();
        fontstyle1.fontSize = 50;
        fontstyle1.normal.textColor = new Color(255, 255, 255);
        if (GUI.RepeatButton(new Rect(0, 0, 120, 40), "Shooting Disk"))
        {
            action.ShowDetail();
        }
        if (GUI.Button(new Rect(0, 60, 120, 40), "STARTGAME"))
        {
            action.StartGame();
        }
        if (GUI.Button(new Rect(0, 120, 120, 40), "RESTART"))
        {
            action.ReStart();
        }
    }
    // Update is called once per frame
    void Update()
    {
        //
    }
}
