import java.io.*;
import java.util.*;

class PlayerData {
    private int score;
    private int health;
    private int bonus;
    private HashMap<String, Integer> count = new HashMap<String, Integer>();
    private String username;
    
    public PlayerData(String[] names) {
        score = 0;
        health = 3;
        bonus = 0;
        setCountMap(names);
    }
    
    public void getCurrentUser(String filename) {
        JSONObject json = loadJSONObject("signup" + File.separator + filename);
        this.username = json.getString("username");
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
        
        if (num == 1) {
            health += 1;
        }   
        else {
            score += 2;
        } 
    }
    
    private boolean checkBadDropping(String name) {
        return "virusA".equals(name) || "virusB".equals(name)||
                "bomb".equals(name);
    }
    
    public void saveUserData() throws IOException {
        JSONObject json = new JSONObject();
        json.setInt("score", score);
        for (String attribute : count.keySet()) {
            json.setInt(attribute, count.get(attribute));
        }
        json.setInt("bonus", bonus);
        String fileName = "user" + File.separator + username + ".json";
        saveJSONObject(json, fileName);
        
        String rankFile = "user" + File.separator + "rank.json";
        json = loadJSONObject(rankFile);
        json.setInt(username, score);
        int previousScore = json.getInt("highest_score");
        json.setInt("highest_score", Math.max(score, previousScore));
        saveJSONObject(json, rankFile);
    }
    
    public boolean compareScore(int score) {
        JSONObject json = loadJSONObject("user" + File.separator + "rank.json");
        int previousScore = json.getInt("highest_score");
        
        return score > previousScore;
    }
    
}
