using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effect_Ini1 : MonoBehaviour {
    public string P_name;
    private GameObject Player;
    public float DeltaX;
    public float DeltaY;
    public float DeltaZ;
	// Use this for initialization
	void Start () {
        Factory.IniPositionEvent += InitialPos;
        Player = GameObject.Find(P_name);
        transform.forward = Player.transform.forward;
        transform.position = new Vector3(Player.transform.position.x + DeltaX, Player.transform.position.y + DeltaY, Player.transform.position.z + DeltaZ);
    }
    void InitialPos()
    {
        transform.forward = Player.transform.forward;
        transform.position = new Vector3(Player.transform.position.x + DeltaX, Player.transform.position.y + DeltaY, Player.transform.position.z + DeltaZ);
    }
}
