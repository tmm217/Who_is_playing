task(:metro_shows => :environment) do
  require "http"
  require "nokogiri"
  
  url = "https://metrochicago.com/events/"
  raw_data = HTTP.get(url).to_s
  parsed_data = Nokogiri::HTML(raw_data)

  parsed_data.css("div.rhino-event-wrapper").each do | show |
    date_no = show.css("div.rhino-event-datebox").css(".rhino-event-datebox-date p").inner_text
    month = show.css("div.rhino-event-datebox").css(".rhino-event-datebox-month p").inner_text
    day = show.css("div.rhino-event-datebox").css(".rhino-event-datebox-day p").inner_text
    image = show.css("div.tribe-events-event-image img").attr("src")
    headliner = show.css("div.rhino-event-info").css("h2.rhino-event-header a[title]").text.strip
    openers = show.css("div.rhino-event-info").css("h3.rhino-event-subheader").inner_text
    sale = show.css("div.rhino-event-list-cta").css("span").inner_text
    s = Show.new
    s.host_id = 1
    s.show_date = "#{day} #{date_no} #{month}"
    s.show_image = "#{image}"
    if openers.empty?
      s.show_bands = "#{headliner}"
    else
      s.show_bands = "#{headliner} with #{openers}"
    end
    if sale == "Sold Out"
      s.is_soldout = "true"
    else
      s.is_soldout = "false"
    end
    s.save
  end
end
