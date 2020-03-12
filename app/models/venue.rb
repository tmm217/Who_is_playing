# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  city       :string
#  link       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Venue < ApplicationRecord
  has_many :followers, :class_name => "VenueFollow", :dependent => :destroy
  has_many :shows, :foreign_key => "host_id", :dependent => :destroy
end
