class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

obj = InvoiceEntry.new('banana', 2)
obj.update_quantity(5)

# if do it this way - allowing clients of the class to change the quantity directly rather than going through the update_quantity method. So, better to change line 11 to @quantity and then keep line 2 as a reader to keep the build in protections of the update_quantity method.
