using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CCActionManager : SSActionManager, ISSActionCallback
{
    public GenGameObect sceneController;
    public CCGetOnTheBoat getonA;
    public CCGetOffBoat getoffB;
    public CCBoatMoveing boatmovingC;

    // Use this for initialization
    protected void Start () {
        sceneController = (GenGameObect)SSDirector.getInstance().currentScenceController;
        sceneController.actionManager = this;
    }
	
	// Update is called once per frame
	protected new void Update () {
        if (Input.GetMouseButtonDown(0) && sceneController.game == 0)
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                if (hit.transform.tag == "Devil" || hit.transform.tag == "Priest")
                {
                    if (hit.collider.gameObject == sceneController.boat[0] || hit.collider.gameObject == sceneController.boat[1])
                    {
                        if (hit.collider.gameObject == sceneController.boat[0])
                        {
                            getoffB = CCGetOffBoat.GetSSAction(0);
                            this.RunAction(hit.collider.gameObject, getoffB, this);
                        }
                        else
                        {
                            getoffB = CCGetOffBoat.GetSSAction(1);
                            this.RunAction(hit.collider.gameObject, getoffB, this);
                        }
                    }
                    else
                    {
                        getonA = CCGetOnTheBoat.GetSSAction();
                        this.RunAction(hit.collider.gameObject, getonA, this);
                    }
                }
                else if (hit.transform.tag == "Boat" && sceneController.boatCapacity != 2)
                {
                    print(hit.transform.tag);
                    boatmovingC = CCBoatMoveing.GetSSAction();
                    this.RunAction(hit.collider.gameObject, boatmovingC, this);
                }
            }
        }
        base.Update();
    }

    public void SSActionEvent(SSAction source, SSActionEventType events = SSActionEventType.Competeted,
        int intParam = 0, string strParam = null, Object objectParam = null)
    {
        //
    }
}
