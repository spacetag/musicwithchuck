class Notes
{
    //Musical scales
    int major[];// maj I, min III
    [1,0,1,0,1,1,0,1,0,1,0,1] @=> major;
    int minor[];// maj VI, min I
    [1,0,1,1,0,1,0,1,1,0,1,0] @=> minor;
    int mHormonic[];
    [1,0,1,1,0,1,0,1,1,0,0,1] @=> mHormonic;
    int doubleHormonic[];
    [1,1,0,0,1,1,0,1,1,0,0,1] @=> doubleHormonic;
    int mixolydian[];//maj V, minor VII
    [1,0,1,0,1,1,0,1,0,1,1,0] @=> mixolydian;
    int locrian[];//maj VII, min II
    [1,1,0,1,0,1,1,0,1,0,1,0] @=> locrian;
    int phrygian[];//maj III, min V
    [1,1,0,1,0,1,0,1,1,0,1,0] @=> phrygian;
    int lydian[];// maj IV, min VI
    [1,0,1,0,1,0,1,1,0,1,0,1] @=> lydian;
    int dorian[];// maj II, min IV
    [1,0,1,1,0,1,0,1,0,1,1,0] @=> dorian;
    
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