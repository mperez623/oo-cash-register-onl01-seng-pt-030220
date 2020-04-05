require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :items, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times {self.items << title}
    last_transaction = [title, price, quantity]
    binding.pry
  end
  
  def apply_discount 
      if self.discount == 0
        "There is no discount to apply."
      else 
        discount_amt = @total * @discount/100.0
        @total -= discount_amt
        "After the discount, the total comes to $#{@total.to_i}."
      end
  end
  
  def items 
    @items
  end
  
  
  def void_last_transaction
    @total -= self.last_transaction
    
  end
  
  
  
end
