try {
    CloseableHttpClient httpclient = HttpClients.createDefault();
    CloseableHttpResponse httpresponse = httpclient.execute(${input$request});
} catch (IOException e) {
    System.out.println("Error fetching URL");
}