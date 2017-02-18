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
      @rentals.each do |rental|
        this_amount = amount_for(rental)
        # add frequent renter points
        frequent_renter_points += 1
        # add bonus for a two day new release rental
        if rental.movie.price_code == VideoStore::Movie::NEW_RELEASE && rental.days_rented > 1
          frequent_renter_points += 1
        end
        total_amount += this_amount
      end
      # This line was not in the original problem, added for testing purposes
      [total_amount, frequent_renter_points]
    end

    private

    def amount_for(rental)
      result = 0
      # determine amounts for each line
      case rental.movie.price_code
      when VideoStore::Movie::REGULAR
        result += 2
        result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
      when VideoStore::Movie::NEW_RELEASE
        result += rental.days_rented * 3
      when VideoStore::Movie::CHILDRENS
        result += 1.5
        result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
      end
      result
    end
  end
end
