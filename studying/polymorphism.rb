class People
  def do_work(people)
    people.each do |person|
      person.do_job
    end
  end
end

class Teacher
  def do_job
    puts "I teach!"
  end
end

class Mailman
  def do_job
    puts "I deliver your mail!"
  end
end

people_arr = [Teacher.new, Mailman.new]
people = People.new
people.do_work(people_arr)