using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DiskFactory1 : MonoBehaviour {
    private static DiskFactory1 _instance;
    public ShootController sceneControler { get; set; }
    public Recorder scoreRecorder;
    GameObject arrow;
    public List<GameObject> used;
    public List<GameObject> free;
    private void Awake()
    {
        if (_instance == null)
        {
            _instance = Singleton<DiskFactory1>.Instance;
            _instance.used = new List<GameObject>();
            _instance.free = new List<GameObject>();
        }
    }
    // Use this for initialization
    void Start () {
        sceneControler = (ShootController)SSDirector.getInstance().currentScenceController;
        sceneControler.factory = this;
        arrow = Instantiate(Resources.Load("prefabs/Arrow01")) as GameObject;
        arrow.transform.parent = sceneControler.Bow.transform;
        arrow.transform.localEulerAngles = new Vector3(90, 0, -90);
        free.Add(sceneControler.Arrow);
    }
    public GameObject getArrow(int round)
    {
        GameObject newArrow;
        if (free.Count == 0)
        {
            newArrow = GameObject.Instantiate(Resources.Load("prefabs/Arrow01")) as GameObject;
        }
        else
        {
            newArrow = free[0];
            free.Remove(free[0]);
        }
        newArrow.transform.position = arrow.transform.position;
        newArrow.transform.parent = sceneControler.Bow.transform;
        newArrow.transform.localEulerAngles = new Vector3(90, 0, -90);
        used.Add(newArrow);
        return newArrow;
    }
    public void freeArrow(GameObject arrow1)
    {
        for (int i = 0; i < used.Count; i++)
        {
            if (used[i] == arrow1)
            {
                used.Remove(arrow1);
                arrow1.SetActive(true);
                free.Add(arrow1);
            }
        }
        return;
    }
}
