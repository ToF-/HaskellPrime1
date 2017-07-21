spoj : Prime1.hs
	tail -n +2 Prime1.hs > SPOJPrime1.hs
	echo "main = interact process" >> SPOJPrime1.hs

test: spoj
	runhaskell SPOJPrime1.hs <test.txt >result.txt
	diff expected.txt result.txt

time: spoj
	time runhaskell SPOJPrime1.hs <test.txt >result.txt
	
