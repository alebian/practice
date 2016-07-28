class RepetitionsList
  attr_reader :uniques, :repetitions, :total_repetitions

  def initialize
    @uniques = {}
    @repetitions = {}
    @total_repetitions = 0
  end

  def add(key, value)
    if repetitions.key?(key)
      repetitions[key] << value
      @total_repetitions += 1
      return
    end
    return repetition_found(key, value) if uniques.key?(key)
    uniques[key] = value
  end

  private

  def repetition_found(key, value)
    repetitions[key] = [value]
    repetitions[key] << uniques[key]
    @total_repetitions += 2
    uniques.delete(key)
  end
end
