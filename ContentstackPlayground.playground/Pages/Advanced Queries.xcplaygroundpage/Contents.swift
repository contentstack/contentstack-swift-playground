//: [Previous](@previous)
/*:
 ---
# Advanced Queries
 
### Initialization
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

entryObj.fetch({ (responseType, error) in
    //error if exists then use 'error' object for details
    print("Entry: \(entryObj.createdAt)")
})
/*:
 ### Get a multiple entries
 This query lets you fetch multiple entries of a particular content type. The example snippet given below fetches entries by their UIDs from the content type 'news'.
 var contentTypeObj:ContentType = stack.contentType(withName:"news")
 print(contentTypeObj)
 */

var newsQuery:Query = contentTypeObj.query()
newsQuery.find { (type, res, error) in
    print("multiple entries: \(res?.getResult())")
}
/*:
## whereKey:lessThan:
 This method provides only the entries with values less than the specified value for a field.
 
- Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */

newsQuery.whereKey("_version", lessThan:NSNumber(value: 20))
newsQuery.find { (responsetype, result, error) in
    print("whereKey:lessThan:\(result?.getResult())")
}

/*:
 ## whereKey:lessThanOrEqualTo:
 This method provides only the entries with values less than or equal to the specified value for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */
newsQuery.whereKey("_version", lessThanOrEqualTo:NSNumber(value: 6))
newsQuery.find { (responsetype, result, error) in
    print("whereKey:lessThanOrEqualTo: \(result?.getResult())")
}

/*:
 ## whereKey:greaterThan:
 This method provides only the entries with values greater than the specified value for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */
newsQuery.whereKey("_version", greaterThan:NSNumber(value: 5))
newsQuery.find { (responsetype, result, error) in
    print("whereKey:greaterThan: \(result?.getResult())")
}

/*:
 ## whereKey:greaterThanOrEqualTo:
 This method provides only the entries with values greater than or equal to the specified value for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */
newsQuery.whereKey("_version", greaterThanOrEqualTo:NSNumber(value: 17))
newsQuery.find { (responsetype, result, error) in
    print("whereKey:greaterThanOrEqualTo: \(result?.getResult())")
}
/*:
 ## whereKey:equalTo:
 This method provides only the entries matching the specified value for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */
newsQuery.whereKey("title", equalTo:"Welcome")
newsQuery.find { (responsetype, result, error) in
    print("whereKey:equalTo: \(result?.getResult())")
}
/*:
 ## whereKey:notEqualTo:
 This method provides only the entries with values not equal to the specified value for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* The value used to match or compare
 */
newsQuery.whereKey("title", notEqualTo:"Welcome")
newsQuery.find { (responsetype, result, error) in
    print("whereKey:notEqualTo: \(result?.getResult())")
}

/*:
 ## whereKey:containedIn:
 This method provides only the entries with values matching the specified values for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* An array of values that are to be used to match or compare
 */
newsQuery.whereKey("title", containedIn:["Demo", "Welcome"])
newsQuery.find { (responsetype, result, error) in
    print("whereKey:containedIn: \(result?.getResult())")
}


/*:
 ## whereKey:notContainedIn:
 This method provides only the entries that do not contain values matching the specified values for a field.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *object:* An array of values that are to be used to match or compare
 */
newsQuery.whereKey("title", notContainedIn: ["Demo","Welcome"])
newsQuery.find { (responsetype, result, error) in
    print("whereKey:notContainedIn: \(result?.getResult())")
}

/*:
 ## whereKeyExists:
 This method provides only the entries that contains the field matching the specified field uid.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
 */
newsQuery.whereKeyExists("introduction")
newsQuery.find { (responsetype, result, error) in
    print("whereKeyExists: \(result?.getResult())")
}

/*:
 ## whereKeyDoesNotExist:
 This method provides only the entries that do not contain the field matching the specified field uid.
 
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
 */
newsQuery.whereKeyDoesNotExist("introduction")
newsQuery.find { (responsetype, result, error) in
    print("whereKeyDoesNotExist: \(result?.getResult())")
}

/*:
 ## orderByAscending:
 This parameter sorts the provided entries in the ascending order on the basis of the specified field.
 
 - Parameters
    - *key:* field uid based on which the ordering should be done.
 */
