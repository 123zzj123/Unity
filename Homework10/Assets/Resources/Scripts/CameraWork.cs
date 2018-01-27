using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraWork : MonoBehaviour {

    public void OnStartFollowing(Vector3 LocalPos)
    {
        Camera.main.transform.parent = this.transform;
        Camera.main.transform.localPosition = LocalPos;
    }
}
