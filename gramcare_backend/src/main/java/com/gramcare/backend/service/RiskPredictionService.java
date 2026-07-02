package com.gramcare.backend.service;

import com.gramcare.backend.entity.RiskPrediction;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.RiskPredictionRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RiskPredictionService {
    private final RiskPredictionRepository riskPredictionRepository;
    private final UserRepository userRepository;
    private final NvidiaAiService nvidiaAiService;

    public Optional<RiskPrediction> getLatestRisk(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return riskPredictionRepository.findFirstByUserOrderByPredictedAtDesc(user);
    }

    @Transactional
    public RiskPrediction generatePrediction(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        
        String prompt = "Analyze the health risks for a patient with the following profile: " + user.getName() + 
            ". Consider their age and potential rural health challenges. " +
            "Provide a health score (0-100), risk levels for Diabetes and Hypertension (LOW, MEDIUM, HIGH), " +
            "and concise recommendations for an elderly person.";
            
        String aiResponse = nvidiaAiService.generateResponse(prompt);
        
        // Simple mock extraction logic for demo purposes
        RiskPrediction prediction = RiskPrediction.builder()
                .user(user)
                .healthScore(82) 
                .riskLevel("LOW")
                .diabetesRisk("LOW")
                .hypertensionRisk("MEDIUM")
                .complianceRisk("LOW")
                .hospitalizationRisk("LOW")
                .recommendations(aiResponse)
                .predictedAt(LocalDateTime.now())
                .build();
        
        return riskPredictionRepository.save(prediction);
    }
}
