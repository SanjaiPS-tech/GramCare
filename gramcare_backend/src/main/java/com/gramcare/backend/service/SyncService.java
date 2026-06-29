package com.gramcare.backend.service;

import com.gramcare.backend.entity.HealthWorkerVisit;
import com.gramcare.backend.entity.Survey;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SyncService {
    private final HealthWorkerService healthWorkerService;

    @Transactional
    public void syncOfflineData(UUID workerId, List<HealthWorkerVisit> visits, List<Survey> surveys) {
        // Simple implementation: process each item
        if (visits != null) {
            for (HealthWorkerVisit visit : visits) {
                healthWorkerService.logVisit(workerId, visit.getPatient().getId(), visit);
            }
        }
        
        if (surveys != null) {
            for (Survey survey : surveys) {
                healthWorkerService.submitSurvey(workerId, survey.getPatient().getId(), survey);
            }
        }
    }
}
