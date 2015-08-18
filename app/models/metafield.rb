class Metafield
    def initialize(namespace,description,key,value,value_type)
        @description=description
        @namespace=namespace
        @key=key
        @value=value
        @value_type=value_type
    end
    
    def getDescription
        @description
    end
    
    def getNamespace
        @namespace
    end
    
    def getKey
        @key
    end
    
    def getValue
        @value
    end
    
    def getValue_type
        @value_type
    end
    
    def setDescription=(value)
        @description=value
    end
    
    def setNamespace=(value)
        @namespace=value
    end
    
    def setKey=(value)
        @key=value
    end
    
    def setValue=(value)
        @value=value
    end
    
    def setValue_type=(value)
        @value_type=value
    end
    
    def createMetafield()
        return ShopifyAPI::Metafield.new({
                :description => @description,
                :namespace => @namespace,
                :key => @key,
                :value => @value,
                :value_type => @value_type})
    end
end
