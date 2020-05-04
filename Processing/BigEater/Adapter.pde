import mqtt.*;
import java.util.*;

MQTTClient client;

class Adapter implements MQTTListener {
  
    public String message = null;
    public List<String> userChoice = new ArrayList<String>();
  
    private void getUserChoice() {
        int left = -1;
        int right = -1;
        for (int i = 0; i < message.length(); ++i) {
            if (message.charAt(i) == '[') { left = i; }
            if (message.charAt(i) == ']') { right = i; }
            if (left != -1 && right != -1) { break; }
        }
        if (left == -1 || right == -1) {
            //client.publish("/yiduzhiren", printErrorMessage("Lack of brackets"));
            return;
        }
        setChoiceList(left, right);
        //if (userChoice.size() < 2) {
        //    client.publish("/yiduzhiren", printErrorMessage("Too few arguments"));
        //    return;
        //}
        //if (userChoice.size() > 6) {
        //    client.publish("/yiduzhiren", printErrorMessage("Too many arguments"));
        //    return;
        //}
    }
    
    private void setChoiceList(int left, int right) {
        boolean flag = false;
        for (int i = left; i <= right; ++i) {
            if (message.charAt(i) == ',') { continue; }
            if (message.charAt(i) == '"') {
                flag = true;
                continue;
            }
            if (flag) {
                StringBuilder sb = new StringBuilder();
                for (int j = i; j < right; ++j) {
                    if (message.charAt(j) == '"') { 
                        i = j;
                        break;
                    }
                    sb.append(String.valueOf(message.charAt(j)));
                }
                userChoice.add(sb.toString());
                flag = false;
            }
        }
    }
  
    //private String printErrorMessage(String info) {
    //    JSONObject json = new JSONObject();
    //    json.setString("datatype", "error");
    //    json.setString("main", info);
    //    return json.toString();
    //}
  
    void clientConnected() {
      println("client connected");

      client.subscribe("/BigEater");
    }

    void messageReceived(String topic, byte[] payload) {
      println("new message: " + topic + " - " + new String(payload));
      message = new String(payload);
      getUserChoice();
    }

    void connectionLost() {
      println("connection lost");
    }
}
