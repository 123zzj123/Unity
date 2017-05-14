using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Check : MonoBehaviour {
    public int num;
    public Emit EmitDisk;
    void OnTriggerEnter(Collider other)
    {
        Debug.Log(other.gameObject.tag);
        if (other.gameObject.tag == "Disk")
        {
            EmitDisk = (Emit)other.gameObject.GetComponent<DiskData2>().action;
            EmitDisk.Destory();
        }
    }
}
