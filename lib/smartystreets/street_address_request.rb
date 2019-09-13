# -*- encoding: utf-8 -*-

require 'smartystreets/base_json_object'

module SmartyStreets

  # Represents a request for a street address.
  #
  # @author Peter Edge (peter.edge@gmail.com)
  class StreetAddressRequest < BaseJsonObject

    attr_reader :input_id
    attr_reader :street
    attr_reader :street2
    attr_reader :secondary
    attr_reader :city
    attr_reader :state
    attr_reader :zipcode
    attr_reader :lastline
    attr_reader :addressee
    attr_reader :urbanization
    attr_reader :candidates

    def initialize(hash)
      super(hash)
      @input_id = get_optional_string(hash, :input_id)
      @street = get_required_string(hash, :street)
      @street2 = get_optional_string(hash, :street2)
      @secondary = get_optional_string(hash, :secondary)
      @city = get_optional_string(hash, :city)
      @state = get_optional_string(hash, :state)
      @zipcode = get_optional_string(hash, :zipcode)
      @lastline = get_optional_string(hash, :lastline)
      @urbanization = get_optional_string(hash, :urbanization)
      @candidates = get_optional_integer(hash, :candidates)
    end

    def to_json(*a)
      hash = Hash.new
      hash[:input_id] = input_id if input_id
      hash[:street] = street if street
      hash[:street2] = street2 if street2
      hash[:secondary] = secondary if secondary
      hash[:city] = city if city
      hash[:state] = state if state
      hash[:zipcode] = zipcode if zipcode
      hash[:lastline] = lastline if lastline
      hash[:addressee] = addressee if addressee
      hash[:urbanization] = urbanization if urbanization
      hash[:candidates] = candidates if candidates
      hash.to_json(*a)
    end
  end
end
