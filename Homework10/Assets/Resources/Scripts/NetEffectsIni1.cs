using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;

public class NetEffectsIni1 : PunBehaviour {
    private Transform Target;
    public float DeltaX;
    public float DeltaY;
    public float DeltaZ;
    // Use this for initialization
    void Start()
    {
        if(photonView.isMine)
        {
            Target = NetSceneController.Instance.GetLocalTransform();
            transform.forward = Target.forward;
            transform.position = new Vector3(Target.position.x + DeltaX, Target.position.y + DeltaY, Target.position.z + DeltaZ);
        }
    }
    void InitialPos()
    {
        if(photonView.isMine)
        {
            Target = NetSceneController.Instance.GetLocalTransform();
            transform.forward = Target.transform.forward;
            transform.position = new Vector3(Target.transform.position.x + DeltaX, Target.transform.position.y + DeltaY, Target.transform.position.z + DeltaZ);
        }
    }

    private void OnEnable()
    {
        InitialPos();
    }
}
