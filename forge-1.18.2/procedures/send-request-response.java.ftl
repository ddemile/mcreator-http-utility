(new Object(){
	public String getResponse(HttpUriRequest request){
	    try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
            CloseableHttpResponse httpresponse = httpclient.execute(request);
    	    HttpEntity entity = httpresponse.getEntity();
			String responseString = EntityUtils.toString(entity, "UTF-8");
			return responseString;
        } catch (IOException e) {
            System.out.println("Error fetching URL");
			return null;
        }
    }
}.getResponse(${input$request}))