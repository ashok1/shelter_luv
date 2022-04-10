# frozen_string_literal: true

module ShelterLuv
  class Api
    class << self
      def get(path)
        validate_x_api_key
        uri = URI.parse(path)
        req = Net::HTTP::Get.new(uri)
        req["X-Api-Key"] = ShelterLuv.configuration.x_api_key
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(req)
        end
        extract_response(res)
      end

      private

      def validate_x_api_key
        return unless ShelterLuv.configuration.x_api_key.blank?

        raise Errors::InvalidApiKeyError, "Ensure X-API-KEY is not blank."
      end

      def validate_content_type(content_type)
        return if content_type == "application/json"

        raise Errors::InvalidResponseError, "Content-type is not application/json."
      end

      def extract_response(res)
        case res
        when Net::HTTPSuccess
          validate_content_type(res["content-type"])
          JSON.parse res.body
        else
          raise Errors::ShelterLuvError, res.message
        end
      end
    end
  end
end
