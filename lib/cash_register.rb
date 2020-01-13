require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :last_transaction, :items
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @last_transaction = price
    self.total += price * quantity
    if quantity > 1 
      i = 0 
      while i < quantity 
        @items << item
        i += 1 
      end
    else 
      @items << item 
    end
    self.total = @last_transaction
  end
  
  def apply_discount
    self.discount = discount/100.to_f
    self.total = self.total - (self.total * self.discount)
    if self.discount > 0
      return "After the discount, the total comes to $#{total.to_i}."
    else 
      return "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_transaction
  end
  
end