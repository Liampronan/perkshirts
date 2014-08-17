class Category < ActiveRecord::Base

  def self.get_all
    res = open("https://api.scalablepress.com/v2/categories")
    Yajl::Parser.parse(res)
  end

end
