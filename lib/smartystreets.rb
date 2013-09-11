# -*- encoding: utf-8 -*-

lib = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'centzy_common'
require 'httparty'
require 'multi_json'

require 'smartystreets/api_error'
require 'smartystreets/street_address_api'
require 'smartystreets/street_address_request'
require 'smartystreets/street_address_response'
require 'smartystreets/version'

# Wrapper module for the SmartyStreets API.
#
# Covers both the Street Address and Zipcode APIs.
# www.smartystreets.com
#
# @author Peter Edge <peter@centzy.com>
module SmartyStreets
  class << self
    include CentzyCommon::Preconditions
  end

  # Set the authentication id and token from SmartyStreets.
  #
  # This method must be called exactly once.
  #
  # @param [String] auth_id the authentication id
  # @param [String] auth_token the authenticaton token
  # @return nil
  def self.set_auth(auth_id, auth_token)
    @@auth_id = check_type(auth_id, String)
    @@auth_token = check_type(auth_token, String)
    check_argument(!@@auth_id.empty?)
    check_argument(!@@auth_token.empty?)
    class << self
      remove_method :set_auth
    end
    nil
  end

  def self.auth_id
    raise StandardError.new("set_auth must be called!") unless defined?(@@auth_id)
    @@auth_id
  end

  def self.auth_token
    raise StandardError.new("set_auth must be called!") unless defined?(@@auth_token)
    @@auth_token
  end

  # Set the API url.
  #
  # This method can only be called once, but is not required.
  #
  # @param [String] api_url the API url
  # @return nil
  def self.set_api_url(api_url)
    @@api_url = check_type(api_url, String)
    check_argument(!@@api_url.empty?)
    class << self
      remove_method :set_api_url
    end
    nil
  end

  def self.api_url
    defined?(@@api_url) ? @@api_url : "https://api.smartystreets.com"
  end
end
