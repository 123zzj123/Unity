using UnityEngine;
using System.Collections;

public class DemoScene : MonoBehaviour {

	public FXBlock[] fxBlocks;
	
	public GameObject ground;
	
	private int totalCount = 0;
	private int currentNumber = 1;
	private float spawnNextTime = -1f;
	private float spawnPeriod = 2f;
	private float prevspawnPeriod;
	private bool loop = false;
	private int currentBlockId = 0;
	private FXBlock currentBlock;
	private int currentPrefabId = 0;
	private string currentPrefabName = "";
	private string spawnPeriodString;
	
	void Start()
	{
		currentBlock = fxBlocks[0];
		for(int i=0;i<fxBlocks.Length;i++){
			FXBlock fxBlock = fxBlocks[i];
			totalCount+=fxBlock.particlePrefabs.Length;
		}
		spawnPeriodString=spawnPeriod.ToString("00.0");
		prevspawnPeriod=spawnPeriod;
	}
	
	void OnGUI()
	{		
		GUILayout.BeginArea(new Rect(10,10,Screen.width-10,30));
		GUILayout.BeginHorizontal();
		
		GUILayout.Label("Spawn Period", GUILayout.Width(90));
		
		GUILayout.Label(currentPrefabName, GUILayout.Width(350));
				
		GUILayout.EndHorizontal();
		GUILayout.EndArea();
		
		
		GUILayout.BeginArea(new Rect(10,40,Screen.width-10,30));
		GUILayout.BeginHorizontal();
		
		//spawnPeriod
		float newspawnPeriod;
		spawnPeriodString = GUILayout.TextField(spawnPeriodString,GUILayout.Width(40));
		if (float.TryParse(spawnPeriodString, out newspawnPeriod))
    	{
        	spawnPeriod = newspawnPeriod;
			if(spawnPeriod<0.1f)
			{
				spawnPeriod=0.1f;
			}
			
			if(spawnPeriod>=100)
			{
				spawnPeriod=99.9f;
			}
			
			
			if(prevspawnPeriod!=spawnPeriod)
			{
				spawnNextTime-= prevspawnPeriod-spawnPeriod;
			}
			prevspawnPeriod=spawnPeriod;
    	}
		
		spawnPeriodString=spawnPeriod.ToString("00.0");
		
		GUILayout.Label("", GUILayout.Width(50));
		
		if(GUILayout.Button("Prev",GUILayout.Width(60)))
		{
			currentPrefabId--;
			currentNumber--;
			if(currentPrefabId<0){
				currentBlockId--;
				if(currentBlockId<0){
					currentNumber = totalCount;
					currentBlockId = fxBlocks.Length-1;	
				}
				currentBlock = fxBlocks[currentBlockId];
				currentPrefabId = currentBlock.particlePrefabs.Length-1;
			}
			SwitchCurrentParticle();
		}
		
		if(GUILayout.Button("Next",GUILayout.Width(60)))
		{
			currentPrefabId++;
			currentNumber++;
			if(currentPrefabId>currentBlock.particlePrefabs.Length-1){
				currentBlockId++;
				if(currentBlockId>fxBlocks.Length-1){
					currentBlockId = 0;	
					currentNumber = 1;
				}
				currentBlock = fxBlocks[currentBlockId];
				currentPrefabId = 0;
			}
			SwitchCurrentParticle();
		}
		
		GUILayout.EndHorizontal();
		GUILayout.EndArea();
		
		GUI.Label (new Rect (Screen.width - 250,Screen.height - 40,250,250), "Click on the ground to spawn a particle");
	}
	
	void Update(){
		if(!loop&&Time.time>spawnNextTime){
			EmmitAParticle(currentBlock.particlePrefabs[currentPrefabId]);
			spawnNextTime = Time.time+spawnPeriod;
		}
		MakeDetectionMouseTouch();
	}
	
