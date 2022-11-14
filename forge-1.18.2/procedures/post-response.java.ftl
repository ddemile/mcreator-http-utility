(new Object(){
	public String getResponse(String inputstring){
	    try {
            JsonObject inputobject = new JsonParser().parse(inputstring).getAsJsonObject();
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
    	    HttpEntity entity = httpresponse.getEntity();
			String responseString = EntityUtils.toString(entity, "UTF-8");
			return responseString;
        } catch (IOException e) {
            System.out.println("Error fetching URL");
			return null;
        }
    }
}.getResponse(${input$json}))