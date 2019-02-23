
if Rails.env.production?
    require 'azure/storage/blob'

    #account_name = 'izaba'   
    #account_key = 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA=='
    container_name = 'bibliodarium_app_covers'
    #store_dir = "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    blob_client = Azure::Blob::BlobService
        
    CarrierWave.configure do |config|
        azure_credentials = {
          access_key_id: "izaba",
          secret_access_key: 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA=='
        }
        container = "bibliodarium_app_covers"

        

        #blob_properties = blob_client.get_blob_properties container_name, blob_name

    end
    #blob_client.create_block_blob(container_name, store_dir, store_dir)
end
