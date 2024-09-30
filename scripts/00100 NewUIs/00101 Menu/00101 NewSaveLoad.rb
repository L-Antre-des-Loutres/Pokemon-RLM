module GamePlay
  class Save < Load
    attr_reader :frame  # Crée un accesseur pour @frame

    public
    def create_frame
      @frame = Sprite.new(@viewport)
      @frame.load('load/new_frame_save', :interface)
    end
  end
end

module UI
  # Défini @base_ui dans la plupart des interfaces
  class GenericBase < SpriteStack
    def create_button_background
      button_background_height = 52
      @button_background = add_sprite(0, 360 - button_background_height, button_background_filename).set_z(500)
    end
    
    def button_background_filename
      'gui/bottom_button_bar'
    end

    class ControlButton < SpriteStack
      # Array of button coordinates
      Y_COORDINATES = 360 - 21
      COORDINATES = [[3, Y_COORDINATES], [83, Y_COORDINATES], [163, Y_COORDINATES], [243, Y_COORDINATES]]
    end
  end

  class SaveSign < SpriteStack
    SAVE_INDEX_MESSAGE = 'Pokémon RLM : Save %d'

    def create_background
      @background = add_sprite(0, -10, NO_INITIAL_IMAGE)
    end

    def create_cursor
      @cursor = add_sprite(-4, -14, NO_INITIAL_IMAGE, 1, 2, type: SpriteSheet)
    end

    def create_pokemon_sprites
      @pokemon_sprites = Array.new(6) { |i| add_sprite(24 + i * 35, 0, NO_INITIAL_IMAGE, type: PokemonFaceSprite) }
      @swap_sprites.concat(@pokemon_sprites)
    end

    def base_x
      47
    end

    def base_y
      147
    end
  end
end