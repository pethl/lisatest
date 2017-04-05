module PlayersHelper
  
  def cell(user, player_id)
    if Userplayer.where(user_id: user, player_id: player_id, selected: true).any?
      return true
    else
      return false
    end
  end
 
  def points_for_correct_squad_player(user_id)
     @squad_players = Player.where(selected: true).pluck(:id)
     @squad_selected_by_user = Userplayer.where(user_id: user_id, selected: true).pluck(:player_id)
     @points = @squad_players & @squad_selected_by_user
     return @points.length
  end
  
  def points_scored_for_game(game_id, user_id)
   # game = Game.find(game_id)
   # usergame = Usergame.where(game_id: game_id, user_id: user_id).first
     if who_won(game_id)==who_did_you_predict_to_win(game_id, user_id)
       return 1
    else
      0
    end
  end
  
  def points_scored_for_correct_margin(game_id, user_id)
   # game = Game.find(game_id)
    usergame = Usergame.where(game_id: game_id, user_id: user_id).first
    if points_margin(game_id)==usergame.winning_margin
      return 1
    else
      0
    end
  end
  
  def total_points_per_game(game_id, user_id)
    game_points = points_scored_for_game(game_id, user_id)
    margin_points = points_scored_for_correct_margin(game_id, user_id)
    return (game_points+margin_points)
  end
  
  def points_for_all_games(user_id)
    @all_games = Game.all.pluck(:id)
    total = 0
    @all_games.each do |game|
      total += points_scored_for_game(game, user_id)
    end
    return total
  end
    
end
