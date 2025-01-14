## Overview
This is a generated connector from [Sakari](https://sakari.io/) OpenAPI Specification. 

Sakari provides an advanced platform to drive large scale customized SMS communication. To find out more about our product offering, please visit [https://sakari.io](https://sakari.io).

This module supports Sakari REST API v1.0.1.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Sakari developer account](https://hub.sakari.io/)
- Obtain tokens - Login into [https://hub.sakari.io](https://hub.sakari.io) and obtain tokens following [this guide](https://developer.sakari.io/docs#section/Finding-your-client-id-client-secret-and-account-id)
 
## Quickstart
To use the Sakari connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/sakari module into the Ballerina project.
```ballerina
import ballerinax/sakari;
```
### Step 2: Create a new connector instance
You can now make the connection configuration using the obtained credentials.
```ballerina
sakari:ClientConfig configuration = {
    authConfig: {
        clientId: <>,
        clientSecret: <>,
        tokenUrl: "https://api.sakari.io/oauth2/token"   
    }
};

sakari:Client sakariClient = check new Client(configuration);

```
### Step 3: Invoke the operation
1. Now you can use the operations available within the connector. Following code demonstrates how to fetch all Sakari contacts. 
```ballerina
public function main() returns error? {
    string accountId = <ACCOUNT_ID>;
    sakari:ContactsResponse contactsResponse = check sakariClient->fetchAllContacts(accountId);
}
``` 
2. Use `bal run` command to compile and run the Ballerina program.
