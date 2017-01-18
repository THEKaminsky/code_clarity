user_list = [
  [ "Sam", "Smith", "SamS@example.com"],
  [ "Jim", "Jones", "JJones@example.com"],
  [ "Chris", "Canes", "Canes@example.com"],
  [ "Walter", "White", "Cooker@example.com"],
]

question_list = [
  ["What color is the color blue?"],
  ["What is 2 + 3?"],
  ["What smells like oranges?"]
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

user_answer_list = [
  [1, 1],
  [1, 6],
  [1, 11],
  [2, 2],
  [2, 6],
  [2, 12],
  [3, 1],
  [3, 6],
  [3, 11],
  [4, 1],
  [4, 8],
  [4, 10]
]

question_list.each do |content|
  Question.find_or_create_by( content: content )
end

user_list.each do |fname, lname, email|
  User.find_or_create_by( fname: fname, lname: lname, email: email )
end

answer_option_list.each do |question_id, content, is_correct|
  AnswerOption.find_or_create_by( question_id: question_id, content: content, is_correct: is_correct )
end

user_answer_list.each do |user_id, answer_option_id|
  UserAnswer.find_or_create_by( user_id: user_id, answer_option_id: answer_option_id )
end
