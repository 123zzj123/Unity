using UnityEngine;

public class ReloadLvl : MonoBehaviour 
{
	// Update is called once per frame
	void Update () 
	{
		if (Input.GetKeyDown("0"))
		{
			Application.LoadLevel(0);
		}
		else if (Input.GetKeyDown("9"))
		{
			Application.LoadLevel(1);
		}
	}
}
