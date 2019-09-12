class CategotyController < ApplicationController
    def index
	@categoty = Category.paginate(page: params[:page])
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @categoty.save
            flash[:success] = "Produto cadastrado com sucesso!"
            redirect_to @product
        else
            render 'new'
        end
    end

private

    def category_params
      params.require(:category).permit(:name, :description)
    end

end
