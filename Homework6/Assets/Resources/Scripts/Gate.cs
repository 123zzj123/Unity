using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gate : MonoBehaviour {
    public delegate void AddScore();
    public static event AddScore addScore;
	// Use this for initialization

    void OnTriggerEnter(Collider collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            if (this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<GuardController>().state == 0)
            {
                this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<Animator>().SetInteger("state1",1);
                this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<GuardController>().state = 1;
            }
            else
            {
                this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<Animator>().SetInteger("state1", 0);
                this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<GuardController>().state = 0;
                escape();
            }
        }
        if(collider.gameObject.tag == "Guard")
        {
            this.transform.parent.GetComponent<GetGuard>().guard.GetComponent<GuardController>().state = 0;
        }
    }

    void escape()
    {
        if(addScore != null)
        {
            addScore();
        }
    }
}
