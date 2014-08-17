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

  def self.get_quote product_id, product_color, product_quantity, product_size
    url = "https://api.scalablepress.com/v2/quote"
    authenticate = {:password => APP_CONFIG['api_key']}
    res = HTTParty.post(url, body: {:type => 'dtg', sides: {front: 1},
                                products: [{id: product_id, color: product_color, quantity: product_quantity, size: product_size}],
                                address: {name: 'liam', address1: '123 Scalable Drive"', city: 'West Pressfield', state: 'CA',
                                zip: 12345 }},
                  basic_auth: authenticate)
    res['total']

  end
end
