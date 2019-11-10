#This version of the directory file is meant as a test of various additional
#exercises from step 8 of the directory project. I have chosen to test
#a couple of different exercises with each of these new methods.
#(Task 11 can be found at TypoCorrections.rb)
#Our list of villainous students, of studious villains!
@villains = []

#For all month-keeping purposes! (tasks 7 and 8)
require 'time'
@default_month = "#{Time.now}".split('-')[1].to_i

@cohorts = [:january, :february, :march, :april, :may, :june, :july,
:august, :september, :october, :november, :december]

#Title and head divider
def print_header
  puts "Villains of the Academy, assemble!".center(66)
  puts "~|---------------------------------------------------------------|~"
end

#A bit of code for when the list is empty (task 12)
def empty_list
  puts "Nothing to see here :/".center(66) if @villains.empty?
end

#Presenting our students!
#List printing, now with height, index, and centering (tasks 1, 5 and 6)
def print_list
  @villains.each_with_index do |v,n|
    unless @villains.empty?
      row = "#{n + 1}-#{v[:name]} (#{v[:month]} cohort) #{v[:height]}cm"
      puts row.center(66)
    end
  end
end

#Only prints names starting with a specific letter (task 2)
def print_by_letter
  puts " "
  letter = gets.chomp.upcase
  @villains.each_with_index do |v,n|
    unless v[:name][0].upcase != letter
      puts "#{n + 1}-#{v[:name]} (#{v[:month]} cohort) #{v[:height]}cm".center(66)
    end
  end
end

#Only print names shorter than 12 characters, with until loop (tasks 3 and 4)
def print_short
  v = @villains #This shortens the subsequent code
  i = 0 #Our counter, so our until loop knows when to stop
  unless v.empty?
    until i == v.length
      n = i + 1 #This is for our index
      row = "#{n}:#{v[i][:name]} (#{v[i][:month]} class) #{v[i][:height]}cm"
      puts row.center(66) if v[i][:name].length < 12
      i += 1
    end
  end
end

#Printing, sorted by cohort! (task 8)
def print_cohorts
  i = 0
  until i == 12
    month = @cohorts[i]
    @villains.each_with_index do |vl,n|
      unless @villains.empty?
        row = "#{n + 1}-#{vl[:name]} (#{vl[:month]} cohort) #{vl[:height]}cm"
        puts row.center(66) unless vl[:month] != month
      end
    end
    i += 1
  end
end

#Code to ensure proper singular vs plural use (task 9)
def plural
  return @villains.length > 1 ? 's' : ''
end

#Footer, for style purposes! Array length, for student count!
def footer
  unless @villains.empty?
    puts " "
    ln = "Overall, we have #{@villains.length} dastardly student#{plural}!"
    puts ln.center(66)
  end
  puts "~|-------------------------------------------------------------|~"
end

#But what if we want to add students? Now with cohort! (Task 7)
def add_student
  puts "For each new villain, first enter a name and press enter."
  puts "Press return without entering another name to finish. \n"
  #Add a name if desired, and then keep adding names if desired
  name = STDIN.gets.delete("\n")
  until name.empty?
    puts "Second, enter their cohort month, or hit return for current month \n"
    month = STDIN.gets.delete("\n").downcase.to_sym
    puts "Current month selected by default" if month.empty?
    month = @cohorts[@default_month - 1] if month.empty?
    until @cohorts.include? month
      puts "Cohort month invalid (typos possible). Try again \n"
      month = STDIN.gets.delete("\n").downcase.to_sym
    end
    puts "Third, enter a height(cm) and press enter. \n"
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
    puts "Current list saved to file"
  end
  file.close
end

#And then load?
def load_students(filename = "Villains2.csv")
 @villains = []
 file = File.open(filename, "r")
 file.readlines.each do |vil|
   name, month, height = vil.chomp.split(", ")
   @villains << {name: name, month: month.to_sym, height: height}
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
    puts "---------------------------------------------------------------"
    puts "1:List all  | 2:Add | 3:Save | 4:Load | 5:List names < 12 chars"
    puts "6:By letter | 7:By cohort    | 8:?    | 9:Exit "
    puts " "

    choice = STDIN.gets.delete("\n") #Alternative to .chomp again! (task 10)
    puts "\n \n"
    case choice
    #Print the directory if user asks to list students
    when "1"
      print_header
      empty_list
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
      print_header
      empty_list
      print_short
      footer
    when "6"
      puts "Type a starting letter to select names by."
      print_by_letter
      empty_list
      footer
    when "7"
      print_header
      empty_list
      print_cohorts
      footer
    when "8"
      puts "????????????"
    when "9"
      break
    else
      nil
    end
    puts " "
    puts "Request processed.\n"
  end
end

command_line_load
interactive_menu
