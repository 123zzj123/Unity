using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCActionManager : SSActionManager, ISSActionCallback
{
    public SceneController sceneController;
    public DiskFactory diskFactory;
    public Emit2 EmitDisk;
    int count = 0;
    // Use this for initialization
    protected void Start()
    {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        diskFactory = DiskFactory.getInstance();
        sceneController.actionManager = this;
    }

    // Update is called once per frame
    protected new void Update()
    {
        if (sceneController.round <= 3 && sceneController.game == 1)
        {
            count++;
            if (count == 60)
            {
                EmitDisk = Emit2.GetSSAction();
                this.RunAction(diskFactory.getDisk(sceneController.round), EmitDisk, this);
                sceneController.num++;
                print(sceneController.num);
                count = 0;
            }
            base.Update();
        }
    }

    public void SSActionEvent(SSAction source, SSActionEventType events = SSActionEventType.Competeted,
        int intParam = 0, string strParam = null, Object objectParam = null)
    {
        //
    }
}
