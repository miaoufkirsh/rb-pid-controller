rb-pid-controller
==========

Description
--------------------------------

This is a simple PID controller writen in ruby

Installation
--------------------------------

      sudo gem install rb-pid-controller
      
Usage
--------------------------------

      require "rubygems"
      require "rb-pid-controller"
      
      Kp = 1 # Proportional gain
      Ki = 1 # Integrative gain
      Kd = 1 # Derivative gain
      
      # pid controller creation
      pid = PIDController::PID.new(Kp,Ki,Kd)
      
      # set the consign
      pid.set_consign(10)
      
      # push a value to the controller and get the command
      command = pid << 11

      
