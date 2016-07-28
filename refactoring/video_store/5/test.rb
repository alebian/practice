require 'test/unit'
require_relative 'customer'
require_relative 'regular_movie'
require_relative 'new_release_movie'
require_relative 'childrens_movie'
require_relative 'rental'

class TestCustomer < Test::Unit::TestCase
  def test_rent_regular_for_more_than_2_days
    rental = VideoStore::Rental.new(regular_movie, 3)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([3.5, 1], customer.statement)
  end

  def test_rent_regular_for_2_days
    rental = VideoStore::Rental.new(regular_movie, 2)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([2, 1], customer.statement)
  end

  def test_rent_regular_for_less_than_2_days
    rental = VideoStore::Rental.new(regular_movie, 1)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([2, 1], customer.statement)
  end

  def test_rent_childrens_for_more_than_3_days
    rental = VideoStore::Rental.new(childrens_movie, 4)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([3, 1], customer.statement)
  end

  def test_rent_childrens_for_3_days
    rental = VideoStore::Rental.new(childrens_movie, 3)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([1.5, 1], customer.statement)
  end

  def test_rent_childrens_for_less_than_3_days
    rental = VideoStore::Rental.new(childrens_movie, 2)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([1.5, 1], customer.statement)
  end

  def test_rent_new_release_for_more_than_1_days
    rental = VideoStore::Rental.new(new_release_movie, 4)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([12, 2], customer.statement)
  end

  def test_rent_new_release_for_1_days
    rental = VideoStore::Rental.new(new_release_movie, 1)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([3, 1], customer.statement)
  end

  def test_rent_new_release_for_less_than_1_days
    rental = VideoStore::Rental.new(new_release_movie, 0)
    customer = VideoStore::Customer.new('Test')
    customer.add_rental(rental)
    assert_equal([0, 1], customer.statement)
  end

  private

  def regular_movie
    @regular_movie ||= VideoStore::RegularMovie.new('Die Hard', 0)
  end

  def new_release_movie
    @regular_movie ||= VideoStore::NewReleaseMovie.new('Matrix', 1)
  end

  def childrens_movie
    @regular_movie ||= VideoStore::ChildrensMovie.new('Frozen', 2)
  end
end
