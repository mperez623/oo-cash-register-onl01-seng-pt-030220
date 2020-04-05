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
    @total -= self.last_transaction[1] * self.last_transaction[2]
    self.last_transaction do 
      self.items.delete_at(self.items.index(self.last_transaction[0]) || self.items.count)
    end
  end
  
  
  
end
