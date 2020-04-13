private Background bg;
private Eater eater;
private int mode = 4;
private int startY = 95;
private int endY = 590;
private int speed = 300;
private ArrayList<Drop> tracks = new ArrayList<Drop>();
private HashMap<String, Drop> map = new HashMap<String, Drop>();

public void setup() {
    size(1280, 720);
    bg = new Background(startY, endY);
    setMap();
    tracks.add(map.get("Cheese"));
}

public void draw() {  
    bg.drawBackground(mode);
    eater = new Eater(bg.getEatterAreaMargin());
    eater.drawEater();
    //print(tracks.get(0).reachEnd);
    if (!tracks.get(0).reachEnd) {
        displayClass(tracks.get(0));
    }
    
    
    //for (int i = 0; i < mode; ++i) {
    //    tracks.get(i).display();
    //}
    
}

private void displayClass(Drop item) {
    item.getStartEndX(1, bg.getTrackTopNode(), bg.getTrackBottomNode());
    item.display();
}

private void setMap() {
    map.put("Cheese", new Cheese(mode, startY, endY, speed, "data/cheese.svg"));
}
