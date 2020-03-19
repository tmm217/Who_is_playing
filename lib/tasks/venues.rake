task(:create_venues => :environment) do
  v = Venue.new
  v.id = 1
  v.name = "The Metro"
  v.city = "Chicago"
  v.link = "https://metrochicago.com/events/"
  v.save

  a = Venue.new
  a.id = 2
  a.name = "The Bottom Lounge"
  a.city = "Chicago"
  a.link = "https://bottomlounge.com/"
  a.save

  b = Venue.new
  b.id = 3
  b.name = "The Knitting Factory"
  b.city = "New York"
  b.link = "https://bk.knittingfactory.com/"
  b.save

  c = Venue.new
  c.id = 4
  c.name = "The Sinclair"
  c.city = "Boston"
  c.link = "https://www.sinclaircambridge.com/events"
  c.save
end 