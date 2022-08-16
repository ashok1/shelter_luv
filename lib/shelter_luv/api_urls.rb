# frozen_string_literal: true

module ShelterLuv
  class ApiUrls
    PARAMS_IDENTIFIER = ":$$id"

    class << self
      def generate_url_for(type, page = 1, id = "")
        concatinate_pagination(ShelterLuv.configuration.base_url + sl_url_for(type, id), page)
      end

      private

      def sl_url_for(type, id = "")
        url = { all_animals: "animals",
                animal_details: "animals/#{PARAMS_IDENTIFIER}",
                all_people: "people",
                person_details: "people/#{PARAMS_IDENTIFIER}",
                all_events: "events",
                animal_events: "animals/#{PARAMS_IDENTIFIER}/events",
                all_vaccines: "vaccines",
                animal_vaccines: "animals/#{PARAMS_IDENTIFIER}/vaccines",
                partners: "partners/#{PARAMS_IDENTIFIER}" }
        url[type].gsub(PARAMS_IDENTIFIER, id)
      end

      def concatinate_pagination(url, page)
        page_size = ShelterLuv.configuration.page_size
        url + "&limit=#{page_size}&offset=#{(page-1) * page_size}"
      end
    end
  end
end
