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
      [ @rentals.inject(0) { |sum, rental| sum + rental.charge },
        @rentals.inject(0) { |sum, rental| sum + rental.frequent_points } ]
    end
  end
end
