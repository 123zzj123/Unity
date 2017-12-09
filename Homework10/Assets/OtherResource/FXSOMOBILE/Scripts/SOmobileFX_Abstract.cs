using UnityEngine;
using System.Collections;

/// <summary>
/// Base class.
/// </summary>
public class SOmobileFX_Abstract : MonoBehaviour {

	private Transform _singleTransform = null;
	private Renderer _singleRenderer = null;
	
    public Transform singleTransform {
        get {
            return _singleTransform;
        }
        protected set {
            _singleTransform = value;
        }
    }
	
    public Renderer singleRenderer {
        get {
            return _singleRenderer;
        }
        protected set {
            _singleRenderer = value;
        }
    }
	
	public virtual void Awake(){
		singleTransform = transform;
		singleRenderer = GetComponent<Renderer>();
	}
}


