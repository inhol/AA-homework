

class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    def manager?
        self.is_a? Manager
    end

end


class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary = 0, boss)
        super(name, title, salary, boss)
        @employees = []
    end


    def bonus(multiplier)
        collective_salary(@employees) * multiplier
    end

    def total_employee_salary(manager)
        manager.employees.reduce(0) { |sum, employee| sum += employee.salary }
    end

    def collective_employee_salary_tree(manager)
        
        return 0 unless manager.instance_of? Manager

        sum = 0
        queue = [manager]
        
        until queue.empty?
            current_manager = queue.shift
            sum += total_employee_salary(current_manager)
            managers = current_manager.employees.select(&:manager?)
            queue += managers
        end

        sum

    end

end
Ned = Manager.new("Ned", "Founder", 1000000, nil)
Darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
David = Employee.new("David", "TA", 10000, "Darren")

Ned.employees << Darren
Darren.employees += [Shawna, David]

puts Ned.collective_employee_salary_tree(Ned)




# puts Ned.bonus(5)
# puts Darren.bonus(4)
# puts David.bonus(3)