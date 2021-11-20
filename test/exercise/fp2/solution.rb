require 'byebug'

module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(items = nil, &block)
        items ||= self
        one, *items = items

        yield(one)
        my_each(items, &block) unless items.blank?

        self
      end

      # Написать свою функцию my_map
      def my_map
        @out_ary = Exercise::Fp2::MyArray.new

        my_each(self) do |item|
          @out_ary << yield(item)
        end

        @out_ary
      end

      # Написать свою функцию my_compact
      def my_compact
        @out_ary = Exercise::Fp2::MyArray.new

        my_each(self) do |item|
          @out_ary << item unless item.nil?
        end

        @out_ary
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, items = nil, &block)
        items ||= dup
        acc ||= items.delete_at(0)

        acc = yield(acc, items.delete_at(0))

        return acc if items.blank?

        my_reduce(acc, items, &block)
      end
    end
  end
end
