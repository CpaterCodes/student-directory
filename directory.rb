#Our list of villainous students, of studious villains!
@villains = []


#Title and head divider
def print_header
  puts "Villains of the Academy, assemble!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!

def print_list
  @villains.each_with_index do |vil,n|
    puts "#{n}:#{vil[:name]} (#{vil[:month]} cohort)" unless @villains.empty?
  end
    puts "Nothing to see here :/" if @villains.empty?
end

#A bit of code for later use, to ensure proper singular vs plural use
def plural
  return @villains.length > 1 ? 's' : ''
end

#Footer, for style purposes! Array length, for student count!
def footer
  unless @villains.empty?
    puts " "
    puts "Overall, we have #{@villains.length} dastardly student#{plural}!"
  end
  puts "~|------------------------------------------------|~"
end

#But what if we want to add students?
def add_student
  puts "Enter all new Villains you require."
  puts "Press return without entering another name to finish."
  #Add a name if desired, and then keep adding names if desired
  name = gets.chomp
  until name.empty?
    @villains << {name: name, month: :november}
    #Update the user, and ask for the next name. Hit return to stop.
    puts "#{name} added, we have #{@villains.length} student#{plural} total!"
    puts "Type a name to add another student or press return to stop."
    name = gets.chomp
  end
end

def save_students
  file = File.open("Villains.csv", "w")
  @villains.each do |vil|
    villain_data = [vil[:name], vil[:month]]
    villain_row = villain_data.join(", ")
    file.puts villain_row
  end
  file.close
end

def load_students
 file = File.open("Villains.csv", "r")
 file.readlines.each do |vil|
   name, month = vil.chomp.split(", ")
   @villains << {name: name, month: month.to_sym}
 end
 file.close
end


def interactive_menu
  #Introduce the program and menu
  puts "Welcome to the directory!"
  #Ask user what they wish to do, perform it, and ask again
  #until 'exit' is chosen
  loop do
    puts "What do you wish to do? Enter the number of your desired action"
    puts "----------------------"
    puts "1:List students | 2:Add | 3:Save | 4:Load | 9:Exit"
    choice = gets.chomp
    case choice
    #Print the directory if user asks to list students
    when "1"
      print_header
      print_list
      footer
    #Run the procedure for adding students if user asks to add students
    when "2"
      add_student
    #Save the directory of students the user has created to a file, Villains.csv
    when "3"
      save_students
    #Load the student directory previously saved.
    when "4"
      load_students
    #Exit the program by breaking the loop if users asks to exit
    when "9"
      break
    else
      nil
    end
  end
end

interactive_menu
