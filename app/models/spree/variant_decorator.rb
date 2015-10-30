Spree::Variant.class_eval do

  def get_or_create

    candidates = self.class.includes(:option_values)
                           .where(is_master: 0, product: self.product, deleted_at: nil)

    existing = candidates.detect do |ev|
      (ev.options_text.eql? self.options_text) and (ev.price.eql? self.price)
    end
    return existing if existing.present?

    save!
    return self

  end

end
