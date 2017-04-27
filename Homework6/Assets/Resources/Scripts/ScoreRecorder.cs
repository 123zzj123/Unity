using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScoreRecorder : MonoBehaviour {
    public Text ScoreText;
    public SceneController sceneController;
    public int Score = 0;
    void GetScore()
    {
        Score++;
    }
	// Use this for initialization
	void Start () {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        sceneController.scoreRecorder = this;
        Gate.addScore += GetScore;
	}
	
	// Update is called once per frame
	void Update () {
        ScoreText.text = "Score:" + Score.ToString();//更新分数
    }
}
