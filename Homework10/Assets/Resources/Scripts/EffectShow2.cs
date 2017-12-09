using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EffectShow2 : MonoBehaviour {
    private Vector3 InitialPosition;
    private Transform Parent;
    public bool Initial = false;
	// Use this for initialization
	void Start () {
        InitialPosition = this.transform.localPosition;
        Parent = this.transform.parent;
	}
	
	// Update is called once per frame
	void Update () {
        if(Initial)
        {
            Initial = false;
            IniPosition();
        }
        GetComponent<Rigidbody>().AddForce(transform.forward * 0.2f, ForceMode.Impulse);
	}

    void IniPosition()
    {
        this.transform.parent = Parent;
        this.transform.localPosition = InitialPosition;
        GetComponent<Rigidbody>().velocity = Vector3.zero;
    }

    void OnTriggerEnter(Collider collider)
    {
        if(collider.gameObject.tag != "Player")
        {
            Initial = true;
            this.gameObject.SetActive(false);
        }
    }
}
