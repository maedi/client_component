require_relative '../lib/client_component.rb'
ClientComponent.require 'app_component.rb.js'

app_component = AppComponent.new

#begin
#
#  demo_component = DemoComponent.new
#
#rescue NameError => error
#
#  begin
#    result = require_relative '../demo/app_component.js.rb'
#  rescue SyntaxError => error
#    p result
#    #p demo_component.client()
#  end
#
#end
