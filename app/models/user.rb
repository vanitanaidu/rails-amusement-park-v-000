class User < ActiveRecord::Base

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates_uniqueness_of :name, :message => "There is already a user with that name." #use flash[:errors] to show error messages

    enum role: [ :user, :admin ]


  def mood
    if happiness > nausea
      "happy"
    else
      "sad"
    end
  end


end
