module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        arr = array.reject { |film| film['rating_kinopoisk'].to_f.zero? || !film['country']&.include?(',') }.map { |film| film['rating_kinopoisk'].to_f }
        arr.reduce(:+) / arr.count
      end

      def chars_count(films, threshold)
        films.reject { |f| f['rating_kinopoisk'].to_f < threshold }.map { |f| f['name'] }.join.count 'и'
      end
    end
  end
end
