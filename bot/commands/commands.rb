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
    when 'OK'
      say "Super, tu as donc une bonne utilsiation des panneaux solaires"
      stop_thread
    when 'NOT_OK'
      say "Okay, pas de problème ! Veux tu quelques conseils pour une bonne utilisation ?"
      next_command :appear_nice
    else
      say "🤖"
      # it's always a good idea to have an else, quick replies don't
      # prevent user from typing any message in the dialogue
      stop_thread
    end
    message.typing_off
  end

  def appear_nice
    message.typing_on
    case message.text
    when 'oui' then say "Utilise tes appareils électro ménagers en pleine journée au soleil! Quels produits électro-ménagers possède-tu ?"
      next_command :appareils
    when 'non' then say "Et bah te faire foutre !! "
    else
      say "It shall pass"
    end
    message.typing_off
    stop_thread # future messages from user will be handled from top-level bindings
  end

  def appareils
    message.typing_on
    case message.text
    when 'four' then say 'Okay, pour le four tu dois bla bla bla'
      next_command :appear_nice
    when 'machine à laver' then say 'Pour ta machine, si tu as des panneaux il faut mieux la programmer le midi quand le soleil est à son pic !'
      next_command :appear_nice
    when 'lave-linge' then say 'Pour ton lave-linge, si tu as des panneaux il faut mieux la programmer le midi quand le soleil est à son pic !'
      next_command :appear_nice
    else
      say "it shall bla bla "
    end
    message.typing_off
    stop_thread
end 
