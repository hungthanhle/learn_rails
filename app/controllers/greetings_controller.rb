class GreetingsController < ApplicationController
  include GreetingsHelper

  def hello
    debugger
    # self = #<GreetingsController:0x00000000015810>
    # self.methods = [:hello, :fnc_helper

    fnc_helper
  end
end
