require './config/environment'

use Rack::MethodOverride
use FriendsController
use SubscriptionsController
use UsersController
run ApplicationController