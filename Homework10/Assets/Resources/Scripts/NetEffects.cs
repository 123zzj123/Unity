using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon;

public class NetEffects : PunBehaviour {
    public Roletype Type;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnEnable()
    {
        
    }

    public void SetType(Roletype type)
    {
        if(photonView.isMine)
        {
            if(type == Roletype.player1)
            {
                this.photonView.RPC("SetEffectsType", PhotonTargets.All, 0);
            }
            else
            {
                this.photonView.RPC("SetEffectsType", PhotonTargets.All, 1);
            }
        }
    }

    [PunRPC]
    public void SetEffectsType(int num)
    {
        if(num == 0)
        {
            Type = Roletype.player1;
        }
        else
        {
            Type = Roletype.player2;
        }
    }
}
