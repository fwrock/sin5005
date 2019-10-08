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

    def edit
    	@category = Category.find(params[:id])
    end

    def update
    	@category = Category.find(params[:id])
    	if @category.update_attributes(category_params)
 		flash[:success] = "Categoria alterada com sucesso!"
      		redirect_to @category
    	else
      		render 'edit'
    	end
    end

    def destroy
    
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end

end
