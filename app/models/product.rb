class Product < ActiveRecord::Base
  Parser = Yajl::Parser.new

  def self.get_all_by_category_id category_id
    res = open("https://api.scalablepress.com/v2/categories/#{category_id}")
    Yajl::Parser.parse(res)
  end

  def self.get_by_product_id product_id
    res = open("https://api.scalablepress.com/v2/products/#{product_id}")
    Yajl::Parser.parse(res)
  end

  def self.get_product_colors products
    products['colors'].map {|c| c['name']}
  end
end
