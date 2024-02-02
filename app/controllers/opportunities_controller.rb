class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[show edit update update_stage]

  def index
    @opportunities = Opportunity.all
    respond_to do |format|
      format.html
      format.json { render json: @opportunities }
    end
  end

  def show
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      render json: @opportunity, status: :created
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to @opportunity, notice: 'Opportunity was successfully updated.'
    else
      render :edit
    end
  end

  def update_stage
    case @opportunity.stage.length
    when 1
      @opportunity.stage << { stage: 'Qualified', timestamp: Time.now.strftime("%e %B %l:%M %p") }
    when 2
      @opportunity.stage << { stage: 'Booked', timestamp: Time.now.strftime("%e %B %l:%M %p") }
    when 3
      @opportunity.stage << { stage: 'Treated', timestamp: Time.now.strftime("%e %B %l:%M %p") }
    end
    if @opportunity.save
      render json: @opportunity, status: :ok
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:procedure_name, :patient_id, :doctor_id)
  end
end
