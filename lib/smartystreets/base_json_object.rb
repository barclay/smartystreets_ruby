# -*- encoding: utf-8 -*-

module SmartyStreets

  # Base class for json requests and responses.
  #
  # @author Peter Edge (peter.edge@gmail.com)
  class BaseJsonObject
    include Util

    attr_reader :to_hash

    def initialize(hash)
      check_hash_key_types(hash, Symbol)
      @to_hash = hash.dup.freeze
    end

    private

    def get_optional_string(hash, key)
      hash[key] != nil && !hash[key].empty? ? check_type(hash[key], String) : nil
    end

    def get_required_string(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be a string"})
      check_argument(!hash[key].empty?, -> { "#{key} was empty and should be a string"})
      check_type(hash[key], String)
    end

    def get_optional_integer(hash, key)
      hash[key] != nil ? check_type(hash[key], Integer) : nil
    end

    def get_required_integer(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be an integer"})
      check_type(hash[key], Integer)
    end

    def get_optional_number(hash, key)
      hash[key] != nil ? check_type(hash[key], Float, Integer) : nil
    end

    def get_required_number(hash, key)
      check_argument(hash[key] != nil)
      check_type(hash[key], Float, Integer)
    end

    def get_optional_float(hash, key)
      hash[key] != nil ? check_type(hash[key], Float, Integer) : nil
    end

    def get_required_float(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be a float"})
      check_type(hash[key], Float, Integer)
    end

    def get_optional_boolean(hash, key)
      hash[key] != nil ? check_type(hash[key], TrueClass, FalseClass) : nil
    end

    def get_required_boolean(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be a boolean"})
      check_type(hash[key], TrueClass, FalseClass)
    end

    def get_optional_hash(hash, key)
      hash[key] != nil && !hash[key].empty? ? check_type(hash[key], Hash) : nil
    end

    def get_required_hash(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be a hash"})
      check_argument(!hash[key].empty?, -> { "#{key} was empty and should be a hash"})
      check_type(hash[key], Hash)
    end

    def get_optional_array(hash, key)
      hash[key] != nil && !hash[key].empty? ? check_type(hash[key], Array) : nil
    end

    def get_required_array(hash, key)
      check_argument(hash[key] != nil, -> { "#{key} was nil and should be a array"})
      check_argument(!hash[key].empty?, -> { "#{key} was empty and should be a non-empty array"})
      check_type(hash[key], Array)
    end
  end
end
