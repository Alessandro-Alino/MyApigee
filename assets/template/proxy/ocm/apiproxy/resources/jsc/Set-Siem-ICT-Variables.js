//get content length as requested by field BytesReceived
var responseContent = context.getVariable('response.content');
if (responseContent === null) {
  var contentLength = "-";
}
else {
  var contentLength = responseContent.length;
}
context.setVariable("responseContentLength", contentLength);

//Retrieve "-" when 401 received, otherwise pass the IP as requested by field BasicAuth
var messagestatuscode = context.getVariable('message.status.code');
if (messagestatuscode === 401) {
  var basicauth = "-";
}
else {
  var basicauth = context.getVariable('proxy.client.ip');
}
context.setVariable("basicauth", basicauth);


//Retrieve "-" when JSESSIONID not set as requested in JSESSIONID field
var idsession = context.getVariable("request.header.JSESSIONID");
if (!(idsession)) {
  var sessionresult = "-";
}
else {
  var sessionresult = context.getVariable("request.header.JSESSIONID");
}
context.setVariable("sessionresult", sessionresult);


//Remove "https" string from the origin as requested by Splunk for Host field
var fulldns = context.getVariable("request.header.origin");
if (!(fulldns)) {
  var deletehttpbeforedns = "-";
}
else {
  var deletehttpbeforedns = fulldns.slice(8);
}
context.setVariable("deletehttpbeforedns", deletehttpbeforedns);

//Retrieve "-" when Referrer not set as requested in Referrer field
var referrer = context.getVariable("request.header.Referer");
var ref;
if (referrer === null) {
  ref = "-";
}
else {
  ref = context.getVariable("request.header.Referer");
}
context.setVariable("ref", ref);


var start, end, delta;

//The timestamp value specifying when the proxy started sending the request
//to the URL specified in the TargetEndpoint
start = context.getVariable('target.sent.start.timestamp');

//The timestamp value specifying when the TargetEndpoint finished receiving the response
//from the target.
end = context.getVariable('target.received.end.timestamp');
delta = (end - start);
context.setVariable('target-server-elapsed', delta);

//The timestamp value specifying when the proxy began receiving the request
//from the originating client at the ProxyEndpoint
start = context.getVariable('client.received.start.timestamp');

//The timestamp value specifying when the ProxyEndpoint finished returning the response
//to the originating client app
//end = context.getVariable('client.sent.end.timestamp');
//print("client.sent.end.timestamp: " +end);
//CAN NOT USE THIS VARIABLE BECAUSE IT IS NOT PRESENT IN PROXY POST FLOW

//WE'LL USE system.timestamp
end = context.getVariable('system.timestamp');
delta = (end - start);
context.setVariable('time-total-elapsed', delta);

//Time taken to send request in microseconds
var timeTakenToServeRequest = (delta * 1000);
context.setVariable("timeTakenToServeRequest", timeTakenToServeRequest);