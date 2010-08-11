module ActsHelper

  def act_to_english(act_type)
    if act_type == 'draw_to_hand'
		  return 'drew a card into his hand'
		elsif act_type == 'play_from_hand'
		  return 'played a card from his hand'
		elsif act_type == 'play_from_deck'
		  return 'played a card from the deck'
		elsif act_type == 'give_to_player'
		  return 'gave a card to another player'
		end
  end

end
