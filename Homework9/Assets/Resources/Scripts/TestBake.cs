using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class TestBake : MonoBehaviour {
    private NavMeshAgent agent;
    private Animator animation1;

    void Start()
    {
        //获取组件  
        agent = GetComponent<NavMeshAgent>();
        animation1 = GetComponent<Animator>();
    }


    void Update()
    {
        if(Bridge.Open == false)
        {
            agent.areaMask = -1;
        }
        else
        {
            agent.areaMask = 1;
        }

        //鼠标左键点击  
        if (Input.GetMouseButtonDown(0))
        {
            //摄像机到点击位置的的射线  
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                Debug.Log(hit.collider.name);
                //判断点击的是否地形
                /*
                if (!hit.collider.name.Equals("Plane"))
                {
                    return;
                }
                */
                //点击位置坐标  
                Vector3 point = hit.point;
                Debug.Log(point);
                //转向  
                transform.LookAt(new Vector3(point.x, point.y, point.z));
                //设置寻路的目标点  
                agent.SetDestination(point);
            }
        }


        //播放动画，判断是否到达了目的地，播放空闲或者跑步动画  
        if (agent.remainingDistance < 0.5f)
        {
            animation1.Play("idle");
        }
        else
        {
            animation1.Play("run");
        }

    }
}
