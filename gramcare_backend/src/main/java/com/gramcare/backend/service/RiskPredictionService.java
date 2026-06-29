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

    public Optional<RiskPrediction> getLatestRisk(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return riskPredictionRepository.findFirstByUserOrderByPredictedAtDesc(user);
    }

    @Transactional
    public RiskPrediction generatePrediction(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        
        // In a real app, logic would gather medicine logs, health records, 
        // and call Gemini AI to produce these scores.
        RiskPrediction prediction = RiskPrediction.builder()
                .user(user)
                .healthScore(75) // Mock score
                .riskLevel("MEDIUM")
                .diabetesRisk("LOW")
                .hypertensionRisk("MEDIUM")
                .complianceRisk("LOW")
                .hospitalizationRisk("LOW")
                .recommendations("Keep maintaining your current routine. Monitor salt intake.")
                .predictedAt(LocalDateTime.now())
                .build();
        
        return riskPredictionRepository.save(prediction);
    }
}
