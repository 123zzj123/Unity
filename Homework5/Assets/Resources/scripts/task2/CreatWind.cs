using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreatWind : MonoBehaviour {
    public ShootController sceneController;
    public void Start()
    {
        sceneController = (ShootController)SSDirector.getInstance().currentScenceController;
    }
    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Arrow")
        {
            other.gameObject.GetComponent<Rigidbody>().AddForce(new Vector3(ShootController.directionX * sceneController.round * 0.5f, ShootController.directionY * sceneController.round * 0.5f, 0));
            Debug.Log("wind");
        }
    }
}
