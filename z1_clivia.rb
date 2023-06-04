require_relative "z2_store"
require_relative "z5_presenter"
require "httparty"
require "htmlentities"

class CliviaMain
  attr_reader :data

  include HTTParty
  include Presenter
  base_uri "https://opentdb.com"

  def initialize
    @data = code_questions
    @store = Store.new
  end

  def start
    action = ""
    while action != "exit"
      action = defining_action
      case action
      when "random" then option_random
      when "scores" then option_scores
      when "exit" then puts "Good Bye!"
      end
    end
  end

  # Load questions in initial state
  def load_questions
    data = JSON.parse self.class.get("/api.php?amount=10").body, symbolize_names: true
    data = data[:results]
  end

  # Encode all questions in the same array
  def code_questions
    questions = load_questions
    questions.each do |question|
      question = code_question(question)
    end
    questions
  end

  # Code a question
  def code_question(question)
    coder = HTMLEntities.new
    question[:category] = coder.decode(question[:category])
    question[:type] = coder.decode(question[:type])
    question[:difficulty] = coder.decode(question[:difficulty])
    question[:question] = coder.decode(question[:question])
    question[:correct_answer] = question[:correct_answer]
    question[:incorrect_answers] = question[:incorrect_answers].map { |i| coder.decode(i) }
    question
  end

  def option_random
    @data = code_questions
    @store.option_random(@data)
  end

  def option_scores
    @store.option_scores
  end
end

# objeto = CliviaMain.new
# objeto.start
# objeto.main
# objeto.print_main
# puts objeto.option_start
# objeto.print_table
