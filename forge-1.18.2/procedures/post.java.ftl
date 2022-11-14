

try {
    JsonObject inputobject = new JsonParser().parse(${input$json}).getAsJsonObject();
    String urlString = "";
    for (Map.Entry<String, JsonElement> item : inputobject.entrySet()) {
        urlString += item.getKey() + "=" + item.getValue().getAsString() + "&";
    }
    CloseableHttpClient httpclient = HttpClients.createDefault();
    StringEntity params = new StringEntity(urlString);
    HttpPost httppost = new HttpPost(${input$url});
    httppost.addHeader("content-type", "application/x-www-form-urlencoded");
    httppost.setEntity(params);
    CloseableHttpResponse httpresponse = httpclient.execute(httppost);
} catch (IOException e) {
    System.out.println("Error fetching URL");
}