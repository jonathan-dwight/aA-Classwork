class Employee
    #returns name, title, salary and boss
    attr_reader :name, :title, :salary, :boss
    attr_reader :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multi)
        bonus = (self.salary) * multi
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) unless boss.nil?
        boss
    end

end


class Manager < Employee
    
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(subordinate)
        self.employees << subordinate
        subordinate
    end

    def bonus(multi)
        total = 0
        self.employees.each { |emp| total += emp.salary  }
        bonus = total * multi
    end

    protected

    def total_subsalary
        total = 0
        # want to make sure you are checking this person is a manager... then getting bonus
        self.employees.each do |emp|
            if emp.is_a?(Manager)
                total += emp.salary + self.total_subsalary
            else
                total += emp.salary
            end
        end
        total
    end
end

