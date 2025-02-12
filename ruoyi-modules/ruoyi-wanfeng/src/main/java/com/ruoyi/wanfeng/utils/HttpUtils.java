package com.ruoyi.wanfeng.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.http.*;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.zip.GZIPInputStream;


@Component
@Slf4j
public class HttpUtils {
    // 自定义拦截器，添加 Accept-Encoding 头
    class GzipRequestInterceptor implements ClientHttpRequestInterceptor {
        @Override
        public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution) throws IOException {
            request.getHeaders().add("Accept-Encoding", "gzip");
            return execution.execute(request, body);
        }
    }

    // 自定义消息转换器，处理 GZIP 压缩的响应
    class GzipHttpMessageConverter extends StringHttpMessageConverter {
        @Override
        protected String readInternal(Class<? extends String> clazz, HttpInputMessage inputMessage) throws IOException {
            HttpHeaders headers = inputMessage.getHeaders();
            String contentEncoding = headers.getFirst("Content-Encoding");
            InputStream bodyStream = inputMessage.getBody();
            if (contentEncoding != null && contentEncoding.contains("gzip")) {
                bodyStream = new GZIPInputStream(bodyStream);
            }
            InputStream finalBodyStream = bodyStream;
            return super.readInternal(clazz, new HttpInputMessage() {
                @Override
                public HttpHeaders getHeaders() {
                    return headers;
                }

                @Override
                public InputStream getBody() {
                    return finalBodyStream;
                }
            });
        }
    }
    private final static RestTemplate restTemplate = new RestTemplate();
    {
        // 添加自定义拦截器
        List<ClientHttpRequestInterceptor> interceptors = new ArrayList<>();
        interceptors.add(new GzipRequestInterceptor());
        restTemplate.setInterceptors(interceptors);
        // 获取原有的消息转换器列表
        List<HttpMessageConverter<?>> existingConverters = restTemplate.getMessageConverters();

        // 创建新的消息转换器列表，并将自定义转换器放在首位
        List<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
        messageConverters.add(new GzipHttpMessageConverter());
        messageConverters.addAll(existingConverters);

        // 将新的消息转换器列表设置给 RestTemplate
        restTemplate.setMessageConverters(messageConverters);
    }
    public static CloseableHttpClient createSSLClientDefault() {
        try {
            // 信任所有
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, (chain, authType) -> true).build();
            HostnameVerifier hostnameVerifier = NoopHostnameVerifier.INSTANCE;
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, hostnameVerifier);
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        } catch (KeyManagementException | NoSuchAlgorithmException | KeyStoreException e) {
            log.error(e.getMessage());
        }
        return HttpClients.createDefault();
    }

    /**
     * 发送 GET 请求
     *
     * @param url          请求的 URL
     * @param headers      请求头
     * @param params       请求参数
     * @param postProcess  后置处理函数，可对响应进行后置处理
     * @param responseType 响应的数据类型
     * @param <T>          响应的数据类型
     * @return 处理后的响应结果
     */
    public <T> T get(String url, Map<String, String> headers, Map<String, String> params, Function<ResponseEntity<T>, T> postProcess, Class<T> responseType) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36");
        httpHeaders.set("Accept-Charset", "UTF-8");
        if (headers != null) {
            httpHeaders.setAll(headers);
        }
        HttpEntity<?> httpEntity = new HttpEntity<>(httpHeaders);
        ResponseEntity<T> responseEntity = restTemplate.exchange(url, HttpMethod.GET, httpEntity, responseType, params == null ? new HashMap<>() : params);
        // 后置处理
        if (postProcess != null) {
            return postProcess.apply(responseEntity);
        } else {
            return responseEntity.getBody();
        }
    }

    /**
     * 发送 GET 请求
     *
     * @param url          请求的 URL
     * @param headers      请求头
     * @param params       请求参数
     * @param responseType 响应的数据类型
     * @param <T>          响应的数据类型
     * @return 处理后的响应结果
     */
    public <T> T get(String url, Map<String, String> headers, Map<String, String> params, Class<T> responseType) {
        HttpHeaders httpHeaders = new HttpHeaders();
        if (headers != null) {
            httpHeaders.setAll(headers);
        }
        httpHeaders.set("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36");
        httpHeaders.set("Accept-Charset", "UTF-8");
        HttpEntity<?> httpEntity = new HttpEntity<>(httpHeaders);
        ResponseEntity<T> responseEntity = restTemplate.exchange(url, HttpMethod.GET, httpEntity, responseType, params == null ? new HashMap<>() : params);
        return responseEntity.getBody();
    }

    /**
     * 发送 POST 请求
     *
     * @param url          请求的 URL
     * @param headers      请求头
     * @param params       请求参数
     * @param postProcess  后置处理函数，可对响应进行后置处理
     * @param responseType 响应的数据类型
     * @param <T>          响应的数据类型
     * @return 处理后的响应结果
     */
    public <T> T post(String url, Map<String, String> headers, Map<String, String> params, Function<ResponseEntity<T>, T> postProcess, Class<T> responseType) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36");
        httpHeaders.set("Accept-Charset", "UTF-8");
        if (headers != null) {
            httpHeaders.setAll(headers);
        }
        HttpEntity<Map<String, String>> httpEntity = new HttpEntity<>(params, httpHeaders);
        ResponseEntity<T> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, responseType, params == null ? new HashMap<>() : params);
        // 后置处理
        if (postProcess != null) {
            return postProcess.apply(responseEntity);
        } else {
            return responseEntity.getBody();
        }
    }

    /**
     * 发送 POST 请求
     *
     * @param url          请求的 URL
     * @param headers      请求头
     * @param params       请求参数
     * @param responseType 响应的数据类型
     * @param <T>          响应的数据类型
     * @return 处理后的响应结果
     */
    public <T> T post(String url, Map<String, String> headers, Map<String, String> params, Class<T> responseType) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36");
        httpHeaders.set("Accept-Charset", "UTF-8");
        if (headers != null) {
            httpHeaders.setAll(headers);
        }
        HttpEntity<Map<String, String>> httpEntity = new HttpEntity<>(params, httpHeaders);
        ResponseEntity<T> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, responseType, params == null ? new HashMap<>() : params);
        return responseEntity.getBody();
    }

    // 因restTemplate返回Html一直乱码，换另一种解决
    public String getForHtml(String url, Map<String, String> queryParams, Map<String, String> headers) {
        HttpClient client = createSSLClientDefault();
        HttpGet httpGet = new HttpGet(url);
        httpGet.addHeader("Cookie", headers.get("Cookie")); // 不知道缺哪个字段，索性全部使用
        HttpResponse resp;
        String respContent = null;
        try {
            resp = client.execute(httpGet);
            org.apache.http.HttpEntity entity = resp.getEntity();
            respContent = EntityUtils.toString(entity, "UTF-8");
            return respContent;
        } catch (Exception e) {
            log.error(e.getMessage());
            log.info("Bili Get请求错误 -- " + e);
            return respContent;
        }
    }
}
