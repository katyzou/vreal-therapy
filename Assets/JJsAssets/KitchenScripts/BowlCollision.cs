using System.Collections;
using System.Collections.Generic;
using UnityEngine;

enum Ingredients
{
    eggs,
    flour,
    milk,
    sugar
};

public class BowlCollision : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void OnTriggerEnter(Collider collision)
    {
        string collisionTag ="";
      
        //assign correct item to stick in
        switch (GamePlay.stepsCompleted)
        {
            case (int)Ingredients.eggs:
                collisionTag = "egg";
                //put the eggs into the bowl
                
                break;

            case (int)Ingredients.flour:
                collisionTag = "flour";
                break;

            case (int)Ingredients.milk:
                collisionTag = "milk";
                break;
            case (int)Ingredients.sugar:
                collisionTag = "sugar";
                break;
        }

        //check if you put right item into bowl
        if (collision.gameObject.tag == collisionTag)
        {
            Debug.Log("COLLISION" + collision.gameObject.name);
            Destroy(collision.gameObject); //make item disappear
            GamePlay.stepsCompleted++;
        }
        else {
            Debug.Log("WRONG ITEM");
            this.GetComponent<ParticleSystemRenderer>().material = new Color(1,0,0,1);
        }
    





    }
}
