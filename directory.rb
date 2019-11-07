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
  puts "Villains of the Academy, assemble!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!

def print_list(list)
  list.each_with_index do |villain,number|
    puts "#{number}:#{villain[:name]} (#{villain[:month]} cohort)" unless list.empty?
  end
    puts "Nothing to see here :/" if list.empty?
end

#Footer, for style purposes! Array length, for student count!
def footer(list)
  unless list.empty?
    puts " "
    puts "Overall, we have #{list.length} dastardly students!"
  end
  puts "~|------------------------------------------------|~"
end

#But what if we want to add students?
def add_student(list)
  puts "Enter all new Villains you require."
  puts "Press return when you are finished."
  #Add a name if desired, and then keep adding names if desired
  name = gets.chomp
  until name.empty?
    list << {name: name, month: :november}
    #Update the user, and ask for the next name. Hit return to stop.
    puts "#{name} added, now there are #{list.length} students total!"
    puts "Type a name to add another student or press return to stop."
    name = gets.chomp
  end
end

def menu_interactive(list)
  puts "Welcome to the directory!"
  loop do
    puts "What do you wish to do?"
    puts "----------------------"
    puts "Read | Add students | Exit"
    choice = gets.chomp
    case choice
    when "Read"
    print_header
    print_list(list)
    footer(list)
    when "Add students"
    add_student(list)
    when "Exit"
      break
    else
      nil
    end
  end
end

menu_interactive(villains)
