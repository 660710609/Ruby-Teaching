# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_many :phone, dependent: :destroy
  has_many :person_jobs
  has_many :jobs, through: :person_jobs
  # before_validation :create_username

  # private
  # def create_username
  #  if self.name.nil?
  #    self.name = SecureRandom.uuid
  #  end
  # end
end
