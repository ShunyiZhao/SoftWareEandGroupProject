class Gift {

    private int cnt;
    private boolean status;
    private int x;
    private int y;
    
    public Gift() {
        cnt = 0;
        status = false;
        x = 60;
        y = height / 3 + 50;
    }
    
    public boolean pickUpGift() {
        if (mouseX >= x - 50 && mouseX <= x + 50 
              && mouseY >= y - 50 && mouseY <= y + 50) {  
                status = false;    
                return true;
        }
        return false;
    }
    
    public boolean getGiftStatus(PlayerData data) {
        if (status == false && data.getScore() != 0 && data.getScore() % 150 == 0) {
            status = true;
            return true;
        }
        if (status == true && cnt <= 10) {
            cnt++;
            return true;
        }
        cnt = 0;
        status = false;
        return false;
    }
    
    public void display() {
        PShape svg = loadShape("data/gift.svg");
        shape(svg, 10, height / 3, 100, 100);
       
    }
  
}
