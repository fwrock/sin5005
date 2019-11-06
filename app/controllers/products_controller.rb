class ProductsController < ApplicationController 

    def index
        @products = Product.paginate(page: params[:page])
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @category = Category.all
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.old_price = @product.price
        if @product.save
            flash[:success] = "Produto cadastrado com sucesso!"
            redirect_to @product
        else
            @category = Category.all
            render 'new'
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.price != product_params[:price]
            @product.old_price = @product.price
        end
        if @product.update_attributes(product_params)
            flash[:success] = "Produto atualizado com sucesso!"
            redirect_to @product
        else
            render 'edit'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_url
    end

    def product_params
        params.require(:product).permit(:name, :price, :description, :category)
    end
end
