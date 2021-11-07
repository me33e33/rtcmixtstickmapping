
   rtsetparams(44100, 2)
   load("COMBIT")
   control_rate(1000)

   rtinput("/Users/meeshfradkin/Desktop/SINE_1.wav")

   dur = 0.1
   ampenv = maketable("line", 1000, 0,0, 0.1,1, 1,0) 
   for (outsk = 0; outsk < 14.0; outsk = outsk + 0.1) {
      insk = random() * 7.0
      pitch = random() * 500 + 100
      COMBIT(outsk, insk, dur, 0.1*ampenv, pitch, .5, 0, random());
   }

 rtsetparams(44100, 1)

   // send a bang 1.5 seconds after receiving this score
   MAXBANG(1.5)