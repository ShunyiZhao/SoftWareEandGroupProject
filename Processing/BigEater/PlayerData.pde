class PlayerData {
    private int score;
    private int health;
    private HashMap<String, Integer> count = new HashMap<String, Integer>();
    
    public PlayerData(String[] names) {
        score = 0;
        health = 10;
        setCountMap(names);
    }
    
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
    
    private boolean checkBadDropping(String name) {
        return "virusA".equals(name) || "virusB".equals(name)||
                "bomb".equals(name);
    }
}
