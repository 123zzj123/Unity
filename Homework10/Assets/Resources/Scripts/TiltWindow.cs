using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TiltWindow : MonoBehaviour
{
    public Vector2 range = new Vector2(5f, 3f);//旋转范围  

    Transform mTrans;
    Quaternion mStart;
    Vector2 mRot = Vector2.zero;

    void Start()
    {
        mTrans = transform;
        mStart = mTrans.localRotation;
    }

    void Update()
    {
        Vector3 pos = Input.mousePosition;//获取鼠标位置  

        float halfWidth = Screen.width * 0.5f;
        float halfHeight = Screen.height * 0.5f;
        float x = Mathf.Clamp((pos.x - halfWidth) / halfWidth, -1f, 1f);//求相对x比例，并且限制上下界  
        float y = Mathf.Clamp((pos.y - halfHeight) / halfHeight, -1f, 1f);//求相对y比例，并且限制上下界  
        mRot = Vector2.Lerp(mRot, new Vector2(x, y), Time.deltaTime * 5f);//求插值  

        mTrans.localRotation = mStart * Quaternion.Euler(-mRot.y * range.y, mRot.x * range.x, 0f);//进行旋转  
    }
}
