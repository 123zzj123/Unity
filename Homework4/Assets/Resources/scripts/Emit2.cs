using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Emit2 : SSAction
{
    public SceneController sceneControler = (SceneController)SSDirector.getInstance().currentScenceController;
    public GameObject target;   //要到达的目标  
    public float speed;    //速度  
    private float distanceToTarget;   //两者之间的距离  
    float startX;
    float targetX;
    float targetY;

    public override void Start()
    {
        speed = 5 + sceneControler.round * 5;//使速度随着轮数变化
        startX = 6 - Random.value * 12;//使发射位置随机在（-6,6）
        if (Random.value > 0.5)
        {
            targetX = 32;
        }
        else
        {
            targetX = -32;
        }
        targetY = (Random.value * 25);//随机在（0,25）
        this.transform.position = new Vector3(startX, 0, 0);
        target = new GameObject();//创建终点
        target.transform.position = new Vector3(targetX, targetY, 30);
        //计算两者之间的距离  
        distanceToTarget = Vector3.Distance(this.transform.position, target.transform.position);
    }
    public static Emit2 GetSSAction()
    {
        Emit2 action = ScriptableObject.CreateInstance<Emit2>();
        return action;
    }
    public override void Update()
    {
        Vector3 targetPos = target.transform.position;

        //让始终它朝着目标  
        gameobject.transform.LookAt(targetPos);

        //计算弧线中的夹角  
        float angle = Mathf.Min(1, Vector3.Distance(gameobject.transform.position, targetPos) / distanceToTarget) * 45;
        gameobject.transform.rotation = gameobject.transform.rotation * Quaternion.Euler(Mathf.Clamp(-angle, -42, 42), 0, 0);
        float currentDist = Vector3.Distance(gameobject.transform.position, target.transform.position);
        gameobject.transform.Translate(Vector3.forward * Mathf.Min(speed * Time.deltaTime, currentDist));
        if (this.transform.position == target.transform.position)
        {
            DiskFactory.getInstance().freeDisk(gameobject);
            Destroy(target);
            this.destroy = true;
            this.callback.SSActionEvent(this);
        }
    }
}
