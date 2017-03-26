class PeopleController < ApplicationController

  def show
    @people = Person.find(params[:id])
    @peoplelast = Person.last
    respond_to do |format|
      format.html
      format.json { render :json => @peoplelast }
    end
  end

  def new
    @allpeople = Person.all
    @people = Person.new
    respond_to do |format|
      format.html
      format.json { render :json => @allpeople }
    end
  end

  def create
    @people = Person.new(people_params)
    @people.save
    respond_to do |format|
      format.html
      format.json { render :json => @people }
    end
  end

  def edit
    @peoplefind = Person.find(params[:id])
  end

  def update
    @people = Person.find_by(params[:id])
    @people.update_attribute(:favoriteCity, params[:person][:favoriteCity])
    @people.save
    respond_to do |format|
      format.html
      format.json { render :json => @people }
    end
  end

  def destroy
    @people = Person.find(params[:id])
    @people.destroy!
  end

  private

  def people_params
    params.require(:person).permit(:id, :name, :favoriteCity)
  end

end
