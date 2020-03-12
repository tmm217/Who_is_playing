task(:blounge_shows => :environment) do
  require "http"
  require "nokogiri"
  require "mechanize"
  
  url = "https://bottomlounge.com/events/"
  raw_data = HTTP.get(url).to_s
  parsed_data = Nokogiri::HTML(raw_data)

  parsed_data.css("div.schedule-item.clear").each do | show |
    client = Mechanize.new
    agent = Mechanize.new

    date_no = show.css("div.schedule-date").css("span.day").text.strip
    month = show.css("div.schedule-date").css("span.dm-m").text.strip
    day = show.css("div.schedule-date").css("span.dm-d").text.strip

    pic_url = show.css("div.event-bands").css("h2 a").attr("href")
    band_page = agent.get("#{pic_url}")
    image = band_page.css("div.artist-img img").attr("src").value

    sale = band_page.css("div.schedule-item.clear a").text.strip

    headliner = show.css("div.event-bands").css("h2 span:nth-child(1)").text.strip
    headliner_tr = headliner.gsub("\t\t\t\t\t\t\t\t\t\t", "")
    opener_1 = show.css("div.event-bands").css("h2 span:nth-child(2)").text.strip
    opener_2 = show.css("div.event-bands").css("h2 span:nth-child(3)").text.strip
    opener_3 = show.css("div.event-bands").css("h2 span:nth-child(4)").text.strip
    opener_4 = show.css("div.event-bands").css("h2 span:nth-child(5)").text.strip

    s = Show.new
    s.host_id = 2
    s.show_date = "#{day} #{date_no} #{month}"
    s.image = "#{image}"
    if opener_1.empty?
      s.bands = "#{headliner_tr}"
    elsif opener_2.empty?
      s.bands = "#{headliner_tr} with #{opener_1}"
    elsif opener_3.empty?
      s.bands = "#{headliner_tr} with #{opener_1} and #{opener_2}"
    elsif opener_4.empty?
      s.bands = "#{headliner_tr} with #{opener_1}, #{opener_2}, and #{opener_3}"
    end
    if sale == "SOLD OUT!"
      s.is_soldout = "true"
    else
      s.is_soldout = "false"
    end
    s.save
  end
end