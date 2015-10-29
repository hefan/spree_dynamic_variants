Spree::Product.class_eval do

  def get_or_create_variant options
    v = master.dup
    v.is_master = false
    v.track_inventory = false
    v.sku = ""
    Spree::OptionValue.where(id: options.values).each { |ov| v.option_values << ov }

    evs = Spree::Variant.includes(:option_values)
                        .where(:is_master => 0, :product_id => self.id, :deleted_at => nil)
    existing = evs.detect { |cv| cv.options_text.eql? v.options_text }
    return existing if existing.present?

    v.save!
    return v
  end

end
