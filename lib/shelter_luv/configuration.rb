# frozen_string_literal: true

module ShelterLuv
  class Configuration
    attr_accessor :x_api_key, :page_size

    def initialize
      @x_api_key = nil
      @page_size = 100
    end
  end
end
