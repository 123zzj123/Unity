using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum Roletype
{
    player1,
    player2
}
public class Factory : MonoBehaviour {
    public delegate void IniPosition();
    public static event IniPosition IniPositionEvent;
    private GameObject[] Effect = new GameObject[6];
    private List<GameObject> []PS = new List<GameObject>[6];
    private string[] PathName = new string[6];
    public static string RoleInfo;
    // Use this for initialization
    void Start () {
        IniEffect();
        /*test
        PathName[0] = "prefabs/Effects10";
        PathName[1] = "prefabs/Effects11";
        PathName[2] = "prefabs/Effects12";
        PathName[3] = "prefabs/Effects1";
        PathName[4] = "prefabs/Effects2";
        PathName[5] = "prefabs/Effects3";
        test*/
        for (int i = 0; i < 6; i++)
        {
            Effect[i] = Instantiate(Resources.Load(PathName[i])) as GameObject;
            if(i < 3)
            {
                Effect[i].GetComponent<EffectsType>().Type = Roletype.player1;
            }
            else
            {
                Effect[i].GetComponent<EffectsType>().Type = Roletype.player2;
            }
            Effect[i].SetActive(false);
            PS[i] = new List<GameObject>();
            PS[i].Add(Effect[i]);
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void IniEffect()
    {
        int player1_Effect = int.Parse(PlayerPrefs.GetString("Player1_choice"));
        int player2_Effect = int.Parse(PlayerPrefs.GetString("Player2_choice"));
        player1_Effect = (player1_Effect - 1) * 3 + 1;
        player2_Effect = (player2_Effect - 1) * 3 + 1;
        for(int i = 0; i < 3; i++)
        {
            PathName[i] = "prefabs/Effects" + player1_Effect;
            player1_Effect++;
        }
        for(int i = 3; i < 6; i++)
        {
            PathName[i] = "prefabs/Effects" + player2_Effect;
            player2_Effect++;
        }

    }

    public GameObject getPS(int ID)
    {
        for (int i = 0; i < PS[ID].Count; i++)
        {
            if (!PS[ID][i].gameObject.activeSelf)
            {
                PS[ID][i].gameObject.SetActive(true);
                PS[ID][i].GetComponent<Rigidbody>().velocity = Vector3.zero;
                if(IniPositionEvent != null)
                {
                    IniPositionEvent();
                }
                return PS[ID][i];
            }
        }
        GameObject newPs = Instantiate<GameObject>(Effect[ID]);
        PS[ID].Add(newPs);
        if (IniPositionEvent != null)
        {
            IniPositionEvent();
        }
        return newPs;
    }
}
