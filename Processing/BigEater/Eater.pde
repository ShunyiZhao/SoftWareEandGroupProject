public class Eater {
    private int eaterMarginTopFromBoundary = 30;
    private int bodyHeight = 80;
    private int bodyRedius = 10;
    private int topBoundary;
    private int bottomBoundary;
    private int leftBoundary;
    private int rightBoundary;
    private int eaterMarginTop;
    private int eaterMarginLeft;
    
    
    public Eater(int[] boundary) {
        this.topBoundary = boundary[0];
        this.bottomBoundary = boundary[1];
        this.leftBoundary = boundary[2];
        this.rightBoundary = boundary[3];
        this.eaterMarginTop = eaterMarginTopFromBoundary + topBoundary;
    }
    
    public void drawEater() {
        if (mouseX < leftBoundary) 
            eaterMarginLeft = leftBoundary;
        else if (mouseX > rightBoundary - bodyHeight) 
            eaterMarginLeft = rightBoundary - bodyHeight;
        else 
            eaterMarginLeft = mouseX; 

        pushMatrix();
        drawFeet(eaterMarginLeft);
        drawBody(eaterMarginLeft);
        drawHands(eaterMarginLeft);
        popMatrix();
    }
    
    private void drawHands(int leftMargin) {
        /* handLength / bodyLength = 0.368 */
        float handLength = 0.368 * bodyHeight;
        /* handHeight / bodyHeight = 0.236 */
        float handWidth = 0.236 * bodyHeight;
        
        float leftCenterX = leftMargin - 0.0590 * bodyHeight;
        float leftCenterY = eaterMarginTop + bodyHeight / 2;
        float rightCenterX = leftMargin + bodyHeight + 0.0590 * bodyHeight;
        float rightCenterY = leftCenterY;
        
        stroke(172, 23, 23);
        /* Left hand */
        pushMatrix();
        translate(leftCenterX, leftCenterY);
        rotate(radians(-61.8));
        ellipse(0, 0, handLength, handWidth);
        popMatrix();
        
        /* Right hand */
        pushMatrix();
        translate(rightCenterX, rightCenterY);
        rotate(radians(61.8));
        ellipse(0, 0, handLength, handWidth);
        popMatrix();
    }
    
    private void drawFeet(int leftMargin) {
        /* footLength / bodyLength = 0.566 */
        float footLength = 0.566 * bodyHeight;
        /* footHeight / bodyHeight = 0.305 */
        float footHeight = 0.305 * bodyHeight;
        /* distance between two feet center */
        float feetDistance = 0.892 * bodyHeight;
        
        /* Left foot */
        strokeWeight(2);
        stroke(182, 0, 0);
        fill(76, 174, 234);
        ellipse(leftMargin + 0.0694 * bodyHeight, 
            eaterMarginTop + bodyHeight + 0.0417 * bodyHeight, footLength, footHeight);
            
        /* Right foot */
        ellipse(leftMargin + 0.0694 * bodyHeight + feetDistance, 
            eaterMarginTop + bodyHeight + 0.0417 * bodyHeight, footLength, footHeight);
    }
    
    private void drawBody(int leftMargin) {
        fill(236, 125, 48);
        strokeWeight(2);
        stroke(0, 59, 138);
        rect(leftMargin, eaterMarginTop, bodyHeight, bodyHeight,
            bodyRedius, bodyRedius, bodyRedius, bodyRedius);
    }
    
    public int[] getAvailEater() {
        int[] area = new int[2];
        area[0] = eaterMarginLeft;
        area[1] = eaterMarginLeft + bodyHeight;
        return area;
    }
}
