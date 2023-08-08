
//Package is the folder the class is in
package runner;
//Import the Junit5 package to run the karate feature file
import com.intuit.karate.junit5.Karate;

//Runner class to run the feature file
public class GetSingleUserRunner {
    //Use Karate.Test tag
    @Karate.Test
    //Function to call the feature file
    Karate runGetSingleUser(){
        return Karate.run("../../karate/features/get-single-user/get-single-user.feature").relativeTo(getClass());
    }

}
//Type in the terminal "mvn test -Dtest=GetSingleUserRunner" to run the test. To run other feature files, input the associated class name
//after -Dtest=
