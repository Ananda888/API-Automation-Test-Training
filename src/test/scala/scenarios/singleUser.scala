package scenarios


import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef.*
import io.gatling.core.Predef.*
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef.*
import io.gatling.http.protocol.HttpProtocolBuilder

object singleUser
{
  val httpProtocol: HttpProtocolBuilder = http.baseUrl("https://reqres.in")



  val get_viewSingleUser: ScenarioBuilder = scenario("View Single User")
    .exec(http("GET /api/users/2")
      .get("/api/users/2")
      .check(status.is(200))
    ).pause(28, 37)
}