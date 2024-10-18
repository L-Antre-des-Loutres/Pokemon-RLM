module GamePlay
  class Save < Load
    attr_reader :frame  # Crée un accesseur pour @frame

    public
    def create_frame
      @frame = Sprite.new(@viewport)
      @frame.load('load/new_frame_save', :interface)
    end
  end

  class Load < BaseCleanUpdate
    def update
      super
      @icon_bar_animation&.update
    end

    def update_icon_bar_animation
      @icon_bar_animation&.update
    end

    def create_icon_bar
      icon_bar_layer = -10
      icon_bar_y = 0
      icon_bar_x = 0

      @icon_bar = Sprite.new(@viewport)
      @icon_bar.load('load/icon_bar_save', :interface)
      @icon_bar.set_position(icon_bar_x, icon_bar_y)
      @icon_bar.set_z(icon_bar_layer)
      
      ya = Yuki::Animation
      duration = 10.5

      @icon_bar_animation = ya.timed_loop_animation(duration)
      @icon_bar_animation.play_before(ya.shift(duration, @icon_bar, 161, icon_bar_y, 0, icon_bar_y))
      @icon_bar_animation.start
    end

    def create_graphics
      super
      create_base_ui
      create_shadow
      create_frame
      create_signs
      create_icon_bar
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
      Y_COORDINATES = 360 - 31
      COORDINATES = [[5, Y_COORDINATES], [85, Y_COORDINATES], [165, Y_COORDINATES], [245, Y_COORDINATES]]
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