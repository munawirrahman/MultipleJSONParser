@isTest
private class MultipleJSONParserTest {

    public static testMethod void TestParse() {
    	Test.startTest();
            List<MultipleJSONParser.Request> listRequest =new List<MultipleJSONParser.Request>();
    		MultipleJSONParser.Request req = new MultipleJSONParser.Request();
        	MultipleJSONParser.Request reqNoError = new MultipleJSONParser.Request();
 	       	req.jsonStringToParse = '{"id": "0001","total":200, "repeat":true,"ppu": 0.55,"batters":{"batter":[{ "id": "1001", "type": "Regular" },{ "id": "1002", "type": "Chocolate" },{ "id": "1003", "type": "Blueberry" },{ "id": "1004", "type": "Devils Food" }]},"topping":[{ "id": "5001", "type": null},{ "id": "5002", "type": "Glazed" },{ "id": "5005", "type": "Sugar" },{ "id": "5007", "type": "Powdered Sugar" },{ "id": "5006", "type": "Chocolate with Sprinkles" },{ "id": "5003", "type": "Chocolate" },{ "id": "5004", "type": "Maple" }]}';
        	req.ignore_error = True;
    		req.fieldName1 = 'id';
        	req.fieldName2 = 'total';
        	req.fieldName3 = 'repeat';
        	req.fieldName4 = 'ppu';
        	req.fieldName5 = 'batters.batter.[0]id';
        	req.fieldName6 = 'batters.batter.[1]type';
        	req.fieldName7 = 'topping.[0]id';
        	req.fieldName8 = 'topping.[0]type';
        	req.fieldName9 = 'batters.batter.[0]';
        	req.fieldName10 = 'batters.batter';
        	req.fieldName11 = 'topping.[10]id';
        	reqNoError.jsonStringToParse = '{"id": "0001","total":200, "repeat":true,"ppu": 0.55,"batters":{"batter":[{ "id": "1001", "type": "Regular" },{ "id": "1002", "type": "Chocolate" },{ "id": "1003", "type": "Blueberry" },{ "id": "1004", "type": "Devils Food" }]},"topping":[{ "id": "5001", "type": null},{ "id": "5002", "type": "Glazed" },{ "id": "5005", "type": "Sugar" },{ "id": "5007", "type": "Powdered Sugar" },{ "id": "5006", "type": "Chocolate with Sprinkles" },{ "id": "5003", "type": "Chocolate" },{ "id": "5004", "type": "Maple" }]}';
        	reqNoError.ignore_error = False;
        	reqNoError.fieldName12 = 'id';
        	listRequest.add(reqNoError);
        	listRequest.add(req);
        	List<MultipleJSONParser.ResultValue> listResult = MultipleJSONParser.MultipleJSONParser(listRequest);

        Test.stopTest();
        System.assertEquals('0001', listResult[0].Value01);
        System.assertEquals('200', listResult[0].Value02);
        System.assertEquals('true', listResult[0].Value03);
        System.assertEquals('0.55', listResult[0].Value04);
        System.assertEquals('1001', listResult[0].Value05);
        System.assertEquals('Chocolate', listResult[0].Value06);
        System.assertEquals('5001', listResult[0].Value07);
        System.assertEquals(null, listResult[0].Value08);
        System.assertEquals('{"type":"Regular","id":"1001"}', listResult[0].Value09);
        System.assertEquals('[{"type":"Regular","id":"1001"},{"type":"Chocolate","id":"1002"},{"type":"Blueberry","id":"1003"},{"type":"Devils Food","id":"1004"}]', listResult[0].Value10);
        System.assertEquals('[Error catched] : List index out of bounds: 10', listResult[0].Value11);
    }
}