package com.digitalBorrowing.catalog.controller;

import com.digitalBorrowing.catalog.model.Borrowing;
import com.digitalBorrowing.catalog.service.BorrowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/borrowings")
@CrossOrigin(origins = "*")
public class BorrowingController {
    
    @Autowired
    private BorrowingService BorrowingService;
    
    @GetMapping("/user/{userId}")
    public ResponseEntity<Borrowing> getBorrowingById(@PathVariable Long UserId) {
        return ResponseEntity.ok(BorrowingService.getBorrowingById(UserId));
    }
    
    @PostMapping("/borrow")
    public ResponseEntity<Borrowing> addBorrowing(@RequestBody Borrowing Borrowing) {
        return ResponseEntity.ok(BorrowingService.saveBorrowing(borrowing));
    }
    
    @PutMapping("/return/{id}")
    public ResponseEntity<Borrowing> updateBorrowing(@PathVariable Long id, @RequestBody Borrowing Borrowing) {
        Borrowing.setId(id);
        return ResponseEntity.ok(BorrowingService.saveBorrowing(borrowing));
    }
}
