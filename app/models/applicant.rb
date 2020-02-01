class Applicant < ApplicationRecord
    belongs_to:offer,optional: true
    belongs_to:user
    belongs_to:company
end
