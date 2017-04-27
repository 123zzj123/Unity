using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GetGuard : MonoBehaviour {
    public GameObject guard;
    void OnCollisionEnter(Collision collider)
    {
        Debug.Log(collider.gameObject.tag);
        if(collider.gameObject.tag == "Guard")
        {
            Debug.Log(collider.gameObject.name);
            guard = collider.gameObject;
        }
    }
}
