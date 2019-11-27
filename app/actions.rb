require 'sinatra'

get '/' do
  @treats = [
    {
      name: "Lebkuchen",
      img_url: "https://mediaproxy.nordbayern.de/v3/image/images.nordbayern.de/ThumbnailatorAspectResizeFilter/w900dp/image/contentid/policy:1.2278790:1495947847/383192562.jpg?f=4%3A3&h=675&m=FIT&w=900&$p$f$h$m$w=5edb154",
    },
    {
      name: "Spekulatious",
      img_url: "https://coppenrath-feingebaeck.de/wp-content/uploads/2018/04/gewuerzspekulatius-400-g-wn03.png",
    },
    {
      name: "Gluewein",
      img_url: "https://femina.wwmindia.com/content/2017/Jun/gluhwein-germany_1497951931.jpg",
    }
  ]

  erb(:index)
end

































# get '/' do
#   @xmas_title = ['My', 'favourite', 'Christmas', 'treats']
#   erb(:index)
# end


