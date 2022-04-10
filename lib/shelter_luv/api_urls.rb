# frozen_string_literal: true

module ShelterLuv
  class ApiUrls
    BASE_URL = "https://www.shelterluv.com/api/v1/"
    PARAMS_IDENTIFIER = ":$$id"

    class << self
      def generate_url_for(type, page = 1, id = "")
        concatinate_pagination(BASE_URL + sl_url_for(type, id), page)
      end
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
              parteners: "partners/#{PARAMS_IDENTIFIER}" }
      url[type].gsub(PARAMS_IDENTIFIER, id)
    end

    def concatinate_pagination(url, page)
      url + "&limit=#{ShelterLuv.configuration.page_size}&offset=#{page * ShelterLuv.configuration.page_size}"
    end
  end
end
