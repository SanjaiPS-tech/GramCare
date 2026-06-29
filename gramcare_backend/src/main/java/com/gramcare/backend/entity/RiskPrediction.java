package com.gramcare.backend.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "risk_predictions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RiskPrediction {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private Integer healthScore;

    private String riskLevel; // LOW, MEDIUM, HIGH, CRITICAL

    private String diabetesRisk;

    private String hypertensionRisk;

    private String complianceRisk;

    private String hospitalizationRisk;

    @Column(columnDefinition = "TEXT")
    private String recommendations;

    @Column(nullable = false, updatable = false)
    @Builder.Default
    private LocalDateTime predictedAt = LocalDateTime.now();
}
