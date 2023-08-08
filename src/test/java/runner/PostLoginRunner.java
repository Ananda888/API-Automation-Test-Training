package runner;
import com.intuit.karate.junit5.Karate;

public class PostLoginRunner {
    @Karate.Test
    Karate runPostLogin(){
        return Karate.run("../../karate/features/post-login/post-login.feature").relativeTo(getClass());
    }

}
