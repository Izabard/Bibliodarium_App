
if Rails.env.production?
    CarrierWave.configure do |config|
        config.azure_storage_account_name =  ENV['STORAGE_ACCOUNT_NAME'],
        config.azure_storage_access_key = ENV['STORAGE_SECRET_KEY'],
        config.azure_container = ENV['STORAGE_CONTAINER']
    end
end
