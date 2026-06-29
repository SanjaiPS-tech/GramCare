package com.gramcare.backend.service;

import com.gramcare.backend.entity.HealthWorkerVisit;
import com.gramcare.backend.entity.Survey;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.HealthWorkerVisitRepository;
import com.gramcare.backend.repository.SurveyRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class HealthWorkerService {
    private final HealthWorkerVisitRepository visitRepository;
    private final SurveyRepository surveyRepository;
    private final UserRepository userRepository;

    public List<HealthWorkerVisit> getVisitsByWorker(UUID workerId) {
        return visitRepository.findByWorkerIdOrderByVisitedAtDesc(workerId);
    }

    @Transactional
    public HealthWorkerVisit logVisit(UUID workerId, UUID patientId, HealthWorkerVisit visit) {
        User patient = userRepository.findById(patientId)
                .orElseThrow(() -> new RuntimeException("Patient not found"));
        visit.setWorkerId(workerId);
        visit.setPatient(patient);
        visit.setVisitedAt(LocalDateTime.now());
        return visitRepository.save(visit);
    }

    @Transactional
    public Survey submitSurvey(UUID workerId, UUID patientId, Survey survey) {
        User patient = userRepository.findById(patientId)
                .orElseThrow(() -> new RuntimeException("Patient not found"));
        survey.setWorkerId(workerId);
        survey.setPatient(patient);
        survey.setCompletedAt(LocalDateTime.now());
        return surveyRepository.save(survey);
    }

    public List<Survey> getSurveysByWorker(UUID workerId) {
        return surveyRepository.findByWorkerIdOrderByCompletedAtDesc(workerId);
    }
}
