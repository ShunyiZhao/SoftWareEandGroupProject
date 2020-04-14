class Background {
    private int length = 1280;
    private int height = 720;
    private int screenMarginTop = 5;
    private int screenMarginLeft = 320;
    private int screenHeight;
    private int trackVerticleDistance = 495;
    private int trackBottomMarginLeft = 4;
    private int trackNumber;
    private int trackBottomMarginTop;
    
    public Background(int startY, int endY) {
        this.screenHeight = startY - screenMarginTop;
        this.trackVerticleDistance = endY - screenHeight;
    }
    
    public void drawBackground(int trackNumber) {
        this.trackNumber = trackNumber;
        background(255, 255, 255);
        strokeWeight(6);
        stroke(0, 0, 0);
        drawScreen();
        drawRouteBoundaries();
    }
    
    public int[] getEatterAreaMargin() {
        int[] margin = new int[4];
        /* Top */
        margin[0] = trackBottomMarginTop;
        /* Bottom */
        margin[1] = height;
        /* Left */
        margin[2] = trackBottomMarginLeft;
        /* Right */
        margin[3] = length - trackBottomMarginLeft;
        
        return margin;
    }
    
    public int[] getScreenMargin() { 
        int[] res = new int[2];
        res[0] = screenMarginLeft;
        res[1] = screenMarginTop + screenHeight;
        return res;
    }
    
    private void drawScreen() {
        int screenRadius = 5;
        int screenLength = length - 2 * screenMarginLeft;
        fill(248, 182, 81);
        rect(screenMarginLeft, screenMarginTop, screenLength, screenHeight / 2,
            screenRadius, screenRadius, 0, 0);
        fill(255, 241, 0);
        rect(screenMarginLeft, screenMarginTop + screenHeight / 2, screenLength, screenHeight / 2,
            0, 0, screenRadius, screenRadius);
    }
    
    private void drawRouteBoundaries() {
        int trackUpMarginTop = screenMarginTop + screenHeight;
        trackBottomMarginTop = trackUpMarginTop + trackVerticleDistance;
        line(trackBottomMarginLeft, trackBottomMarginTop, 
            length - trackBottomMarginLeft, trackBottomMarginTop);
        line(trackBottomMarginLeft, height, length, height);
        
        int topGap = (length - screenMarginLeft * 2) / trackNumber;
        int bottomGap = (length - trackBottomMarginLeft * 2) / trackNumber;
        
        fill(209, 206, 189);
        quad(screenMarginLeft, trackUpMarginTop, 
             screenMarginLeft + topGap, trackUpMarginTop,
             trackBottomMarginLeft + bottomGap, trackBottomMarginTop, 
             trackBottomMarginLeft, trackBottomMarginTop);
             
        fill(246, 238, 223);
        quad(screenMarginLeft + 1 * topGap, trackUpMarginTop, 
             screenMarginLeft + 2 * topGap, trackUpMarginTop,
             trackBottomMarginLeft + 2 * bottomGap, trackBottomMarginTop, 
             trackBottomMarginLeft + 1 * bottomGap, trackBottomMarginTop);
        
        fill(209, 206, 189);
        quad(screenMarginLeft + 2 * topGap, trackUpMarginTop, 
             screenMarginLeft + 3 * topGap, trackUpMarginTop,
             trackBottomMarginLeft + 3 * bottomGap, trackBottomMarginTop, 
             trackBottomMarginLeft + 2 * bottomGap, trackBottomMarginTop);
        
        fill(246, 238, 223);
        quad(screenMarginLeft + 3 * topGap, trackUpMarginTop, 
             screenMarginLeft + 4 * topGap, trackUpMarginTop,
             trackBottomMarginLeft + 4 * bottomGap, trackBottomMarginTop, 
             trackBottomMarginLeft + 3 * bottomGap, trackBottomMarginTop);
        
        fill(251, 230, 163);
        rect(trackBottomMarginLeft, trackBottomMarginTop, 
              bottomGap, height - trackBottomMarginTop - trackBottomMarginLeft);
        
        fill(251, 230, 163);
        rect(trackBottomMarginLeft + bottomGap, trackBottomMarginTop, 
              bottomGap, height - trackBottomMarginTop - trackBottomMarginLeft);
        
        fill(251, 230, 163);
        rect(trackBottomMarginLeft + 2 * bottomGap, trackBottomMarginTop, 
              bottomGap, height - trackBottomMarginTop - trackBottomMarginLeft);
        
        fill(251, 230, 163);
        rect(trackBottomMarginLeft + 3 * bottomGap, trackBottomMarginTop, 
              bottomGap, height - trackBottomMarginTop - trackBottomMarginLeft);
    }
    
    public int[] getTrackBottomMargin() { 
        int[] res = new int[2];
        res[0] = trackBottomMarginLeft;
        res[1] = trackBottomMarginTop;
        
        return res; 
    }
    
    public int getTrackTopSpace() { return (length - 2 * screenMarginLeft) / trackNumber; }
    
    public int getTrackBottomSpace() { return (length - 2 * trackBottomMarginLeft) / trackNumber; }

    public ArrayList<Integer> getTrackTopNode() {
        ArrayList<Integer> res = new ArrayList<Integer>();
        res.add(screenMarginLeft);
        for (int i = 1; i <= trackNumber; ++i) {
            int nextNode = screenMarginLeft + getTrackTopSpace() * i;
            res.add(nextNode);
        }
        return res;
    }
    
    public ArrayList<Integer> getTrackBottomNode() {
        ArrayList<Integer> res = new ArrayList<Integer>();
        res.add(trackBottomMarginLeft);
        for (int i = 1; i <= trackNumber; ++i) {
            int nextNode = trackBottomMarginLeft + getTrackBottomSpace() * i;
            res.add(nextNode);
        }
        return res;
    }
    
}
