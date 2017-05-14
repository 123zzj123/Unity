using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Emit : SSAction
{
    bool enableEmit = true;
    Vector3 force;
    float startX;
    public SceneController sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
    // Use this for initialization
    public override void Start () {
        startX = 6 - Random.value * 12;
        this.transform.position = new Vector3(startX, 0, 0);
        force = new Vector3(6 * Random.Range(-1, 1), 6 * Random.Range(0.5f, 2), 13 + 2 * sceneControler.round);
    }
    public static Emit GetSSAction()
    {
        Emit action = ScriptableObject.CreateInstance<Emit>();
        return action;
    }

    public override void Update()
    {
        //
    }
    public void Destory()
    {
        this.destroy = true;
        this.callback.SSActionEvent(this);
    }
    // Update is called once per frame
    public override void FixedUpdate () {
        if(!this.destroy)
        {
            if(enableEmit)
            {
                gameobject.GetComponent<Rigidbody>().velocity = Vector3.zero;
                gameobject.GetComponent<Rigidbody>().AddForce(force, ForceMode.Impulse);
                enableEmit = false;
            }
        }
	}
}
