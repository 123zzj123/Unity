using UnityEngine;
using System.Collections;

//Rotates object at constant velocity

public class SOmobileFX_MoveBy : SOmobileFX_Abstract
{
	// Rotation speed vector
	public Vector3 moveby;
	
	void Update()
	{
		singleTransform.Translate(moveby*Time.deltaTime);
	}
}
