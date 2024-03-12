$(document).ready(function(){
          
    $('#movieForm').submit(function(event){
        event.preventDefault()
    var result=""    
    var movie = $('#moviename').val()
    var url ="http://www.omdbapi.com/?apikey=793761af&"
        $.ajax({
            method:'GET',
            url:url+"&t="+movie,
            success:function(data){
            console.log(data)
                result =`
                <img style="float:left" src="${data.Poster}" class="img-thumnail" width="300" height="300"/>
           
                <div class="m-3" style="float:left">

                <h5>Title: ${data.Title}</h5>
                <h5>Released Date: ${data.Released}</h5>
                <h5>Genre: ${data.Genre}</h5>
                <h5>Duration: ${data.Runtime}</h5>
                <h5>Actors: ${data.Actors}</h5>
                <h5>Director: ${data.Director}</h5>
        <h5>Award: ${data.Awards}</h5>
                <input type="button" value="Add to list" class="btn btn-success" class="fa fa-plus">
              
                </div>
                `
                $("#result").html(result)
        }
        })
    })
    
});