using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserGUI1 : MonoBehaviour {
    private IUserAction action;
    public bool isButtonDown = false;
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
        if (GUI.RepeatButton(new Rect(0, 0, 120, 40), "Shooting"))
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
        if (Input.GetMouseButtonDown(0) && !isButtonDown)
        {
            action.hit();
            isButtonDown = true;
        }
        else if(Input.GetMouseButtonDown(0) && isButtonDown)
        {
            isButtonDown = false;
        }
    }
}
