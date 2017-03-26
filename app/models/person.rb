class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :favoriteCity, presence: true
end
