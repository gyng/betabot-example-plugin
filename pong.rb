# frozen_string_literal: true

# The repo name should match the supplied name

# The class name has to be a single capitalized name
# and should match the filename
class Bot::Plugin::Pong < Bot::Plugin
  def initialize(bot)
    # Defaults. Settings are persistent. A settings file is created if it does not exist
    # in lib/settings/ping.json. See: #save_settings and #load_settings
    #
    # Required plugin settings:
    #
    # trigger: A hash of trigger mappings
    #   {
    #     trigger1: [:method_to_call, auth_level, 'Optional help text for this trigger'],
    #     trigger2: [:method2, 3]
    #   }
    #
    # subscribe: bool
    #   Subscribe to Bot publish? (ie. usually all non-sensitive messages)
    #
    # help: A string, optional
    #   Not required, but useful to have. This means you can have
    #
    # You can add custom settings for the bot as a key in the settings object @s

    @s = {
      trigger: {
        pong: [:method_to_call, 0, 'Pongs the bot.'],
        change_reply: [:change_reply, 0, 'Change the pong reply message']
      },
      reply_with: 'peng',
      subscribe: false
    }

    super(bot)
  end

  def method_to_call(msg)
    msg.reply(@s[:reply_with])
  end

  def change_reply(msg)
    new_reply = msg.args[0]
    @s[:reply_with] = new_reply
    save_settings
    msg.reply "Changed to #{new_reply}"
  end

  # Example with complex arguments and auth
  def parse_cmd(msg)
    case msg.args
      in ['check']
        msg.reply @s[:reply_with]
      in ['set', *rest_of_args] if auth_r(4, msg)
        change_reply(*rest_of_args.join(' '))
    end
  end

  # The method called when an adapter is fully ready
  # Eg, when the bot has registered its nickname with the IRC server
  def on_connect(_adapter, _connection)
    # If IRC is addressable, send "Betabot is here!" to #mychannel on the IRC server group named "myserver"
    # @bot.address_str('irc:::myserver:::#mychannel')&.reply('Betabot is here!')
  end

  # This method receives published (=broadcasted) messages.
  # Since @s[:subscribe] is false, it is never called and is actually not required.
  def receive(msg)
    # Receiving a published message!
  end
end
