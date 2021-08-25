
const fetch = require("node-fetch");

var data = fetchJSON('neighbourhoods.geojson')
            .then(function(data) { 
                console.log(data);

        // do what you want to do with `data` here...
        

});


function fetchJSON(url) {
    return fetch(url)
      .then(function(response) {
        return response.json();
      });
  }