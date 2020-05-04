public class Crab extends Drop {
    public Crab(int mode, float startY, float endY, int speed, String filename) {
        super(mode, startY, endY, speed, filename);
    }
    
    @Override
    public String getClassName() { return "crab"; }
}
