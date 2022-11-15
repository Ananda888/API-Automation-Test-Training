package scenarios


import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef.*
import io.gatling.core.Predef.*
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef.*
import io.gatling.http.protocol.HttpProtocolBuilder

object createUser
{
  val httpProtocol: HttpProtocolBuilder = http.baseUrl("https://reqres.in")




  val post_createUser: ScenarioBuilder = scenario("Create User")
    .exec(http("POST /api/users")
      .post("/api/users")
      .body(StringBody(
        """
{
    "name": "morpheus",
    "job": "leader"
}
    """))
      .check(status.is(201))
    ).pause(22, 27)


}