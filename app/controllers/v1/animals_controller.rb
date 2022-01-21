class V1::AnimalsController < ApplicationController
  def random
    @animals = Animal.all.shuffle.sample
    json_response(@animals, :ok)
  end
  
  def index
    if params[:species]
      if params[:page]
        @animals = Animal.search_species(params[:species]).paginate(page: params[:page], per_page: 5)
      else
        @animals = Animal.search_species(params[:species])
      end
    elsif params[:name]
      if params[:page]
        @animals = Animal.search_name(params[:name]).paginate(page: params[:page], per_page: 5)
      else
        @animals = Animal.search_name(params[:name])
      end
    elsif !params[:page]
      @animals = Animal.all
    else
      @animals = Animal.paginate(page: params[:page], per_page: 5)
    end
    json_response(@animals, :ok)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal, :ok)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
      message: "This pet has been updated successfully."
      }
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      render status: 200, json: {
      message: "This animal has been deleted (from the database) successfully."
      }
    end
  end

  private
  
  def animal_params
    params.permit(:name, :species, :age)
  end
end