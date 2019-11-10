#This version of the directory file is meant as a test of various additional
#exercises from step 8 of the directory project. I have chosen to test
#a couple of different exercises with each of these new methods.

#Our list of villainous students, of studious villains!
@villains = []

#Title and head divider
def print_header
  puts "Villains of the Academy, assemble!"
  puts "~|------------------------------------------------|~"
end
#Presenting our students!
#List printing, now with height, index, and centering (tasks 1, 5 and 6)
def print_list
  @villains.each_with_index do |vl,n|
    unless @villains.empty?
      row = "#{n + 1}-#{vl[:name]} (#{vl[:month]} cohort), #{vl[:height]}cm"
      puts row.center(50)
    end
  end
end

#Only prints names starting with a specific letter (task 2)
def print_by_letter
  puts "Type a starting letter to select names by."
  letter = gets.delete("\n").upcase
  @villains.each_with_index do |vl,n|
    unless @villains.empty? || vl[:name][0].upcase != letter
      puts "#{n + 1}-#{vl[:name]} (#{vl[:month]} cohort), #{vl[:height]}cm"
    end
  end
end

#Only print names shorter than 12 characters, using until (tasks 3 and 4)
def print_short
  v = @villains #This shortens the subsequent code
  n = 1 #Our counter, so our until loop knows when to stop
  until n == v.length
    unless v.empty?
      i = n - 1
      row = "#{n}-#{v[i][:name]},(#{v[i][:month]} cohort), #{v[i][:height]}cm"
      puts row if v[i][:name].length < 12
    end
    n += 1
  end
end

#Printing by cohort!
def print_cohort
  puts "enter a month"
  month = gets.delete("\n").to_sym
  @villains.each_with_index do |vl,n|
    unless @villains.empty?
      row = "#{n + 1}-#{vl[:name]} (#{vl[:month]} cohort), #{vl[:height]}cm"
      puts row unless vl[:month] != month
    end
  end
end

#Code to ensure proper singular vs plural use (step 8, task 9)
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

#But what if we want to add students? Now with cohort! (Task 7)
def add_student
  puts "For each new villain, first enter a name and press enter."
  puts "Second, enter the month of their cohort."
  puts "Third, enter a height(cm) and press enter."
  puts "Press return without entering another name to finish."
  #Add a name if desired, and then keep adding names if desired
  name = STDIN.gets.delete("\n")
  until name.empty?
    month = STDIN.gets.delete("\n").to_sym
    height = STDIN.gets.delete("\n").to_sym
    @villains << {name: name, month: month, height: height}
    #Update the user, and ask for the next name. Hit return to stop.
    puts "#{name} added, we have #{@villains.length} student#{plural} total!"
    puts "Type a name to add another student or press return to stop."
    name = STDIN.gets.delete("\n")
  end
end

#Or save?
def save_students
  file = File.open("Villains2.csv", "w")
  @villains.each do |vil|
    villain_data = [vil[:name], vil[:month], vil[:height]]
    villain_row = villain_data.join(", ")
    file.puts villain_row
  end
  file.close
end

#And then load?
def load_students(filename = "Villains2.csv")
 @villains = []
 file = File.open(filename, "r")
 file.readlines.each do |vil|
   name, month = vil.chomp.split(", ")
   @villains << {name: name, month: month.to_sym}
   end
 file.close
end

#... from the command line?
def command_line_load
  filename = ARGV.first #Takes the first and only argument given to directory.rb
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  puts "Using directory from #{filename}. Contains #{@villains.length} students."
  else
   puts "#{filename} non-existent. My deepest condolences."
   exit
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
    puts "1:List| 2:Add | 3:Save | 4:Load | 5:List(shorter than 12 chars)"
    puts "6:By letter | 7:By cohort | 8:? | 9:Exit"

    choice = STDIN.gets.delete("\n") #An alternative to .chomp! (task 10)
    case choice
    #Print the directory if user asks to list students
    when "1"
      print_header
      #A bit of code for when the list is empty (step 8, task 12)
      puts "Nothing to see here :/".center(50) if @villains.empty?
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
    when "5"
      print_short
    when "6"
      print_by_letter
    when "7"
      print_cohort
    when "9"
      break
    else
      nil
    end
    puts "\n \n"
  end
end

command_line_load
interactive_menu
