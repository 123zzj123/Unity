using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Button3_Move : MonoBehaviour {

    public GameObject Panel;
    float cur_x;
    float cur_y;
    float x = 0;
    float y = -95;
    float x1 = 0;
    float y1 = -299;

    void Start()
    {
        cur_x = x;
        cur_y = y;
    }
    // Update is called once per frame
    void Update()
    {
        Panel.transform.Find("Image3").gameObject.GetComponent<RectTransform>().localPosition = new Vector3(cur_x, cur_y - 165, 0);
        if (Panel.transform.Find("Image1").gameObject.activeSelf == true)
        {
            if(Panel.transform.Find("Image2").gameObject.activeSelf == false)
            {
                Return2();
            }
        }
        else
        {
            if (Panel.transform.Find("Image2").gameObject.activeSelf == false)
            {
                Return1();
            }
            else
            {
                Return2();
            }
        }
    }
    void Return1()
    {
        GetComponent<RectTransform>().localPosition = new Vector3(x, y, 0);
        cur_y = y;
    }
    void Return2()
    {
        GetComponent<RectTransform>().localPosition = new Vector3(x1, y1, 0);
        cur_y = y1;
    }
    void OnCollisionEnter2D(Collision2D coll)
    {
        RectTransform coll_Tranform = coll.gameObject.GetComponent<RectTransform>();
        Debug.Log(coll.gameObject.name);
        GetComponent<RectTransform>().localPosition = new Vector3(cur_x, cur_y - coll_Tranform.sizeDelta.y, 0);
        cur_y = cur_y - coll_Tranform.sizeDelta.y;
    }
}
