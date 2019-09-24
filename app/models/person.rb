class Person < ApplicationRecord
  belongs_to :manager, class_name: 'Person', foreign_key: :manager_id
  has_many :employees, class_name: 'Person', foreign_key: :manager_id
  belongs_to :location
  belongs_to :role
end
