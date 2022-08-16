# frozen_string_literal: true

module ShelterLuv
  class Configuration
    attr_accessor :x_api_key, :page_size, :base_url

    def initialize
      @page_size = 100
      @base_url = "https://www.shelterluv.com/api/v1/"
    end
  end
end
