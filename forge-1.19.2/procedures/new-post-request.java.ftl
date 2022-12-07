(new Object(){
    public HttpPost createRequest(String url, String bodyJson) {
        try {
            JsonObject inputobject = new JsonParser().parse(bodyJson).getAsJsonObject();
            String body = "";
            for (Map.Entry<String, JsonElement> item : inputobject.entrySet()) {
                body += item.getKey() + "=" + item.getValue().getAsString() + "&";
            }
            StringEntity params = new StringEntity(body);
            HttpPost httppost = new HttpPost(url);
            httppost.addHeader("content-type", "application/x-www-form-urlencoded");
            httppost.setEntity(params);
			return httppost;
        } catch (IOException e) {
            System.out.println("Error fetching URL");
			return null;
        }
    }
}).createRequest(${input$url}, ${input$body})