newsQuery = contentTypeObj.query()
newsQuery.order(byAscending:"created_at")
newsQuery.find { (responsetype, result, error) in
    print("orderByAscending: \(result?.getResult())")
}

/*:
 ## orderByDescending:
 This method sorts the provided entries in the descending order on the basis of the specified field.
 
 - Parameters
    - *key:* field uid based on which the ordering should be done.
 */
print(newsQuery.order(byDescending:"updated_at"))
newsQuery.find { (responsetype, result, error) in
    print("orderByDescending: \(result?.getResult())")
}
/*:
 ## skipObjects:
 This method skips the specified number of entries.
 
 - Parameters
    - *number:* Number of entries to be returned
 */
newsQuery.skipObjects(NSNumber(value:1))
newsQuery.find { (responsetype, result, error) in
    print("skipObjects: \(result?.getResult())")
}
/*:
 ## limitObjects:
 This method limits the response by providing only the specified number of entries.
 
 - Parameters
    - *number:* Number of entries to be returned
 */
newsQuery = contentTypeObj.query()
newsQuery.limitObjects(NSNumber(value:3))
newsQuery.find { (responsetype, result, error) in
    print("limitObjects: \(result?.getResult())")
}

/*:
 ## orWithSubqueries:
 This method performs the OR operation on the specified query objects and provides only the matching entries.
 
 - Parameters
    - *queries:* Array of queries to be taken into consideration
 */
newsQuery = contentTypeObj.query()
var query1:Query = contentTypeObj.query()
query1.whereKey("title", equalTo:"Welcome")
var query2:Query = contentTypeObj.query()
query2.whereKey("title", equalTo:"The Martian Movie Review Ticket Received")
newsQuery.or(withSubqueries:[query1, query2])
newsQuery.find { (responsetype, result, error) in
    print("orWithSubqueries: \(result?.getResult())")
}

/*:
 ## andWithSubqueries:
 This method performs the AND operation on the specified query objects and provides only the matching entries.
 
 - Parameters
    - *queries:* Array of queries to be taken into consideration
 */
newsQuery = contentTypeObj.query()
var query3:Query = contentTypeObj.query()
print( query3.whereKey("_version", greaterThanOrEqualTo:6))
var query4:Query = contentTypeObj.query()
query4.whereKey("_version", equalTo:31)
newsQuery.and(withSubqueries:[query3, query4])
newsQuery.find { (responsetype, result, error) in
    print("andWithSubqueries: \(result?.getResult())")
}

/*:
 ## includeCount:
 This method also includes the total number of entries returned in the response.
 */
newsQuery.includeCount()
newsQuery.find { (responsetype, result, error) in
    print("includeCount: \(result?.totalCount())")
}

/*:
 ## includeSchema:
 This method also includes the schema of the form for the entries returned in the response.
 */
var newsQuery11:Query = contentTypeObj.query()
newsQuery11.includeSchema()
newsQuery11.find { (responsetype, result, error) in
    print("includeSchema: \(result?.schema())")
}

/*:
 ## includeOwner:
 This method also includes owner information for all the entries returned in the response.
  */
newsQuery.includeOwner()
newsQuery.find { (responsetype, result, error) in
    print("includeOwner: \(result?.getResult())")
}

/*:
 ## onlyFields:
 This method provides only the entries that match the specified field uids and corresponding values.
 - Parameters
    - *fieldUIDs:* An array of values that are to be included for the key
 */
newsQuery.onlyFields(["attachments" as String])
newsQuery.find { (responsetype, result, error) in
    print("onlyFields: \(result?.getResult())")
}

/*:
 ## exceptFields:
 This method provides only the entries that match the specified field uids and corresponding values.
 - Parameters
     - *fieldUIDs:* An array of values that are to be included for the key
 */
print(newsQuery.exceptFields(["attachments" as String]))
newsQuery.find { (responsetype, result, error) in
    print("exceptFields: \(result?.getResult())")
}
/*:
 ## whereKey:matchesRegex:
 This method provides only the entries matching the regular expression for the specified field.
    
 - Parameters
     - *key:* Uid of the field that is to be taken into consideration
     - *regex:* The value used to match or compare
     */
newsQuery.whereKey("title", matchesRegex:"^Uber")
newsQuery.find { (responsetype, result, error) in
    print("whereKey:matchesRegex: \(result?.getResult())")
}

