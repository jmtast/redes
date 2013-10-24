function tqueue = Tqueue(rtt, tprop)
	tqueue = rtt/2 - 1000*tprop;
end