public abstract class Drop {
    protected int mode;
    protected int speed;
    protected float startX;
    protected float startY;
    protected float endX;
    protected float endY;
    protected int currentTrack;
    protected int startSize = 50;
    protected int endSize = 100;
    protected float dx;
    protected float dy;
    protected float dsize;
    public boolean reachEnd;
    protected PShape svg;
    protected float currentX;
    protected float currentY;
    
    public Drop(int mode, float startY, float endY, int speed, String filename) {
        this.mode = mode;
        this.startY = startY;
        this.endY = endY - endSize;
        this.speed = speed;
        this.reachEnd = false;
        this.svg = loadShape(filename);
    }
    
    
    public void getStartEndX(int currentTrack, ArrayList<Integer> topNode, ArrayList<Integer> bottomNode) {
        this.currentTrack = currentTrack;
        int topSpace = topNode.get(1) - topNode.get(0);
        int bottomSpace = bottomNode.get(1) - bottomNode.get(0);
        this.startX = topNode.get(currentTrack) + topSpace / 2 - startSize / 2;
        this.endX = bottomNode.get(currentTrack) + bottomSpace / 2 - endSize / 2;
        getDifferential();      
    }
        
    protected void getDifferential() {
        float x = (startX - endX) / speed;
        dx = (currentTrack == 0 || currentTrack == 1) ? x : x * (-1);
        dy = (endY - startY) / speed;
        dsize = (endSize - startSize) * 15 / speed;
    }
    
    public void display(int startFrameCount) {
        if ((frameCount - startFrameCount) % (speed + 1) == speed) {
            this.reachEnd = true;
        }
        float distance = (frameCount - startFrameCount) % speed * dx;
        if (!reachEnd) {
            currentX = (currentTrack == 0 || currentTrack == 1) ? startX - distance : startX + distance;
            currentY = startY + (frameCount - startFrameCount) % speed * dy;
        }
        float currentSize = startSize + (frameCount - startFrameCount) % speed * dsize / 15;
    
        if (currentY <= endY && !reachEnd) {
            shape(svg, currentX, currentY, currentSize, currentSize);
        } 
        
    }
    
    public String getClassName() { return " "; }
    
}
