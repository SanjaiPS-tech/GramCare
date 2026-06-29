package com.gramcare.backend.controller;

import com.gramcare.backend.entity.HealthWorkerVisit;
import com.gramcare.backend.entity.Survey;
import com.gramcare.backend.service.SyncService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/sync")
@RequiredArgsConstructor
public class SyncController {
    private final SyncService syncService;

    @PostMapping("/offline-data")
    public ResponseEntity<Void> syncData(@RequestParam UUID workerId, @RequestBody SyncRequest request) {
        syncService.syncOfflineData(workerId, request.getVisits(), request.getSurveys());
        return ResponseEntity.ok().build();
    }

    @Data
    public static class SyncRequest {
        private List<HealthWorkerVisit> visits;
        private List<Survey> surveys;
    }
}
