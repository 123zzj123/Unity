using UnityEngine;
using System.Collections;

public class SOMobileFXFlyOutGUI : SOmobileFX_Abstract {
	public GameObject animatedObject;
	public void FlyOutEnded(){
		animatedObject.GetComponent<Animation>().Play();
		Destroy(gameObject,2f);
	}

}
