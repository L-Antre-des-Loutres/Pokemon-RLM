module BattleUI
  class PlayerChoice < GenericChoice
    # Les coordonnées des 4 boutons
    # Résolution 640x360 | Taille des boutons 72x27
    ButtonX = 630 - 72
    ButtonY = 350 - 27
    SpaceBetweenButtonsX = 82
    BUTTON_COORDINATE = [
      [ButtonX - SpaceBetweenButtonsX * 3, ButtonY],
      [ButtonX - SpaceBetweenButtonsX * 2, ButtonY],
      [ButtonX - SpaceBetweenButtonsX, ButtonY],
      [ButtonX, ButtonY]
    ]
  end

  class PokemonSprite < ShaderedSprite
    def create_shadow
      @shadow = ShaderedSprite.new(viewport)
      @shadow.shader = Shader.create(:battle_shadow)
    end

    def base_position_v1 # Position des Pokémon en combat 1v1
      return 460, 200 if enemy? # 99 = hauteur du sprite
      return 200, 320
    end

    def base_position_v2 # Position des Pokémon en combat 2v2
      return 202, 133 if enemy?
      return 58, 179
    end

    def sprite_zoom
      return 1.5
    end
  end

  class GenericChoice < UI::SpriteStack
    private
    def create_sprites
      create_button_background
      create_misc_icons_background

      create_buttons
      create_sub_choice
      create_cursor
    end

    def button_background_filename
      'battle/bottom_button_bar'
    end

    def misc_icons_background_filename
      'battle/bottom_top_bar'
    end
    
    def create_button_background
      button_background_height = 56
      @button_background = add_sprite(0, 360 - button_background_height, button_background_filename).set_z(500)
    end

    def create_misc_icons_background
      @misc_icons_background = add_sprite(0, 0, misc_icons_background_filename).set_z(500)
    end
  end
end