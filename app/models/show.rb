# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  bands      :string
#  image      :string
#  is_soldout :boolean
#  show_date  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  host_id    :integer
#

class Show < ApplicationRecord
  has_many :seekers, :class_name => "ShowFollow", :dependent => :destroy
  belongs_to :host, :class_name => "Venue"

  validates :bands, :uniqueness => { :scope => :show_date }
end
