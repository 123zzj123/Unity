using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateCamera : MonoBehaviour {
    public SceneController sceneController;
    public GameObject role;
    void Start()
    {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        role = sceneController.role;
        this.transform.parent = role.transform;
    }
}
