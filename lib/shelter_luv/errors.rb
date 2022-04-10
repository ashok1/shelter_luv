# frozen_string_literal: true

module ShelterLuv
  module Errors
    class ShelterLuvError < RuntimeError; end

    class InvalidParamsError < ShelterLuvError; end

    class InvalidApiKeyError < ShelterLuvError; end

    class InvalidResponseError < ShelterLuvError; end

    class MissingAnimalError < ShelterLuvError; end

    class MissingPersonError < ShelterLuvError; end
  end
end
