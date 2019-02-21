
if Rails.env.production?
    CarrierWave.configure do |config|
        config.azure_storage_account_name =  'izaba',
        config.azure_storage_access_key = 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA==',
        config.azure_container = 'bibliodarium-app-covers'
    end
end
