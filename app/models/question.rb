class Question < ApplicationRecord
  before_action :authorize, only: [:secret]
  belongs_to :user
  has_many :responses

  def secret
  end
  
end
