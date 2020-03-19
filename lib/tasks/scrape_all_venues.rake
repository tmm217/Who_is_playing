task(:scrape_all => :environment) do
  Rake::Task["create_venues"].invoke
  Rake::Task["metro_shows"].invoke
  Rake::Task["blounge_shows"].invoke
  Rake::Task["knitting_shows"].invoke
  Rake::Task["sinclair_shows"].invoke
end