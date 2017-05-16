using UnityEngine;  
using System.Collections;  

public class testButton : MonoBehaviour {  
	protected bool switchFlag = true;  
	
	// Use this for initialization  
	void Start () {  
		
	}  
	
	void OnClick () {  
		if (this.switchFlag) {  
			this.GetComponent<UISprite> ().spriteName = "1";  
			this.GetComponent<UIButton> ().normalSprite = "1";  
			this.switchFlag = false;  
		}  
		else{  
			this.GetComponent<UISprite>().spriteName = "2";  
			this.GetComponent<UIButton>().normalSprite = "2";  
			this.switchFlag = true;  
		}  
	}  
}
