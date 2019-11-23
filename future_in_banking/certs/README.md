![DevHacks 2019](https://api.myconnector.ro/files/events/logo/175/529e3c2db8e94cfa68c5e73ece5f4591.png)
---
## Challenge: Future in Banking
### Raiffeisen Bank OpenBanking API Details
* Sandbox URL: https://developer-test.raiffeisen.ro/
* Sample TPP Certificate: [devhacks.crt](devhacks.crt), [devhacks.key](devhacks.key)
* Sample TPP Certificate private key password: `devhacks`

### Tips and Tricks
#### Create an Application
* Recommended OAuthRedirect URI: https://testapi-rbi-merlin.apiconnect.ibmcloud.com/development/sb/forms-application/process-access-token
* On Certificate fiels you should put the content of [devhacks.crt](devhacks.crt) (from `-----BEGIN CERTIFICATE-----` until `-----END CERTIFICATE-----`)
#### Use APIs
* You should subscribe to OAuth2 API, Accounts API and Payments API
#### Test Data
* Test Data could be found here: https://developer-test.raiffeisen.ro/pisp_test_data
