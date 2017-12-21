# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  hashed_password :string
#  salt            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'digest/sha2'

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, confirmation: true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + 'wibble' + salt)
  end

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

    def password_must_be_present
      errors.add(:password, 'Missing password') unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end