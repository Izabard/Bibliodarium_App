
if Rails.env.production?
    require 'azure/storage/blob'
    account_name = 'izaba'   
    account_key = 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA=='

    blob_client = Azure::Storage::Blob::BlobService 

    CarrierWave.configure do |config|
        blob_client = Azure::Storage::Blob::BlobService.create(
            storage_account_name: account_name,
            storage_access_key: account_key
        )
    end
end
