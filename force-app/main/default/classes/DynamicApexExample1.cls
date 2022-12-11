public with sharing class DynamicApexExample1 {
    public Static Map<String, String> getObjectAPINameToLabelMap() {
        Map<String, String> objectAPINameToLabelMap = new Map<String, String>();
        
        //Note: Schema.SObjectType --> Schema is namespace not class
        //Note: Schema.getGlobalDescribe --> Schema is class
        //getGlobalDescribe will give all sOjects metadata
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();

        //Iterating each sObject one by one
        for(String globalDescribe: globalDescribeMap.keySet()) {

            //Fetchig current sObject type
            Schema.SObjectType currentSObjectType = globalDescribeMap.get(globalDescribe);

            //Getting the current sObject description result
            Schema.DescribeSObjectResult currentSObjectResult = currentSObjectType.getDescribe();

            objectAPINameToLabelMap.put(currentSObjectResult.getName(), currentSObjectResult.getLabel());
        }

        for (String key : objectAPINameToLabelMap.keySet()) {
            System.debug(key + ': ' + objectAPINameToLabelMap.get(key));
        }
        return objectAPINameToLabelMap;
    }
}
