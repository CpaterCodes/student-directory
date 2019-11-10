#This version of the directory file is meant as a test of various additional
#exercises from step 14 of the directory project. I have chosen to test
#a couple of different exercises with each of these new methods.

@villains = []

#Method to push villain info hashes to array. D.R.Y, after all! (task 1)
def villain_push(name, month)
  @villains << {name: name, month: month.to_sym}
end

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
  puts "For each new Villain, enter a name and month."
  puts "Press return without entering another name to finish."
  #Add a name if desired, and then keep adding names if desired
  name = STDIN.gets.chomp
  month = STDIN.gets.chomp
  until name.empty?
    villain_push(name, month) #Our method from task 1 in action!
    #Update the user, and ask for the next name. Hit return to stop.
    puts "#{name} added, we have #{@villains.length} student#{plural} total!"
    puts "Type a name to add another student or press return to stop."
    name = STDIN.gets.chomp
    month = STDIN.gets.chomp.to_sym
  end
end

#Or save? Now with file choice (step 5)
def save
  puts "Name the file you wish to save to."
  filename = STDIN.gets.chomp
  file = File.open(filename, "w")
  @villains.each do |vil|
    villain_data = [vil[:name], vil[:month], vil[:height]]
    villain_row = villain_data.join(", ")
    file.puts villain_row
  end
  file.close
end


#And then load? Now with file choice (step 5) and do end (step 6)
def load(filename)
 @villains = [] #Empties current loaded content, prevents conjoining
 File.foreach(filename) do |vil|
   name, month = vil.chomp.split(", ")
   villain_push(name, month) #Our method from task 1, again in action!
 end
end


#... from the command line?
def command_line_load
  cmdfile = ARGV.first #Takes the first/only argument given, the file's name
  cmdfile = "Villains.csv" if cmdfile.nil? #Set Villains.csv as default (task 2)
  if File.exists?(cmdfile)
    load(cmdfile)
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
      save
    #Load the student directory previously saved.
    when "4"
      puts "Name a file you wish to load from."
      decide = STDIN.gets.chomp
      load(decide)
    when "9"
      break #Exits the program by breaking the loop
    else
      nil
    end
    puts "Action has been performed"  #Tell the user if action passes (task 4)
  end
end

command_line_load
interactive_menu
