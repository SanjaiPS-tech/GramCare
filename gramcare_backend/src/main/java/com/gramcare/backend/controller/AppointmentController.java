package com.gramcare.backend.controller;

import com.gramcare.backend.entity.Appointment;
import com.gramcare.backend.service.AppointmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/appointments")
@RequiredArgsConstructor
public class AppointmentController {
    private final AppointmentService appointmentService;

    @GetMapping
    public ResponseEntity<List<Appointment>> getAppointments(@RequestParam UUID patientId) {
        return ResponseEntity.ok(appointmentService.getAppointments(patientId));
    }

    @PostMapping
    public ResponseEntity<Appointment> bookAppointment(@RequestParam UUID patientId, @RequestBody Appointment appointment) {
        return ResponseEntity.ok(appointmentService.bookAppointment(patientId, appointment));
    }

    @PatchMapping("/{id}/status")
    public ResponseEntity<Appointment> updateStatus(@PathVariable UUID id, @RequestBody Map<String, String> request) {
        return ResponseEntity.ok(appointmentService.updateStatus(id, request.get("status")));
    }
}
