package nc.sumy.edu.webapp.integration;

import nc.sumy.edu.webcontainer.common.integration.ResultOfPostSubmit;
import nc.sumy.edu.webcontainer.common.integration.SocialNetworkInfo;
import nc.sumy.edu.webcontainer.common.integration.SocialNetworks;
import org.testng.annotations.Test;

import java.util.*;

import static org.testng.Assert.assertEquals;


public class IntegrationImplTest {
    private static final IntegrationImpl INTEGRATION = new IntegrationImpl();

    @Test
    public void testSubmitPostInvalidSetParameter(){
        Set resultEmpty = INTEGRATION.submitPost(new HashSet<SocialNetworkInfo>(), "post message");
        Set resultNull = INTEGRATION.submitPost(null, "post message");
        assertEquals(resultEmpty, Collections.emptySet(),
                "Publishing to empty set of integrations must return empty set of results");
        assertEquals(resultNull, Collections.emptySet(),
                "Publishing to null set returns must return empty set of results");
    }

    @Test
    public void testSubmitPostInvalidMessageParameter(){
        SocialNetworkInfo info = new SocialNetworkInfo(1, SocialNetworks.VK, "token", "token additional field");
        Set<SocialNetworkInfo> infos = new HashSet<>();
        infos.add(info);
        Set<ResultOfPostSubmit> result = new HashSet<>();
        result.add(new ResultOfPostSubmit(info, false));
        Set<ResultOfPostSubmit> actualEmptyString = INTEGRATION.submitPost(infos, "");
        Set<ResultOfPostSubmit> actualNull = INTEGRATION.submitPost(infos, null);
        assertEquals(actualEmptyString, result, "Publishing empty string must return empty set of results all false");
        assertEquals(actualNull, result, "Publishing null string must return set of results all false");
    }

    @Test
    public void testSubmitWithInvalidNetworkType() {
        SocialNetworkInfo info = new SocialNetworkInfo(2, SocialNetworks.VK, "ten", " additional field");
        Set<SocialNetworkInfo> infos = new HashSet<>();
        infos.add(info);
        Map<SocialNetworks, SocialNetworkIntegration> integrationMapping = new HashMap<>();
        Set<ResultOfPostSubmit> actual = new IntegrationImpl(integrationMapping).submitPost(infos, "message");
        Set<ResultOfPostSubmit> result = new HashSet<>();
        result.add(new ResultOfPostSubmit(info, false));
        assertEquals(actual, result, "Publishing to network that isn't in integration mapping" +
                " must return set of results all false");
    }

    @Test
    public void testSubmitPostValidParameters(){
        SocialNetworkInfo infoNullToken = new SocialNetworkInfo(3, SocialNetworks.VK, null, "token additional field");
        SocialNetworkInfo infoNullAddFieldToken = new SocialNetworkInfo(4, SocialNetworks.VK, "token",
                null);
        SocialNetworkInfo infoEmptyAddFieldToken = new SocialNetworkInfo(5, SocialNetworks.VK, "token", "");
        SocialNetworkInfo infoEmptyToken = new SocialNetworkInfo(7, SocialNetworks.VK, "", "token additional field");

        Set<SocialNetworkInfo> infoNull = new HashSet<>();
        infoNull.add(infoNullToken);
        infoNull.add(infoNullAddFieldToken);

        Set<SocialNetworkInfo> infoEmpty = new HashSet<>();
        infoEmpty.add(infoEmptyAddFieldToken);
        infoEmpty.add(infoEmptyToken);

        Set<ResultOfPostSubmit> resultNull = new HashSet<>();
        resultNull.add(new ResultOfPostSubmit(infoNullToken, false));
        resultNull.add(new ResultOfPostSubmit(infoNullAddFieldToken, false));

        Set<ResultOfPostSubmit> resultEmpty = new HashSet<>();
        resultEmpty.add(new ResultOfPostSubmit(infoEmptyAddFieldToken, false));
        resultEmpty.add(new ResultOfPostSubmit(infoEmptyToken, false));

        Set<ResultOfPostSubmit> actualNull = INTEGRATION.submitPost(infoNull, "message");
        Set<ResultOfPostSubmit> actualEmpty = INTEGRATION.submitPost(infoEmpty, "message");
        assertEquals(actualNull,
                resultNull, "Publishing message to networks with null token/add.token field must return set of results all false");
        assertEquals(actualEmpty,
                resultEmpty, "Publishing message to networks with empty token/add.token field must return set of results all false");
    }
}
