package com.gramcare.backend.controller;

import com.gramcare.backend.entity.Prescription;
import com.gramcare.backend.service.PrescriptionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/prescriptions")
@RequiredArgsConstructor
public class PrescriptionController {
    private final PrescriptionService prescriptionService;

    @GetMapping
    public ResponseEntity<List<Prescription>> getPrescriptions(@RequestParam UUID userId) {
        return ResponseEntity.ok(prescriptionService.getPrescriptions(userId));
    }

    @PostMapping("/upload")
    public ResponseEntity<Prescription> uploadPrescription(@RequestParam UUID userId, @RequestBody Prescription prescription) {
        // In a real app, this would involve multipart file upload and AI analysis
        // For now, we save the metadata
        return ResponseEntity.ok(prescriptionService.savePrescription(userId, prescription));
    }
}
