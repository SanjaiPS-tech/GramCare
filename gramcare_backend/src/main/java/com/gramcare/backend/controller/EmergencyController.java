package com.gramcare.backend.controller;

import com.gramcare.backend.entity.EmergencyAlert;
import com.gramcare.backend.entity.EmergencyContact;
import com.gramcare.backend.service.EmergencyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/emergency")
@RequiredArgsConstructor
public class EmergencyController {
    private final EmergencyService emergencyService;

    @GetMapping("/contacts")
    public ResponseEntity<List<EmergencyContact>> getContacts(@RequestParam UUID userId) {
        return ResponseEntity.ok(emergencyService.getContacts(userId));
    }

    @PostMapping("/contacts")
    public ResponseEntity<EmergencyContact> addContact(@RequestParam UUID userId, @RequestBody EmergencyContact contact) {
        return ResponseEntity.ok(emergencyService.addContact(userId, contact));
    }

    @PostMapping("/alert")
    public ResponseEntity<EmergencyAlert> triggerAlert(@RequestParam UUID userId, @RequestBody EmergencyAlert alert) {
        return ResponseEntity.ok(emergencyService.triggerAlert(userId, alert));
    }

    @GetMapping("/alerts")
    public ResponseEntity<List<EmergencyAlert>> getAlerts(@RequestParam UUID userId) {
        return ResponseEntity.ok(emergencyService.getAlerts(userId));
    }
}
