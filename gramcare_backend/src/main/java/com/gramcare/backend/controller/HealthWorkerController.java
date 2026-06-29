package com.gramcare.backend.controller;

import com.gramcare.backend.entity.HealthWorkerVisit;
import com.gramcare.backend.entity.Survey;
import com.gramcare.backend.service.HealthWorkerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/health-worker")
@RequiredArgsConstructor
public class HealthWorkerController {
    private final HealthWorkerService healthWorkerService;

    @GetMapping("/visits")
    public ResponseEntity<List<HealthWorkerVisit>> getVisits(@RequestParam UUID workerId) {
        return ResponseEntity.ok(healthWorkerService.getVisitsByWorker(workerId));
    }

    @PostMapping("/visits")
    public ResponseEntity<HealthWorkerVisit> logVisit(@RequestParam UUID workerId, @RequestParam UUID patientId, @RequestBody HealthWorkerVisit visit) {
        return ResponseEntity.ok(healthWorkerService.logVisit(workerId, patientId, visit));
    }

    @PostMapping("/surveys")
    public ResponseEntity<Survey> submitSurvey(@RequestParam UUID workerId, @RequestParam UUID patientId, @RequestBody Survey survey) {
        return ResponseEntity.ok(healthWorkerService.submitSurvey(workerId, patientId, survey));
    }

    @GetMapping("/surveys")
    public ResponseEntity<List<Survey>> getSurveys(@RequestParam UUID workerId) {
        return ResponseEntity.ok(healthWorkerService.getSurveysByWorker(workerId));
    }
}
