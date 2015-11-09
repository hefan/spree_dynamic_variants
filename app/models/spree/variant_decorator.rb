Spree::Variant.class_eval do

  def add_options_and_calc_price(new_option_values)
    self.price = product.price
    new_option_values.each do |ov|
      self.option_values << ov
      self.price += ov.surcharge if ov.surcharge.present?
    end
  end

  def similar?(other)
    (other.options_text.eql? self.options_text) &&
      (other.price.eql? self.price)
  end

end
