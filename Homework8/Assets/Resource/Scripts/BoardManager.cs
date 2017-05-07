using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoardManager : MonoBehaviour {
    public void ControlBoard(GameObject obj)
    {
        bool open = obj.GetComponent<Board>().Open;
        open = !open;
        obj.GetComponent<Board>().Open = open;
        obj.SetActive(open);
    }
}
