$: << ""
$: << "figures"
$: << "statdata"
$: << "game"
$: << "cards"
$: << "test"
$: << "handtypes"
$: << "event"
$: << "logsession"

#gem install couchrest

require 'couchrest'

require_relative 'configsession.rb'

require_relative 'figures/figure.rb'
require_relative 'figures/hauteur.rb'
require_relative 'figures/pair.rb'
require_relative 'figures/doublepair.rb'
require_relative 'figures/brelan.rb'
require_relative 'figures/quinte.rb'
require_relative 'figures/couleur.rb'
require_relative 'figures/full.rb'
require_relative 'figures/carre.rb'

require_relative 'amelioration.rb'

require_relative 'handtypes/handtype.rb'
require_relative 'handtypes/handtypearray.rb'

require_relative 'statdata/gamedata.rb'
require_relative 'statdata/handdata.rb'
require_relative 'statdata/playerdata.rb'
require_relative 'statdata/figuredata.rb'

require_relative 'cards/card.rb'
require_relative 'cards/cards.rb'
require_relative 'cards/cardcolor.rb'
require_relative 'cards/cardlist.rb'

require_relative 'game/board.rb'
require_relative 'game/hand.rb'
require_relative 'game/player.rb'
require_relative 'game/session.rb'
require_relative 'game/table.rb'

require_relative 'event/abstractevent.rb'
require_relative 'event/showdown.rb'

require_relative 'logsession/dblogsession.rb'

require_relative 'test/testsession.rb'
require_relative 'test/testtable.rb'
require_relative 'test/testdb.rb'