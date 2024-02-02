class MembersController < ApplicationController

  def index
    @members = Member.all

    respond_to do |format|
      format.html
      format.json { render json: @members }
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def get_doctors
    @doctors = Member.where(role: 1)

    respond_to do |format|
      format.html
      format.json { render json: @doctors }
    end
  end

  def get_patients
    @patients = Member.where(role: 0)

    respond_to do |format|
      format.html
      format.json { render json: @patients }
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :gender, :age, :role)
  end
end
  