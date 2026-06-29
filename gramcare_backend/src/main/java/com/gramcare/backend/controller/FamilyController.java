package com.gramcare.backend.controller;

import com.gramcare.backend.entity.FamilyMonitoring;
import com.gramcare.backend.service.FamilyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/family")
@RequiredArgsConstructor
public class FamilyController {
    private final FamilyService familyService;

    @GetMapping("/linked-users")
    public ResponseEntity<List<FamilyMonitoring>> getLinkedElderly(@RequestParam UUID familyMemberId) {
        return ResponseEntity.ok(familyService.getLinkedElderly(familyMemberId));
    }

    @PostMapping("/link")
    public ResponseEntity<FamilyMonitoring> linkToElderly(@RequestBody Map<String, Object> request) {
        UUID familyMemberId = UUID.fromString(request.get("familyMemberId").toString());
        UUID elderlyUserId = UUID.fromString(request.get("elderlyUserId").toString());
        String relationship = request.get("relationship").toString();
        
        return ResponseEntity.ok(familyService.linkToElderly(familyMemberId, elderlyUserId, relationship));
    }

    @PutMapping("/approve/{linkId}")
    public ResponseEntity<FamilyMonitoring> approveLink(@PathVariable UUID linkId) {
        return ResponseEntity.ok(familyService.approveLink(linkId));
    }
}
