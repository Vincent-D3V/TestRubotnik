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
      say "Bien sûr on ne va te demander de ne regarder la télévision qu'à midi, mais seulement éviter de la laisser en veille lorsque tu ne l'utilises pas te permettrait d'éviter une dépense énergétique inutile!
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'LAVE_LINGE'
      say "Savais-tu que la plupart des lave-linges possèdent un mode éco qui te permet de moins consommer ? Pense à remplir correctement tes machines et à nettoyer régulièrement le filtre !
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'LAVE_VAISSELLE'
      say "Essaie de le brancher sur l'arrivée d'eau chaude, charge-le completement avant de la lancer !
      Possèdes-tu d'autres appareils ? "
      stop_thread
    when 'FRIGO'
      say "Place ton frigo loin des sources de chauleurs (comme un four), dépoussière régulièrement les grilles arrières et pense aussi à laisser de l'espace entre le mur et l'arrière de ton réfrigérateur!
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