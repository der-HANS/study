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

      def search(arr, qry, idx_start = nil, idx_end = nil)
        idx_start ||= 0
        idx_end ||= arr.length

        len = idx_end - idx_start
        return arr[idx_start] == qry ? idx_start : -1 if len < 2

        idx_cen = len / 2 + idx_start
        if arr[idx_cen] > qry
          idx_end = idx_cen
        else
          idx_start = idx_cen
        end

        search(arr, qry, idx_start, idx_end)
      end
    end
  end
end
