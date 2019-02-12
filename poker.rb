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
def cardnamer(cardnum)
    names = ["Two of Clubs", "Two of Diamonds", "Two of Hearts", "Two of Spades", "Three of Clubs", "Three of Diamonds", "Three of Hearts", "Three of Spades", "Four of Clubs", "Four of Diamonds", "Four of Hearts", "Four of Spades", "Five of Clubs", "Five of Diamonds", "Five of Hearts", "Five of Spades", "Six of Clubs", "Six of Diamonds", "Six of Hearts", "Six of Spades", "Seven of Clubs", "Seven of Diamonds", "Seven of Hearts", "Seven of Spades", "Eight of Clubs", "Eight of Diamonds", "Eight of Hearts", "Eight of Spades", "Nine of Clubs", "Nine of Diamonds", "Nine of Hearts", "Nine of Spades", "Ten of Clubs", "Ten of Diamonds", "Ten of Hearts", "Ten of Spades", "Jack of Clubs", "Jack of Diamonds", "Jack of Hearts", "Jack of Spades", "Queen of Clubs", "Queen of Diamonds", "Queen of Hearts", "Queen of Spades", "King of Clubs", "King of Diamonds", "King of Hearts", "King of Spades", "Ace of Clubs", "Ace of Diamonds", "Ace of Hearts", "Ace of Spades"]
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
    drawncards = handname(randomcard(10))
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
    return [hand1,hand2]
end