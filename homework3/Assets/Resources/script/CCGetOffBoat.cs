using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCGetOffBoat : SSAction {
    public int side;
    public GenGameObect sceneController;
    public static CCGetOffBoat GetSSAction(int side)
    {
        CCGetOffBoat action = ScriptableObject.CreateInstance<CCGetOffBoat>();
        action.side = side;
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
        if (sceneController.boat[side] != null)
        {
            sceneController.boat[side].transform.parent = null;
            if (sceneController.boat_position == 1)
            {
                
                if (sceneController.boat[side].transform.tag == "Priest")
                {
                    for (int i = 0; i < 3; i++)
                    {
                        if (sceneController.priests_end[i] == null)
                        {
                            sceneController.priests_end[i] = sceneController.boat[side];
                            sceneController.boatCapacity++;
                            break;
                        }
                    }
                }
                else if (sceneController.boat[side].transform.tag == "Devil")
                {
                    for (int i = 0; i < 3; i++)
                    {
                        if (sceneController.devils_end[i] == null)
                        {
                            sceneController.devils_end[i] = sceneController.boat[side];
                            sceneController.boatCapacity++;
                            break;
                        }
                    }
                }
            }
            else if (sceneController.boat_position == 0)
            {
                if (sceneController.boat[side].transform.tag == "Priest")
                {
                    for (int i = 0; i < 3; i++)
                    {
                        if (sceneController.priests_start[i] == null)
                        {
                            sceneController.priests_start[i] = sceneController.boat[side];
                            sceneController.boatCapacity++;
                            break;
                        }
                    }
                }
                else if (sceneController.boat[side].transform.tag == "Devil")
                {
                    for (int i = 0; i < 3; i++)
                    {
                        if (sceneController.devils_start[i] == null)
                        {
                            sceneController.devils_start[i] = sceneController.boat[side];
                            sceneController.boatCapacity++;
                            break;
                        }
                    }
                }
            }
            sceneController.boat[side] = null;
        }
        sceneController.check();
        this.destroy = true;
        this.callback.SSActionEvent(this);
    }
}
