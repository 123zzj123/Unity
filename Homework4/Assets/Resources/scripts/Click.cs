using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Click : MonoBehaviour, ISceneController{
    GameObject obj;
    int CoolTimes = 2;
    void Awake()
    //创建导演实例并载入资源
    {
        SSDirector director = SSDirector.getInstance();
        director.setFPS(60);
        director.currentScenceController = this;
        director.currentScenceController.LoadResources();
    }
    // Use this for initialization
    void Start () {
		
	}
    public void LoadResources()
    {
        for(int i = 0; i < 10; i++)
        {
            for(int j = 0; j < 10; j++)
            {
                Instantiate(Resources.Load("prefabs/Ground"),new Vector3(i,0,j), Quaternion.identity);
            }
        }
    }
    // Update is called once per frame
    void Update () {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                if (hit.transform.tag == "Finish")
                {
                    print("Hit!!!");
                    obj = Diskfactory1.getInstance().getCube();
                    obj.transform.position = hit.collider.gameObject.transform.position;
                    obj.transform.position += new Vector3(0, 0.5f, 0);
                    Destroy(obj, 2.0f);
                }
            }
        }
    }

}
