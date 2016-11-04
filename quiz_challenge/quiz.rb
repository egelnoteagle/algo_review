right_answers = []
puts "Welcome to Trivia"
sleep 1
File.open("quiz_source_text.txt").each do |line|
  line = line.chomp

  if line.include?("Correct:")
    answer = "Correct: " + gets.chomp.upcase
    if answer == line
      puts ""
      puts line
      right_answers += 1
    else
      puts ""
      puts "Wrong"
      puts "The correct answer was:"
      puts line[-1]
    end    
  else
    puts line
  end   
  puts ""
  sleep 1
end
puts "Total number of answers correct:"
puts right_answers