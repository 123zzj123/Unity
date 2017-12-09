using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effect_Ini2 : MonoBehaviour {
    public string P_name;
    private GameObject Player;
    // Use this for initialization
    void Start () {
        Player = GameObject.Find(P_name);
        Transform Target = Player.transform.Find("Bip001 Weapon").Find("Weapon02_EffectPoint").transform;
        transform.position = Target.position;
        transform.parent = Target;
        transform.localPosition = new Vector3(0, 0, 0.65f);
        transform.localRotation = Quaternion.Euler(0, 0, 0);
        Factory.IniPositionEvent += InitialPos;
    }

    void InitialPos()
    {
        Transform Target = Player.transform.Find("Bip001 Weapon").Find("Weapon02_EffectPoint").transform;
        transform.position = Target.position;
        transform.parent = Target;
        transform.localPosition = new Vector3(0, 0, 0.65f);
        transform.localRotation = Quaternion.Euler(0, 0, 0);
    }
}
