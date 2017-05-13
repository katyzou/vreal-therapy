using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HoleToSpawn : MonoBehaviour {

    public GameObject horse;
    Quaternion spawnRotation = Quaternion.Euler(0, 0, 0);

    public void Spawn()
    {
        Vector3 spawnPosition = new Vector3(this.gameObject.transform.position.x, 
        this.gameObject.transform.position.y, this.gameObject.transform.position.z);
        Instantiate(horse, spawnPosition, spawnRotation);
    }
}
