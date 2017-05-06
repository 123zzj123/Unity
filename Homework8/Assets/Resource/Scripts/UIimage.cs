using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIimage : MonoBehaviour {

    private Image mouse_Image;
    public Color visable;
    public Color unvisable;
	// Use this for initialization
	void Start () {
        mouse_Image = GetComponent<Image>();
	}
	
	// Update is called once per frame
	void Update () {
		if(MenuManger.texture != null)
        {
            mouse_Image.color = visable;
            mouse_Image.sprite = MenuManger.texture;
            this.transform.position = new Vector3(Input.mousePosition.x, Input.mousePosition.y, 0);
        }
        else
        {
            mouse_Image.color = unvisable;
        }
	}
}
