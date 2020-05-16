class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy

  def username
    email.split('@').first.upcase
  end

  def comments_created
    number_of_comments += 1
    save
    number_of_comments
  end
end
