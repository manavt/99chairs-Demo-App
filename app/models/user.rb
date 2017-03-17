class User < ApplicationRecord
  before_create do | user |
    user.count = 0
  end
end
