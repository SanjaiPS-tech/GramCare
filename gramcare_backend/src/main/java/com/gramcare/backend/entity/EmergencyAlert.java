package com.gramcare.backend.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "emergency_alerts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmergencyAlert {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private Double latitude;

    private Double longitude;

    @Column(nullable = false)
    private String alertType;

    @Column(nullable = false)
    private String status;

    @Column(nullable = false, updatable = false)
    @Builder.Default
    private LocalDateTime triggeredAt = LocalDateTime.now();

    private LocalDateTime resolvedAt;
}
