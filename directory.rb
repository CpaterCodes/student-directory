#Our list of villainous students, of studious villains!
villains = [
  {name: "Dr. Hannibal Lecter", month: :november},
  {name: "Darth Vader", month: :november},
  {name: "Ludo Kressh", month: :november},
  {name: "Naga Sadow", month: :november},
  {name: "Nurse Ratched", month: :november},
  {name: "Michael Corleone", month: :november},
  {name: "Alex Delarge", month: :november},
  {name: "The Wicked Witch of the West", month: :november},
  {name: "Terminator", month: :november},
  {name: "Freddy Krueger", month: :november},
  {name: "The Joker", month: :november},
  {name: "Hush", month: :november},
  {name: "Joffrey Baratheon", month: :november},
  {name: "Daenerys Targaryen", month: :november},
  {name: "Norman Bates", month: :november} ]
#Title and head divider
def print_header
  puts "Villians of the Villain Academy, assemble!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!

def print_list(ls)
  ls.each do |vl|
    puts "#{vl[:name]} (#{vl[:month]} cohort)"
  end
end

#Footer, for style purposes! Array length, for student count!
def footer(ls)
  puts " "
  puts "Overall, we have #{ls.length} dastardly students!"
  puts "~|------------------------------------------------|~"
end

print_header
print_list(villains)
footer(villains)
