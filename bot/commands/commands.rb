module Commands
  # You can write all your commands as methods here

  # If the command is bound with reply_with specified,
  # you have to deal with user response to the last message and react on it.
  def start_conversation
    # Quick replies are accessible through message object's quick_reply property,
    # by default it's the quick reply text in ALL CAPS
    # you can also react on the text itself
    message.typing_on
    case message.quick_reply
    when 'TV'
      say "Bien sur on ne va te demander de ne pas regarder la télévision seulement à midi mais la mettre seulement en veille te permettrait d'éviter une dépense énergétique inutile,
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'LAVE_LINGE'
      say "Savais-tu que la plupart des lave-linges possèdent un mode éco qui te permet de moins consommer. Remplis correctement tes machines et nettoie régulièrement le filtre,
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'LAVE_VAISSELLE'
      say "Essaie de brancher sur l'arrivée d'eau froide. Charge totalement tes machines. Fais au maximum de vaisselles à la main,
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'FRIGO'
      say "Place ton frigidaire loin des sources de chauleurs. Dépoussière régulièrement les grilles arrières. Laisse aussi de l'espace entre le mur et l'arrière de ton frigidaire,
      Possèdes-tu d'autres appareils ? "
      stop_thread
    else
      say "🤖"
      # it's always a good idea to have an else, quick replies don't
      # prevent user from typing any message in the dialogue
      stop_thread
    end
    message.typing_off
  end
end