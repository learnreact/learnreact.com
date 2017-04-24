class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :charge
end
