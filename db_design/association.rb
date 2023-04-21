class Shop
=begin
    attributes
    id, name, description, adddress, phone_number    
=end
    has_many :products
end

class Category
=begin
    attributes
    id, name  
=end
    has_many :category_products
    has_many :products, through: :category_products
end

class Product
=begin
    attributes
    id, name, uniq_product_id, shop_id
=end
    has_many :product_price_histories
    has_many :category_products
    has_many :categories, through: :category_products

    def latest_price 
        product_price_histories.find_by(date: Date.today).price || product_price_histories.where("date::DATE <= ?", Date.today).order('date DESC').first&.price
    end
end

class CategoryProduct
=begin
    attributes
    category_id, product_id
=end
    belongs_to :category
    belongs_to :product
end

class ProductPriceHistory
# raw data of product prices on day to day basis
=begin
    attributes
    id, product_id, price, date
=end

    belongs_to :product
end