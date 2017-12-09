using UnityEngine;
using System.Collections;

//Rotates object at constant velocity

public class SOmobileFX_Rotate : SOmobileFX_Abstract
{
	// Rotation speed vector
	public Vector3 rotation;
	
	void Update()
	{
		singleTransform.Rotate(rotation * Time.deltaTime);
	}
}
