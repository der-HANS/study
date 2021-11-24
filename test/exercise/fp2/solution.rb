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
        acc = Exercise::Fp2::MyArray.new

        my_reduce(acc) do |acc, item|
          acc << yield(item)
          acc
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        acc = Exercise::Fp2::MyArray.new

        my_reduce(acc) do |acc, item|
          acc << item unless item.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, items = nil, &block)
        items ||= self
        acc, *items = items if acc.nil?

        one, *items = items
        acc = yield(acc, one)

        acc = my_reduce(acc, items, &block) unless items.blank?
        acc
      end
    end
  end
end
