using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class back : MonoBehaviour {
	public Texture2D img;

	//通过OnGUI方法执行下面操作
	void OnGUI()
	{
		        string aa = "";
		        
		        //构造一个空的GUIStyle
		        GUIStyle bb = new GUIStyle();
		        
		        //设置bb正常显示时是背景图片
		        bb.normal.background = img;
		        GUI.Label(new Rect(0, 0, 1370, 780), aa, bb);
	}
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
