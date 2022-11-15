
import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder

object multipleUsers {

  val get_viewMultipleUsers: ScenarioBuilder = scenario("View Multiple Users")
    .exec(http("GET /api/users")
      .get("/api/users")
      .formParam("page", 2)
      .check(status.is(200)))
    .pause(52, 65)

}