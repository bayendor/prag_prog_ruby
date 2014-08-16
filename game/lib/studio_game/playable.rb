module StudioGame
  module Playable
    def strong?
      health > 100
    end

    def blam
      puts "#{name} got blammed!"
      self.health -= 10
    end

    def w00t
      puts "#{name} got w00ted!"
      self.health += 15
    end
  end
end
