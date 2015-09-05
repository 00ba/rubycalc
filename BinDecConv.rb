#2進数配列変換器
class Converter

	#10進数の数字を受け取って2進数に変換、配列にして返す

	def d2b a
		b = a.to_s(2).reverse.split(//)
		c = [0,0,0,0,0,0,0,0]
		c = b.map{ |b| b.to_i}					
		return c								
	end

	#配列を受け取って2進数に変換、10進数の数字を返す

	def b2d a
		b = a.to_s
		c = b.to_i(2)
		return c
	end

end

conv = Converter.new 

a1 = ARGV[0]
a2 = a1.to_i
a3 = []
a3 = conv.d2b a2

print a3
