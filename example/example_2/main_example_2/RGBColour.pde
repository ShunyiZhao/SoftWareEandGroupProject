class RGBColour{
    int R;
    int G;
    int B;
    
    RGBColour(int setR, int setG, int setB){
        R = setR;
        G = setG;
        B = setB;
    }
    
    void setR(int valR){
        R = valR;
    }
    
    void setG(int valG){
        G = valG;
    }
    
    void setB(int valB){
        B = valB;
    }
    
    int readR(){
        return R;
    }
    int readB(){
        return B;
    }
    int readG(){
        return G;
    }
}
