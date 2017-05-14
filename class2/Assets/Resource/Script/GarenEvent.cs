using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GarenEvent : MonoBehaviour {
    public delegate void GarenSubject(GameObject self, string message);
    public static event GarenSubject OnGarenSubjectNotify;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void JumpTopPoint()
    {
        Debug.Log("Jump to the top point!!!");
        if(OnGarenSubjectNotify != null)
        {
            OnGarenSubjectNotify(this.gameObject, "AtTop");
        }
    }
}