	protected void MakeDetectionMouseTouch()
	{
		#if UNITY_IPHONE || UNITY_WP8 || UNITY_ANDROID
			MakeDetectionTouch();
		#else
        	MakeDetectionMouse();
		#endif
	}
	
	protected void MakeOnTouch(Vector3 mousePosition)
	{
	
		Ray ray = Camera.main.ScreenPointToRay (mousePosition);
	    RaycastHit hit= new RaycastHit();
	    if (ground.GetComponent<Collider>().Raycast (ray,out hit, 100.0f)) {
			if(loop){
				DestroyAllParticles();
			}
			GameObject particlePrefab = currentBlock.particlePrefabs[currentPrefabId];
			EmmitAParticle(particlePrefab, false, hit.point.x, hit.point.z);
	    }
	}
	
	protected void MakeDetectionMouse()
	{
		//left mouse button
		if(Input.GetMouseButtonDown (0)){
			MakeOnTouch(Input.mousePosition);
		}
	}
	
	protected void MakeDetectionTouch()
	{
        int count = Input.touchCount;
		Touch touch; 
        for (int i = 0; i < count; i++) {
            touch = Input.GetTouch (i); 
			switch (touch.phase) {
            		case TouchPhase.Began:MakeOnTouch(touch.position);
					break;
				}
			}
	}
	
	private void SwitchCurrentParticle(){
		DestroyAllParticles();
		spawnNextTime = -1f;
		loop = false;
	}
	
	private void DestroyAllParticles(){
		for(int i=0;i<ground.transform.GetChildCount();i++){
			Transform objToDelete = ground.transform.GetChild(i);
			Destroy(objToDelete.gameObject);
		}
	}
	
	private void EmmitAParticle(GameObject particlePrefab, bool randomPlace = true, float x = 0f, float z = 0f){
		currentPrefabName = string.Format("{0}/{1} ({2}/{3})", currentBlock.name, particlePrefab.name, currentNumber, totalCount);
		Object particleObject = Instantiate(particlePrefab);
		GameObject shadowGameObject = new GameObject();
		shadowGameObject.name = "shadow object for "+particlePrefab.name;
		Transform shadowGameObjectTransform = shadowGameObject.transform;
		float y;
		
		ParticleSystem particleSystem = (particleObject as GameObject).GetComponent<ParticleSystem>();
		
		if(particleSystem!=null){
			loop = particleSystem.loop;
			if(!loop){
				Destroy(shadowGameObject,10f);
			}
			y = particleSystem.transform.position.y;
			particleSystem.transform.parent = shadowGameObjectTransform;
			particleSystem.transform.localPosition = Vector3.zero;
		}else{
			GameObject particleGameObject = particleObject as GameObject;
			Destroy(shadowGameObject,10f);
			y = particleGameObject.transform.position.y;
			particleGameObject.transform.parent = shadowGameObjectTransform;
			particleGameObject.transform.localPosition = Vector3.zero;
		}
		
		shadowGameObjectTransform.parent = ground.transform;
		if(loop){
			float shadowObjectX;
			float shadowObjectZ;
			if(randomPlace){
			 	shadowObjectX = ground.transform.position.x;
				shadowObjectZ = 0f*ground.transform.localScale.z+(float)ground.transform.position.z;
			}else{
				shadowObjectX = x;
				shadowObjectZ = z;
			}
			shadowGameObjectTransform.position = new Vector3(shadowObjectX,y,shadowObjectZ);
		}else{
			float shadowObjectX;
			float shadowObjectZ;
			if(randomPlace){
			 	shadowObjectX = Random.Range(-0.2f,0.2f)*ground.transform.localScale.x+(float)ground.transform.position.x;
				shadowObjectZ = Random.Range(-0.3f,0f)*ground.transform.localScale.z+(float)ground.transform.position.z;
			}else{
				shadowObjectX = x;
				shadowObjectZ = z;
			}
			shadowGameObjectTransform.position = new Vector3(shadowObjectX,y,shadowObjectZ);
		}
	}
}
