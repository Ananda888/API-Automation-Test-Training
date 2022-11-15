package PerformanceLoadTests


import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef.*
import io.gatling.core.Predef.*
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration.*

class KarateGatlingTest extends Simulation {
  val protocol = karateProtocol(

    //Member Registrations
    "api/register" -> Nil,
    //Login
    "api/login" -> Nil,
    //Create User
    "api/users" -> Nil,
    //Update/delete/list single user
    "api/users/{userId}" -> Nil,
    //List multiple users
    "api/users" -> Nil
)
 //Get transaction names
  protocol.nameResolver = (req, ctx) => req.getHeader("gatling-txn-name")

  //Define scenarios
  //Member Registration
  val post_registration = scenario("Successful Member Registration").repeat(1){exec(karateFeature("src/test/karate/features/POST_Register.feature")).pause(30, 33)}
  val post_login = scenario("Successful Login").repeat(1){exec(karateFeature("src/test/karate/features/POST_Login.feature")).pause(30,33)}
  val post_createUser = scenario("Successfully create user").repeat(1){exec(karateFeature("src/test/karate/features/POST_CreateUser.feature")).pause(22, 27)}
  val put_updateUser = scenario("Successfully update user details").repeat(1){exec(karateFeature("src/test/features/karate/PUT_UpdateUser.feature")).pause(22,27)}
  val delete_User = scenario("Successfully delete user").repeat(1){exec(karateFeature("src/test/karate/features/DELETE_User.feature")).pause(22,27)}
  val get_viewMultipleUsers = scenario("View multiple user details").repeat(1){exec(karateFeature("src/features/test/karate/GET_MultipleUsers.feature")).pause(52,65)}
  val get_viewSingleUser = scenario("View single user details").repeat(1){exec(karateFeature("src/test/features/karate/GET_User.feature")).pause(28,37)}
  //Shakeout

//  setUp(
//    post_registration.inject(atOnceUsers(1)),
//
//    post_login.inject(atOnceUsers(1)),
//
//    post_createUser.inject(atOnceUsers(1)),
//
//    put_updateUser.inject(atOnceUsers(1)),
//
//    delete_User.inject(atOnceUsers(1)),
//
//    get_viewMultipleUsers.inject(atOnceUsers(1)),
//
//
//    get_viewSingleUser.inject(atOnceUsers(1))
//
//  ).protocols(protocol)


  //Load Test
  setUp(
    post_registration.inject(rampConcurrentUsers(0).to(2).during(60),
    constantConcurrentUsers(2).during(300)),

    post_login.inject(rampConcurrentUsers(0).to(2).during(60),
    constantConcurrentUsers(2).during(300)),

    post_createUser.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    put_updateUser.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    delete_User.inject(rampConcurrentUsers(0).to(5).during(120),
    constantConcurrentUsers(5).during(300)),

    get_viewMultipleUsers.inject(rampConcurrentUsers(0).to(10).during(180),
    constantConcurrentUsers(10).during(300)),

    get_viewSingleUser.inject(rampConcurrentUsers(0).to(10).during(180),
    constantConcurrentUsers(10).during(300))

  ).protocols(protocol)

}