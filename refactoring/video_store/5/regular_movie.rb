module VideoStore
  class RegularMovie
    attr_reader :title
    attr_accessor :price_code

    def initialize(title, price_code)
      @title, @price_code = title, price_code
    end

    def charge(days_rented)
      return 2 if days_rented <= 2
      2 + (days_rented - 2) * 1.5
    end

    def frequent_points(days_rented)
      1
    end
  end
end
