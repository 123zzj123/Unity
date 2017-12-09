using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Button2_Move : MonoBehaviour {
    public GameObject Panel;
    float x = 0;
    float y = 25;
    float cur_x;
    float cur_y;
    void Start()
    {
        cur_x = x;
        cur_y = y;
    }
    // Update is called once per frame
    void Update() {
        if (Panel.transform.Find("Image1").gameObject.activeSelf == false)
        {
            Return0();
        }
        Panel.transform.Find("Image2").gameObject.GetComponent<RectTransform>().localPosition = new Vector3(cur_x, cur_y - 155, 0);

    }
    void Return0()
    {
        GetComponent<RectTransform>().localPosition = new Vector3(x, y, 0);
        cur_y = y;
    }
    void OnCollisionEnter2D(Collision2D coll)
    {
        RectTransform coll_Tranform = coll.gameObject.GetComponent<RectTransform>();
        GetComponent<RectTransform>().localPosition = new Vector3(x, y - coll_Tranform.sizeDelta.y, 0);
        cur_y = y - coll_Tranform.sizeDelta.y;
    }
}
