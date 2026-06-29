package com.gramcare.backend.service;

import com.gramcare.backend.entity.Medicine;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.MedicineRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MedicineService {
    private final MedicineRepository medicineRepository;
    private final UserRepository userRepository;

    public List<Medicine> getMedicines(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return medicineRepository.findByUserAndIsActiveTrue(user);
    }

    @Transactional
    public Medicine addMedicine(UUID userId, Medicine medicine) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        medicine.setUser(user);
        return medicineRepository.save(medicine);
    }

    @Transactional
    public Medicine updateMedicine(UUID id, Medicine medicineDetails) {
        Medicine medicine = medicineRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Medicine not found"));
        
        medicine.setName(medicineDetails.getName());
        medicine.setDosage(medicineDetails.getDosage());
        medicine.setFrequency(medicineDetails.getFrequency());
        medicine.setTiming(medicineDetails.getTiming());
        medicine.setStartDate(medicineDetails.getStartDate());
        medicine.setEndDate(medicineDetails.getEndDate());
        medicine.setInstructions(medicineDetails.getInstructions());
        medicine.setActive(medicineDetails.isActive());
        
        return medicineRepository.save(medicine);
    }

    @Transactional
    public void deleteMedicine(UUID id) {
        Medicine medicine = medicineRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Medicine not found"));
        medicine.setActive(false);
        medicineRepository.save(medicine);
    }
}
