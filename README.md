# Falling Words
Falling Words

## How to run the project
Download, and run `$ ./setup.sh`
it will download necessary dependancies if not installed on your machine 

### Other scripts
Use Make file to have scripts shortcut for easy use
run `configuration.rb` or `make config` to reconfiger the project with keys in the xcconfig

## Project Overview

* Display a simple Language game to choose betwwn a correct or wrong word translation between english and Spanish


## Project Architecture 
The project is following clean architucte and using MVVM-C with a group of practices and decisions that makes the code testable with independable components. 


Resources:
* [Clean architucte](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [The Coordinator](https://khanlou.com/2015/01/the-coordinator/)
* [Advanced iOS App Architecture](https://store.raywenderlich.com/products/advanced-ios-app-architecture)
* [Advanced coordinators in iOS](https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios)


## Questions:
###  how much time was invested
- it takes around 8~10 Houres spleted betwwen two working days
### how was the time distributed (concept, model layer, view(s), game mechanics)
 * 2  for Project initilization and (MVVM-C Architected app )
 * 2 for the simple list screen with loading data
 * 3~4 for the Game
 * 1 hour for test

 ### decisions made to solve certain aspects of the game
    * for the game to end the Di set the numOfTries to the Game  as it could be replaced with any other soulution(UI / Saved ) and injected into the game
    * the game UseCase take the data and shuffle the translation which will probably make the game the correct answer is to choose wrong

### decisions made because of restricted time
 * no fancy UI
 * shuffle algorithm should be better
 *

 ### what would be the first thing to improve or add if there had been more time
 * give the user more feeling with achievements, to have more correct answers, save the history 
 * use SwiftUI & Combine for practice 