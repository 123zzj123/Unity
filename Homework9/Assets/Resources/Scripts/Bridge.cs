using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bridge : MonoBehaviour {
    public static bool Open = false;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(Input.GetKeyDown(KeyCode.Space))
        Open = !Open;
        if(Open == true)
        {
            this.transform.rotation = Quaternion.Euler(0, 0, 30);
        }
        else if(Open == false)
        {
            this.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
	}
}
