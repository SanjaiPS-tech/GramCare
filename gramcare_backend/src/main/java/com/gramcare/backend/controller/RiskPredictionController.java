package com.gramcare.backend.controller;

import com.gramcare.backend.entity.RiskPrediction;
import com.gramcare.backend.service.RiskPredictionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/risk")
@RequiredArgsConstructor
public class RiskPredictionController {
    private final RiskPredictionService riskPredictionService;

    @GetMapping("/{userId}")
    public ResponseEntity<RiskPrediction> getLatestRisk(@PathVariable UUID userId) {
        return riskPredictionService.getLatestRisk(userId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.noContent().build());
    }

    @PostMapping("/{userId}/predict")
    public ResponseEntity<RiskPrediction> generatePrediction(@PathVariable UUID userId) {
        return ResponseEntity.ok(riskPredictionService.generatePrediction(userId));
    }
}
