Deface::Override.new(
  name: 'dynamic_product_cart_form',
  virtual_path: 'spree/products/show',
  replace_contents: '[data-hook="cart_form"]',
  partial: 'deface_partials/dynamic_cart_form')
