using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIController : MonoBehaviour {

    public GameObject MainMenuUi;
    public GameObject CreditsUI;

    /* Buttons hexavalues:
     * highlight: 00FF21FF
     * clicked: F95656FF
     */
    
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
<<<<<<< HEAD
        Application.LoadLevel(3);
=======
        //Application.LoadLevel(3);
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
    }

    public void TakeAWalk()
    {
        MainMenuUi.SetActive(false);
        Application.LoadLevel(2);
        //forest
        //desert
        //iceland
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
        Application.LoadLevel(0);
        
    }
}
