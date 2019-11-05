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
puts "Villians of this here Villain Academy, assembled!"
puts "~|------------------------------------------------|~"
#Presenting our students!
villains.each { |v| puts v}
#And now to state the number of students,
#which is the length of the villains array!
puts "Overall, we have #{villains.length} dastardly students!"
#Footer, for style purposes!
puts "~|------------------------------------------------|~"
