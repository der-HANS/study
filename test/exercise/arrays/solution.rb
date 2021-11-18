module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.size.times do
          array.rotate!
          max = array[0] if array[0] > max
        end

        i = 0
        while i < array.size
          array[i] = array[i].positive? ? max : array[i]
          i += 1
        end

        array
      end

      def search(array, query, index_start = nil, index_end = nil)
        index_start ||= 0
        index_end ||= array.length

        length = index_end - index_start
        return array[index_start] == query ? index_start : -1 if length < 2

        index_center = length / 2 + index_start
        if array[index_center] > query
          index_end = index_center
        else
          index_start = index_center
        end

        search(array, query, index_start, index_end)
      end
    end
  end
end
