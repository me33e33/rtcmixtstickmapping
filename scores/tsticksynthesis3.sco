rtsetparams(44100, 1, 512)
load("PVOC")

rtinput("./rtcmix_wav/WHITE_1.wav")

PVOC(start=0, inputskip=0, inputread=DUR(0), amp=0.9, inputchan=0, fft=1024, window=2*fft,
readin=1024, writeout=2*readin)