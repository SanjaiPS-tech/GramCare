package com.gramcare.backend.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NvidiaAiService {

    @Value("${nvidia.api.key}")
    private String apiKey;

    @Value("${nvidia.api.url}")
    private String apiUrl;

    @Value("${nvidia.api.model}")
    private String model;

    private final RestTemplate restTemplate = new RestTemplate();

    public String generateResponse(String prompt) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);

        Map<String, Object> body = Map.of(
            "model", model,
            "messages", List.of(
                Map.of("role", "user", "content", prompt)
            ),
            "temperature", 0.5,
            "top_p", 0.7,
            "max_tokens", 1024
        );

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(apiUrl, entity, Map.class);
            if (response.getStatusCode() == HttpStatus.OK) {
                List<Map<String, Object>> choices = (List<Map<String, Object>>) response.getBody().get("choices");
                Map<String, Object> message = (Map<String, Object>) choices.get(0).get("message");
                return (String) message.get("content");
            }
        } catch (Exception e) {
            return "Error calling NVIDIA AI: " + e.getMessage();
        }
        return "I'm sorry, I couldn't process your request at this time.";
    }
}
