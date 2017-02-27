using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HorseToWack : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	void OnMouseDown()
    {
        Destroy(this.gameObject);
    }
    void OnTriggerEnter(Collider other)
    {
        /*if(other.gameObject.GetComponent<controller>())
         * {
         *      Destroy(this.gameObject);
         * }
         * */
    }
}
