package com.wedding.weddingplanner.controller;

import com.wedding.exception.InvalidPaymentException;
import com.wedding.util.FileHandler;
import com.wedding.weddingplanner.model.Booking;
import com.wedding.weddingplanner.model.Payment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Controller
@RequestMapping("/payments")
public class PaymentController {

    private static final String PAYMENTS_FILE = "data/payments.txt";
    private static final String BOOKINGS_FILE = "data/bookings.txt";

    @GetMapping("/checkout/{bookingId}")
    public String showCheckout(@PathVariable String bookingId, Model model) {
        model.addAttribute("bookingId", bookingId);
        return "checkout";
    }

    @PostMapping("/process")
    public String processPayment(
            @RequestParam String bookingId,
            @RequestParam double amount,
            @RequestParam String paymentMethod,
            Model model) {
        try {
            if (amount <= 0) {
                throw new InvalidPaymentException("Amount must be greater than zero!");
            }

            String paymentId = FileHandler.generateId(PAYMENTS_FILE, "PAY");
            String paymentDate = LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            Payment payment = new Payment(
                    paymentId, bookingId, amount,
                    paymentMethod, "COMPLETED", paymentDate
            );
            FileHandler.appendSingleLine(PAYMENTS_FILE, payment.toFileString());

            String record = FileHandler.findRecord(BOOKINGS_FILE, bookingId, 0);
            if (record != null) {
                Booking booking = Booking.fromFileString(record);
                if (booking != null) {
                    booking.setStatus("CONFIRMED");
                    FileHandler.updateRecord(BOOKINGS_FILE, bookingId, 0, booking.toFileString());
                }
            }

        } catch (InvalidPaymentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("bookingId", bookingId);
            return "checkout";
        } catch (Exception e) {
            System.err.println("Error processing payment: " + e.getMessage());
        }
        return "redirect:/bookings";
    }

    @GetMapping
    public String viewPayments(Model model) {
        ArrayList<Payment> payments = new ArrayList<>();
        ArrayList<String> lines = FileHandler.readAllLines(PAYMENTS_FILE);
        for (String line : lines) {
            Payment p = Payment.fromFileString(line);
            if (p != null) payments.add(p);
        }
        model.addAttribute("payments", payments);
        return "payments";
    }
}