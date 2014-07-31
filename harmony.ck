SinOsc chl1 => dac;
Harmony.setNoteStream();
//instantiating a class looks like a C++ value instance
Harmony h; 
h.setMeter(100);

h.setChordsAndScale([1,1,0,0,1,1,0,1,1,0,0,1],2);

<<<h.whole>>>;

for(21 => int i; i < 56; i++)
{
    h.scale[i] => chl1.freq;
    h.sixteenth::second => now; 
}

public class Harmony 
{
    //Musical tones
    static float noteStream[];
    static float notesByOctave[][];
    //meter
    float whole;
    float half;
    float quarter;
    float eighth;
    float sixteenth;
    //Chords
    float I[];
    float II[];
    float III[];
    float IV[];
    float V[];
    float VI[];
    float VII[];
    // the scale 
    float scale[];
    
    fun void setMeter(int beatsPerMinute)
    {
        if(beatsPerMinute != 0)
        {
            //this is for seconds, todo must be a way to use the time class instead of floats
            (1/beatsPerMinute) * 60 => quarter;
            (beatsPerMinute * 2) * 60 => half;
            (beatsPerMinute * 4) * 60 => whole;
            (0.5/beatsPerMinute) * 60 => eighth;
            (0.25/beatsPerMinute) * 60 => sixteenth;
        }
    }
    
    fun void setChordsAndScale(int scalePattern[], int root) 
    {
        float temp[85];
        0 => int count;
        for(0 => int i; i < 85; i++) 
        {
            if(scalePattern[(i + root) % 12] == 1)
            {
                noteStream[i] => temp[count++];
            }
        }
        temp @=> scale;
    }
    
    fun static void setNoteStream()
    {
        float temp[85];
        Math.pow(2.0,1.0/12.0) => float a;
        for( 0 => int i; i < 85; i++ ) 
        {
           440.0 * Math.pow(a,i-45) => temp[i];
        } 
        temp @=> noteStream;
    }
    
    fun static void setNotesByOctave(){}
}