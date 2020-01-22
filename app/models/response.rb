class Response < ApplicationRecord
    # before_action :authorize, only: [:secret]
  belongs_to :question

  def secret
  end

end
