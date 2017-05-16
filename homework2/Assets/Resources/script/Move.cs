using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour {
    public Transform origin;
    public float speed = 20;
    float ry, rx;
    // Use this for initialization
    void Start () {
        rx = Random.Range(10, 60);
        ry = Random.Range(10, 60);
    }
	
	// Update is called once per frame
	void Update () {
        Vector3 axis = new Vector3(rx, ry, 0);
        this.transform.RotateAround(origin.position, axis, speed * Time.deltaTime);
    }
}
