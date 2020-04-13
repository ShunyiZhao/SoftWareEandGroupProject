import java.util.Arrays;

private Background bg;
private Eater eater;
private int mode = 4;
private int startY = 95;
private int endY = 590;
private int speed = 300;
private Drop[] tracks;
private String[] names = new String[8];
private int[] startCount;
private int[] lastCount;
private boolean[] trackUsed;
private boolean[] frameCountLock;
private HashMap<String, Drop> map = new HashMap<String, Drop>();

public void setup() {
    size(1280, 720);
    bg = new Background(startY, endY);
    setMap();
    setClassVariable();
    setFirstRound();
}

public void draw() {  
    bg.drawBackground(mode);
    eater = new Eater(bg.getEatterAreaMargin());
    eater.drawEater();
    for (int i = 0; i < mode; ++i) {
        if ((frameCount == startCount[i] || trackUsed[i]) && !tracks[i].reachEnd) {
            trackUsed[i] = true;
            displayClass(i);
        }
        else if (!frameCountLock[i]) {
            lastCount[i] = frameCount;
            frameCountLock[i] = true;
            trackUsed[i] = false;
        }
        
    }  
}

private void setFirstRound() {
    for (int i = 0; i < mode; ++i) {
        tracks[i] = new Cheese(mode, startY, endY, speed, "data/cheese.svg");
    }
    
    
}

//private Drop setNewClassRandomly() {
//    int i = (int) random(map.keySet().size());
    
//}

private void setClassVariable() {
    startCount = new int[mode];
    startCount[0] = 1;
    for (int i = 1; i < mode; ++i) {
        startCount[i] = startCount[i - 1] + (int) random(100);
    }
    
    lastCount = new int[mode];
    Arrays.fill(lastCount, 0);
    frameCountLock = new boolean[mode];
    Arrays.fill(frameCountLock, false);
    trackUsed = new boolean[mode];
    Arrays.fill(trackUsed, false);
    tracks = new Drop[mode];
}

private void displayClass(int i) {
    tracks[i].getStartEndX(i, bg.getTrackTopNode(), bg.getTrackBottomNode());
    tracks[i].display(startCount[i]);
}

private void setMap() {
    map.put("Cheese", new Cheese(mode, startY, endY, speed, "data/cheese.svg"));
    
    int i = 0;
    for (String name : map.keySet()) {
        names[i++] = name;
    }
}
