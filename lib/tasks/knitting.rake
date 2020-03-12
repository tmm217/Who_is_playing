task(:knitting_shows => :environment) do
  require "http"
  require "nokogiri"
  require "mechanize"

  url = "https://bk.knittingfactory.com/"
  raw_data = HTTP.get(url).to_s
  parsed_data = Nokogiri::HTML(raw_data)

  parsed_data.css("div.flexmedia.flexmedia--artistevents").each do | show |
    client = Mechanize.new
    agent = Mechanize.new

    bands = show.css("span.artisteventsname").first.text.strip
    date = show.css("span.artisteventstime").first.text.strip

    band_url = show.css("div.eventinfo").css("a").attr("href")
    band_page = agent.get("#{band_url}")
    image = band_page.css("div.eventartists_artist_media a").css("img").attr("src").value
    sale = band_page.css("div.eventartists__event__ticketbutton a").text.strip

    s = Show.new
      s.host_id = 3
      s.show_date = "#{date}"
      s.image = "#{image}"
      s.bands = "#{bands}"
      if sale == "SOLD OUT"
        s.is_soldout = "true"
      else
        s.is_soldout = "false"
      end
    s.save
  end
end