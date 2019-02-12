/*:
---
 # Query Guide
 Queries are requests that you can send to Contentstack. This section of our Guide explains how to write queries that will let you fetch exactly what you are looking for. The following queries are accompanied by examples to help you understand them better.
 
## Initialization
 To initialize, you will need to specify the stack's API Key, Access Token, and Environment's name.
 The snippet given below initializes your iOS SDK.
 */

import Contentstack
import PlaygroundSupport

let AccessToken = "***REMOVED***"
let APIKEY = "***REMOVED***"
let EnvironmentName = "production"

PlaygroundPage.current.needsIndefiniteExecution = true

let stack:Stack = Contentstack.stack(withAPIKey: APIKEY, accessToken: AccessToken, environmentName: EnvironmentName)
print(stack)
/*:
 ## Get a single entry
 The example snippet given below lets you retrieve a single entry ("***REMOVED***") from the 'news' content type.
 */
var contentTypeObj:ContentType = stack.contentType(withName:"news")
print(contentTypeObj)

//consider '***REMOVED***' is uid of an entry of 'news' contenttype
var entryObj:Entry = contentTypeObj.entry(withUID:"***REMOVED***")

entryObj.fetch { (responseTyep, error) in
    print("Entry: \(entryObj.contentTypeName)")

}
/*:
 ## Get a multiple entries
 This query lets you fetch multiple entries of a particular content type. The example snippet given below fetches entries by their UIDs from the content type 'news'.
 var contentTypeObj:ContentType = stack.contentType(withName:"news")
 print(contentTypeObj)

 */

var newsQuery:Query = contentTypeObj.query()
print(newsQuery)
newsQuery.find { (type, res, error) in
    print("multiple entries: \(res?.getResult())")
}
/*:
 ## What's Next
 So far, we have covered how to get multiple entries of a content type. Let us now look at the list of Advanced Queries that enable you to fetch specific entries based on certain conditions.
 
- [**View Advanced Queries**](Advanced%20Queries)
 
 We also have Image Delivery API. You can try

- [**Image Delivery API**](Image%20Delivery%20API)

 
 */
