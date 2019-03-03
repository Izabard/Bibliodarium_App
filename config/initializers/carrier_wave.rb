
if Rails.env.production?
    require 'fog/azurerm'
        
    CarrierWave.configure do |config|
    	FogStorage = Fog::Storage::AzureRM.new(
    		azure_storage_account_name: "izaba",
    		azure_storage_access_key: "inOgkKlKEuW/vkOqMxhDJ8Or7OLe13RO7f9vtCIKj6Fhdy9hwHNc8MIkPHseVf9xxO8OSD07vm4ba2zDsnE8sA==",
    		environment: '<AzureCloud>'
    	)
    	StorageBucket = FogStorage.directories.new key: CONFIG["bucket"]
    end
end
