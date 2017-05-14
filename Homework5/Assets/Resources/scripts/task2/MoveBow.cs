using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBow : MonoBehaviour {
    public float speedX = 0.01f;
    public float speedY = 0.01f;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            this.transform.position = new Vector3(-0.02f, 0.95f, -4);
        }
        float translationY = Input.GetAxis("Vertical") * speedY;
        float translationX = Input.GetAxis("Horizontal") * speedY;
        translationY *= Time.deltaTime;
        translationX *= Time.deltaTime;
        transform.Translate(0, translationY, 0);
        transform.Translate(0, 0, -translationX);
    }
}
