class Question
  # attr_reader :question
  def initialize(data)
    @category = data[:category]
    @type = data[:type]
    @difficulty = data[:difficulty]
    @question = data[:question]
    @correct_answer = data[:correct_answer]
    @incorrect_answers = data[:incorrect_answers]
    # Tool variables
    @answers = answers_list
    @keys = (1..@answers.length).to_a
    @correct_key = @answers.index(@correct_answer) + 1
  end

  # Start Question
  def start
    print_question
    key = validation_key
    score_obtained(key)
  end

  # Print Question
  def print_question
    puts "Category: #{@category} | Difficulty: #{@difficulty}"
    puts "Question: #{@question}"
    i = 1
    @answers.each do |answer|
      puts "#{i}. #{answer}"
      i += 1
    end
    print "> "
  end

  # Validation de respuesta
  def validation_key
    key = gets.chomp.to_i
    until @keys.include?(key)
      puts "Option Invalid"
      print_question
      key = gets.chomp.to_i
    end
    key
  end

  # Score obtained
  def score_obtained(id)
    if id == @correct_key
      puts "Very Good, correct answer"
      10
    else
      puts "#{@answers[id - 1]}... Incorrect!"
      puts "The correct answer was: #{@correct_answer}"
      0
    end
  end

  # Tool
  def answers_list
    if @type == "boolean"
      ["True", "False"]
    else
      @incorrect_answers.push(@correct_answer).shuffle
    end
  end
end

# data_1 = {
#   category: "Animals", type: "boolean", difficulty: "easy",
#   question: "In 2016, the IUCN reclassified the status of Giant Pandas from endangered to vulnerable.",
#   correct_answer: "True",
#   incorrect_answers: ["False"]
# }

# data_2 = {
#   category: "Science: Computers",
#   type: "multiple",
#   difficulty: "hard",
#   question: "Which of these was the name of a bug found in April 2014 in the publicly available OpenSSL cryptography library?",
#   correct_answer: "Heartbleed",
#   incorrect_answers: ["Shellshock", "Corrupted Blood", "Shellscript"]
# }

# objeto = Question.new(data_2)
# p objeto.star
