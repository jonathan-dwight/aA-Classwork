# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  details    :string           not null
#  name       :string           not null
#  status     :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_goals_on_user_id  (user_id)
#
FactoryBot.define do
  factory :goal do
    
  end
end
