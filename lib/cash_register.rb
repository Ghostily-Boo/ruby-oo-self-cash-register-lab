require 'pry'

class CashRegister
    attr_accessor :discount, :total, :apply_discount, :items, :void_last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total = price * quantity + @total
        quantity.times {@items << title}
        @last_transaction = [title, price, quantity]
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply." 
        else
            @total = @total - @total * @discount / 100
            "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total = @total - @last_transaction[1] * @last_transaction[2]
    end

end
