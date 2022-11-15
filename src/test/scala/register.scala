
import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder

object register
{
  val httpProtocol: HttpProtocolBuilder = http.baseUrl("https://reqres.in")


  val post_registration: ScenarioBuilder = scenario("Member Registrations")
    .exec(http("POST /api/register")
      .post("/api/register")
      .body(StringBody(
        """
      {
      "email": "eve.holt@reqres.in",
      "password": "pistol"
  }
      """)).asJson
      .check(status.is(200))
    ).pause(30, 33)

  
}