package com.gramcare.backend.repository;

import com.gramcare.backend.entity.Appointment;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, UUID> {
    List<Appointment> findByPatient(User patient);
    List<Appointment> findByDoctorId(UUID doctorId);
}
