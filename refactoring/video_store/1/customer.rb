require_relative 'movie'

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
      @rentals.each do |element|
        this_amount = 0
        # determine amounts for each line
        case element.movie.price_code
        when VideoStore::Movie::REGULAR
          this_amount += 2
          this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
        when VideoStore::Movie::NEW_RELEASE
          this_amount += element.days_rented * 3
        when VideoStore::Movie::CHILDRENS
          this_amount += 1.5
          this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
        end
        # add frequent renter points
        frequent_renter_points += 1
        # add bonus for a two day new release rental
        if element.movie.price_code == VideoStore::Movie::NEW_RELEASE && element.days_rented > 1
          frequent_renter_points += 1
        end
        total_amount += this_amount
      end
      # This line was not in the original problem, added for testing purposes
      [total_amount, frequent_renter_points]
    end
  end
end
