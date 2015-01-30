class AuthorsController < ApplicationController
  def index
    @authors = Author.all

    respond_to do |format|
      format.html
      format.json { render json: @authors }
    end
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render json: @author, status: :created, location: @author }
      else
        format.html { render action: "new" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end


  def author_params
    params.require(:author).permit(:first_name, :last_name, :biography)
  end


  def new
    @author = Author.new

    respond_to do |format|
      format.html
      format.json { render json: @author }
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @author }
    end
  end

  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroy.' }
      format.json { head :no_content }
    end
  end
end
