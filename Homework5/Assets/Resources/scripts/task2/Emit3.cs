using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Emit3 : SSAction
{
    int count = 0;
    bool enableEmit = true;
    Vector3 force;
    public ShootController sceneControler = (ShootController)SSDirector.getInstance().currentScenceController;
    public static Emit3 GetSSAction()
    {
        Emit3 action = ScriptableObject.CreateInstance<Emit3>();
        return action;
    }
    // Use this for initialization
    public override void Start()
    {
        force = new Vector3(0, 0.3f, 2);
        gameobject.transform.parent = null;
	}

    // Update is called once per frame
    public override void Update()
    {
		
	}

    public void Destory()
    {
        this.destroy = true;
        this.callback.SSActionEvent(this);
        Destroy(gameobject.GetComponent<BoxCollider>());
    }

    public override void FixedUpdate()
    {
        count++;
        if (!this.destroy)
        {
            if (enableEmit)
            {
                gameobject.GetComponent<Rigidbody>().velocity = Vector3.zero;
                gameobject.GetComponent<Rigidbody>().AddForce(force, ForceMode.Impulse);
                enableEmit = false;
            }
        }
        if(count == 60)
        {
            gameobject.AddComponent<BoxCollider>();
        }
    }
}
