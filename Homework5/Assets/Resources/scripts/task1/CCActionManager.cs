using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCActionManager : SSActionManager, ISSActionCallback, IActionManager
{
    public SceneController sceneController;
    public DiskFactory diskFactory;
    public Recorder scoreRecorder;
    public Emit2 EmitDisk;
    public GameObject Disk;
    int count = 0;
    // Use this for initialization
    protected void Start()
    {
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        diskFactory = sceneController.factory;
        scoreRecorder = sceneController.scoreRecorder;
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
                playDisk();
                sceneController.num++;
                print(sceneController.num);
                count = 0;
            }
            base.Update();
        }
    }

    public void playDisk()
    {
        EmitDisk = Emit2.GetSSAction();
        Disk = diskFactory.getDisk(sceneController.round);
        this.RunAction(Disk, EmitDisk, this);
        Disk.GetComponent<DiskData2>().action = EmitDisk;
    }

    public void SSActionEvent(SSAction source, SSActionEventType events = SSActionEventType.Competeted,
        int intParam = 0, string strParam = null, Object objectParam = null)
    {
        if (!source.gameobject.GetComponent<DiskData2>().hit)
        scoreRecorder.miss();
        diskFactory.freeDisk(source.gameobject);
        source.gameobject.GetComponent<DiskData2>().hit = false;
    }
}
