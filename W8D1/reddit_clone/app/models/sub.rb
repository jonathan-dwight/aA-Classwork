# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, :user_id, presence: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :sub_id,
        inverse_of: :sub,
        class_name: 'Postsub'

    has_many :posts,
        through: :post_subs,
        source: :post

    #creates a joins table when creating
end 
