question_list = [
  "What color is the color blue?",
  "What is 2 + 3?",
  "What smells like oranges?"
]

answer_option_list = [
  [1, "Blue", true],
  [1, "Red", false],
  [1, "Green", false],
  [1, "Black", false],
  [1, "White", false],
  [2, "5", true],
  [2, "23", false],
  [2, "47", false],
  [2, "643", false],
  [3, "Oranges", true],
  [3, "Bananas", false],
  [3, "Pickles", false],
  [3, "Used Sneakers", false],
]


question_list.each do |content|
  Question.find_or_create_by( content: content )
end

answer_option_list.each do |question_id, content, is_correct|
  AnswerOption.find_or_create_by( question_id: question_id, content: content, is_correct: is_correct )
end
