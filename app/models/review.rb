class Review < ActiveRecord::Base
  belongs_to :product

  def self.update_or_create(attributes)
    obj = assign_or_new(attributes)
    if obj.save
      obj
    else
      false
    end
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
  #   def initialize(product_id, reviews_data)
  #     @product_id = product_id
  #     @title = reviews_data[:title]
  #     @author = reviews_data[:author]
  #     @stars = reviews_data[:stars]
  #     @body = reviews_data[:body]
  #  end
end
