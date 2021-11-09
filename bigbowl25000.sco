inlet_control = makeconnection("inlet",1,100)


total_length = 60


// big hits
for (start = 0; start < total_length; start += irand(2,5))
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
