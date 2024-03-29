rtsetparams(44100, 2)
load("FLANGE")

rtinput("/Users/meeshfradkin/Desktop/SAWTOOTH_1.wav")

inchan = 0
inskip = 0
dur = DUR()
amp = 1.0

resonance = 0.06
lowpitch = 7.00
moddepth = 70
modspeed = maketable("line", "nonorm", 100, 0,4, 1,.1)
wetdrymix = 0.5
flangetype = "IIR"
pan = 0.5

maxdelay = 1.0 / cpspch(lowpitch)

FLANGE(outskip=0, inskip, dur, amp, resonance, maxdelay, moddepth, modspeed,
wetdrymix, flangetype)