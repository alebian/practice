require_relative 'regular_movie'

module VideoStore
  class ChildrensMovie < RegularMovie
    def charge(days_rented)
      return 1.5 if days_rented <= 3
      1.5 + (days_rented - 3) * 1.5
    end
  end
end
