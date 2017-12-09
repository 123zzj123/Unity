using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EffectShow1 : MonoBehaviour {
    public int insistTime;//持续时间
    private int count = 0;//用于计时
    public bool Initial = false;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        count++;
        if(insistTime == count)
        {
            count = 0;
            this.gameObject.SetActive(false);
            Initial = false;
        }
        if (Initial)
        {
            Initial = false;
            count = 0;
        }
    }
}
