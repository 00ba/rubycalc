# -*- coding: utf-8 -*-

class HarfAdder 
	def add a,b
		a = a.to_i
		b = b.to_i

		d = a | b	#orゲート
		c = a & b	#andゲート1
		if c == 1	#notゲート
			e = 0
		else
		 	e = 1
		end		 			
		s = e & d	#andゲート2	
		return s,c
	end
end

class OrGate 
	def add c1,c2
		c3 = c1 | c2 	#orゲート	
	return c3
	end
end

class FullAdder
	def add a,b,x				#入力a,bと桁上りの数ｘ
		adder1 = HarfAdder.new
		adder2 = HarfAdder.new
		gate = OrGate.new

		s1,c1 = adder1.add a,b		#HarfAdder1の出力sと
		s2,c2 = adder2.add s1,x 	#桁上りの数ｘを、HarfAdder2に入力
		c3 	= 	gate.add c1,c2

		#puts s1,s2,c1,c2,c3
		puts 'c:'+c3.to_s 			#桁上りの数cと出力s
		puts 's:'+s2.to_s
	end
end

adder = FullAdder.new
adder.add ARGV[0],ARGV[1],ARGV[2]	#入力a,bと桁上りの数ｘ

