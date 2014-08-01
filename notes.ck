class Notes
{
    //Musical scales
    int major[];
    [1,0,1,0,1,1,0,1,0,1,0,1] @=> major;
    int minor[];
    [1,0,1,1,0,1,0,1,1,0,1,0] @=> minor;
    int mHormonic[];
    [1,0,1,1,0,1,0,1,1,0,0,1] @=> mHormonic;
    int doubleHormonic[];
    [1,1,0,0,1,1,0,1,1,0,0,1] @=> doubleHormonic;
    int Mixolydian[];
    [1,0,1,0,1,1,0,1,0,1,1,0] @=> Mixolydian;
    
    //Chromatic musical tones
    static float noteStream[];
    static float notesByOctave[][];
    
    fun void setNoteStream()
    {
        float temp[85];
        Math.pow(2.0,1.0/12.0) => float a;
        for( 0 => int i; i < 85; i++ ) 
        {
           440.0 * Math.pow(a,i-45) => temp[i];
        } 
        temp @=> noteStream;
    }
    fun void setNotesByOctave(){}
}