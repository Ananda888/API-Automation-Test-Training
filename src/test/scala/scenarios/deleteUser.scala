package scenarios


import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef.*
import io.gatling.core.Predef.*
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef.*
import io.gatling.http.protocol.HttpProtocolBuilder

object deleteUser {
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

  val delete_User: ScenarioBuilder = scenario("Delete User")
    .exec(http("DELETE /api/users/2")
      .delete("/api/users")
      .check(status.is(204))
    ).pause(22, 27)

}