# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } # Email should be unique
end
