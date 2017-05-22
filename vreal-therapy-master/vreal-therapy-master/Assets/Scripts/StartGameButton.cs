using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartGameButton : MonoBehaviour {

    private int spinSpeed = 25;
    private GameController gc;
    void Start()
    {
        gc = FindObjectOfType<GameController>();
    }
	void Update () {
        transform.Rotate(0, spinSpeed * Time.deltaTime, 0);
    }
    void OnMouseDown()
    {
        gc.StartGame();
    }
    void OnTriggerEnter(Collider other)
    {
        /*if(other.gameObject.GetComponent<controller>())
         * {
         *      gc.StartGame();
         * }
         * */
    }
}
