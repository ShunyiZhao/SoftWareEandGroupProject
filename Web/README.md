# Web Application

Our website is mainly focusing on the **description of the game**, playing an **interaction with desktop game** and providing a **visualized data** about analyzing player‘s behavior and preference.

The entire web application partly relies on the Bootstrap4 layout and references some font Awesome icons

Main front-end logics are implemented with JavaScript and JQuery, while some external libraries are used for specific functionalities (e.g. Echarts is used to Manager System for visualizing user's preference and final score).

## *Content*
 * [Function](#function)
 * [Application Structure](#structure)
 * [Communication Protocols](#protocols)
 * [Datatype for MQTT](#type)
 * [Limitations](#limitations)

## Developers

**@ HoCheung Lee (ja19025)**

**@ Kehan Du (mz19460)**

## <span id="function">Function

1. Admin
   * Administer use the link **login** at the top of the navigation can access to Manager System
   * Administer is able to see the data that have been visualized.
  
2. Interactive players && Users
   * Interactive players can know the background of the game (in the part of "Intro Story")
      > * Used a comic style to display the background of story
   * Interactive players are able to choose their favorite food that appear in the desktop game (in the part of "CheckBox")
      > * Used a check box style allow interactive players to select the food they like and also, they can submit and send the data via  MQTT in JSON format, which the food they chose will appear in the game
   * Users are able to get a general idea of the game (in the part of "Game Display")
      > * Used GIF to display how the game actually works
   * Users can know the instructions of the game (in the part of "Instruction")
      > * Used slideshow style to display the instruction, the text below the picture will be moved with the picture simultaneously
   * User can learn some health tips (in the part of "Health Tips")
      > * Used flipcard style to display the healthy tip for each food
 
## <span id="structure">Application Structure
 ```
    web
    │   README.md
    └───json -- Original program test data
    └───img --  All images that we have used in the web
    └───font -- fontawesome library
    └───src -- privacy.md
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

## <span id="protocols">Communication Protocols 
The web application is mainly responsible for communicating with processing (desktop). We chose MQTT as communication methods.

Our communication achieved two main functions:
1. Interactive players use CheckBox setting combo(send messages to desktop)
2. Admin login to Manage System and check the user's behavior and preferences. 

Because the data messages we communicate is time-sensitive and the message body is small, MQTT is the most convenient way to connect at both ends. We only need to subscribe to relevant topics to achieve.


## <span id="type">Datatype for MQTT
```json
{
   "datatype":"datatype_name",
   "main":"related_information_json"
}
```
We use JSON as the main format for data exchange. It is compatible with JavaScript and Java. 

In order to distinguish different data, we have unified different data types to facilitate the determination of whether data needs to be processed after receiving the data. 

The following are detailed examples:

```json
{
   "datatype":"checkbox",
   "main":["Pienapple","Crab","Salad"]
}
```
The above json format is an example of the list of food, which are chosen by the interactive players in the Web Page, send from the **check box (website)** to **the desktop (processing)**. The food that have been chosen will appear in the game. And also, these data will also be transferred to the back-end analysis, which analysing the player's preference.

```json
{
   "datatype":"admin",
   "main":{
      "username":"mz19460@bristol.ac.uk",
      "password":"1234567"
   }
}
```
This is the login message communication after initialization, it originates from inside the Web Application.

Due to the small dimension of the game, the current administrator account does not need to be registered. The administrator account is fixed at **mz19460@bristol.ac.uk**, password **1234567**.

The web application will  ask Login  information from MQTT server if matched.

```json
{
    "datatype":"chart",
    "main":{
        "score": 276,
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

## <span id="limitations">Limitations

1.Program compatibility

- The HTML frame part of this program is built with the help of Bootstrap4. It is a certain level of screen adaptation has been achieved, but most of them have limited desktops and cannot provide services for mobile devices.

- In terms of layout, CSS flexbox is partly used, which means that IE browser is not well compatible

2.Structural integrity

- We tried to build a game background management system. Due to the small size of the game, the structure of the parameters is not complex, so the collection and visualization of user information is relatively simple.

- The administrator's account cannot be registered.

- For the part of Check Box, we have restricted to receive the first and the last submission of the list of food that the interactive player chose, if there are mutliple submissions.

3.Design maturity

- The design style of the game is moderately naive, and there is no perfected design style and color adaptation.

- The background of each part are using an image instead of using css or Bootstrap4 library to build the background.

