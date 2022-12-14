public with sharing class DynamicApexExample1 {
    public Static Map<String, String> getAllObjectsAPINameToLabelMap() {
        Map<String, String> objectAPINameToLabelMap = new Map<String, String>();
        
        //Note: Schema.SObjectType --> Schema is namespace not class
        //Note: Schema.getGlobalDescribe --> Schema is class
        //getGlobalDescribe will give all sOjects metadata
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();

        //Iterating each sObject one by one
        for(String globalDescribeKey: globalDescribeMap.keySet()) {

            //Fetchig current sObject type
            Schema.SObjectType currentSObjectType = globalDescribeMap.get(globalDescribeKey);

            //Getting the current sObject description result
            Schema.DescribeSObjectResult currentSObjectResult = currentSObjectType.getDescribe();

            objectAPINameToLabelMap.put(currentSObjectResult.getName(), currentSObjectResult.getLabel());
        }

        for (String key : objectAPINameToLabelMap.keySet()) {
            System.debug(key + ': ' + objectAPINameToLabelMap.get(key));
        }
        return objectAPINameToLabelMap;
    }

    public Static Map<String, String> getObjectDetailsMap(String objectName) {
        Map<String, String> objectDetailsMap = new Map<String, String>();
        //Getting SObjectType from the string
        Schema.SObjectType currentObjectType = Schema.getGlobalDescribe().get(ObjectName);
        Schema.DescribeSobjectResult currentSObjectResult = currentObjectType.getDescribe();
        objectDetailsMap.put('API Name', currentSObjectResult.getName());
        objectDetailsMap.put('Is Custom Object', String.valueOf(currentSObjectResult.isCustom()));
        System.debug(objectDetailsMap.get('API Name'));
        System.debug(objectDetailsMap.get('Is Custom Object'));
        return objectDetailsMap;
    }
}
