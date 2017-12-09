using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowSkill : MonoBehaviour {
    public GameObject Skill1;
    public GameObject Skill2;
    public GameObject Skill3;
    public float RotateSpeed = 10.0f;
    // Use this for initialization
    void Start()
    {

    }
    public void Attack1(int ID)
    {
        GetComponent<Animator>().SetInteger("state", 2);
        GetComponent<Animator>().Play("Attack1", 0);
        GetComponent<Animator>().SetInteger("state", 0);
        Skill1.SetActive(true);
        if(ID == 6 || ID == 7 || ID == 0 || ID == 1)
        {
            Skill1.GetComponent<EffectShow2>().Initial = true;
        }
        else
        {
            Skill1.GetComponent<EffectShow1>().Initial = true;
        }
    }

    public void Attack2(int ID)
    {
        GetComponent<Animator>().SetInteger("state", 3);
        GetComponent<Animator>().Play("Attack2");
        GetComponent<Animator>().SetInteger("state", 0);
        Skill2.SetActive(true);
        if (ID == 6 || ID == 7 || ID == 0 || ID == 1)
        {
            Skill2.GetComponent<EffectShow2>().Initial = true;
        }
        else
        {
            Skill2.GetComponent<EffectShow1>().Initial = true;
        }
    }

    public void Attack3(int ID)
    {
        GetComponent<Animator>().SetInteger("state", 4);
        GetComponent<Animator>().Play("Attack3");
        GetComponent<Animator>().SetInteger("state", 0);
        Skill3.SetActive(true);
        if (ID == 6 || ID == 7 || ID == 0 || ID == 1)
        {
            Skill3.GetComponent<EffectShow2>().Initial = true;
        }
        else
        {
            Skill3.GetComponent<EffectShow1>().Initial = true;
        }
    }

    public void OnMouseDrag()
    {
        float mouse = Input.GetAxis("Mouse X") * RotateSpeed;
        this.transform.Rotate(new Vector3(0, -mouse, 0));
    }
}

