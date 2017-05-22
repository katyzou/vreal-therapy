using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour {

    public HoleToSpawn[] holes;
    public float spawnWait;
    private int tempIndex;

	public void StartGame()
    {
        StartCoroutine(spawnEveryXSeconds());
    }
    IEnumerator spawnEveryXSeconds()
    {
        while (true)
        {
            tempIndex = Random.Range(0, holes.Length - 1);
            holes[tempIndex].Spawn();

            yield return new WaitForSeconds(spawnWait);
        }
    }
}
