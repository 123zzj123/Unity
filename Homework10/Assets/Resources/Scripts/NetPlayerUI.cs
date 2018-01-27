using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NetPlayerUI : MonoBehaviour {

    public UILabel NameText;
    private Transform _targetTransform;
    private PlayerManager _target;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if (_target == null)
        {
            Destroy(this.gameObject);
            return;
        }
        this.transform.rotation = Camera.main.transform.rotation;
        this.transform.position = new Vector3(_targetTransform.position.x + 0.5f, _targetTransform.position.y + 2.45f, _targetTransform.position.z);
        GetComponentInChildren<MyUISlider>().UpdateVal(_target.PlayerHp / 100);//实时更新玩家的血量
        GetComponentInChildren<MyUISlider1>().UpdateVal(_target.PlayerMp / 100);//实时更新玩家的魔法值
    }

    public void SetTarget(PlayerManager target)
    {

        if (target == null)
        {
            Debug.LogError("<Color=Red><b>Missing</b></Color> PlayMakerManager target for PlayerUI.SetTarget.", this);
            return;
        }

        // Cache references for efficiency because we are going to reuse them.
        _target = target;
        _targetTransform = _target.GetComponent<Transform>();

        if (NameText != null)
        {
            NameText.text = _target.photonView.owner.NickName;
        }
    }
}
