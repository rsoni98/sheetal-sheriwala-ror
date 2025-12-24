class GroceryCheckout
  PRICING = {
    "milk" => {
      unit_price: 3.97,
      sale_quantity: 2,
      sale_price: 5.00
    },
    "bread" => {
      unit_price: 2.17,
      sale_quantity: 3,
      sale_price: 6.00
    },
    "banana" => {
      unit_price: 0.99
    },
    "apple" => {
      unit_price: 0.89
    }
  }

  def initialize(items)
    @items = items.map(&:downcase)
  end

  def total_cost
    counts = @items.tally
    total = 0.0

    counts.each do |item, quantity|
      pricing = PRICING[item]

      if pricing[:sale_quantity]
        sale_sets = quantity / pricing[:sale_quantity]
        remaining = quantity % pricing[:sale_quantity]

        total += sale_sets * pricing[:sale_price]
        total += remaining * pricing[:unit_price]
      else
        total += quantity * pricing[:unit_price]
      end
    end

    total.round(2)
  end
end

# -----------------------------
# Program Execution
# -----------------------------

puts "Enter items purchased (comma separated):"
input = gets.chomp

items = input.split(",").map(&:strip)
checkout = GroceryCheckout.new(items)

puts "Total cost: $#{checkout.total_cost}"
