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