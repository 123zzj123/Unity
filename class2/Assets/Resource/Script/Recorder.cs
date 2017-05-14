using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Recorder : MonoBehaviour {

	// Use this for initialization
	void Start () {
        GarenEvent.OnGarenSubjectNotify += record;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void record(GameObject self, string message)
    {
        print(self);
        print(" ");
        print(message);
    }
}
