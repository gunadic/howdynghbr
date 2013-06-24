require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


urls = ["http://www.yelp.com/search?find_desc=Local+Flavor&find_loc=Downtown%2C+Boston&ns=1&ls=e841a7867ab6fb16#find_desc&find_loc=Brookline+Village,+Brookline,+MA&cflt=active",
        "http://www.yelp.com/search?find_desc=Local+Flavor&find_loc=Downtown%2C+Boston&ns=1&ls=e841a7867ab6fb16#find_desc&find_loc=Brookline+Village,+Brookline,+MA&cflt=food",
        "http://www.yelp.com/search?find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&cflt=restaurants",
        "http://www.yelp.com/search?find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&start=10&cflt=restaurants",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&start=10",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Coolidge+Corner,+Brookline,+MA&cflt=active",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Coolidge+Corner,+Brookline,+MA&cflt=arts",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Coolidge+Corner,+Brookline,+MA&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Coolidge+Corner,+Brookline,+MA&start=10&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Coolidge+Corner,+Brookline,+MA&start=20&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Washington+Square,+Brookline&cflt&l=g:-71.12999439239502,42.34378174576285,-71.14278316497803,42.33426519255552",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Washington+Square,+Brookline&cflt&l=g:-71.12999439239502,42.34378174576285,-71.14278316497803,42.33426519255552",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Washington+Square,+Brookline&start=20&cflt&l=g:-71.12999439239502,42.34378174576285,-71.14278316497803,42.33426519255552",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&cflt=active",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&start=10&cflt=active",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&start=10&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&start=20&cflt=food",
        "http://www.yelp.com/search?cflt=shopping&find_loc=Brookline+Village%2C+Brookline%2C+MA#find_desc&find_loc=Allston/Brighton&cflt=nightlife"        
        ]

y_data = "yelp_data.txt"

urls.each do |url|
  doc = Nokogiri::HTML(open(url,
  'User-Agent' => 'Mozilla/5.0 (Windows; U; Windows NT 6.1; ru; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8',
  'Referer' => 'http://www.google.com',
  'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'))
  yelp_data = doc.css("address , .neighborhood-str-list, .biz-name")
  File.open(y_data, 'a') { |file| file.write(yelp_data) }
  puts yelp_data.to_a
end