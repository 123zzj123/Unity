var mySkin : GUISkin;
var effect01 : GameObject;
var effect02 : GameObject;
var effect03 : GameObject;
var effect04 : GameObject;
var effect05 : GameObject;
var effect06 : GameObject;
var effect07 : GameObject;
var effect08 : GameObject;
var effect09 : GameObject;
var effect10 : GameObject;
var effect11 : GameObject;
var effect12 : GameObject;
var effect13 : GameObject;
var effect14 : GameObject;
var effect15 : GameObject;
var effect16 : GameObject;
var effect17 : GameObject;
var effect18 : GameObject;
var effect19 : GameObject;
var effect20 : GameObject;
var effect21 : GameObject;
var effect22 : GameObject;
var effect23 : GameObject;
var effect24 : GameObject;
var effect25 : GameObject;
var effect26 : GameObject;
var effect27 : GameObject;
var effect28 : GameObject;
var effect29 : GameObject;
var effect30 : GameObject;
var effect31 : GameObject;
var effect32 : GameObject;
var effect33 : GameObject;
var effect34 : GameObject;
var effect35 : GameObject;
var effect36 : GameObject;
var effect37 : GameObject;
var effect38 : GameObject;
var effect39 : GameObject;
var effect40 : GameObject;
var effect41 : GameObject;


function OnGUI ()
{
	GUI.skin = mySkin;
	
	GUI.Label (Rect (70,10,200,30), "FT_MagicEffect Vol02");

	if(GUI.Button (Rect (10,40,20,20), GUIContent ("", "Projectile01")))
	{	Instantiate(effect01, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (40,40,20,20), GUIContent ("", "Projectile02")))
	{	Instantiate(effect02, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (70,40,20,20), GUIContent ("", "Projectile03")))
	{	Instantiate(effect03, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (100,40,20,20), GUIContent ("", "Projectile04")))
	{	Instantiate(effect04, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (130,40,20,20), GUIContent ("", "Projectile05")))
	{	Instantiate(effect05, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (160,40,20,20), GUIContent ("", "Projectile06")))
	{	Instantiate(effect06, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (190,40,20,20), GUIContent ("", "Projectile07")))
	{	Instantiate(effect07, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	
	if(GUI.Button (Rect (10,70,20,20), GUIContent ("", "Projectile08")))
	{	Instantiate(effect08, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	if(GUI.Button (Rect (40,70,20,20), GUIContent ("", "Projectile09")))
	{	Instantiate(effect09, new Vector3(0, 1.5, 0), Quaternion.Euler(0, 0, 0));	}
	
	GUI.Label (Rect (10,Screen.height-30,200,30), GUI.tooltip);
}