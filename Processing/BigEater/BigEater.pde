import java.util.Arrays;

private Background bg;
private Eater eater;
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

public void setup() {
    size(1280, 720);
    bg = new Background(startY, endY);
    initialiseVariables();
}

public void draw() {  
    bg.drawBackground(mode);
    eater = new Eater(bg.getEatterAreaMargin());
    eater.drawEater();
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
            startCount[i] = lastCount[i] + (int) random(200);
            tracks[i] = createNewClassRandomly();
        }
    }  
    
}

private void initialiseVariables() {
    startCount = new int[mode];
    Arrays.fill(startCount, 0);
    lastCount = new int[mode];
    Arrays.fill(lastCount, 0);
    frameCountLock = new boolean[mode];
    Arrays.fill(frameCountLock, false);
    trackUsed = new boolean[mode];
    Arrays.fill(trackUsed, false);
    tracks = new Drop[mode];
    
    for (int i = 0; i < mode; ++i) {
        startCount[i] = (int) random(200);
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
