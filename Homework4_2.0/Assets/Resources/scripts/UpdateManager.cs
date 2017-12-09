using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateManager : MonoBehaviour {
    public GameObject UpdatePanel;
    public SceneController sceneControler { get; set; }
    void Awake()
    {
        sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
        sceneControler.updateManager = this;
    }
    public void OpenPanel()
    {
        UpdatePanel.SetActive(true);
    }
    public void ClosePanel()
    {
        UpdatePanel.GetComponent<Animator>().SetBool("Open", false);
        StartCoroutine(CloseDelay());
    }

    public IEnumerator CloseDelay()
    {
        int CoolTimes = 1;
        while (CoolTimes > 0)
        {
            print("还剩" + CoolTimes);
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        UpdatePanel.SetActive(false);
    }
}
