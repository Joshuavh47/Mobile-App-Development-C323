Josh Eres
jeeres

1. For this lab, I implemented persistent storage through a settings bundle. To do this, I created a default settings bundle, registered the bundle with an observer in AppDelegate, and used a lable to get the value of a text field based on its key. 

Affinity Map:

Implementation:
1. How would a server be set up to run on a mobile device and how would that be implemented in Swift?
2. How could we ensure synchronization between all users in a Forager-like app?

UIDesign:
1. How would we design a 3D view for a Forager-like game?
2. What libraries/methods exist for using a 3D view in Swift?


Functionality:
1. How much resources would a server need to run Forager?
2. What could we do to ensure that only clients running the Forager app are able to connect to the server?

Description:
To implement the Forager game, I would probably set up an Apache2/NGINX server that would host an instance of the map that clients could download copies of. I would probably have to have something in the model class that synchronises all actions across all players (this would probably use an observer and listeners, and if the server detects a change, it would relay this to the server, which would then relay this to all the other players.) I would then make objects for each character that contain their position, speed, facing direction, etc. Then, I would find a way to implement a 3D world in my view for the Forager game, and make it so that each user's view is a rendering of their player's perspective in the world based on their position and orientation. 
 
