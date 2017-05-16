using UnityEngine;  
using System.Collections;  

public class Send_Button : MonoBehaviour {  
	public UITextList textList;  
	
	// Use this for initialization  
	void Start () {  
		
	}  
	
	// Update is called once per frame  
	void Update () {  
		if (Input.GetKeyDown (KeyCode.Return)) {  
			this.OnClick();   
		}   
	}  
	
	void OnClick() {  
		GameObject input_Label = GameObject.Find ("Input_Label");  
		string text_str = "[8bddfc]Some say:[-] " + input_Label.GetComponent<UILabel> ().text;   
		textList.Add(text_str);   
	}  
}  