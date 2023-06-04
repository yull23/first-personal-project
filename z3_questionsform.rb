require_relative "z4_question"

class QuestionForm
  attr_reader :questions

  def initialize(questions)
    @questions = questions.map { |question| Question.new(question) }
  end

  def start
    score = 0
    @questions.each do |question|
      score += question.start
    end
    puts "Well done! Your score is #{score}"
    puts "--------------------------------------------------"
    score
  end
end

# data = [
#   { category: "History", type: "multiple", difficulty: "medium",
#     question: "The Herero genocide was perpetrated in Africa by which of the following colonial nations?", correct_answer: "Germany", incorrect_answers: ["Britain", "Belgium", "France"] }, { category: "Entertainment: Video Games", type: "multiple", difficulty: "medium", question: "Which football player is featured on the international cover version of the video game FIFA 16?", correct_answer: "Lionel Messi", incorrect_answers: ["Cristiano Ronaldo", "Wayne Rooney", "David Beckham"] }, { category: "Entertainment: Video Games", type: "multiple", difficulty: "hard", question: "What is the fastest speed possible in Trackmania&sup2;: Stadium?", correct_answer: "1000  km/h", incorrect_answers: ["500 km/h", "320 km/h", "100 km/h"] }, { category: "Art", type: "multiple", difficulty: "hard", question: "What year was the Mona Lisa finished?", correct_answer: "1504", incorrect_answers: ["1487", "1523", "1511"] }, { category: "Entertainment: Video Games", type: "multiple", difficulty: "medium", question: "What was the name of the protagonist of Metal Gear Solid V: The Phantom Pain?", correct_answer: "Punished &quot;Venom&quot; Snake", incorrect_answers: ["Miller", "Solid Snake", "Ocelot"] }, { category: "Entertainment: Video Games", type: "multiple", difficulty: "medium", question: "How many regular Sunken Sea Scrolls are there in &quot;Splatoon&quot;?", correct_answer: "27", incorrect_answers: ["32", "30", "5"] }, { category: "Geography", type: "multiple", difficulty: "easy", question: "What is the capital of Scotland?", correct_answer: "Edinburgh", incorrect_answers: ["Glasgow", "Dundee", "London"] }, { category: "Entertainment: Music", type: "multiple", difficulty: "hard", question: "What is the official name of Prince&#039;s backing band?", correct_answer: "The Revolution", incorrect_answers: ["The Paupers", "The Wailers", "The Heartbreakers"] }, { category: "Entertainment: Video Games", type: "multiple", difficulty: "easy", question: "In the survival horror game, &quot;Cry of Fear,&quot; what was the name of Simon&#039;s close friend/potential love interest?", correct_answer: "Sophie", incorrect_answers: ["Olivia", "Jessica", "Alice"] }, { category: "Entertainment: Books", type: "multiple", difficulty: "hard", question: "What is the name of the town in which Lily and James Potter are buried?", correct_answer: "Godric&#039;s Hollow", incorrect_answers: ["Hogsmeade", "Ottery St. Catchpole", "Little Hangleton"] }
# ]

# objeto = QuestionForm.new(data)
# objeto.star
