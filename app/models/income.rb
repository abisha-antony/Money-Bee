# frozen_string_literal: true

class Income < ApplicationRecord
  validates :amount, presence: true
  validates :users_id, presence: true
end
