import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
/*
// These URLs are endpoints that are provided by the authorization
// server. They're usually included in the server's documentation of its
// OAuth2 API.
final authorizationEndpoint =
Uri.parse("https://developer-test.raiffeisen.ro/oauth2/authorize");
final tokenEndpoint =
Uri.parse("https://developer-test.raiffeisen.ro/oauth2/token");

// The authorization server will issue each client a separate client
// identifier and secret, which allows the server to tell which client
// is accessing it. Some servers may also have an anonymous
// identifier/secret pair that any client may use.
//
// Note that clients whose source code or binary executable is readily
// available may not be able to make sure the client secret is kept a
// secret. This is fine; OAuth2 servers generally won't rely on knowing
// with certainty that a client is who it claims to be.
final identifier = "d34dff49-7413-4801-b126-56fca1f0e539";
final secret = "G2pS6rX4jS5gW3aJ2cB0oE7lF6nQ2iM7lG1aC2lY1iT3hB3tL2";

// This is a URL on your application's server. The authorization server
// will redirect the resource owner here once they've authorized the
// client. The redirection will include the authorization code in the
// query parameters.
final redirectUrl = Uri.parse("https://testapi-rbi-merlin.apiconnect.ibmcloud.com/development/sb/forms-application/process-access-token");

/// A file in which the users credentials are stored persistently. If the server
/// issues a refresh token allowing the client to refresh outdated credentials,
/// these may be valid indefinitely, meaning the user never has to
/// re-authenticate.
final credentialsFile = new File("~/.myapp/credentials.json");

/// Either load an OAuth2 client from saved credentials or authenticate a new
/// one.
Future<oauth2.Client> getClient() async {
  var exists = await credentialsFile.exists();

  // If the OAuth2 credentials have already been saved from a previous run, we
  // just want to reload them.
  if (exists) {
    var credentials = new oauth2.Credentials.fromJson(
        await credentialsFile.readAsString());
    return new oauth2.Client(credentials,
        identifier: identifier, secret: secret);
  }

  // If we don't have OAuth2 credentials yet, we need to get the resource owner
  // to authorize us. We're assuming here that we're a command-line application.
  var grant = new oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  // Redirect the resource owner to the authorization URL. This will be a URL on
  // the authorization server (authorizationEndpoint with some additional query
  // parameters). Once the resource owner has authorized, they'll be redirected
  // to `redirectUrl` with an authorization code.
  //
  // `redirect` is an imaginary function that redirects the resource
  // owner's browser.
  await redirect(grant.getAuthorizationUrl(redirectUrl));

  // Another imaginary function that listens for a request to `redirectUrl`.
  var request = await listen(redirectUrl);

  // Once the user is redirected to `redirectUrl`, pass the query parameters to
  // the AuthorizationCodeGrant. It will validate them and extract the
  // authorization code to create a new Client.
  return await grant.handleAuthorizationResponse(request.uri.queryParameters);
}

main() async {
  var client = await getClient();

  // Once you have a Client, you can use it just like any other HTTP client.
  var result = client.read("http://example.com/protected-resources.txt");

  // Once we're done with the client, save the credentials file. This ensures
  // that if the credentials were automatically refreshed while using the
  // client, the new credentials are available for the next run of the
  // program.
  await credentialsFile.writeAsString(client.credentials.toJson());

  print(result);
}*/
class OauthProvider{

void Login() async {
  final authorizationEndpoint =
  Uri.parse("https://developer-test.raiffeisen.ro/node/320/oauth2/token");

  final username = "9999999999";
  final password = "9999";

  // Something like this
  final identifier = "mavEZjJgs9d4JwvvXsANZgN5Dz5GFxzfj616752A";
  final secret = "hcAFRwvtGqzhKrMPH2Vqm1vncuZt2YTVfTs6LcdNcnKPdEH3J0T1njIwurryofrvDMnzOvhQDVbaC9Gt5DctciTv3n89s7JSGjpHtzkbEfLpkOT5y6YHN3p6grQlYGd59";

  // Make a request to the authorization endpoint that will produce the fully
  // authenticated Client.
  var client = await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint, username, password,
      identifier: identifier, secret: secret);

  // Once you have the client, you can use it just like any other HTTP client.
  var result = await client.get("https://developer-test.raiffeisen.ro/node/323/accounts");

  print(result.toString());
  // Once we're done with the client, save the credentials file. This will allow
  // us to re-use the credentials and avoid storing the username and password
  // directly.
  new File("~/.myapp/credentials.json")
      .writeAsString(client.credentials.toJson());
  }
}