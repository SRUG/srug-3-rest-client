#!/usr/bin/ruby

require 'trollop'
require 'activeresource'

module TwitterClone
  
  class Status < ActiveResource::Base
    self.site = "http://localhost:3000/"
    Status.prefix = "/users/:user_id/"

    def to_s
      "#{user.login}:\t #{body} at #{created_at}"
    end
  end

  class Client
    
    SUB_COMMANDS = %w(show create delete)

    def initialize
      @opts = Trollop::options do
        banner "Twitter clone RESTful client"
        version "0.0.1"
        stop_on SUB_COMMANDS
      end

      @cmd = ARGV.shift # get the subcommand
      @cmd_opts = case @cmd
                  when "show"
                    Trollop::options do
                      opt :user, "User name or id that you want to show tweets for", :type => :string
                    end
                  when "create"
                    Trollop::options do
                      opt :login, "Login", :type => :string, :required => true
                      opt :password, "Password", :type => :string, :required => true
                      opt :text, "Your status", :type => :string, :required => true
                    end
                  when "delete"
                    Trollop::options do
                      opt :login, "Login", :type => :string, :required => true
                      opt :password, "Password", :type => :string, :required => true
                      opt :id, "ID of the tweet you want to delete", :type => :int, :required => true
                    end
                  else
                    Trollop::die "unknown subcommand #{cmd.inspect}"
                  end
            
      self.send(@cmd) # execute the subcommand
    end
    
    def show
      if @cmd_opts[:user]
        params = {:user_id => @cmd_opts[:user]}
      else
        params = {}
        Status.prefix = "/"
      end
      @statuses = Status.find(:all, :params => params)
      @statuses.each do |status|
        puts status
      end
    end

    def create
      setup_credentials
      Status.create(:body => @cmd_opts[:text], :user_id => @cmd_opts[:login])
      puts "Status created successfully"
    end

    def delete
      setup_credentials
      Status.delete(@cmd_opts[:id], :user_id => @cmd_opts[:login])
      puts "Status destroy successfully"
    end

    private
    def setup_credentials
      if @cmd_opts[:login] && @cmd_opts[:password]
        Status.user = @cmd_opts[:login]
        Status.password = @cmd_opts[:password]
      end
    end

  end
end

TwitterClone::Client.new
