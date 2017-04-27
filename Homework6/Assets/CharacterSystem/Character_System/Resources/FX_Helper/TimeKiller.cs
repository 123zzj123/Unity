using UnityEngine;
using System.Collections;

public class TimeKiller : MonoBehaviour 
{
	public float lifeTime = 1f;
	
	void OnEnable ()
	{
		Destroy( this.gameObject, lifeTime );
	}
}
