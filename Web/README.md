# Web Application

Our website is mainly focusing on the **description of the game**, playing a **interact with desktop game** and providing a **visualized data** about analyzing player‘s behavior and preference.

The entire web application partly relies on the Bootstrap4 layout and references some font Awesome icons

Main front-end logics are implemented with JavaScript and JQuery, while some external libraries are used for specific functionalities (e.g. Echarts is used to Manager System for visualizing user's preference and final score).

## Authors

**HoCheung Lee**

**Kehan Du**

## Function

1. Admin
   * Administer use the link **login** at the top of the navigation can access to Manager System
   * Administer is able to see the data that have been visualized.
  
2. Users
   * Users can know the background of the game (in the part of "Intro Story")
      > * Used a comic style to display the background of story
   * Users are able to choose their favorite food that appear in the game (in the part of "CheckBox")
      > * Used a check box style allow user to select the food they like and also, user can submit and send the data via  MQTT in JSON format
   * Users able to join the game (in the part of "Game")
   * Users can know the instructions of the game (in the part of "Instruction")
      > * Used slideshow style to display the instruction, the text below the picture will be moved with the picture simultaneously
   * User can learn some health tips (in the part of "Health Tips")
      > * Used flipcard style to display the healthy tip for each food
  
## Application Structure
 ```
    web
    │   README.md
    └───json -- Original program test data
    └───img --  All images that we have used in the web
    └───font -- fontawesome library
    └───src -- processing Source code
    └───js
    │    │
    │    └─── MQTT-client.js --- all
    │         index1_MQTT.js ---index.html
    │         login_MQTT.js --- login.html
    │         charts_MQTT.js --- index2.html
    │         index.js
    │         script.js --- index.html
    │         init.js --- index2.html
    └───css
    │    │
    │    └─── init.css --- index2.html
    │         product.css --- index.html
    │         style.css --- index.html
```
The files described in the structure are original parts, and other unmentioned files are mostly library files that the program depends on.


## Datatype for MQTT

```json
{
   "datatype":"checkbox",
   "main":["Pienapple","Crab","Salad"]
}
```
The above json format is an example of the list of food, which is chosen by the player in the Web Page, send from the **check box (website)** to **the desktop (processing)**. The food that have been chosen will appear in the game. And also, these data will also be transferred to the back-end analysis, which analysing the player's food preference.

```json
{
   "datatype":"admin",
   "main":{
      "username":"mz19460@bristol.ac.uk",
      "password":"1234567"
   }
}
```
Due to the small dimension of the game, the current administrator account does not need to be registered. The administrator account is fixed at **mz19460@bristol.ac.uk**, password **1234567**.

The web application will  ask Login  information from MQTT server if matched.

```json
{
    "datatype":"chart",
    "main":{
        "score": 3,
        "bonus": 1,
        "combo": 2,
        "salad": 1,
        "pineapple": 0,
        "fish": 2,
        "virus": 3,
        "crab": 0,
        "eggplant": 0,
        "cheese": 0
    }
}
```
After the player ends the game, the desktop application will send the player's preference information to the MQTT agent server. The web application will get this information then visualising by Echart-Bar. 

## Limitation

1.Program compatibility

- The HTML frame part of this program is built with the help of Bootstrap4. It is a certain level of screen adaptation has been achieved, but most of them have limited desktops and cannot provide services for mobile devices.

- In terms of layout, CSS flexbox is partly used, which means that IE browser is not well compatible

2.Structural integrity

- We tried to build a game background management system. due to the small size of the game, the structure of the parameters is not complex, so the collection and visualization of user information is relatively simple.

- The administrator's account cannot be registered.

- For the part of Check Box, we haven't restricted only the player could submit the list of food that he/she chose. Thus, it will be a problem that everyone can submit the form.

3.Design maturity

- The design style of the game is moderately naive, and there is no perfected design style and color adaptation.

- The background of each part are using an image instead of using css or Bootstrap4 library to build the background.

