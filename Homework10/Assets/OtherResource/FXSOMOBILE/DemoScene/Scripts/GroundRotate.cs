using UnityEngine;
using System.Collections;

public class GroundRotate : MonoBehaviour {
	
	Transform localTransform;

	// Use this for initialization
	void Start () {
		localTransform = transform;
	}
	
	// Update is called once per frame
	void Update () {
		localTransform.Rotate(5*Vector3.up * Time.deltaTime, Space.World);
	}
}
