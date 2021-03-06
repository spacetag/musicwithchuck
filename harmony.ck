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
