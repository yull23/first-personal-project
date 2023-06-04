require "json"
require "terminal-table"
require_relative "z3_questionsform"

class Store
  attr_reader :file_name, :scores

  def initialize
    @file_name = filename_save
    @scores = read_scores
    # @data = data
  end

  def filename_save
    filename = ARGV.shift
    filename = "scores.json" if filename.nil?
    File.write(filename, []) unless File.exist?(filename)
    filename
  end

  # Data reading
  def read_scores
    data = File.read(@file_name)
    JSON.parse data, symbolize_names: true
  end

  # Option Random
  def option_random(dato)
    questionsform = QuestionForm.new(dato)
    score = questionsform.start
    action_save = save?
    return unless action_save == "y"

    puts "Type the name to assign to the score"
    print "> "
    name = gets.chomp
    @scores.push({ name:, score: })
    save
  end

  # Option Scores
  def option_scores
    table = Terminal::Table.new
    table.title = "Top Scores"
    table.headings = ["Name", "Score"]
    table.rows = scores
    puts table
  end

  def save?
    puts "Do you want to save your score? (y/n)"
    print "> "
    answer = gets.chomp
    until ["y", "n"].include?(answer)
      puts "Option Invalid"
      puts "Do you want to save your score? (y/n)"
      print "> "
      answer = gets.chomp
    end
    answer
  end

  # Defining score list and ordering
  def scores
    scores_list = []
    if @scores != []
      @scores.each do |score|
        scores_list << [score[:name], score[:score]]
      end
    end
    scores_list.sort_by { |name, score| [-score, name] }
  end

  private

  # Method to save score
  def save
    json_data = JSON.generate(@scores)
    File.write(@file_name, json_data)
  end
end

# objeto = Store.new
# puts objeto.scores
