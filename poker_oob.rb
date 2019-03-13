class Hand
    attr_accessor :cards_in_hand
    def initialize(cards_in_hand)
        if cards_in_hand != nil
            @cards_in_hand = cards_in_hand
        else
            @cards_in_hand = []
        end
    end
    def draw(deckdrawnfrom, cardnum)
        cardnum.times do
            drawncard = deckdrawnfrom.cards_in_deck[0]
            cards_in_hand << drawncard
            # puts "This is our deck: #{deckdrawnfrom.cards_in_deck}"
            deckdrawnfrom.cards_in_deck.delete(drawncard)
        end
    end
end
class Deck 
    attr_accessor :cards_in_deck
    def initialize
        cards_in_deck = (1..52).to_a
        @cards_in_deck = cards_in_deck
    end
    def shufflecards
       return cards_in_deck.shuffle
    end
end
def index_boy(card)
    card.each do |icard|
        if icard != 'X'
            return card.index(icard)
        end
    end
end
def handjudger_rf(hand)
    rf_hands = [[33,37,41,45,49],[34,38,42,46,50],[35,38,43,47,51],[36,39,43,48,52]]
    handr = ""
    rf_hands.each do |rfhand|
        if hand.cards_in_hand == rfhand
            handr = "Royal Flush"
        end
    end
    return handr
end
def handjudger_f(hand)
    card_values = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [17,18,19,20], [21,22,23,24], [25,26,27,28], [29,30,31,32], [33,34,35,36], [37,38,39,40], [41,42,43,44], [45,46,47,48], [49,50,51,52]]
    handvalue = []
    card_values.each do |value|
        
        value.each do |indivalue|
            if hand.cards_in_hand.include?(indivalue)
                handvalue << indivalue
            else
                handvalue << 'X'
            end
        end
    end
    index_arr = []
    13.times do
        arr = Array.new
        4.times do
            arr << handvalue[0]
            handvalue.delete_at(0)
        end
        index_arr << index_boy(arr)
    end
    index_arr.delete(["X","X","X","X"])
    # puts "This is index_arr #{index_arr}"
    if index_arr[0] == index_arr[1] && index_arr[0] == index_arr[2] && index_arr[0] == index_arr[3] && index_arr[0] == index_arr[4]
        return "Flush"
    end
end
def straight_helper(card)
    score = 0
    # puts "This is card #{card}"
    card.each do |icard|
        if icard == 'X'
            score += 1
        end
    end
    if score == 3
        return "True"
    else
        return "False"
    end
end
def truth_interpreter(truth)
    counter = 0
    truth.each do |t|
        if t == "True"
            counter += 1
        else
            counter = 0
        end
        if counter == 5
            return "Straight"
            break
        end
    end
end
def handjudger_s(hand)
    card_values = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [17,18,19,20], [21,22,23,24], [25,26,27,28], [29,30,31,32], [33,34,35,36], [37,38,39,40], [41,42,43,44], [45,46,47,48], [49,50,51,52]]
    handvalue = []
    card_values.each do |value|
        
        value.each do |indivalue|
            if hand.cards_in_hand.include?(indivalue)
                handvalue << indivalue
            else
                handvalue << 'X'
            end
        end
    end
    # puts "Handvalue: #{handvalue}"
    truth = Array.new
    13.times do
        arr = Array.new
        4.times do
            arr << handvalue[0]
            handvalue.delete_at(0)
        end
        truth << straight_helper(arr)
    end
    # puts "This is truth #{truth}"
    return truth_interpreter(truth)
end
def handjudger_toak(hand)
    card_values = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [17,18,19,20], [21,22,23,24], [25,26,27,28], [29,30,31,32], [33,34,35,36], [37,38,39,40], [41,42,43,44], [45,46,47,48], [49,50,51,52]]
    card_values.each do |value|
        handvalue = 0
        value.each do |indivalue|
            if hand.cards_in_hand.include?(indivalue)
                handvalue += 1
            end
        end
        return "Three of a Kind" if handvalue == 3
        return "Four of a Kind" if handvalue == 4
    end
end
def handjudger_p(hand)
    paircount = 0
    pairs = [[1,2], [1,3], [1,4], [2,3], [2,4], [3,4], [5,6], [5,7], [5,8], [6,7], [6,8], [7,8], [9,10], [9,11], [9,12], [10,11], [10,12], [11,12], [13,14], [13,15], [13,16], [14,15], [14,16], [15,16], [17,18], [17,19], [17,20], [18,19], [18,20], [19,20], [21,22], [21,23], [21,24], [22, 23], [22,24], [23,24], [25,26], [25,27], [25,28], [26,27], [26, 28], [27,28], [29,30], [29,31], [29, 32], [30,31], [30, 32], [31,32], [33,34], [33,35], [33,36], [34,35], [34,36], [35,36]]
    pairs.each do |pair|
        if hand.cards_in_hand.include?(pair[0]) && hand.cards_in_hand.include?(pair[1])
            # puts pair
            # puts hand.cards_in_hand
            paircount += 1
        end
    end
    if paircount == 1
        return "Pair"
    elsif paircount >= 2
        return "Two Pair"
    end
end
def handjudger_hc(hand)
    if hand.cards_in_hand.include?(52) || hand.cards_in_hand.include?(51) || hand.cards_in_hand.include?(50) || hand.cards_in_hand.include?(49)
        return "Ace High" 
    elsif hand.cards_in_hand.include?(48) || hand.cards_in_hand.include?(47) || hand.cards_in_hand.include?(46) || hand.cards_in_hand.include?(45)
        return "King High"
    elsif hand.cards_in_hand.include?(44) || hand.cards_in_hand.include?(43) || hand.cards_in_hand.include?(42) || hand.cards_in_hand.include?(41)
        return "Queen High"
    elsif hand.cards_in_hand.include?(40) || hand.cards_in_hand.include?(39) || hand.cards_in_hand.include?(38) || hand.cards_in_hand.include?(37)
        return "Jack High" 
    else
        return "Card High"
    end
end
def handjudger(hand)
    result = handjudger_rf(hand)
    if result == "Royal Flush"
        return result
    else
    result = handjudger_f(hand)
    end
    if result == "Flush"
        if handjudger_s(hand) == "Straight"
            return "Straight Flush"
        else
            return result
        end
    else
    result = handjudger_s(hand)
    end
    if result == "Straight"
        return result
    else
    result = handjudger_toak(hand)
    end
    if result == "Three of a Kind"
        if handjudger_p(hand) == "Two Pair" && hand.cards_in_hand.length == 5
            return "Full House"
        else
        return result
        end
    elsif result == "Four of a Kind"
        return result
    else
    result = handjudger_p(hand)
    end
    if result == "Pair" || result == "Two Pair"
        return result
    else
    return handjudger_hc(hand)
    end
end