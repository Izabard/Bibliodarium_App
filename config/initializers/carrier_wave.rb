
if Rails.env.production?
    require 'azure/storage/blob'

    #account_name = 'izaba'   
    #account_key = 'inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA=='
    container_name = 'bibliodarium_app_covers'
    #store_dir = "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    blob_client = Azure::Blob::BlobService

    signer = Azure::Core::Auth::SharedAccessSignatureSigner.new izaba, inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA==
    blob_client = Azure::Blob::BlobService.new(signer: signer)
        
    CarrierWave.configure do |config|
        blob_client = Azure::Storage::Blob::BlobService.create(
            storage_account_name: ENV['STORAGE_ACCOUNT_NAME'],
            storage_access_key: ENV['STORAGE_ACCESS_KEY']
        )

        #blob_properties = blob_client.get_blob_properties container_name, blob_name

    end
    #blob_client.create_block_blob(container_name, store_dir, store_dir)
end
