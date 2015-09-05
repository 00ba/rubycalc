#半加算器
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

#全加算器
class FullAdder
	def add a,b,x				#a,bと桁上りの数ｘを入力
		adder1 = HarfAdder.new
		adder2 = HarfAdder.new
		gate = OrGate.new

		s1,c1 = adder1.add a,b		#HarfAdder1の出力sと
		s2,c2 = adder2.add s1,x 	#桁上りの数ｘを、HarfAdder2に入力
		c3 	= 	gate.add c1,c2

		return s2,c3				#sと桁上りの数cを出力
	end
end

#2進数配列変換器
class Converter

	#10進数の数字を受け取って2進数に変換、配列にして返す

	def d2b a
		b = a.to_s(2).reverse.split(//)
		c = []
		c = b.map{ |b| b.to_i}					
		return c								
	end

	#配列を受け取って2進数に変換、10進数の数字を返す

	def b2d a
		
		c = a.to_i(2)
		return c
	end

end



adder1 = FullAdder.new
adder2 = FullAdder.new
conv = Converter.new 

a1 = ARGV[0]
a2 = a1.to_i
a3 = []

b1 = ARGV[1]
b2 = b1.to_i
b3 = []

a3 = conv.d2b a2
b3 = conv.d2b b2

print a3
puts ARGV[0]
print b3
puts ARGV[1]						#うまく改行できない


s0,c = adder1.add a3[0],b3[0],0 	#１桁目は桁上りの数cは無しなので０
s1,c = adder2.add a3[1],b3[1],c
answer1 = []
answer1 = c,s1, s0
answer2 = answer1.join 
num = conv.b2d answer2 
print answer1
puts num
 

									