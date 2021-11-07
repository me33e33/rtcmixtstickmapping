
dur = 60


amp = 35000
carfreq = makeconnection("inlet",0,440);
modfreq = makeconnection("inlet",1,440);
minindex = 0
maxindex = 10

env = maketable("line", 1000, 0, 0, 3.5,1, 7,0)
wavetable = maketable("wave", 1000, "sine")
guide = makeconnection("inlet",2,0)
control_rate(44100)
FMINST(0, dur, amp * env, carfreq, modfreq, minindex, maxindex, pan=0.5, wavetable, guide)

   rtsetparams(44100, 1)
   load("BUTTER")

   rtinput("/Users/meeshfradkin/Desktop/SQUARE_1.wav")

   ampenv = maketable("window", 1000, "hanning")

   BUTTER(0, 0, 8.7, ampenv, "bandpass", 3, 1, 0, 0, 0, 778, 90.0)


// use float inlet to control parameters. the "1" indicates the first inlet. You can have
// up to 9
inlet_control = makeconnection("inlet",1,100)

total_length = 60

// singing bowl
bowlenv = maketable("line",1000,0,0,1,1,2,0)
pitches = {6.00, 6.03, 6.04, 6.07, 6.08, 6.11, 7.00, 7.03, 7.04, 7.07, 7.08, 7.11}
pitchlen = len(pitches)
for (start = 0; start < total_length; start += irand(5,15))
{
        thispitch = trand(pitchlen-1)
        MBANDEDWG(start, irand(8,12), irand(1500,2000)*bowlenv, cpspch(pitches[thispitch]), inlet_control/100, 1, 0.5, 3, 0.0, 1.0, 0.0, random())
        thispitch = trand(pitchlen-1)
        MBANDEDWG(start, irand(8,12), irand(1500,2000)*bowlenv, cpspch(pitches[thispitch]), inlet_control/100, 1, 0.5, 3, 0.0, 1.0, 0.0, random())

}

// fast notes
tempo = {0.33333, 0.25, 0.125, 0.16666, 0.083333}
which_tempo = 2;
for (start = 2; start < total_length; start += tempo[which_tempo])
{
        humanize_tempo = random() * 0.02;
        pan = irand(0.4,0.6)
        MMESH2D(start+humanize_tempo, 1, 8000*start/total_length, trand(2,7), trand(2,7), 0.8, 0.9, 1.0, irand(0.8,0.9), pan)
        if (random()<0.1)
                which_tempo = trand(0,5)
}

// big hits
for (start = 4; start < total_length; start += irand(2,5))
{
        pan = irand(0,0.6)
        MMESH2D(start, 5, 25000, trand(6,12), trand(6,12), 0.8, 0.9, 1, 1, pan)
	MAXBANG()
}
for (start = 5; start < total_length; start += irand(2,5))
{
        pan = irand(0.4,1)
        MMESH2D(start, 5, 25000, trand(6,12), trand(6,12), 0.8, 0.9, 1, 1, pan)
	MAXBANG()
}


rtsetparams(44100, 2)
   load("JCHOR")
   
   rtinput("/Users/meeshfradkin/Desktop/SAWTOOTH_1.wav")
   inchan = 0
   inskip = 0.20
   
   outdur = 10
   
   indur = 0.60
   maintain_dur = 1
   transposition = 0.07
   nvoices = 50
   minamp = 0.01
   maxamp = 1.0
   minwait = 0.00
   maxwait = 0.30
   seed = 0.9371
   
   amp = 0.5
   env = maketable("line", 1000, 0,0, 1,1, outdur-1,1, outdur,0)
   
   grainenv = maketable("window", 1000, "hanning")
   
   JCHOR(15, inskip, outdur, indur, maintain_dur, transposition, nvoices,
      minamp, maxamp, minwait, maxwait, seed, inchan, amp * env, grainenv)
