# == Schema Information
#
# Table name: show_follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :integer
#  show_id     :integer
#

class ShowFollow < ApplicationRecord
  belongs_to :attendee, :class_name => "User"
  belongs_to :show
end
