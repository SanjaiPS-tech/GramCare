package com.gramcare.backend.controller;

import com.gramcare.backend.entity.HealthRecord;
import com.gramcare.backend.service.HealthRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/health-records")
@RequiredArgsConstructor
public class HealthRecordController {
    private final HealthRecordService healthRecordService;

    @GetMapping
    public ResponseEntity<List<HealthRecord>> getRecords(@RequestParam UUID userId) {
        return ResponseEntity.ok(healthRecordService.getRecords(userId));
    }

    @PostMapping
    public ResponseEntity<HealthRecord> saveRecord(@RequestParam UUID userId, @RequestBody HealthRecord record) {
        return ResponseEntity.ok(healthRecordService.saveRecord(userId, record));
    }
}
