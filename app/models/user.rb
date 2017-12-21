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
  after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true
  validates :password, confirmation: true
  attr_accessor :password_confirmation   # 虚拟属性
  attr_reader :password

  validate :password_must_be_present

  # 新建user实例的时候，加密密码
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + 'wibble' + salt)
  end

  # 登录的时候验证用户
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  # 手动设定 password 虚拟属性的 writer 方法
  def password=(password)                    # NOTE: 这个方法何时被调用
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  # after_destroy 回调（钩子方法）
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  private
    # 自定义的一个验证
    def password_must_be_present
      errors.add(:password, 'Missing password') unless hashed_password.present?
    end

    # 实作password writer时被调用
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
