#Our list of villainous students, of studious villains!
@villains = []

#Title and head divider
def print_header
  puts "Villains of the Academy, assemble!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!

def print_list
  @villains.each_with_index do |vl,n|
    puts "#{n + 1}:#{vl[:name]} (#{vl[:month]} cohort)" unless @villains.empty?
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
  name = STDIN.gets.chomp
  until name.empty?
    @villains << {name: name, month: :november}
    #Update the user, and ask for the next name. Hit return to stop.
    puts "#{name} added, we have #{@villains.length} student#{plural} total!"
    puts "Type a name to add another student or press return to stop."
    name = STDIN.gets.chomp
  end
end

#Or save?
def save_students
  file = File.open("Villains.csv", "w")
  @villains.each do |vil|
    villain_data = [vil[:name], vil[:month]]
    villain_row = villain_data.join(", ")
    file.puts villain_row
  end
  file.close
end

#And then load?
def load_students(filename = "Villains.csv")
 @villains = [] #Empties current loaded content, prevents conjoining
 file = File.open(filename, "r")
 file.readlines.each do |vil|
   name, month = vil.chomp.split(", ")
   @villains << {name: name, month: month.to_sym}
 end
 file.close
end

#... from the command line?
def command_line_load
  cmdfile = ARGV.first #Takes the first/only argument given, the file's name
  return if cmdfile.nil? #Aborts and skips to menu method if no name given
  if File.exists?(cmdfile)
    load_students(cmdfile)
  puts "-----------------------------------------------------------------------"
  puts "Using directory from #{cmdfile}. Contains #{@villains.length} students."
  puts "-----------------------------------------------------------------------"
  else
   puts "------------------------------------------------"
   puts "#{cmdfile} non-existent. My deepest condolences."
   puts "------------------------------------------------"
   exit #Exists the program if the file named does not exist
  end
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
    choice = STDIN.gets.chomp
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
    when "9"
      break #Exits the program by breaking the loop
    else
      nil
    end
  end
end

command_line_load
interactive_menu
