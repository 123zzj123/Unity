using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public interface IUserAction
{
    void ShowDetail();
    void ReStart();
}

public class UserInterface : MonoBehaviour {
    private IUserAction action;
    public GameObject role;
    public float speed = 1;
    public SceneController sceneController;
    private Rigidbody rig;
    // Use this for initialization
    void Start () {
        action = SSDirector.getInstance().currentScenceController as IUserAction;
        sceneController = (SceneController)SSDirector.getInstance().currentScenceController;
        role = sceneController.role;
        rig = role.GetComponent<Rigidbody>();
    }
    void OnGUI()
    {
        GUIStyle fontstyle1 = new GUIStyle();
        fontstyle1.fontSize = 50;
        fontstyle1.normal.textColor = new Color(255, 255, 255);
        if (GUI.RepeatButton(new Rect(0, 0, 120, 40), "ESCAPE"))
        {
            action.ShowDetail();
        }
        if (GUI.Button(new Rect(0, 60, 120, 40), "RESTART"))
        {
            action.ReStart();
        }
    }
    // Update is called once per frame
    void Update () {
        if(sceneController.game == 1)
        {
            if(Input.GetKeyDown(KeyCode.Space) && role.transform.position.y < 0.55)
            {
                rig.AddForce(new Vector3(0, 4, 0), ForceMode.Impulse);
            }
            float translationX = Input.GetAxis("Horizontal") * speed;
            float translationZ = Input.GetAxis("Vertical") * speed;
            translationX *= Time.deltaTime;
            translationZ *= Time.deltaTime;
            if(translationX != 0 || translationZ != 0)
            {
                role.GetComponent<Animator>().SetInteger("state", 1);
            }
            else
            {
                role.GetComponent<Animator>().SetInteger("state", 0);
            }
            role.transform.Translate(translationX, 0, 0);
            role.transform.Translate(0, 0, translationZ);
        }
    }
}
