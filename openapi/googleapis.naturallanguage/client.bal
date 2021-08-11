// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Google Cloud Natural Language API v1](https://cloud.google.com/natural-language/) OpenAPI specification.
# Provides natural language understanding technologies, such as sentiment analysis, entity recognition, entity sentiment analysis, and other text annotations, to developers.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://language.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Finds named entities (currently proper names and common nouns) in the text along with entity types, salience, mentions for each entity, and other properties.
    #
    # + payload - AnalyzeEntities request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function analyzeentitiesDocuments(AnalyzeEntitiesRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeEntitiesResponse|error {
        string  path = string `/v1/documents:analyzeEntities`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AnalyzeEntitiesResponse response = check self.clientEp->post(path, request, targetType=AnalyzeEntitiesResponse);
        return response;
    }
    # Finds entities, similar to AnalyzeEntities in the text and analyzes sentiment associated with each entity and its mentions.
    #
    # + payload - AnalyzeEntitySentiment request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function analyzeentitysentimentDocuments(AnalyzeEntitySentimentRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeEntitySentimentResponse|error {
        string  path = string `/v1/documents:analyzeEntitySentiment`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AnalyzeEntitySentimentResponse response = check self.clientEp->post(path, request, targetType=AnalyzeEntitySentimentResponse);
        return response;
    }
    # Analyzes the sentiment of the provided text.
    #
    # + payload - AnalyzeSentiment request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function analyzesentimentDocuments(AnalyzeSentimentRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeSentimentResponse|error {
        string  path = string `/v1/documents:analyzeSentiment`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AnalyzeSentimentResponse response = check self.clientEp->post(path, request, targetType=AnalyzeSentimentResponse);
        return response;
    }
    # Analyzes the syntax of the text and provides sentence boundaries and tokenization along with part of speech tags, dependency trees, and other properties.
    #
    # + payload - AnalyzeSyntax request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function analyzesyntaxDocuments(AnalyzeSyntaxRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnalyzeSyntaxResponse|error {
        string  path = string `/v1/documents:analyzeSyntax`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AnalyzeSyntaxResponse response = check self.clientEp->post(path, request, targetType=AnalyzeSyntaxResponse);
        return response;
    }
    # A convenience method that provides all the features that analyzeSentiment, analyzeEntities, and analyzeSyntax provide in one call.
    #
    # + payload - AnnotateText request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function annotatetextDocuments(AnnotateTextRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnnotateTextResponse|error {
        string  path = string `/v1/documents:annotateText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AnnotateTextResponse response = check self.clientEp->post(path, request, targetType=AnnotateTextResponse);
        return response;
    }
    # Classifies a document into categories.
    #
    # + payload - ClassifyText request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function classifytextDocuments(ClassifyTextRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ClassifyTextResponse|error {
        string  path = string `/v1/documents:classifyText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClassifyTextResponse response = check self.clientEp->post(path, request, targetType=ClassifyTextResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
