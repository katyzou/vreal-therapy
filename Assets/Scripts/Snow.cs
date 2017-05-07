using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Snow : MonoBehaviour {


    public Camera mainCamera;

    private void OnMouseDown()
    {
        Vector3 temp = Input.mousePosition;
        temp.z = 30f; // Set this to be the distance you want the object to be placed in front of the camera.
        this.transform.position = Camera.main.ScreenToWorldPoint(temp);

    }
    private void OnMouseEnter()
    {
        //instantiate sound or exclamation mark
    }
}
