# task(:metro_shows => :environment) do
  require "http"
  require "nokogiri"
  
  url = "https://www.sinclaircambridge.com/events"
  raw_data = HTTP.get(url).to_s
  parsed_data = Nokogiri::HTML(raw_data)

  parsed_data.css("div.entry.sinclair.clearfix").each do | show |
    date = show.css("div.info div.date-time-container").css("span.date").text.strip
    image = show.css("div.thumb").css("a img").attr("src").value
    headliner = show.css("div.title").css("h3.carousel_item_title_small a").text.strip
    openers = show.css("div.title").css("h4.supporting.animated").text.strip
    sale = show.css("div.buttons a").text.strip
    
    s = Show.new
    s.host_id = 4
    s.show_date = "#{date}"
    s.image = "#{image}"
    if openers.empty?
      s.bands = "#{headliner}"
    else
      s.bands = "#{headliner} with #{openers}"
    end
    if sale == "Sold Out"
      s.is_soldout = "true"
    else
      s.is_soldout = "false"
    end
    s.save
  end







    

