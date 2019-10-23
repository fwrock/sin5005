class ProductsController < ApplicationController 

    def index
        @products = Product.paginate(page: params[:page])
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.old_price = @product.price
        if @product.save
            flash[:success] = "Produto cadastrado com sucesso!"
            redirect_to @product
        else
            render 'new'
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update_attributes(product_params)
            flash[:success] = "Produto atualizado com sucesso!"
            redirect_to @product
        else
            render 'edit'
        end
    end

    def destroy
    
    end

    def product_params
        params.require(:product).permit(:name, :price, :old_price, :description)
    end
end
