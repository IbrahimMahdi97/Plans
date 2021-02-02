class Flight < ApplicationRecord
  belongs_to :user
  # , class_name: "user", foreign_key: "user_id"
  validates :fromairport, presence: true
  validates :toairport, presence: true
end
