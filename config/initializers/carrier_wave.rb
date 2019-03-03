
if Rails.env.production?
    require 'fog/azurerm'

    storage_account_name = 'izaba', 
    storage_access_key = 'rrHX+QdbnadVQHeOejwOG3xOMgOoG80Xgh1zu9M7Y2+ahjmYfLgrVJwhhg8hwxp17pTEaQSSSZ5KVbqxJZyhLA=='
        
    CarrierWave.configure do |config|
    	FogStorage = Fog::Storage::AzureRM.new(
    		azure_storage_account_name: storage_account_name,
    		azure_storage_access_key: storage_access_key,
    		environment: '<AzureCloud>'
    	)
    	StorageBucket = FogStorage.directories.new key: CONFIG["bucket"]
    end
end
