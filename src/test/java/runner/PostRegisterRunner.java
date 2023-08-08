package runner;
import com.intuit.karate.junit5.Karate;

public class PostRegisterRunner {
    @Karate.Test
    Karate runPostRegister(){
        return Karate.run("../../karate/features/post-register/post-register.feature").relativeTo(getClass());
    }

}
