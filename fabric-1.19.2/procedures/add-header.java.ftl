(new Object(){
    public HttpUriRequest addHeader(String name, String value, HttpUriRequest request) {
        request.addHeader(name, value);
        return request;
    }
}.addHeader(${input$name}, ${input$value}, ${input$request}))