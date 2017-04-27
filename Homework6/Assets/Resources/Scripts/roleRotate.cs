using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class roleRotate : MonoBehaviour {
    public float roate_Speed = 2.0f;//旋转速度
    public SceneController sceneController;
    void Start()
    {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
    }
    void Update()
    {
        if(sceneController.game == 1)
        {
            float mousX = Input.GetAxis("Mouse X") * roate_Speed;//得到鼠标移动距离
            this.transform.Rotate(new Vector3(0, mousX, 0));
        }
    }
}
