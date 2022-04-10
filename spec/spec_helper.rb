RSpec.configure do |config|
    config.before(:all) do
      Ravelry.configure do |config|
        config.x_api_key = 'test'
        config.page_size = 'test'
      end
    end
  end