class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :current_token
  helper_method :myfriends
  helper_method :myparties
      
    private  

    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end

    def current_token
      @current_token ||= session[:fbtoken] if session[:fbtoken]
    end

    def client
      @client ||= FBGraph::Client.new(:client_id => '131551150238460',
                                     :secret_id => '9868e66271e87bf5903999fbfa0513ca' ,
                                     :token => current_token)
    end

    def friendlist
      @friendlist = client.selection.me.friends.info!['data'].map(&:id)
    end

    def myfriends
      if (current_user)
        @myfriends = User.all
        @myfriends.reject! { |singleuser| !friendlist.include?(singleuser.uid) }
      end
    end

    def myparties
      if (current_user)
        potential = Party.all :order => "created_at DESC"
        potential.reject! { |singleparty| (singleparty.user.id != current_user.id) && (singleparty.for_who != "all") && (!friendlist.include?(singleparty.user.uid)) }
        @myparties = potential.first(2)
      end
    end

end
