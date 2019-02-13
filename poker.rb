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
    # puts drawncards
    return drawncards
    end
end
def cardnamer(cardnum)
    names = [[2,1], [2, 2], [2, 3], [2,4], [3,1], [3, 2], [3, 3], [3,4], [4,1], [4, 2], [4, 3], [4,4], [5,1], [5, 2], [5, 3], [5,4], [6,1], [6, 2], [6, 3], [6,4], [7,1], [7, 2], [7, 3], [7,4], [8,1], [8, 2], [8, 3], [8,4], [9,1], [9, 2], [9, 3], [9,4], [10,1], [10, 2], [10, 3], [10,4], [11,1], [11, 2], [11, 3], [11,4], [12,1], [12, 2], [12, 3], [12,4], [13,1], [13, 2], [13, 3], [13,4], [14,1], [14, 2], [14, 3], [14,4]]
    return names[cardnum-1]
end
def handname(numbers)
    arr = Array.new
    numbers.each do |num|
      arr << cardnamer(num)
    end
    return arr
end
def drawtwohands
    numcards = randomcard(10)
    drawncards = handname(numcards)
    hand1 = []
    hand2 = []
    5.times do
        hand1 << drawncards[0]
        drawncards.delete_at(0)
    end
    5.times do
        hand2 << drawncards[0]
        drawncards.delete_at(0)
    end
    puts "Hand one: #{hand1}"
    puts "Hand two: #{hand2}"
    return [hand1,hand2]
end
def royalflush(twohands)
end