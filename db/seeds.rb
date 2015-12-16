include RandomData

50.times do
  Task.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end
tasks = Task.all

puts "Seed finished"
puts "#{Task.count} tasks created"
