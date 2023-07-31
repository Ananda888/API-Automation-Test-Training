

function fn() {
    var env = karate.env
    karate.log('Environment is: ', env);
  var config = {
    env: 'demo',
    myVarName: 'env',
    baseUrl: 'https://reqres.in/'

  };

  return config;
}