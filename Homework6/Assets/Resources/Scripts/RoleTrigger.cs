using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoleTrigger : MonoBehaviour {
    public delegate void GameOver();
    public static event GameOver gameOver;
    void OnCollisionEnter(Collision other)
    {
        if(other.gameObject.tag == "Guard")
        {
            this.GetComponent<Animator>().SetInteger("state",2);
            other.gameObject.GetComponent<Animator>().SetInteger("state1", 2);
            if(gameOver != null)
            {
                gameOver();
            }
        }
    }
}
