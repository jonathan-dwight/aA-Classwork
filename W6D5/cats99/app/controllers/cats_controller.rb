class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        
        if @cat.save
            render :show
        else
            render :new
        end
    end

    def edit
        # debugger
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            render :show
        else
            render :edit
        end
    end


    private
    def cat_params
        params.require(:cat).permit(:name, :color, :sex, :description, :birth_date)
    end
end
