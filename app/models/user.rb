# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
    :rememberable, :trackable, :validatable
    # , :confirmable
  include DeviseTokenAuth::Concerns::User

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :scores
end
