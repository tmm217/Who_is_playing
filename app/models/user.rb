# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :venue_likes, :class_name => "VenueFollow", :foreign_key => "fan_id", :dependent => :destroy
  has_many :show_likes, :class_name => "ShowFollow", :foreign_key => "attendee_id", :dependent => :destroy

  def followed_venues
    render({ :template => "users/followed_venues.html.erb" })
  end 

  def venue_feed
    u = User.where({:id => self.id}).at(0)
    venue_ids = u.venue_likes.pluck(:venue_id)
    array_of_venues = Venue.where({:id => venue_ids})
    
    return array_of_venues
  end

  def show_feed
    u = User.where({:id => self.id}).at(0)
    show_ids = u.show_likes.pluck(:show_id)
    array_of_shows = Show.where({:id => show_ids})

    return array_of_shows
  end 
end
