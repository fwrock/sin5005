class Product < ApplicationController 

    def index
    
    end

    def show
    
    end

    def new
    
    end

    def create
    
    end

    def edit
    
    end

    def update
    
    end

    def destroy
    
    end

    def product_params
        params.require(:product).permit(:name, :price, :old_price, :description)
    end
end
