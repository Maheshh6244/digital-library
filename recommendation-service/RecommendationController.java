package com.digitalbook.recommendation.controller;

import com.digitalbook.recommendation.model.Book;
import com.digitalbook.recommendation.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/recommendations")
@CrossOrigin(origins = "*")
public class RecommendationController {
    
    @Autowired
    private RecommendationService recommendationService;
    
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Book>> getRecommendations(@PathVariable Long userId) {
        return ResponseEntity.ok(recommendationService.getRecommendations(userId));
    }
    
    @GetMapping("/popular")
    public ResponseEntity<List<Book>> getPopularBooks() {
        return ResponseEntity.ok(recommendationService.getPopularBooks());
    }
}
