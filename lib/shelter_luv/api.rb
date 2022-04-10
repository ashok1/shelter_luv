# frozen_string_literal: true

module ShelterLuv
  class Api
    class << self
      def all_animals
        api_request(:all_animals)
      end

      def animal_details(animal_id, page = 1)
        raise Errors::MissingAnimalError if animal_id.blank?

        api_request(:animal_details, animal_id, page)
      end

      def all_people(page = 1)
        api_request(:all_people, nil, page)
      end

      def person_details(person_id , page = 1)
        raise Errors::MissingPersonError if person_id.blank?

        api_request(:person_details, person_id, page)
      end

      def all_events(page = 1)
        api_request(:all_events, nil, page)
      end

      def animal_events(animal_id,  page = 1)
        raise Errors::MissingAnimalError if animal_id.blank?

        api_request(:animal_events, animal_id, page)
      end

      def all_vaccines(page = 1)
        api_request(:all_vaccines, nil, page)
      end

      def animal_vaccines(animal_id , page = 1)
        raise Errors::MissingAnimalError if animal_id.blank?

        api_request(:animal_vaccines, animal_id, page)
      end

      def parteners(id, page = 1)
        raise Errors::InvalidParamsError if id.blank?

        api_request(:parteners, id, page)
      end
    end

    private

    def api_request(type, id = "", page = 1)
      ShelterLuv::Api.get(ShelterLuv::ApiUrls.generate_url_for(type, page, id))
    end
  end
end
