class Opportunity < ApplicationRecord
  belongs_to :member, optional: true

  validates :procedure_name, :patient_id, :doctor_id, presence: true
  before_create :update_stage
  attribute :stage, :jsonb, default: []

  private

  def update_stage
    self.stage << { stage: 'Lead', timestamp: Time.now.strftime("%e %B %l:%M %p") }
  end
end
