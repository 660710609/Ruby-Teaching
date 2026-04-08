class Api::V1::PersonController < ApplicationController
  before_action :find_params, only: [ :show, :update, :destroy ]

  def show
    if !@person.nil?
      render json: @person.as_json(only: [ :id, :name, :age ])
    else
      render json: { "error": "not found" }, status: 404
    end
  end

  def index
    all_person = Person.all
    render json: all_person.as_json(only: [ :id, :name, :age ])
  end

  def create
    new_person = Person.new(params_for_update_create)
    if new_person.save
          render json: { "success": true, "data": new_person.as_json(only: [ :name, :age ]) }
    else
          raise SError.new("Invalid Username")
    end
  end

  def update
      @person.update(params_for_update_create)
      render json: { "success": true, "data": @person.as_json(only: [ :name, :age ]) }
  end

  def destroy
    if @person.destroy
      render json: { "success": true }
    else
      render json: { "success": false, "error": @person.errors.as_json }, stauts: 400
    end
  end

  private

  def params_for_update_create
   params.require(:person).permit(:name, :age)
  end

  def find_params
    @person = Person.find(params[:id])
  end
end
