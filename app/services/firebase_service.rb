class FirebaseService 
  AUTH_KEY = 'AIzaSyDXdWV20WkN_1n0BEYfYjDjbsOz9L4LKO0'
  
  def notify(user)
    return if user.token.nil?
    RestClient::Request.execute(method: :post, url: 'https://fcm.googleapis.com/fcm/send',
                            payload: { data: {}, to: user.token }, 
                            content_type: :json,
                            headers: { Authorization: 'key='+AUTH_KEY})
  end
end