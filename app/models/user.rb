class User < ApplicationRecord
    has_many :entities, forein_key: :author_id
    has_many :groups, forein_key: :author_id
end