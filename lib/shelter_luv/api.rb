# frozen_string_literal: true

module ShelterLuv
  class Api
    class << self
      def all_animals(page = 1)
        api_request(:all_animals, page: page)
      end

      def animal_details(animal_id, page = 1)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_details, id: animal_id, page: page)
      end

      def all_people(page = 1)
        api_request(:all_people, page: page)
      end

      def person_details(person_id , page = 1)
        raise Errors::MissingPersonError unless valid_id(person_id)

        api_request(:person_details, id: person_id, page: page)
      end

      def all_events(page = 1)
        api_request(:all_events, page: page)
      end

      def animal_events(animal_id,  page = 1)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_events, id: animal_id, page: page)
      end

      def all_vaccines(page = 1)
        api_request(:all_vaccines, page: page)
      end

      def animal_vaccines(animal_id , page = 1)
        raise Errors::MissingAnimalError unless valid_id(animal_id)

        api_request(:animal_vaccines, id: animal_id, page: page)
      end

      def partners(id, page = 1)
        raise Errors::InvalidParamsError unless valid_id(id)

        api_request(:partners, id: id, page: page)
      end

      private

      def api_request(type, page: 1, id: "")
        x_api_key = ShelterLuv.configuration.x_api_key
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
