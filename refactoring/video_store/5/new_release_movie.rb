require_relative 'regular_movie'

module VideoStore
  class NewReleaseMovie < RegularMovie
    def charge(days_rented)
      days_rented * 3
    end

    def frequent_points(days_rented)
      return 2 if days_rented > 1
      1
    end
  end
end
