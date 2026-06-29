package com.gramcare.backend.service;

import com.gramcare.backend.entity.Appointment;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.AppointmentRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AppointmentService {
    private final AppointmentRepository appointmentRepository;
    private final UserRepository userRepository;

    public List<Appointment> getAppointments(UUID patientId) {
        User patient = userRepository.findById(patientId)
                .orElseThrow(() -> new RuntimeException("Patient not found"));
        return appointmentRepository.findByPatient(patient);
    }

    @Transactional
    public Appointment bookAppointment(UUID patientId, Appointment appointment) {
        User patient = userRepository.findById(patientId)
                .orElseThrow(() -> new RuntimeException("Patient not found"));
        appointment.setPatient(patient);
        appointment.setCreatedAt(LocalDateTime.now());
        appointment.setStatus("SCHEDULED");
        return appointmentRepository.save(appointment);
    }

    @Transactional
    public Appointment updateStatus(UUID id, String status) {
        Appointment appointment = appointmentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Appointment not found"));
        appointment.setStatus(status);
        return appointmentRepository.save(appointment);
    }
}
