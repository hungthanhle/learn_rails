class GreetingsController < ApplicationController
  include GreetingsHelper

  def hello
    debugger
    # self = #<GreetingsController:0x00000000015810>
    # self.methods = [:hello, :fnc_helper


    # [e047f822-4eb2-4649-93e3-5755ee068d2a] app/views/greetings/hello.html.erb:11
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Started GET "/greetings/hello" for 127.0.0.1 at 2024-02-02 16:05:01 +0700
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Processing by GreetingsController#hello as HTML
    # request.request_id = 5361db7a-6cb9-41be-9309-c6599661fbf1
    fnc_helper
  end
end
