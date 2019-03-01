
if Rails.env.production?
    require 'azure/storage/blob'

    client = Azure::Storage::Client.create(:storage_account_name => 'izaba', :storage_access_key => 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA==')
        
    CarrierWave.configure do |config|
        options = { :client => client }
        blob_client = Azure::Storage::Blob::BlobService.create options
    end
end
