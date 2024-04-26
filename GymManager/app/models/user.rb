class User < ApplicationRecord
  has_one :membership, dependent: :destroy
end