/*:
 ## whereKey:matchesRegex:modifiers:
 This method provides only the entries matching the regular expression for the specified field.
     
 - Parameters
     - *key:* Uid of the field that is to be taken into consideration
     - *regex:* The value used to match or compare
     - *modifier:* Modifiers for regex options. Specify ‘i’ as the option to ignore the case.
     */
newsQuery.whereKey("title", matchesRegex:"^Uber", modifiers:"i")
newsQuery.find { (responsetype, result, error) in
    print("whereKey:matchesRegex:modifiers: \(result?.getResult())")
}

/*:
 ## includeReferenceFieldWithKey:
This method provides all entries that also contain data from the referred entry in the specified field.
 
 - Parameters
     - *key:* Uid of the field that is to be taken into consideration
 */

newsQuery.includeReferenceField(withKey:["category" as String])
newsQuery.find { (responsetype, result, error) in
    print("includeReferenceFieldWithKey: \(result?.getResult())")
}

/*:
 ## includeReferenceFieldWithKey:onlyFields:
 This method provides all entries incuding referred entry containing only specified fields.
     
 - Parameters
     - *key:* Uid of the field that is to be taken into consideration
     - *fieldUIDs:* Uid's of the field that is to be taken into consideration
 */
newsQuery.includeReferenceField(withKey: "category", onlyFields: ["title" as String, "uid" as String])
newsQuery.find { (responsetype, result, error) in
    print("includeReferenceFieldWithKey:onlyFields: \(result?.getResult())")
}


/*:
 ## includeReferenceFieldWithKey:excludingFields:
 This method provides all entries incuding referred entry containing all fields except specified fields.
         
 - Parameters
    - *key:* Uid of the field that is to be taken into consideration
    - *fieldUIDs:* Uid's of the field that is to be taken into consideration
 */
newsQuery = contentTypeObj.query()
newsQuery.includeReferenceField(withKey: "category", excludingFields:["title" as String, "publish_details" as String])
newsQuery.find { (responsetype, result, error) in
    print("includeReferenceFieldWithKey:excludingFields: \(result?.getResult())")
}

/*:
 ## tags:
This method provides only the entries that contain tags matching the ones mentioned in the function.
 
 - Parameters
   - *tagsArray:* An array of tags that are to be included for the key

*/
newsQuery = contentTypeObj.query()
newsQuery.tags(["top news" as String])
newsQuery.find { (responsetype, result, error) in
    print("tags: \(result?.getResult())")
}

/*:
 ## search:
This method provides only the entries matching the specified value.
     
 - Parameters
   - *searchString:* The value used to match or compare
 
 */
newsQuery = contentTypeObj.query()
newsQuery.search("New York:")
newsQuery.find { (responsetype, result, error) in
    print("search: \(result?.getResult())")
}

/*:
 ## language:
This method provides all the entries for the specified locale in the response.
 
 - Parameters
   - *language:* Language enum for all language available.
 
 */
newsQuery = contentTypeObj.query()
newsQuery.language(Language.HINDI_INDIA)
newsQuery.find { (responsetype, result, error) in
    print("language: \(result?.getResult())")
}


/*:
 ## addQueryParams:
This method allows you to perform multiple queries on entries.
 
 - Parameters
   - *queryDict:* A dictionary with all the necessary conditions for retrieving objects.
 
 */
newsQuery.addParams([AnyHashable("param1"):"value"])


/*:
 ## removeQueryWithKey:
 Removes custom query.
 
 - Parameters
   - *key:* name of the query.
 
 */
newsQuery.remove(withKey:"_version")
newsQuery.find { (responsetype, result, error) in
    print("removeQueryWithKey: \(result?.getResult())")
}

/*:
 ## find:
 This method provides all the entries from a specified form.
     
 - Parameters
   - *completionBlock:* block to be called once operation is done. The result data contains all entries of the specified contenttype.

*/
newsQuery = contentTypeObj.query()
newsQuery.find { (responseType, result, error) in
    //error for any error description
    //result for reponse data
    print("find: \(result?.getResult())")
}


/*:
 ## findOne:
 This method provides the first entry from a specified form.
 
 - Parameters
 - *completionBlock:* block to be called once operation is done. The result data contains all entries of the specified contenttype.
 
 */
newsQuery.findOne{(responseType, entry, error) in
    print("findOne: \(entry))")
}

/*:
 ---
 */
//: [Next](@next)
