using UnityEngine;
using System.Collections;
public class computer : MonoBehaviour {
	private string info;
	void Start() {

	}
	void OnGUI() {
		GUIStyle fontStyle = new GUIStyle ();
		fontStyle.fontSize = 40;
		fontStyle.normal.textColor = new Color (0, 255, 0);
		GUI.Label (new Rect (280, 80, 100, 60), "简单计算器", fontStyle);
	}
}