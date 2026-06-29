package com.gramcare.backend.controller;

import com.gramcare.backend.entity.Medicine;
import com.gramcare.backend.service.MedicineService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/medicines")
@RequiredArgsConstructor
public class MedicineController {
    private final MedicineService medicineService;

    @GetMapping
    public ResponseEntity<List<Medicine>> getMedicines(@RequestParam UUID userId) {
        return ResponseEntity.ok(medicineService.getMedicines(userId));
    }

    @PostMapping
    public ResponseEntity<Medicine> addMedicine(@RequestParam UUID userId, @RequestBody Medicine medicine) {
        return ResponseEntity.ok(medicineService.addMedicine(userId, medicine));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Medicine> updateMedicine(@PathVariable UUID id, @RequestBody Medicine medicine) {
        return ResponseEntity.ok(medicineService.updateMedicine(id, medicine));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMedicine(@PathVariable UUID id) {
        medicineService.deleteMedicine(id);
        return ResponseEntity.noContent().build();
    }
}
