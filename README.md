# PAC-MAN 

This project, written in Processing by George Zheng and Ivan Zhang, attempts to recreate the arcade game Pac-Man.

### Setup

* Clone or download this repository to your local disk:
```
https://github.com/ivzhang1/Pac-Snake.git
```

* Navigate to the Pac-Snake directory with Processing with `⌘-O`.

* Open any file with the extension `.pde`. 

* Use `Sketch > Import Library > Add Library` and install the library ***Minim*** by _Damien Di Fede and Anderson Mills_.

* Run the program with `⌘-R` .

### Instructions

Goal: Guide Pacman around the maze and eat all the little white dots whilst avoiding those nasty ghosts. If you eat a Power Pill, you can eat the ghosts! Eat a fruit which gives you a bonus score when eaten.

* _**Moving**_  

  Use the  `Up`  `Down`  `Left`  `Right`  arrow keys to move around. Pacman will move in the indicated direction.

* _**Collectibles**_
    There are objects which Pacman can collect as he traverses the map

  * Small pellet: Provides Pacman with a small number of points.
  * Big pellet: Provides Pacman with a greater number of points, causes ghosts to temporarily enter their vulnerable mode.
  * Fruit: Provides Pacman with a large number of points.

* _**Stages**_ 

    * Ghosts will alternate between chasing Pacman and roaming around their zone. As Pacman collects more and more pellets, the ghosts will chase Pacman with increased speed and frequency. 


### Features

* Ghosts spawn in the ghost house, and leave in scheduled intervals

    * They will not all chase Pacman at once at the beginning of the game
    * Ghosts cannot reenter the ghost house once they have left

        * Entry to the ghost house is forbidden for Pacman
        * Ghost will always respawn into the ghost house

* Ghosts have three modes: Chase, Scatter, and Vulnerable 

    * Chase Mode: The ghosts target Pacman with their own algorithms.
    * Scatter Mode: The ghosts roam around their corners of the map
    * Vulnerable: Ghosts slowly run away from Pacman. In this mode, they are vulnerable to being eaten by Pacman, which returns them to the ghost house and strips them of their vulnerable status.

* Alternating between the modes

    * Vulnerable mode is triggered by Pacman's consumption of a large pellet, and is temporary. Upon the passage of enough time or being eaten by Pacman, ghosts return to the ghost house and are stripped of their vulnerable status.

        * Vulnerable ghosts are frightened, and are dark blue.

    * Ghosts will alternate between Chase and Scatter mode throughout the course of the game. The amount of time spent in each mode will be roughly equivalent at the onset of the game, but as the game progresses, the ghosts will spend less and less time in scatter mode — as the duration of the game approaches infinity, the ratio of their time spent in scatter mode to the time spent in chase mode approaches zero.

        * The only ghost that will cease shifting into scatter mode is Blinky (the red ghost)
        * Blinky will eventually only chase Pacman around the map

* Tunnel

    * Pacman has access to a tunnel which will bring him across the map. 
    * Pacman is faster than all the ghosts at the onset of the same.

* Eating 

    * Eating pellets will earn Pacman points, as will his consumption of ghosts.
    * As more and more pellets are eaten by Pacman, the ghosts will find increased movement speed

        * Eventually, Blinky (the red ghost) will slightly outpace Pacman
        * He is the only ghost that is faster than Pacman at any point of the game.

* Blinky (追いかけ — the pursuer/chase)

    * Blinky is the red ghost.
    * Blinky is the first ghost to pursue Pacman.
    * Blinky’s target tile in Chase mode is the tile Pacman is currently on.
    * This ensures that Blinky will always be trailing behind Pacman.
    * While in Scatter code, Blinky will roam around the upper right corner of the map.

* Pinky (待ち伏せ — ambusher)

    * Pinky is the pink ghost.
    * Pinky is the second ghost to pursue Pacman.
    * Pinky’s target tile in Chase mode is set a few tiles in front of Pacman.
    * This ensures that Pinky can catch Pacman off guard and possibly ambush him with Blinky.
    * While in Scatter code, Pinky will roam around the upper left corner of the map.

* Inky (気紛れ — whimsical)

    * Inky is the blue ghost.
    * Inky is the third ghost to pursue Pacman.
    * Inky is difficult to predict, because he is the only one of the ghosts that uses a factor other than Pac-Man’s position/orientation when determining his target tile.
    * Inky uses both Pac-Man’s position/facing and Blinky’s (the red ghost) position in his calculation.
    * Inky will move ahead of Pacman by the distance from Blinky.
    * While in Scatter code, Inky will roam around the bottom right corner of the map.

* Clyde (お惚け — feigning ignorance)

    * Clyde is the orange ghost.
    * Clyde is the last ghost to pursue Pacman.
    * When far away from Pacman, Clyde will pursue him in the same way that Blinky does.
    * Once Clyde is close to Pacman, the former will flee back to his corner that he occupies in Scatter mode.
    * While in Scatter code, Clyde will roam around the bottom left corner of the map.

* Scores

    * The game will keep track of the score of the user.

* Sound

    * The game will play sounds during different events.

* Lives

    * Pacman will begin the game with three lives.

    * Pacman will lose a life after being eaten by ghosts

        * Pacman can be eaten by ghosts by positioning himself on the same tile that one of them are on. 
        * Pacman can be eaten by a ghost even when he has triggered their vulnerable mode by eating a big pellet, because their vulnerable status is stripped after the eaten ghosts respawn in the ghost house. 


## Top Secret Mode for Top Secret People

* Switching the `secretMode` boolean at the top of the code will start a top secret game.
  * Starring:
	* Mr. K as Pac-Man
	* Raccoon as Blinky
	* Mr. DW as Blue Wall    
	* Ivan as Clyde
	* Deli Hamburger as Fruit
	* Krokodil as Inky
	* Pellet as Pellet
	* Crystal as Pinky
	* Pink Wall as Pink Wall
	* George as Scared Ghost






## Bugs

* Pacman can freeze in a location when he is turning a tight corner in the middle left or right of the map.
