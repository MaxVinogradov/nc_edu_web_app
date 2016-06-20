package nc.sumy.edu.webapp.orm;

import nc.sumy.edu.webapp.database.DataBaseConnection;
import nc.sumy.edu.webapp.database.DataBaseConnectionH2;
import nc.sumy.edu.webcontainer.common.integration.SocialNetworkInfo;
import nc.sumy.edu.webapp.orm.domain.Portal;
import nc.sumy.edu.webapp.orm.domain.Post;
import nc.sumy.edu.webapp.orm.domain.User;
import nc.sumy.edu.webcontainer.common.integration.SocialNetworks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;

public class LoadingServiceImpl implements LoadingService {
    private final DataBaseConnection dataBaseConnection =
            new DataBaseConnectionH2();
    private static final String SELECT_USER =
            "SELECT * FROM PUBLIC.USERS WHERE LOGIN = ?;";
    private static final String SELECT_PORTAL =
            "SELECT * FROM PUBLIC.PORTALS WHERE USER_ID = ?;";
    private static final String SELECT_ACCOUNT =
            "SELECT * FROM PUBLIC.ACCOUNTS WHERE ACCOUNT_ID = ?;";
    private static final String SELECT_POSTS =
            "SELECT * FROM PUBLIC.POSTS WHERE USER_ID = ?;";
    /*
    private static final String SELECT_ACCOUNTS_VIA_PORTS =
            "SELECT ACC.ACCOUNT_ID, ACC.SERVICE_NAME, ACC.LOGIN, ACC.PASSWORD, ACC.LAST_TOKEN, ACC.RAW_RESPONSE " +
                    "FROM   PUBLIC.ACCOUNTS ACC, PUBLIC.PORTALS PORT " +
                    "WHERE  ACC.USER_ID = PORT.USER_ID AND ACC.USER_ID = ?;";
    */
    private static final String SELECT_ACCOUNTS_VIA_PORTS =
            "SELECT ACC.* \n" +
                    "FROM   \n" +
                    "  PUBLIC.ACCOUNTS acc\n" +
                    "  ,PUBLIC.PORTALS port \n" +
                    "WHERE  port.USER_ID = ?\n" +
                    "AND acc.ACCOUNT_ID = port.ACCOUNT_ID;";


    @Override
    public User loadUser(String login) {
        try (Connection conn = dataBaseConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_USER)) {
            statement.setString(1, login);
            try (ResultSet resultSet = statement.executeQuery()) {
                User user = new User();
                resultSet.next();
                user.setUserId(resultSet.getInt("USER_ID"))
                        .setLogin(resultSet.getString("LOGIN"))
                        .setPassword(resultSet.getString("PASSWORD"))
                        .setMail(resultSet.getString("MAIL"))
                        .setBirthDate(resultSet.getDate("BIRTHDAY"));
                return user;
            }
        } catch (SQLException e) {
            //throw new LoadingServiceException("Unable to load a new user: " + login, e);
            return null;
        }
    }

    @Override
    public Collection<Portal> loadPortals(int userId) {
        Collection<Portal> collection = new ArrayList<>();
        try (Connection conn = dataBaseConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_PORTAL)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    collection.add(new Portal(resultSet.getInt("USER_ID"), resultSet.getInt("ACCOUNT_ID")));
                }
            }
        } catch (SQLException e) {
            throw new LoadingServiceException("Unable to load a portals of user: " + userId, e);
        }
        return collection;
    }

    @Override
    public SocialNetworkInfo loadAccount(int accountId) {
        SocialNetworkInfo socialNetworkInfo = new SocialNetworkInfo();
        try (Connection conn = dataBaseConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_ACCOUNT)) {
            statement.setInt(1, accountId);
            try (ResultSet resultSet = statement.executeQuery()) {
                //socialNetworkInfo.setAccountId(resultSet.getInt("ACCOUNT_ID"));
                if(resultSet.next()) {
                    String type = resultSet.getString("SERVICE_NAME");
                    SocialNetworks typeN = SocialNetworks.getNetworkType(type);
                    socialNetworkInfo.setServiceName(typeN);
                    //socialNetworkInfo.setLogin(resultSet.getString("LOGIN"));
                    //socialNetworkInfo.setPassword(resultSet.getString("PASSWORD"));
                    socialNetworkInfo.setLastToken(resultSet.getString("LAST_TOKEN"));
                    socialNetworkInfo.setAdditionalTokenField(resultSet.getString("RAW_RESPONSE"));
                }
            }
        } catch (SQLException e) {
            throw new LoadingServiceException("Unable to load a socialNetworkInfo with accountId: " + accountId, e);
        }
        return socialNetworkInfo;
    }

    public Collection<SocialNetworkInfo> loadAccountsWithTwoMethods(int userId) {
        Collection<Portal> portals = loadPortals(userId);
        Collection<SocialNetworkInfo> infos = new HashSet<>();
        for (Portal portal : portals) {
            SocialNetworkInfo info = loadAccount((int) portal.getAccountId());
            infos.add(info);
        }
        return infos;
    }

    @Override
    public Collection<SocialNetworkInfo> loadAccounts(int userId) {
        Collection<SocialNetworkInfo> collection = new HashSet<>();
        try (Connection conn = dataBaseConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_ACCOUNTS_VIA_PORTS)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    SocialNetworkInfo socialNetworkInfo = new SocialNetworkInfo();
                    socialNetworkInfo.setAccountId(resultSet.getInt("ACCOUNT_ID"));
                    socialNetworkInfo.setServiceName(SocialNetworks
                            .getNetworkType(resultSet.getString("SERVICE_NAME")));
                    socialNetworkInfo.setLogin(resultSet.getString("LOGIN"));
                    socialNetworkInfo.setPassword(resultSet.getString("PASSWORD"));
                    socialNetworkInfo.setLastToken(resultSet.getString("LAST_TOKEN"));
                    socialNetworkInfo.setAdditionalTokenField(resultSet.getString("RAW_RESPONSE"));
                    collection.add(socialNetworkInfo);
                }
            }
        } catch (SQLException e) {
            throw new LoadingServiceException("Unable to load a accounts set of user: " + userId, e);
        }
        return collection;
    }

    @Override
    public Collection<Post> loadPosts(int userId) {
        Collection<Post> collection = new ArrayList<>();
        try (Connection conn = dataBaseConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_POSTS)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Post post = new Post();
                    post.setUserId(resultSet.getInt("USER_ID"))
                            .setPostId(resultSet.getInt("POST_ID"))
                            .setPublishDate(resultSet.getDate("PUBLISH_DATE"))
                            .setTitle(resultSet.getString("TITLE"))
                            .setBody(resultSet.getString("BODY"));
                    collection.add(post);
                }
            }
        } catch (SQLException e) {
            throw new LoadingServiceException("Unable to load a post of user: " + userId, e);
        }
        return collection;
    }

}
