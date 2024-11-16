# frozen_string_literal: true

require_relative 'linked_list'

class HashMap
  attr_accessor :bucket, :load_factor, :capacity, :length

  def initialize
    @load_factor = 0.8
    @capacity = 16
    @length = 0
    create_bucket(@capacity)
  end

  def create_bucket(cap)
    @bucket = []
    cap.times do
      @bucket.push(LinkedList.new)
    end
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % capacity
  end

  def set(key, value)
    hash_code = hash(key)
    list = @bucket[hash_code]
    index = list.find_key(key)
    list.remove_at(index) unless index.nil?
    list.append([key, value])
    @length += 1
  end

  def get(key)
    hash_code = hash(key)
    list = @bucket[hash_code]
    index = list.find_key(key)
    return nil if index.nil?

    list.at(index).value[1]
  end

  def has?(key)
    hash_code = hash(key)
    list = @bucket[hash_code]
    index = list.find_key(key)
    !index.nil?
  end

  def remove(key)
    hash_code = hash(key)
    list = @bucket[hash_code]
    index = list.find_key(key)
    unless index.nil?
      value = list.at(index).value[1]
      list.remove_at(index)
      @length -= 1
      return value
    end
    nil
  end

  def clear
    @length = 0
    create_bucket(@capacity)
  end

  def keys
    keys_arr = []
    @bucket.each do |list|
      list.size.times do |item|
        keys_arr.push(list.at(item).value[0])
      end
    end
    keys_arr
  end

  def values
    values_arr = []
    @bucket.each do |list|
      list.size.times do |item|
        values_arr.push(list.at(item).value[1])
      end
    end
    values_arr
  end

  def entries
    entry_list = []
    @bucket.each do |list|
      list.size.times do |item|
        entry_list.push(list.at(item).value)
      end
    end
    entry_list
  end
end






