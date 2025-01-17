## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

All HubSpot objects store data in default and custom properties. These endpoints provide access to read and modify object properties in HubSpot.
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Properties connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.property module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.property;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
property:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

property:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation

1. Create a property instance

```ballerina
property:Property property = {
    groupName: "contactinformation",
    hidden: false,
    displayOrder: 0,
    options: [
            {
                label: "Option A",
                description: "Choice number one",
                value: "A",
                displayOrder: 1,
                hidden: false
            } 
    ],
    label: "My Contact Property",
    description: "",
    fieldType: "select",
    name: "name",
    'type: "enumeration"
};

property:Property|error bEvent = baseClient->create("deals", property);

if (bEvent is property:Property) {
    log:printInfo("Created the property" + bEvent.toString());
} else {
    test:assertFail(msg = bEvent.toString());
}
```
2. List properties

```ballerina
property:CollectionResponseProperty|error bEvent = baseClient->getAll("deals");

if (bEvent is property:CollectionResponseProperty) {
    log:printInfo("Property list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

3. Use `bal run` command to compile and run the Ballerina program
