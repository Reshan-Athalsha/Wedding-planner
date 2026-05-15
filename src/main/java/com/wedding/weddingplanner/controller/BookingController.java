package com.wedding.weddingplanner.controller;

import com.wedding.util.FileHandler;
import com.wedding.weddingplanner.model.Booking;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Controller
@RequestMapping("/bookings")
public class BookingController {

    private static final String BOOKINGS_FILE = "data/bookings.txt";

    @GetMapping
    public String viewBookings(Model model) {
        ArrayList<Booking> bookings = new ArrayList<>();
        ArrayList<String> lines = FileHandler.readAllLines(BOOKINGS_FILE);
        for (String line : lines) {
            Booking b = Booking.fromFileString(line);
            if (b != null) bookings.add(b);
        }
        model.addAttribute("bookings", bookings);
        return "bookings";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("booking", new Booking());
        return "bookingForm";
    }

    @PostMapping("/new")
    public String createBooking(
            @RequestParam String clientName,
            @RequestParam String vendorName,
            @RequestParam String eventDate) {
        try {
            String bookingId = FileHandler.generateId(BOOKINGS_FILE, "BKG");
            String createdDate = LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            Booking booking = new Booking(
                    bookingId, clientName, vendorName,
                    eventDate, "PENDING", createdDate
            );
            FileHandler.appendSingleLine(BOOKINGS_FILE, booking.toFileString());
        } catch (Exception e) {
            System.err.println("Error creating booking: " + e.getMessage());
        }
        return "redirect:/bookings";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        String record = FileHandler.findRecord(BOOKINGS_FILE, id, 0);
        if (record != null) {
            model.addAttribute("booking", Booking.fromFileString(record));
            return "editBooking";
        }
        return "redirect:/bookings";
    }

    @PostMapping("/edit")
    public String updateBooking(
            @RequestParam String bookingId,
            @RequestParam String clientName,
            @RequestParam String vendorName,
            @RequestParam String eventDate,
            @RequestParam String status,
            @RequestParam String createdDate) {
        try {
            Booking updated = new Booking(
                    bookingId, clientName, vendorName,
                    eventDate, status, createdDate
            );
            FileHandler.updateRecord(BOOKINGS_FILE, bookingId, 0, updated.toFileString());
        } catch (Exception e) {
            System.err.println("Error updating booking: " + e.getMessage());
        }
        return "redirect:/bookings";
    }

    @GetMapping("/cancel/{id}")
    public String cancelBooking(@PathVariable String id) {
        try {
            String record = FileHandler.findRecord(BOOKINGS_FILE, id, 0);
            if (record != null) {
                Booking booking = Booking.fromFileString(record);
                if (booking != null) {
                    booking.setStatus("CANCELLED");
                    FileHandler.updateRecord(BOOKINGS_FILE, id, 0, booking.toFileString());
                }
            }
        } catch (Exception e) {
            System.err.println("Error cancelling booking: " + e.getMessage());
        }
        return "redirect:/bookings";
    }

    @GetMapping("/delete/{id}")
    public String deleteBooking(@PathVariable String id) {
        try {
            FileHandler.deleteRecord(BOOKINGS_FILE, id, 0);
        } catch (Exception e) {
            System.err.println("Error deleting booking: " + e.getMessage());
        }
        return "redirect:/bookings";
    }
}
