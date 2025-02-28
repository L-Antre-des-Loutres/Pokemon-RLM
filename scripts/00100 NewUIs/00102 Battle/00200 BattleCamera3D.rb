module Battle
  class Scene < GamePlay::Base
    BATTLE_CAMERA_3D = false

    def create_visual
      return Battle::Visual3D.new(self) if BATTLE_CAMERA_3D
      return Battle::Visual.new(self)
    end
  end
end