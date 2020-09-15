# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, :author_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :sub_id,
        inverse_of: :post,
        class_name: :Postsub

    has_many :subs,
        through: :post_subs,
        source: :sub
end
