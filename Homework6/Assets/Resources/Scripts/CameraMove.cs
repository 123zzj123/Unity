using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMove : MonoBehaviour {
    public GameObject role;
    public SceneController sceneController;
    private Vector3 offset;
    // Use this for initialization
    void Start () {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        role = sceneController.role;
        offset = role.transform.position - this.transform.position;
	}
	
	// Update is called once per frame
	void Update () {
        this.transform.position = role.transform.position - offset;
	}
}
