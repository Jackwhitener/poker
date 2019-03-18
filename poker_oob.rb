class Hand
    attr_accessor :cards_in_hand
    attr_accessor :hand_type
    def initialize(cards_in_hand)
        if cards_in_hand != nil
            @cards_in_hand = cards_in_hand
        else
            @cards_in_hand = []
        end
        @hand_type = handjudger(self)
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
    rf_hands = [[32,36,40,44,48],[33,37,41,45,49],[34,37,42,48,50],[35,38,42,49,51]]
    handr = ""
    rf_hands.each do |rfhand|
        if hand.cards_in_hand == rfhand
            handr = "Royal Flush"
        end
    end
    return handr
end
def handjudger_f(hand)
    card_values = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15], [16,17,18,19], [20,21,22,23],[24,25,26,27], [28,29,30,31],[32,33,34,35], [36,37,38,39], [40,41,42,43], [44,45,46,47], [48,49,50,51]]
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
    card_values = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15], [16,17,18,19], [20,21,22,23],[24,25,26,27], [28,29,30,31],[32,33,34,35], [36,37,38,39], [40,41,42,43], [44,45,46,47], [48,49,50,51]]
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
    card_values = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15], [16,17,18,19], [20,21,22,23],[24,25,26,27], [28,29,30,31],[32,33,34,35], [36,37,38,39], [40,41,42,43], [44,45,46,47], [48,49,50,51]]
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
    pairs = [[0,1],[0,2],[0,3],[1,2],[1,3],[2,3],[4,5],[4,6],[4,7],[5,6],[5,7],[6,7],[8,9],[8,10],[8,11],[9,10],[9,11],[10,11],[12,13],[12,14],[12,15], [13,14], [13,15], [14,15], [16,17], [16,18], [16,19], [17,18], [17,19], [18,19], [20,21], [20,22], [20,23], [21,22], [21,23], [22,23], [24,25], [24,26], [24,27], [25,26], [25,27], [26,27], [28,29], [28,30], [28,31], [29,30], [29,31], [30,31], [32,33], [32,34], [32,35], [33,34], [33,35], [34,35], [36,37], [36,38], [36,39], [37,38], [37,39], [38,39], [40,41], [40,42], [40,43], [41,42], [41,43], [42,43], [44,45], [44,46], [44,47], [45,46], [45,47], [46,47], [48,49], [48,50], [48,51], [49,50], [49,51], [50,51]]
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
    if hand.cards_in_hand.include?(51) || hand.cards_in_hand.include?(50) || hand.cards_in_hand.include?(49) || hand.cards_in_hand.include?(48)
        return "Ace High" 
    elsif hand.cards_in_hand.include?(47) || hand.cards_in_hand.include?(46) || hand.cards_in_hand.include?(45) || hand.cards_in_hand.include?(44)
        return "King High"
    elsif hand.cards_in_hand.include?(43) || hand.cards_in_hand.include?(42) || hand.cards_in_hand.include?(41) || hand.cards_in_hand.include?(40)
        return "Queen High"
    elsif hand.cards_in_hand.include?(39) || hand.cards_in_hand.include?(38) || hand.cards_in_hand.include?(37) || hand.cards_in_hand.include?(36)
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
def handslator(hand)
    cardnames = ["Two of Clubs", "Two of Diamonds", "Two of Hearts", "Three of Spades", "Three of Clubs", "Three of Diamonds", "Three of Hearts", "Three of Spades", "Four of Clubs", "Four of Diamonds", "Four of Hearts", "Four of Spades", "Five of Clubs", "Five of Diamonds", "Five of Hearts", "Five of Spades", "Six of Clubs", "Six of Diamonds", "Six of Hearts", "Six of Spades", "Seven of Clubs", "Seven of Diamonds", "Seven of Hearts", "Seven of Spades", "Eight of Clubs", "Eight of Diamonds", "Eight of Hearts", "Eight of Spades", "Nine of Clubs", "Nine of Diamonds", "Nine of Hearts", "Nine of Spades", "Ten of Clubs", "Ten of Diamonds", "Ten of Hearts", "Ten of Spades", "Jack of Clubs", "Jack of Diamonds", "Jack of Hearts", "Jack of Spades", "Queen of Clubs", "Queen of Diamonds", "Queen of Hearts", "Queen of Spades", "King of Clubs", "King of Diamonds", "King of Hearts", "King of Spades", "Ace of Clubs", "Ace of Diamonds", "Ace of Hearts", "Ace of Spades"]
    hand = [cardnames[hand[0]], cardnames[hand[1]], cardnames[hand[2]], cardnames[hand[3]], cardnames[hand[4]]]
    return hand
end
def scoreboy(score)
    handvalue = ["Card High", "Jack High", "Queen High", "King High", "Ace High", "Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush", "Royal Flush"]
    return handvalue.index(score)
    # if score == "Card High"
    #     return 0
    # elsif score == "Jack High"
    #     return 1
    # elsif score == "Queen High"
    #     return 2
    # elsif score == "King High"
    #     return 3
    # elsif score == "Ace High"
    #     return 4
    # elsif score == "Pair"
    #     return 5
    # elsif score == "Two Pair"
    #     return 6
    # elsif score == "Three of a Kind"
    #     return 7
    # elsif score == "Straight"
    #     return 8
    # elsif score == "Flush"
    #     return 9
    # elsif score == "Full House"
    #     return 10
    # elsif score == "Four of a Kind"
    #     return 11
    # elsif score == "Straight Flush"
    #     return 12
    # elsif score == "Royal Flush"
    #     return 13
    # end
end
def tiebreaker(redhand,blackhand)
    redsult = scoreboy(redhand.hand_type)
    blacksult = scoreboy(blackhand.hand_type)
    if redsult == blacksult
        puts "Tie Detected"
        
    else
        return "No Tie Detected"
    end
end