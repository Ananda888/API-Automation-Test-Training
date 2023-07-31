

function fn() {
    var env = karate.env
    karate.log('Environment is: ', env);
  var config = {
    env: env,
    myVarName: 'env',
    baseUrl: 'https://reqres.in/'

  };


  return config;
}