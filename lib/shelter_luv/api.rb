# frozen_string_literal: true

module ShelterLuv
  class Api
    class << self
      def all_animals(page = 1, x_api_key: nil)
        api_request(:all_animals, page: page, x_api_key: x_api_key)
      end

      def animal_details(animal_id, page = 1, x_api_key: nil)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_details, id: animal_id, page: page, x_api_key: x_api_key)
      end

      def all_people(page = 1, x_api_key: nil)
        api_request(:all_people, page: page, x_api_key: x_api_key)
      end

      def person_details(person_id , page = 1, x_api_key: nil)
        raise Errors::MissingPersonError unless valid_id(person_id)

        api_request(:person_details, id: person_id, page: page, x_api_key: x_api_key)
      end

      def all_events(page = 1, x_api_key: nil)
        api_request(:all_events, page: page, x_api_key: x_api_key)
      end

      def animal_events(animal_id,  page = 1, x_api_key: nil)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_events, id: animal_id, page: page, x_api_key: x_api_key)
      end

      def all_vaccines(page = 1, x_api_key: nil)
        api_request(:all_vaccines, page: page, x_api_key: x_api_key)
      end

      def animal_vaccines(animal_id , page = 1, x_api_key: nil)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_vaccines, id: animal_id, page: page, x_api_key: x_api_key)
      end

      def partners(id, page = 1, x_api_key: nil)
        raise Errors::InvalidParamsError unless valid_id(id)

        api_request(:partners, id: id, page: page, x_api_key: x_api_key)
      end

      private

      def api_request(type, page: 1, id: "", x_api_key: ShelterLuv.configuration.x_api_key)
        ShelterLuv::Api.get(
          ShelterLuv::ApiUrls.generate_url_for(type, page, id),
          x_api_key
        )
      end

      def valid_id(id)
        return false if id.nil? || id.empty?

        true
      end
    end
  end
end
