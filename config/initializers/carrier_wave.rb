
if Rails.env.production?
    require 'fog/azurerm'
        
    CarrierWave.configure do |config|
    	FogStorage = Fog::Storage::AzureRM.new(
    		azure_storage_account_name: CONFIG["account_name"],
    		azure_storage_access_key: CONFIG["account_key"],
    		environment: '<AzureCloud>'
    	)
    	StorageBucket = FogStorage.directories.new key: CONFIG["bucket"]
    end
end
