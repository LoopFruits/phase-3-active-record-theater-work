class Role < ActiveRecord::Base 
    has_many :auditions 

    def actors 
        self.auditions.map do |audition| 
            binding.pry 
            audition.actor 
        end 
    end

    def locations
        # binding.pry
        self.auditions.map do |audition| 
            audition.location
        end 
    end

    def lead 
        # binding.pry
        ## they want us to return the first instance of the audition that was hired for this role or returns a string 'no actor has been hired here'
        find = self.auditions.find{|audition| audition.hired == true}
        find ? find : 'no actor has been hired for this role'
    end

    def understudy 
        # binding.pry
        find = self.auditions.select{|audition| audition.hired == true}[1]
        find ? find : 'no actor has been hired for this role'
    end
     
end 