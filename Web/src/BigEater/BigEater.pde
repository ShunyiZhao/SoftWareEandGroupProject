import java.util.Arrays;

private int status;
private Background bg;
private Eater eater;
private PlayerData data;
private Gift gift;
private int mode = 4;
private int startY = 95;
private int endY = 590;
private int speed = 300;
private Drop[] tracks;
private int[] startCount;
private int[] lastCount;
private boolean[] trackUsed;
private boolean[] frameCountLock;
private String[] names = {"cheese", "crab", "eggplant", "fish", 
                          "pineapple", "salad", "virusA", "virusB"};    

Adapter adapter = new Adapter();

public void setup() {
    size(1280, 720);
    bg = new Background(startY, endY);
    data = new PlayerData(names);
    gift = new Gift();
    initialiseVariables();
    status = 0;
    
    
    client = new MQTTClient(this, adapter);
    String clientName = "group_big_eater" + random(0, 99999);
    client.connect("mqtt://broker.mqttdashboard.com", clientName);
    
}

public void draw() { 
    switch (status) {
        case 0:
            image(loadImage("data/BigEater.png"), 0, 0, 1280, 720);
            if (keyPressed) {
                data.getUserChoice(adapter.userChoice);
                status++;
            }
            break;
        case 1: 
            setGameStatus();
            if (keyPressed) status++;
            break;
        case 2:
            analyseData();
            stop();
    }
  
}

private void analyseData() {
    image(loadImage("data/Lose.png"), 0, 0, 1280, 720);
    //if (data.compareScore(score)) {
    //    image(loadImage("data/Clear.png"), 0, 0, 1280, 720);
    //} 
    //else {
    //    image(loadImage("data/Lose.png"), 0, 0, 1280, 720);
    //} 
    
    data.saveUserData();
}

private boolean detectDropCollision(int i) {
    ArrayList<Integer> node = bg.getTrackBottomNode();
    int[] eaterArea = eater.getAvailEater();
    int[] trackArea = new int[2];
    trackArea[0] = node.get(i);
    trackArea[1] = node.get(i + 1);
    
    return (eaterArea[0] >= trackArea[0] && eaterArea[1] <= trackArea[1]);
}

private void initialiseVariables() {
    startCount = new int[mode];
    Arrays.fill(startCount, 0);
    lastCount = new int[mode];
    Arrays.fill(lastCount, 0);
    frameCountLock = new boolean[mode];
    Arrays.fill(frameCountLock, true);
    trackUsed = new boolean[mode];
    Arrays.fill(trackUsed, false);
    tracks = new Drop[mode];

    for (int i = 0; i < mode; ++i) {
        startCount[i] = (int) random(300);
        tracks[i] = createNewClassRandomly();
    }
}

private void displayClass(int i) {
    tracks[i].getStartEndX(i, bg.getTrackTopNode(), bg.getTrackBottomNode());
    tracks[i].display(startCount[i]);
}

private Drop createNewClassRandomly() {
    int index = (int) random(8);
    String name = names[index];
    switch (name) {
        case "cheese": return new Cheese(mode, startY, endY, speed, "data/cheese.svg");
        case "crab": return new Crab(mode, startY, endY, speed, "data/crab.svg");
        case "eggplant": return new Eggplant(mode, startY, endY, speed, "data/eggplant.svg");
        case "fish": return new Fish(mode, startY, endY, speed, "data/fish.svg");
        case "pineapple": return new Pineapple(mode, startY, endY, speed, "data/pineapple.svg");
        case "salad": return new Salad(mode, startY, endY, speed, "data/salad.svg");
        case "virusA": return new VirusA(mode, startY, endY, speed, "data/virus1.svg");
        case "virusB": return new VirusB(mode, startY, endY, speed, "data/virus2.svg");
        default: return null;
    }
}

private void displayScoreAndHealth() {
    String score = Integer.toString(data.getScore());
    String health = Integer.toString(data.getHealth());
    textSize(48);
    fill(0, 0, 0);
    text(score, 80, 80);
    text(health, 1200, 80);
}

private void setGameStatus() {
    bg.drawBackground(mode);
    eater = new Eater(bg.getEatterAreaMargin());
    eater.drawEater();
    displayScoreAndHealth();
    displayGift();
    
    for (int i = 0; i < mode; ++i) {
        if ((frameCount == startCount[i] || trackUsed[i]) && !tracks[i].reachEnd) {
            trackUsed[i] = true;
            frameCountLock[i] = false;
            displayClass(i);
        }  
        else if (!frameCountLock[i]) {
            lastCount[i] = frameCount;
            frameCountLock[i] = true;
            trackUsed[i] = false;
            startCount[i] = lastCount[i] + (int) random(300);
            
            if (detectDropCollision(i)) 
                data.recordPlayerMove(tracks[i]);
            else if (!data.checkBadDropping(tracks[i].getClassName())) {
                data.loseHealth();
                if (!data.isAlive()) {
                    status++;
                    break;
                }
            }
            
            tracks[i] = createNewClassRandomly();
        }
    }  
}

private void displayGift() {
    if (gift.getGiftStatus(data)) {
        gift.display();
        if (gift.pickUpGift()) {
            data.getBonus();
        }
    }
}
