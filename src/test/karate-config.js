

function fn() {
    var env = karate.env
    karate.log('Environment is: ', env);

  //Set the base url here
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://reqres.in/'

  };


  return config;
}