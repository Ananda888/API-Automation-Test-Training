import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder

object updateUser
{
  val httpProtocol: HttpProtocolBuilder = http.baseUrl("https://reqres.in")


 

  val put_updateUser: ScenarioBuilder = scenario("Update User Details")
    .exec(http("PUT /api/users/2")
      .put("/api/users/2")
      .body(StringBody(
        """
{
            "name": "morpheus",
            "job": "zion resident"
        }
  """))
      .check(status.is(200))
    ).pause(22, 27)

  
}