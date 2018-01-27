using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effect_Ini2 : MonoBehaviour {
    private GameObject Player;
    private SceneController sceneController;
    // Use this for initialization
    void Start () {
        Factory.IniPositionEvent += InitialPos;
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        if (this.GetComponent<EffectsType>().Type == Roletype.player1)
        {
            Player = sceneController.GetPlayer1();
        }
        else
        {
            Player = sceneController.GetPlayer2();
        }
        Transform Target = Player.transform.Find("Bip001 Weapon").Find("Weapon02_EffectPoint").transform;
        transform.position = Target.position;
        transform.parent = Target;
        transform.localPosition = new Vector3(0, 0, 0.65f);
        transform.localRotation = Quaternion.Euler(0, 0, 0);
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
