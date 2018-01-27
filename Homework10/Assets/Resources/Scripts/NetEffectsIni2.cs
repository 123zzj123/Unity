using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;

public class NetEffectsIni2 : PunBehaviour {
    private Transform Target;
    // Use this for initialization
    void Start()
    {
        if (photonView.isMine)
        {
            if(Target == null)
            {
                Target = NetSceneController.Instance.GetLocalTransform();
            }
            Transform TargetPoint = Target.transform.Find("Bip001 Weapon").Find("Weapon02_EffectPoint").transform;
            transform.position = TargetPoint.position;
            transform.parent = TargetPoint;
            transform.localPosition = new Vector3(0, 0, 0.65f);
            transform.localRotation = Quaternion.Euler(0, 0, 0);
        }
    }

    void InitialPos()
    {
        if(photonView.isMine)
        {
            if (Target == null)
            {
                Target = NetSceneController.Instance.GetLocalTransform();
            }
            Transform TargetPoint = Target.transform.Find("Bip001 Weapon").Find("Weapon02_EffectPoint").transform;
            transform.position = TargetPoint.position;
            transform.parent = TargetPoint;
            transform.localPosition = new Vector3(0, 0, 0.65f);
            transform.localRotation = Quaternion.Euler(0, 0, 0);
        }
    }

    private void OnEnable()
    {
        InitialPos();
    }
}
