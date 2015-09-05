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

#orゲート
class OrGate 
	def add c1,c2
		c3 = c1 | c2 		
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

#8bit計算機
class EightBitCalc
	
	def add a,b
	#8つの全加算器をつくって繋げる(この重複部分すっきりまとめたい)

	adder0 = FullAdder.new 				
	adder1 = FullAdder.new
	adder2 = FullAdder.new
	adder3 = FullAdder.new
	adder4 = FullAdder.new
	adder5 = FullAdder.new
	adder6 = FullAdder.new
	adder7 = FullAdder.new

	#8桁の配列a,bを足し、配列にして返す
	s0,c1 = adder0.add a[0],b[0],0 	#１桁目は桁上り無しなので０
	s1,c2 = adder1.add a[1],b[1],c1
	s2,c3 = adder2.add a[2],b[2],c2
	s3,c4 = adder3.add a[3],b[3],c3
	s4,c5 = adder4.add a[4],b[4],c4
	s5,c6 = adder5.add a[5],b[5],c5
	s6,c7 = adder6.add a[6],b[6],c6
	s7,c8 = adder7.add a[7],b[7],c7

	answer = c8,s7,s6,s5,s4,s3,s2,s1,s0
	return answer
	end

end




#main
calc = EightBitCalc.new
conv = Converter.new

#引数ARGVを変換器に通して配列にする
a = conv.d2b(ARGV[0].to_i)  					
b = conv.d2b(ARGV[1].to_i) 

print a.reverse
puts ARGV[0]
print b.reverse
puts ARGV[1]						#うまく改行できない

answer = calc.add a,b

#答えの配列を変換器に通して整数にする
num = conv.b2d(answer.join) 
print answer
puts num
						