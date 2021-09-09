document.addEventListener("turbolinks:load",function(){
    $("#formSubmit").click(function(){
     var title = document.getElementById("title").value;
     var content = document.getElementById("content").value;
     var token = document.getElementById("token").value;
        fetch("http://localhost:3000/api/v1/articles",{
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            title: title,
            content: content,
            auth_token: token
          }) 
        }).then(function(response){
          if (response.ok){
            console.log("success");
          }
          else{
            console.log("not success");
          }
          return response.json()
        })
        .then(function(resultData){
          console.log("go in");
          show(resultData);
          console.log("go success");
        });

        function show(data) {
          console.log(data);
          let tab = 
          `<div class="card" style="width: 18rem;">
          <div class="card-body">
          <h5 class="card-title"> Title:${data.title}</h5>
          <p class="card-text"> Content:${data.content} </p>
          </div>
          </div>`;
          document.write(tab); 
        }

    });


    $("#registerUserFormSubmit").click(function(){
      var title = document.getElementById("title").value;
      var content = document.getElementById("content").value;
        fetch("http://localhost:3000/api/v1/articles",{
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            title: title,
            content: content
          }) 
        }).then(function(response){
          if (response.ok){
            console.log("success");
          }
          else{
            console.log("not success");
          }
            return response.json()
        })
        .then(function(resultData){
          console.log("go in");
          display(resultData);
          console.log("go success");
        });
   
        function display(data) {
          console.log(data);
          let tab = 
          `<div class="card" style="width: 18rem;">
          <div class="card-body">
          <h5 class="card-title"> Title:${data.title}</h5>
          <p class="card-text"> Content:${data.content} </p>
          </div>
          </div>`;
          document.write(tab); 
        }
    });
});
 


  