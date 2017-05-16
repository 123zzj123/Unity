using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCGetOnTheBoat : SSAction
{
    public GenGameObect sceneController;

    public static CCGetOnTheBoat GetSSAction()
    {
        CCGetOnTheBoat action = ScriptableObject.CreateInstance<CCGetOnTheBoat>();
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
        if (sceneController.boatCapacity != 0)
        {
            if (sceneController.boat_position == 0)
            {
                for (int i = 0; i < 3; ++i)
                {
                    if (sceneController.devils_start[i] == gameobject)
                    {
                        sceneController.devils_start[i] = null;
                        sceneController.find = 1;
                    }
                    if (sceneController.priests_start[i] == gameobject)
                    {
                        sceneController.priests_start[i] = null;
                        sceneController.find = 1;
                    }
                }
            }
            else if (sceneController.boat_position == 1)
            {
                for (int i = 0; i < 3; ++i)
                {
                    if (sceneController.devils_end[i] == gameobject)
                    {
                        sceneController.devils_end[i] = null;
                        sceneController.find = 1;
                    }
                    if (sceneController.priests_end[i] == gameobject)
                    {
                        sceneController.priests_end[i] = null;
                        sceneController.find = 1;
                    }
                }
            }

            if (sceneController.find == 1)
                gameobject.transform.parent = sceneController.boat_obj.transform;

            if (sceneController.boat[0] == null && sceneController.find == 1)
            {
                sceneController.boat[0] = gameobject;
                sceneController.boat[0].transform.tag = gameobject.transform.tag;
                sceneController.boatCapacity--;
                this.transform.localPosition = new Vector3(0, 1.2f, 0.19f);
            }
            else if (sceneController.boat[1] == null && sceneController.find == 1)
            {
                sceneController.boat[1] = gameobject;
                sceneController.boat[1].transform.tag = gameobject.transform.tag;
                sceneController.boatCapacity--;
                this.transform.localPosition = new Vector3(0, 1.2f, -0.12f);
            }
        }
        sceneController.find = 0;
        this.destroy = true;
        this.callback.SSActionEvent(this);
    }
}
