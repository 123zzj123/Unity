using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Target : MonoBehaviour {
    public int num;
    public Emit3 EmitDisk;
    public ShootController sceneController;
    public void Start()
    {
        sceneController = (ShootController)SSDirector.getInstance().currentScenceController;
    }
    void OnTriggerEnter(Collider other)
    {
        Debug.Log(other.gameObject.tag);
        if (other.gameObject.tag == "Arrow")
        {
            if (!other.gameObject.GetComponent<DiskData3>().hit)
            {
                other.gameObject.GetComponent<DiskData3>().hit = true;
                Debug.Log(num);
                sceneController.score += num;
            }
            EmitDisk = (Emit3)other.gameObject.GetComponent<DiskData3>().action;
            //print(this.gameObject);
            other.gameObject.GetComponent<Rigidbody>().velocity = Vector3.zero;
            EmitDisk.Destory();
        }
    }
}
