using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Recorder : MonoBehaviour {
    public Text ScoreText;//分数文本
    public float Score = 0;//分数
    public SceneController sceneControler { get; set; }
    // Use this for initialization
    void Awake () {
        sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
        sceneControler.scoreRecorder = this;
    }
	public void add()
    {
        Score += sceneControler.round;
    }
    public void miss()
    {
        Score -= sceneControler.round;
    }
	// Update is called once per frame
	void Update () {
        ScoreText.text = "Score:" + Score.ToString();
    }
}
