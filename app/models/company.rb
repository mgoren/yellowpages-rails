class Company < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :category
  
end
