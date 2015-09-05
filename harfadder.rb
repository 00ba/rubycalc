def add a,b	
	a = a.to_i
	b = b.to_i

	if 	a == b	#xor
		s = 0
	else
	 	s = 1
	end	
	c = a & b	#and
	puts c,s
end

add ARGV[0],ARGV[1]