package steps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.testng.Reporter;
import pages.SauceDemoLoginPage;
import tests.BaseTest;

public class MainSteps extends BaseTest{
    String browser = Reporter.getCurrentTestResult().getTestContext().getCurrentXmlTest().getParameter("browser");
    String env = Reporter.getCurrentTestResult().getTestContext().getCurrentXmlTest().getParameter("env");
    String quit = Reporter.getCurrentTestResult().getTestContext().getCurrentXmlTest().getParameter("quit");

    @Before
    public void setup() throws Exception {
        init(browser);

    }

    @After
    public void tearDown(){
        if(quit.equalsIgnoreCase("yes")){
            quit();
        }
    }

    @Given("I am on the sauce demo page")
    public void iAmOnTheSauceDemoPage() throws Exception {
        openApp(env);
    }

    @When("I enter valid username {string}")
    public void iEnterValidUsername(String username) throws Exception {
        SauceDemoLoginPage sauceDemoLoginPage = new SauceDemoLoginPage(driver);
        sauceDemoLoginPage.enterUsername(username);
    }

    @And("I enter valid password {string}")
    public void iEnterValidPassword(String password) throws Exception {
        new SauceDemoLoginPage(driver).enterPassword(password);
    }

    @And("I click on the login button")
    public void iClickOnTheLoginButton() throws Exception {
        new SauceDemoLoginPage(driver).clickOnLoginButton();
    }

    @Then("I should be logged in")
    public void iShouldBeLoggedIn() {
        new SauceDemoLoginPage(driver).menuShouldBeVisible();
    }

    @And("I should be able to see products")
    public void iShouldBeAbleToSeeProducts() {
        new SauceDemoLoginPage(driver).titleShouldBeVisible();
    }

    @Then("I should get an error message {string}")
    public void iShouldGetAnErrorMessage(String errorMessage) {
        new SauceDemoLoginPage(driver).verifyErrorMessage(errorMessage);
    }
}
