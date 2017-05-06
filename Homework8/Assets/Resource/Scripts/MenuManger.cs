using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Sprites;
using UnityEngine.UI;

public class MenuManger : MonoBehaviour {
    private GameObject Current;
    private GameObject Previous;
    public GameObject Window;
    public GameObject HeadBag;
    public GameObject HandBag;
    public GameObject FootBag;
    public static Sprite texture;
    public static int type = -1;
	// Use this for initialization
	void Start () {
        texture = null;
        Current = Window;
        Previous = Window;
        StartCoroutine(OpenDelay());
    }

    public void getTexture(GameObject obj)
    {
        if(type == -1 || type == obj.GetComponent<Bag>().type)
        {
            Sprite previous = texture;
            texture = obj.GetComponent<Image>().sprite;
            obj.GetComponent<Image>().sprite = previous;
            type = obj.GetComponent<Bag>().type;
        }
        if(texture == null)
        {
            type = -1;
        }
    }
    public void putTexture(GameObject obj)
    {
        if ((type == -1 && obj.GetComponent<Image>().sprite != null)  ||type == obj.GetComponent<Bag>().type)
        {
            Sprite previous = texture;
            texture = obj.GetComponent<Image>().sprite;
            obj.GetComponent<Image>().sprite = previous;
            type = obj.GetComponent<Bag>().type;
        }
        if (texture == null)
        {
            type = -1;
        }
    }
    public IEnumerator OpenDelay()
    {
        int CoolTimes = 1;
        while (CoolTimes > 0)
        {
            print("还剩" + CoolTimes);
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        Current.GetComponent<Animator>().enabled = false;
    }
    public IEnumerator CloseDelay()
    {
        int CoolTimes = 1;
        Previous.GetComponent<Animator>().enabled = true;
        Previous.GetComponent<Animator>().SetBool("Open", false);
        while (CoolTimes > 0)
        {
            print("还剩" + CoolTimes);
            yield return new WaitForSeconds(1);
            CoolTimes--;
        }
        Previous.SetActive(false);
        OpenPanel();
    }
    void OpenPanel()
    {
        Current.SetActive(true);
        Previous.GetComponent<Animator>().enabled = true;
        Current.GetComponent<Animator>().SetBool("Open", true);
        StartCoroutine(OpenDelay());
    }

    public void OpenPanel(GameObject panel)
    {
        Previous = Current;
        Current = panel;
        StartCoroutine(CloseDelay());
    }
}
