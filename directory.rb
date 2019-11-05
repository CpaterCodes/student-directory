#Our list of villainous students, of studious villains!
villains = [ "Dr. Hannibal Lecter",
  "Darth Vader",
  "Ludo Kressh",
  "Naga Sadow",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Hush",
  "Joffrey Baratheon",
  "Daenerys Targaryen",
  "Norman Bates"
]
#Title and head divider
def print_header
  puts "Villians of this here Villain Academy, assembled!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!

def print_list(ls)
  ls.each { |v| puts v }
end

#Footer, for style purposes! Array length, for student count!
def footer(ls)
  puts "Overall, we have #{ls.length} dastardly students!"
  puts "~|------------------------------------------------|~"
end

print_header
print_list(villains)
footer(villains)
