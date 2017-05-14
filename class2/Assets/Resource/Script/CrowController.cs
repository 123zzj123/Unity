using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CrowController : MonoBehaviour {
    public float speed = 4.0f;
	private Animator ani;
    private Rigidbody rig;
	// Use this for initialization
	void Start () {
        ani = GetComponent<Animator>();
        rig = GetComponent<Rigidbody>();
	}
	void Update()
    {
        if(Input.GetKeyDown(KeyCode.A))
        {
            this.transform.Rotate(new Vector3(0, 45, 0));
            rig.velocity = Vector3.zero;
            Debug.Log(transform.eulerAngles);
        }
        else if (Input.GetKeyDown(KeyCode.D))
        {
            this.transform.Rotate(new Vector3(0, -45, 0));
            rig.velocity = Vector3.zero;
            Debug.Log(transform.eulerAngles);
        }
    }
	// Update is called once per frame
	void FixedUpdate () {
        rig.AddForce(new Vector3(Mathf.Sin(transform.eulerAngles.y * Mathf.PI / 180), 0, Mathf.Cos(transform.eulerAngles.y * Mathf.PI / 180)), ForceMode.Force);
        float high = Input.GetAxis("Vertical") * speed;
        rig.AddForce(Vector3.up * (high + 9), ForceMode.Force);
        float right = Input.GetAxis("Horizontal") * speed;
        rig.AddForce(Vector3.right * right, ForceMode.Force);
        if(Input.GetButtonDown("Fire1"))
        {
            ani.SetInteger("fly_attack_trigger", 1);
        }
        if (Input.GetButtonDown("Fire2"))
        {
            ani.SetInteger("fly_attack_trigger", 2);
        }
	}
    void StopAttack()
    {
        ani.SetInteger("fly_attack_trigger", 0);
        Debug.Log("0");
    }
    void OnCollisionEnter(Collision other)
    {
        Debug.Log(other.gameObject.name);
        ani.SetBool("live", false);
    }
}
