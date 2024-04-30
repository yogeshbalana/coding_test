require "pstore"

def store_name
  if $PROGRAM_NAME == __FILE__
    "answers.pstore"
  else
    "answers_test.pstore"
  end
end

QUESTIONS = {
  "q1": "Can you code in Ruby?",
  "q2": "Can you code in JavaScript?",
  "q3": "Can you code in Swift?",
  "q4": "Can you code in Java?",
  "q5": "Can you code in C#?"
}.freeze

# Get the values from users
def do_prompt
  answers = {}
  QUESTIONS.each do |key, question|
    print "#{question} (Yes/No): "
    answer = gets.chomp.downcase
    answers[key] = answer
  end
  add_answers(answers)
  calculate_completion_percentage(answers)
end

# Add answers to store file
def add_answers(answers)
  store = PStore.new(store_name)
  store.transaction do
    store[:answers] ||= []
    store[:answers] << answers
  end
end

# Get for single user fedback avarage
def calculate_completion_percentage(answers)
  nomber_of_yes = answers.values.count { |answer| answer.start_with?("y") }
  rating = (100.0 * nomber_of_yes / QUESTIONS.size).round(2)
  puts "Rating for this run: #{rating}%"
end

# Get all users survey fedback average
def evaluate_survey_average
  store = PStore.new(store_name)
  nomber_of_yes = 0
  question_counts = 0
  store.transaction(true) do
    store[:answers]&.each do |answers|
      nomber_of_yes += answers.values.count { |answer| answer.start_with?("y") }
      question_counts += QUESTIONS.size
    end
  end
  average_rating = (100.0 * nomber_of_yes / question_counts).round(2)
  puts "Average rating across all runs: #{average_rating}%"
end

if $PROGRAM_NAME == __FILE__
  do_prompt
  evaluate_survey_average
end