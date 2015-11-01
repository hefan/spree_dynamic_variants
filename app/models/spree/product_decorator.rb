Spree::Product.class_eval do

  def try_variant options
    v = master.dup
    v.is_master = false
    v.track_inventory = false
    v.sku += "-#{(Time.now.to_f * 1000.0).to_i}"
    Spree::OptionValue.where(id: options.values).each { |ov| v.option_values << ov }
    return v.get_or_create
  end

end
