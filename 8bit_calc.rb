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

#変換器
class Converter

	#10進数の数字を受け取って2進数に変換、配列にして返す

	def d2b a
		b = a.to_s(2).reverse.split(//)
		c = [0,0,0,0,0,0,0,0] 			#8桁を０で埋めておきたい
		c = b.map{ |b| b.to_i}					
		return c								
	end

	#配列を受け取って2進数に変換、10進数の数字を返す

	def b2d a		
		c = a.to_i(2)
		return c
	end

end






#引数ARGVを変換器に通して配列にする
conv = Converter.new

a1 = ARGV[0] 						
a2 = a1.to_i
a3 = []

b1 = ARGV[1]
b2 = b1.to_i
b3 = []

a3 = conv.d2b a2  					
b3 = conv.d2b b2

print a3.reverse
puts ARGV[0]
print b3.reverse
puts ARGV[1]						#うまく改行できない

#8つの全加算器をつくって繋げる(この部分すっきりまとめたい)

adder0 = FullAdder.new 				
adder1 = FullAdder.new
adder2 = FullAdder.new
adder3 = FullAdder.new
adder4 = FullAdder.new
adder5 = FullAdder.new
adder6 = FullAdder.new
adder7 = FullAdder.new


s0,c1 = adder0.add a3[0],b3[0],0 	#１桁目は桁上り無しなので０
s1,c2 = adder1.add a3[1],b3[1],c1
s2,c3 = adder2.add a3[2],b3[2],c2
s3,c4 = adder3.add a3[3],b3[3],c3
s4,c5 = adder4.add a3[4],b3[4],c4
s5,c6 = adder5.add a3[5],b3[5],c5
s6,c7 = adder6.add a3[6],b3[6],c6
s7,c8 = adder7.add a3[7],b3[7],c7

#答えの配列を変換器に通して整数にする

answer1 = []
answer1 = c8,s7,s6,s5,s4,s3,s2,s1,s0
answer2 = answer1.join 
num = conv.b2d answer2 
print answer1
puts num
						