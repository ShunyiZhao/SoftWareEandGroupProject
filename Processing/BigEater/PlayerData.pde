import java.io.*;
import java.util.*;

class PlayerData {
    private int score;
    private int health;
    private int bonus;
    private HashMap<String, Integer> count = new HashMap<String, Integer>();
    private int highestScore;
    private final String FILE_NAME = "user_preference.txt";
    
    public PlayerData(String[] names) {
        score = 0;
        health = 3;
        bonus = 0;
        setCountMap(names);
    }
    
    public void updateHighestScore(int that) {
        highestScore = Math.max(this.score, that);
    }
    
    public boolean isAlive() { return health > 0; }
    
    public void recordPlayerMove(Drop currentClass) {
        modifyCount(currentClass.getClassName());
        modifyScoreAndHealth(currentClass.getClassName());
    }
    
    private void modifyCount(String name) {
        if ("virusA".equals(name) || "virusB".equals(name)) {
            int previousVal = count.get("virus");
            count.put("virus", previousVal + 1);
        }
        else {
            int previousVal = count.get(name);
            count.put(name, previousVal + 1);
        }
    }
    
    private void modifyScoreAndHealth(String name) {
        if (checkBadDropping(name)) health--;
        else score++; 
    }
    
    private void setCountMap(String[] names) {
        for (String name : names) {
            if ("virusA".equals(name) || "virusB".equals(name)) 
                count.put("virus", 0);
            else
                count.put(name, 0);
        }
    }
    
    public int getScore() { return score; }
    
    public int getHealth() { return health; }
    
    public void loseHealth() { health--; }
    
    public void getBonus() { 
        bonus++;
        int num = (int) random(3);
        if (num == 1) health++;  
        else score += 2;
    }
    
    private boolean checkBadDropping(String name) {
        return "virusA".equals(name) || "virusB".equals(name)||
                "bomb".equals(name);
    }
    
}
