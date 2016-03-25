require 'inline'

class CPrimes < Primes
  def self.prime?(number)
    result = CExtension.new.is_prime(number)
    result == 1
  end

  private

  class CExtension
    inline do |builder|
      builder.include '<math.h>'
      builder.c '
        static int is_prime(long number) {
          if (number < 2) {
            return 0;
          }
          if (number == 2) {
            return 1;
          }
          double maximum = sqrt((double)number);
          for (long i = 3; i < maximum; i += 2) {
            if (number % i == 0) {
              return 0;
            }
          }
          return 1;
        }'
    end
  end
end
