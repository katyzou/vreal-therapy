using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Snow : MonoBehaviour {


    public Camera mainCamera;

    private void OnMouseDown()
    {
        Vector3 temp = Input.mousePosition;
        temp.z = 30f; // Set this to be the distance you want the object to be placed in front of the camera.
        this.transform.position = mainCamera.ScreenToWorldPoint(temp);

    }
<<<<<<< HEAD
    void OnTriggerEnter(Collider other)
    {
        /*if (other.GetComponent<ControllerL or R>())
        {
            make block follow the controller;
        }*/
=======
    private void OnMouseEnter()
    {
        //instantiate sound or exclamation mark
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
    }
}
