class User < ApplicationRecord

  has_many :library_users, dependent: :destroy
  has_many :libraries, through: :library_users

  #http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
    
  end

end
