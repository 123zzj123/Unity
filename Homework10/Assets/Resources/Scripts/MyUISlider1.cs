using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MyUISlider1 : MonoBehaviour {
    UIProgressBar mBar;
    // Use this for initialization
    void Start () {
        if (mBar == null)
        {
            mBar = GetComponent<UIProgressBar>();
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void UpdateVal(float value)
    {
        if (mBar == null)
        {
            mBar = GetComponent<UIProgressBar>();
        }
        mBar.value = value;//更新UISlider的值
    }
}
