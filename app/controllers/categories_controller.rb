class CategoriesController < ApplicationController
    def index
	#@categories = Category.paginate(page: params[:page])
	@categories = Category.all
    end

    def show
        #@category = Category.find(params[:id])
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Produto cadastrado com sucesso!"
            redirect_to @category
        else
            render 'new'
        end
    end

private

    def category_params
      params.require(:category).permit(:name, :description)
    end

end
