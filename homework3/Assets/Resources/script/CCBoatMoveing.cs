using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCBoatMoveing : SSAction {
    public GenGameObect sceneController;

    public static CCBoatMoveing GetSSAction()
    {
        CCBoatMoveing action = ScriptableObject.CreateInstance<CCBoatMoveing>();
        return action;
    }
    // Use this for initialization
    public override void Start()
    {
        sceneController = (GenGameObect)SSDirector.getInstance().currentScenceController;
    }

    // Update is called once per frame
    public override void Update()
    {
        if (sceneController.boat_position == 1)
        {
            sceneController.boat_position = 0;
            while (this.transform.position != sceneController.boatStartPos)
                this.transform.position = Vector3.MoveTowards(this.transform.position, sceneController.boatStartPos, 1);
        }
        else if (sceneController.boat_position == 0)
        {
            sceneController.boat_position = 1;
            while (this.transform.position != sceneController.boatEndPos)
                this.transform.position = Vector3.MoveTowards(this.transform.position, sceneController.boatEndPos, 1);
        }
        sceneController.check();
        this.destroy = true;
        this.callback.SSActionEvent(this);
    }
}
