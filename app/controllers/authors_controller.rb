class AuthorsController < ApplicationController
    before_action :set_author, only: [:edit, :update, :destroy]

    def index
        @authors = Author.all
    end

    def new
        @author = Author.new
    end

    def show 
       @author = Author.find_by(id:params[:id])

       if @author.blank?
          redirect_to authors_path, notice: "Author not found!"
       end
       
    end 

    def edit
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to authors_path, notice: "Author created successfully!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @author.update(author_params)
            redirect_to authors_path, notice: "Update Authors Successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
         @author.destroy
            redirect_to authors_path, notice: "Author Deleted successfully!"
    end
  
    private

    def set_author
        @author = Author.find(params[:id])
    end

    def author_params
        params.require(:author).permit(:name, :email)
    end


end
