# frozen_string_literal: true

require_relative 'node'

class HashMap
  def initialize
    @load_factor = 0
    @capaqcity = 0
    @bucket = []
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key)
    @bucket[hash_code] = Node.new(key, value)
  end
end
