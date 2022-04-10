# frozen_string_literal: true

require_relative "shelter_luv/version"
require_relative "shelter_luv/configuration"
require_relative "shelter_luv/errors"
require_relative "shelter_luv/api_helper"
require_relative "shelter_luv/api_urls"
require_relative "shelter_luv/api"

module ShelterLuv
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
