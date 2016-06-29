def likes(people)
  case people.length
  when 0
    "no one likes this"
  when 1
    "#{people[0]} likes this"
  when 2
    "#{people[0]} and #{people[1]} like this"
  when 3
    "#{people[0]}, #{people[1]} and #{people[2]} like this"
  else
    "#{people[0]}, #{people[1]} and #{people.length - 2} others like this"
  end
end
