# Restart the game
def restart_game()
    file_name = "cmd.bat"
    File.open(file_name, "w") do |f|
        f.puts "ruby 00100%20Nom%20Pokemon.rb"
    end
end
