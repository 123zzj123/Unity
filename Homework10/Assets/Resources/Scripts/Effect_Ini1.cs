using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effect_Ini1 : MonoBehaviour {
    private GameObject Player;
    private SceneController sceneController;
    public float DeltaX;
    public float DeltaY;
    public float DeltaZ;
	// Use this for initialization
	void Start () {
        Factory.IniPositionEvent += InitialPos;
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        if(this.GetComponent<EffectsType>().Type == Roletype.player1)
        {
            Player =  sceneController.GetPlayer1();
        }
        else
        {
            Player = sceneController.GetPlayer2();
        }
        transform.forward = Player.transform.forward;
        transform.position = new Vector3(Player.transform.position.x + DeltaX, Player.transform.position.y + DeltaY, Player.transform.position.z + DeltaZ);
    }
    void InitialPos()
    {
        transform.forward = Player.transform.forward;
        transform.position = new Vector3(Player.transform.position.x + DeltaX, Player.transform.position.y + DeltaY, Player.transform.position.z + DeltaZ);
    }
}
