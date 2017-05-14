using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;

public delegate void D_Up(int u);
public class mydelegate : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        up(1);
        try
        {
            D_Up test = (D_Up)Delegate.CreateDelegate(typeof(D_Up), this, "up");
            test(2);
        } catch (Exception e)
        {
            Debug.Log("Why?" + e.Message);
        }

	}

    void up(int u)
    {
        this.transform.position += new Vector3(0, u, 0);
    }
}
