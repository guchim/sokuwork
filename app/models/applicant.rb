class Applicant < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  belongs_to :company
end
