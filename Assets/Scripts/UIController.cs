using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIController : MonoBehaviour {

    public GameObject MainMenuUi;
    public GameObject CreditsUI;

	// Use this for initialization
	void Start () {
		
	}
	
    public void WhackAMole()
    {
        MainMenuUi.SetActive(false);
        Application.LoadLevel(1);
    }

    public void BakeACake()
    {
        MainMenuUi.SetActive(false);
        //Application.LoadLevel(2);
    }

    public void TakeAWalk()
    {
        MainMenuUi.SetActive(false);
        //Application.LoadLevel(3);
    }

    public void Credits()
    {
        MainMenuUi.SetActive(false);
        CreditsUI.SetActive(true);
    }

    public void Back()
    {
        CreditsUI.SetActive(false);
        MainMenuUi.SetActive(true);
    }

    public void BackToMainMenu()
    {

    }
}
