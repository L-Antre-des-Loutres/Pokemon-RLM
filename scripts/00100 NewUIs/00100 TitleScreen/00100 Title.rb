# Monkey Patch pour centrer l'écran d'accueil sur une résolution de 640x360
class Scene_Title
    # Redéfinition de create_title_background pour centrer l'arrière-plan
    def create_title_background
      @background.load('newBackground', :title)
      @background.opacity = 255
      @background.ox = @background.width / 2
      @background.oy = @background.height / 2
      @background.x = 320 # Centre horizontalement (640 / 2)
      @background.y = 180 # Centre verticalement (360 / 2)
    end
  
    # Redéfinition de create_title_title pour centrer le titre
    def create_title_title
      @title = Sprite.new(@viewport)
      @title.z = 200
      @title.load('newTitle', :title)
      @title.ox = @title.width / 2
      @title.oy = @title.height / 2
      @title.x = 320
      @title.y = 100 # Ajustement manuel pour le positionnement esthétique
    end
  end
  
  class UI::TitleControls
    # Redéfinition de create_play_bg pour centrer le bouton "Jouer"
    def create_play_bg
      @play_bg = add_sprite(320, 250, 'shader_bg') # Centrage horizontal
      @play_bg.ox = @play_bg.width / 2
      @play_bg.shader = @shader
    end
  
    # Redéfinition de create_credits_bg pour centrer le bouton "Crédits"
    def create_credits_bg
      @credit_bg = add_sprite(320, 290, 'shader_bg') # Centrage horizontal et position ajustée
      @credit_bg.ox = @credit_bg.width / 2
      @credit_bg.shader = @shader
    end
  
    # Redéfinition de create_play_text pour recentrer le texte "Jouer"
    def create_play_text
      add_text(320, 252, 0, 24, text_get(32, 77).capitalize, 1, 1, color: 9)
    end
  
    # Redéfinition de create_credit_text pour recentrer le texte "Crédits"
    def create_credit_text
      add_text(320, 292, 0, 24, 'Credits', 1, 1, color: 9)
    end
  end
  