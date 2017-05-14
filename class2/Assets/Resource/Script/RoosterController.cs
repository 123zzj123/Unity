using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoosterController : MonoBehaviour {

    //路径寻路中的所有点
    public Transform[] paths;
    public Transform Crow;
    private Animator ani;
    int n = 0;

    void Start()
    {
        ani = GetComponent<Animator>();
        Hashtable args = new Hashtable();
        //设置路径的点
        args.Add("path", paths);
        //设置类型为线性，线性效果会好一些。
        args.Add("easeType", iTween.EaseType.linear);
        //设置寻路的速度
        args.Add("speed", 10f);
        //是否先从原始位置走到路径中第一个点的位置
        args.Add("movetopath", true);
        //循环
        args.Add("loopType", "loop");
        //是否让模型始终面朝当面目标的方向，拐弯的地方会自动旋转模型
        //如果你发现你的模型在寻路的时候始终都是一个方向那么一定要打开这个
        args.Add("orienttopath", false);
        //让模型开始寻路	
        iTween.MoveTo(gameObject, args);
    }

    void OnDrawGizmos()
    {
        //在scene视图中绘制出路径与线
        iTween.DrawLine(paths, Color.yellow);
        iTween.DrawPath(paths, Color.red);
    }
    void Update()
    {
        float safeDis = Vector3.Distance(this.transform.position, Crow.position);
        if (safeDis < 10)
        {
            ani.SetInteger("state", 1);
        }
        else
        {
            ani.SetInteger("state", 0);
        }
        float dis = Vector3.Distance(this.transform.position, paths[n].position);
        if (dis < 0.10f)
        {
            n++;
            if (n == 6)
            {
                n = 0;
            }
            this.transform.LookAt(paths[n]);
            this.transform.Rotate(new Vector3(0, 180, 0));
        }
    }
}
