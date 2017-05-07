using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerObject : MonoBehaviour {

    public Camera mainCamera;
    private Rigidbody rb;
    public int movePower = 2;

	// Use this for initialization
	void Start () {
        rb = this.gameObject.GetComponent<Rigidbody>();
	}
	// Update is called once per frame
	void Update () {

        mainCamera.transform.position = new Vector3(this.transform.position.x, 10f, this.transform.position.z);

        if (Input.GetKey("a"))
        {
            rb.AddForce(Vector2.left * movePower);
        }

        if (Input.GetKey("d"))
        {
            rb.AddForce(Vector2.right * movePower);
        }

        if (Input.GetKey("w"))
        {
            rb.AddForce(new Vector3(0,0,1) * movePower);
        }

        if (Input.GetKey("s"))
        {
            rb.AddForce(new Vector3(0,0,-1) * movePower);
        }
    }
    private void OnMouseDown()
    {
        //Debug.Log("sdafsdafS");
        //mainCamera.transform.SetPositionAndRotation(this.transform.position, this.transform.rotation);
        //mainCamera.transform.position = this.transform.position;
    }
}
