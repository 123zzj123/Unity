using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBoat : MonoBehaviour {
    public Transform target;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                if (hit.transform.tag == "Boat")
                {
                    while (target.position != hit.transform.position)
                    {
                        hit.transform.position = Vector3.MoveTowards(hit.transform.position, target.position, 1);
                    }
                }
            }
        }
    }
}
