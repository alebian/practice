module VideoStore
  class Customer
    attr_reader :name

    def initialize(name)
      @name = name
      @rentals = []
    end

    def add_rental(arg)
      @rentals << arg
    end

    def statement
      total_amount, frequent_renter_points = 0, 0
      @rentals.each do |rental|
        total_amount += rental.charge
        frequent_renter_points += rental.frequent_points
      end
      # This line was not in the original problem, added for testing purposes
      [total_amount, frequent_renter_points]
    end
  end
end
