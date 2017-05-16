using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Diskfactory1 : System.Object
{
    private static Diskfactory1 _instance;
    public List<GameObject> used;
    public List<GameObject> free;
    public static Diskfactory1 getInstance()
    {
        if (_instance == null)
        {
            _instance = new Diskfactory1();
            _instance.used = new List<GameObject>();
            _instance.free = new List<GameObject>();
        }
        return _instance;
    }

    public GameObject getCube()
    {
        GameObject newDisk;
        if (free.Count == 0)
        {
            newDisk = GameObject.Instantiate(Resources.Load("prefabs/Attack")) as GameObject;
        }
        else
        {
            newDisk = free[0];
            free.Remove(free[0]);
        }
        used.Add(newDisk);
        return newDisk;
    }

    public void freeCube(GameObject disk1)
    {
        for (int i = 0; i < used.Count; i++)
        {
            if (used[i] == disk1)
            {
                used.Remove(disk1);
                disk1.SetActive(true);
                free.Add(disk1);
            }
        }
        return;
    }

}
