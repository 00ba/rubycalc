accumulator = 0					#一時記憶用
register = [] 					#命令を格納する配列

get_num = Proc.new do 			#入力した数字をアキュムレータに格納
	puts 'Enter some number: '
	accumulator = gets.to_i
end

if_zero = Proc.new do 			#0を受け付けると計算を終わる
	if accumulator == 0
		register[5].call
	end
end

add_sum = Proc.new do 			#入力した数と累計との和を求める
	accumulator += register[8]
end

store_sum = Proc.new do 		#累計を格納する
	register[8] = accumulator
end

goto_top = Proc.new do 			#先頭に戻って計算を続ける
	register.each do |fetch|	#再帰的に配列を呼び出す	
	fetch.call
	end
end

load_sum = Proc.new do 			#累計をアキュムレータに取り出す
	accumulator = register[8] 
	register[6].call
end

print_accumu = Proc.new do 		#アキュムレータの値を表示する
 	puts 'SUM: '
    puts accumulator
    register[7].call
end

stop = Proc.new do 			
	exit  						#プログラムを終了する
end

#命令を配列に入れる
register[0] = get_num 			
register[1] = if_zero
register[2] = add_sum
register[3] = store_sum
register[4] = goto_top
register[5] = load_sum
register[6] = print_accumu
register[7] = stop
register[8] = 0 				#累計を格納する場所

register.each do |fetch|		#配列から順番に命令を取り出し実行する
	fetch.call
end