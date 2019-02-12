def randomcard(amount)
    cards = (1..52).to_a
    drawncards = Array.new
    amount = amount.to_i
    if amount < 1
        return ["stobbit"]
    else
    amount.times do
        card = cards.sample
        cards.delete_at(card)
        drawncards << card
    end
puts drawncards
return drawncards
end
end