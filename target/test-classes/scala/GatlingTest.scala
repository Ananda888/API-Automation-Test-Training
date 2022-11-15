
import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef.*
import io.gatling.core.Predef.*
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef.*
import io.gatling.http.protocol.HttpProtocolBuilder

import scala.concurrent.duration.*

class GatlingTest extends Simulation {

  val httpProtocol: HttpProtocolBuilder = http.baseUrl("https://reqres.in")

  //Load Test
  setUp(
    register.post_registration.inject(rampConcurrentUsers(0).to(2).during(60),
    constantConcurrentUsers(2).during(300)),

    login.post_login.inject(rampConcurrentUsers(0).to(2).during(60),
    constantConcurrentUsers(2).during(300)),

    createUser.post_createUser.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    updateUser.put_updateUser.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    deleteUser.delete_User.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    multipleUsers.get_viewMultipleUsers.inject(rampConcurrentUsers(0).to(10).during(180),
    constantConcurrentUsers(10).during(300)),

    singleUser.get_viewSingleUser.inject(rampConcurrentUsers(0).to(10).during(180),
    constantConcurrentUsers(10).during(300))

  ).protocols(httpProtocol)

}