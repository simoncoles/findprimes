# This was the original code to find primes, written in Python

def is_this_prime(num):
	this_is_a_prime = True
	for i in range(2, num):
		if (num % i) == 0:
			this_is_a_prime = False
			break
			# print "Found something it can be divided by", i, num % i
	return this_is_a_prime


x = 0
while True:
	x = x + 1
	if is_this_prime(x):
		print x, "is a prime"
