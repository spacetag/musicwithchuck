fun void loopM8(float triad[], SinOsc c, Meter m, int start, int dir, int min, int max) 
{
    for(start => int i; i < max && i >= min; i + dir => i)
    {
        triad[i] => c.freq;
        m.sixteenth::second => now; 
    }
}

fun void main() {
    <<<"Begin">>>;
    //config/initialization section
    SinOsc  chl1 => dac;
    
    Notes notes;
    Harmony harmony; 
    Meter meter;
    notes.setNoteStream();
    meter.setMeter(100);
    <<<"Configuration complete">>>;
    harmony.setScale(notes, notes.mHormonic, 2);
    <<<"Scales and chords set">>>;
    //begin making music
    for(0 => int i; i < 2; i++) 
    {
        loopM8(harmony.I, chl1, meter, 7,-1,0, 8);
        loopM8(harmony.IV, chl1, meter, 7, -1, 0, 8);
        loopM8(harmony.III, chl1, meter, 7, -1,0, 8);
        loopM8(harmony.VII, chl1, meter, 3, -1,0, 8);
        loopM8(harmony.V, chl1, meter, 3, -1,0, 8);
        loopM8(harmony.II, chl1, meter, 7, -1,0, 8);
        loopM8(harmony.scale, chl1, meter, 15, -1,0, 16);

    }
    <<<"End">>>;
}
main();
//-------------Class declaration section--------------------
//Chuck only supports shared data between files that is static
//so below are classes that must be in the same file as the main program
//------------------------------------------------------------

//Meter class keeps track of time -- beats and rapidity
class Meter
{
    //todo -- add more advanced timing
    float whole;
    float half;
    float quarter;
    float eighth;
    float sixteenth;
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
}

//class Harmony t
class Harmony 
{
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
    
    fun void setScale(Notes n, int scalePattern[], int root) 
    {
        float temp[50];
        0 => int count;
        for(0 => int i; i < n.noteStream.cap(); i++) 
        {
            if(scalePattern[(i + root) % 12] == 1)
            {
                n.noteStream[i] => temp[count++];
            }
        }
        temp @=> scale;
        setChords(scale);
    }
    fun void setChords(float mode[])
    {
        float temp1[12];
        float temp2[12];
        float temp3[12];
        float temp4[12];
        float temp5[12];
        float temp6[12];
        float temp7[12];
        int one;
        int two;
        int three;
        int four;
        int five;
        int six;
        int seven;
        for(24-12 => int i; i < mode.cap()-12; i++)
        {
            //I see no switch statement in docs for chucK
            if(i%7 == 0)
            {
                mode[i] => temp1[one];
                one++;
                if(four >= 2)
                {
                    mode[i] => temp4[four];
                    four++;
                }
                if(six >= 1)
                {
                    mode[i] => temp6[six];
                    six++;
                }
            }
            if(i%7 == 1)
            {
                mode[i] => temp2[two];
                two++;
                if(five >= 2)
                {
                    mode[i] => temp5[five];
                    five++;
                }
                if(seven >= 1)
                {
                    mode[i] => temp7[seven];
                    seven++;
                }
            }
            if(i%7 == 2)
            {
                mode[i] => temp3[three];
                three++;
                if(six >= 2)
                {
                    mode[i] => temp6[six];
                    six++;
                }
                if(one >= 1)
                {
                    mode[i] => temp1[one];
                    one++;
                }
            }
            if(i%7 == 3)
            {
                mode[i] => temp4[four];
                four++;
                if(seven >= 2)
                {
                    mode[i] => temp7[seven];
                    seven++;
                }
                if(two >= 1)
                {
                    mode[i] => temp2[two];
                    two++;
                }
            }
            if(i%7 == 4)
            {
                mode[i] => temp5[five];
                five++;
                if(one >= 2)
                {
                    mode[i] => temp1[one];
                    one++;
                }
                if(three >= 1)
                {
                    mode[i] => temp3[three];
                    three++;
                }
            }
            if(i%7 == 5)
            {
                mode[i] => temp6[six];
                six++;
                if(two >= 2)
                {
                    mode[i] => temp2[two];
                    two++;
                }
                if(four >= 1)
                {
                    mode[i] => temp4[four];
                    four++;
                }
            }
            if(i%7 == 6)
            {
                mode[i] => temp7[seven];
                seven++;
                if(three >= 2)
                {
                    mode[i] => temp3[three];
                    three++;
                }
                if(five >= 1)
                {
                    mode[i] => temp5[five];
                    five++;
                }
            }
        }
        temp1 @=> I;
        temp2 @=> II;
        temp3 @=> III;
        temp4 @=> IV;
        temp5 @=> V;
        temp6 @=> VI;
        temp7 @=> VII;
    }
}

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