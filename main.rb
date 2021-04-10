#RPEを考慮した１RM 計算プログラム
# 使用重量を入力
while true
  print "使用重量(kg)を入力してください。>>>"
  used_weight = gets.to_f
  break if (1..500).include?(used_weight)
  puts "1~500の値を入力してください。"
end
puts "使用重量は#{used_weight}kgですね。"

# rep数を入力
while true
  print "rep数を入力してください。>>>"
  num_of_rep = gets.to_i
  break if (1..10).include?(num_of_rep)
  puts "1~10の値を入力してください。"
end
puts "rep数は#{num_of_rep}回ですね。"

# RPEを入力
while true
  print "RPEを入力してください。>>>"
  rating_of_perceived_exertion = gets.to_f
  break if (6.5..10).include?(rating_of_perceived_exertion)
  puts "6.5~10の値を入力してください。(0.5刻み)"
end

puts "RPEは#{rating_of_perceived_exertion}ですね。"

# 入力されたrep数、RPEの値の組み合わせから、特定の％を取り出す。
# ハッシュ RPE = {rep => 90%}
case rating_of_perceived_exertion
when 10
  rpe_10 = { 1 => 1, 2 => 0.96, 3 => 0.92, 4 => 0.89, 5 => 0.86, 6 => 0.84, 7 => 0.81, 8 => 0.79, 9 => 0.76, 10 => 0.74 }
  got_percentage = rpe_10[num_of_rep]
when 9.5
  rpe_95 = { 1 => 0.98, 2 => 0.94, 3 => 0.91, 4 => 0.88, 5 => 0.85, 6 => 0.82, 7 => 0.80, 8 => 0.77, 9 => 0.75, 10 => 0.72 }
  got_percentage = rpe_95[num_of_rep]
when 9
  rpe_9 = { 1 => 0.96, 2 => 0.92, 3 => 0.89, 4 => 0.86, 5 => 0.84, 6 => 0.81, 7 => 0.79, 8 => 0.76, 9 => 0.74, 10 => 0.71 }
  got_percentage = rpe_9[num_of_rep]
when 8.5
  rpe_85 = { 1 => 0.94, 2 => 0.91, 3 => 0.88, 4 => 0.85, 5 => 0.82, 6 => 0.80, 7 => 0.77, 8 => 0.75, 9 => 0.72, 10 => 0.69 }
  got_percentage = rpe_85[num_of_rep]
when 8
  rpe_8 = { 1 => 0.92, 2 => 0.89, 3 => 0.86, 4 => 0.84, 5 => 0.81, 6 => 0.79, 7 => 0.76, 8 => 0.74, 9 => 0.71, 10 => 0.68 }
  got_percentage = rpe_8[num_of_rep]
when 7.5
  rpe_75 = { 1 => 0.91, 2 => 0.88, 3 => 0.85, 4 => 0.82, 5 => 0.80, 6 => 0.77, 7 => 0.75, 8 => 0.72, 9 => 0.69, 10 => 0.67 }
  got_percentage = rpe_75[num_of_rep]
when 7
  rpe_7 = { 1 => 0.89, 2 => 0.86, 3 => 0.84, 4 => 0.81, 5 => 0.79, 6 => 0.76, 7 => 0.74, 8 => 0.71, 9 => 0.68, 10 => 0.65 }
  got_percentage = rpe_7[num_of_rep]
when 6.5
  rpe_65 = { 1 => 0.88, 2 => 0.85, 3 => 0.82, 4 => 0.80, 5 => 0.77, 6 => 0.75, 7 => 0.72, 8 => 0.69, 9 => 0.67, 10 => 0.64 }
  got_percentage = rpe_65[num_of_rep]
else
  puts "RPEが0.5刻みではないので、計算できません。初めからやり直してください。"
  exit
end

# １RM を出力
puts "1RMは#{used_weight / got_percentage}kgです"
