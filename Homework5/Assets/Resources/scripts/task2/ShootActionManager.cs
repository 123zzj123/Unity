using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootActionManager : SSActionManager, ISSActionCallback, ShootAction
{
    public ShootController sceneController;
    public DiskFactory1 ArrowFactory;
    public Recorder scoreRecorder;
    public GameObject Arrow;
    public Emit3 EmitArrow;
    protected void Start()
    {
        sceneController = (ShootController)SSDirector.getInstance().currentScenceController;
        ArrowFactory = sceneController.factory;
        sceneController.actionManager = this;
    }

    protected new void Update()
    {
        base.Update();
    }
    public void playArrow()
    {
        EmitArrow = Emit3.GetSSAction();
        Arrow = ArrowFactory.getArrow(sceneController.round);
        this.RunAction(Arrow, EmitArrow, this);
        Arrow.GetComponent<DiskData3>().action = EmitArrow;
    }
    public void SSActionEvent(SSAction source, SSActionEventType events = SSActionEventType.Competeted,
        int intParam = 0, string strParam = null, Object objectParam = null)
    {
        ArrowFactory.freeArrow(source.gameobject);
        Debug.Log("free");
        source.gameobject.GetComponent<DiskData3>().hit = false;
    }
}
