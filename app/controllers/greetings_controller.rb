class GreetingsController < ApplicationController
  include GreetingsHelper

  def hello
    # debugger
    # self = #<GreetingsController:0x00000000015810>
    # self.methods = [:hello, :fnc_helper


    # [e047f822-4eb2-4649-93e3-5755ee068d2a] app/views/greetings/hello.html.erb:11
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Started GET "/greetings/hello" for 127.0.0.1 at 2024-02-02 16:05:01 +0700
    # [5361db7a-6cb9-41be-9309-c6599661fbf1] Processing by GreetingsController#hello as HTML
    # request.request_id = 5361db7a-6cb9-41be-9309-c6599661fbf1

    # PID and timestamp
    # I, [2024-02-02T16:33:18.746132 #48950]  INFO -- : [a0e7dae3-f74f-498a-9e6a-c750f1583e50] Started GET "/greetings/hello" for 127.0.0.1 at 2024-02-02 16:33:18 +0700
    # use command to find PID:
    # lsof -wni tcp:3001 # => 48950
    # list PID:
    # ps aux
    # user      48950  1.3  0.8 1364884 140472 pts/5  Sl+  16:32   0:01 puma 5.6.8 (tcp://localhost:3000) [context]
    fnc_helper
  end
end
