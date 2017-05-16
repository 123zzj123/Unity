using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControlCamera : MonoBehaviour {
    public GameObject camera0;
    public GameObject camera1;
    public GameObject camera2;
    public void CloseCameras()
    {
        camera1.SetActive(false);
        camera2.SetActive(false);
        camera0.SetActive(false);
    }
    // Use this for initialization
    void Start () {
        CloseCameras();
        camera0.SetActive(true);
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.A))
        {
            CloseCameras();
            camera1.SetActive(true);
        }
        if(Input.GetKeyDown(KeyCode.D))
        {
            CloseCameras();
            camera2.SetActive(true);
        }
        if(Input.GetKeyDown(KeyCode.S))
        {
            CloseCameras();
            camera0.SetActive(true);
        }
    }

    void OnGUI()
    {
        if (GUI.Button(new Rect(0,0,50,50),"Main"))
        {
            camera1.SetActive(false);
            camera2.SetActive(false);
            camera0.SetActive(true);
        }
        if (GUI.Button(new Rect(0, 60, 50, 50), "Earth"))
        {
            camera2.SetActive(false);
            camera0.SetActive(false);
            camera1.SetActive(true);
        }
        if (GUI.Button(new Rect(0, 120, 50, 50), "Moon"))
        {
            camera1.SetActive(false);
            camera0.SetActive(false);
            camera2.SetActive(true);
        }
    }
}
