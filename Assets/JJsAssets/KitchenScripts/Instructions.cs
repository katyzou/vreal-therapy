using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;



public class Instructions : MonoBehaviour {

    public GameObject InstructionPanel;
    public Texture[] InstructionSteps;
    private RawImage Step;

	// Use this for initialization
	void Start () {
        Step = (RawImage)InstructionPanel.GetComponent<RawImage>();
	}
	
	// Update is called once per frame
	void Update () {
        Step.texture = (Texture)InstructionSteps[GamePlay.stepsCompleted];
	}
}
