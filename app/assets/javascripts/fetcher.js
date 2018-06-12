function httpRequestHandler(url,access_token,METHOD){
  let url = url + ?access_token=access_token
  $.ajax({
    url,
    method:METHOD,
    success:function(response){
      console.log(response)
    }

  })
}