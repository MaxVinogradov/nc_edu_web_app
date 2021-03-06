package nc.sumy.edu.webapp.orm;

import nc.sumy.edu.webcontainer.common.integration.SocialNetworkInfo;
import nc.sumy.edu.webapp.orm.domain.Portal;
import nc.sumy.edu.webapp.orm.domain.Post;
import nc.sumy.edu.webapp.orm.domain.User;

public interface StoringService {

    /**
     * @param  user without PK, just POJO
     * @return user with primary key or id
    */
    User addUser(User user);

    Post addPost(Post post);

    SocialNetworkInfo addAccount(int userId, SocialNetworkInfo socialNetworkInfo);

    Portal addPortal(Portal portal);

    User updateUser(User user);

    Post updatePost(Post post);

    SocialNetworkInfo updateAccount(SocialNetworkInfo socialNetworkInfo);

    Portal updatePortal(Portal portal);

}
