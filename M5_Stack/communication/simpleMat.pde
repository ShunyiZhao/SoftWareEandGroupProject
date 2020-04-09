import java.util.ArrayList;

class simpleMat{
    private int nHeight;
    private int nWidth;
    private ArrayList<ArrayList<Float>> arrDatas;
    
    simpleMat(int inptHeight, int inptWidth, ArrayList<ArrayList<Float>> inputDatas){
        nHeight = inptHeight;
        nWidth = inptWidth;
        arrDatas = inputDatas;
    }
    
    public int getHeight(){
        return nHeight;
    }
    
    public int getWidth(){
        return nWidth;
    }
    
    public ArrayList<ArrayList<Float>> getDatas(){
        return arrDatas;
    }
    
    public simpleMat calMatProduct(simpleMat inputMat){
        if(nWidth != inputMat.getHeight()){
            return new simpleMat(0, 0, null);
        }
        //get new width and height
        int newHeight = nHeight;
        int newWidth = inputMat.getWidth();
        //cal Mat
        ArrayList<ArrayList<Float>> newDatas = new ArrayList<ArrayList<Float>>();
        for(int i = 0; i < newHeight; i++){
            ArrayList<Float> rowArray = new ArrayList<Float>();
            for(int j = 0; j < newWidth; j++){
                float temValue = 0.0;
                for(int k = 0; k < nWidth; k++){
                    temValue += arrDatas.get(i).get(k) * inputMat.getDatas().get(k).get(j);
                }
                rowArray.add(temValue);
            }
            newDatas.add(rowArray);
        }
        
        return new simpleMat(newHeight, newWidth, newDatas);
    }
    
    public void printDatas(){
        for(int i = 0; i < nHeight; i++){
            for(int j = 0; j < nWidth; j++){
                print(arrDatas.get(i).get(j) + "  ");
            }
            println();
        }
    }
  
}
