package runner;
import com.intuit.karate.junit5.Karate;

public class GetUserDataDriven {
    @Karate.Test
    Karate runGetUserDataDriven(){
        return Karate.run("../../karate/features/get-single-user/get-user-data-driven.feature").relativeTo(getClass());
    }

}
