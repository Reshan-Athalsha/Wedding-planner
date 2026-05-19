package com.ttt.shared;

import java.util.Scanner;


public class VivaQuiz {

    private static int totalQuestions = 0;
    private static int correctAnswers = 0;
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        clearScreen();
        printHeader("TIE THE TECH (TTT) WEDDING PLANNER — VIVA PREPARATION TOOL");
        System.out.println("Hello! Your viva and presentation are in a couple of hours.");
        System.out.println("This tool is designed to drill you on the exact architecture, design patterns,");
        System.out.println("OOP principles, and code logic present in your Wedding Planner project.");
        System.out.println();
        System.out.println("Let's make sure you know the code from top to bottom!");
        System.out.println("Press ENTER to start the training session...");
        scanner.nextLine();

        boolean running = true;
        while (running) {
            clearScreen();
            printHeader("SELECT A STUDY MODULE");
            System.out.println("1. [ARCHITECTURE] File-based Persistence & Decoupling");
            System.out.println("2. [OOP CORE] Encapsulation, Inheritance, Abstraction, Polymorphism");
            System.out.println("3. [SECURITY] Delimiter Injection & XSS Protection");
            System.out.println("4. [COMPONENTS] Concrete Logic of Modules 1 to 6");
            System.out.println("5. [FULL MOCK VIVA] All Categories Mixed (10 Questions)");
            System.out.println("6. Exit and Review Quick Study Cheat Sheet");
            System.out.println();
            System.out.print("Choose an option (1-6): ");
            String choice = scanner.nextLine().trim();

            switch (choice) {
                case "1":
                    runArchitectureModule();
                    break;
                case "2":
                    runOOPModule();
                    break;
                case "3":
                    runSecurityModule();
                    break;
                case "4":
                    runComponentsModule();
                    break;
                case "5":
                    runMockViva();
                    break;
                case "6":
                    running = false;
                    break;
                default:
                    System.out.println("\nInvalid choice. Press Enter to try again.");
                    scanner.nextLine();
            }
        }

        clearScreen();
        printHeader("VIVA SESSION WRAP-UP");
        System.out.println("Great job studying! Here is your quick confidence score:");
        if (totalQuestions > 0) {
            double scorePct = ((double) correctAnswers / totalQuestions) * 100;
            System.out.printf("Questions Attempted: %d | Correct: %d (%d%%)\n", totalQuestions, correctAnswers, (int) scorePct);
            if (scorePct >= 90) {
                System.out.println("Status: EXCELLENT! You are ready to ace your viva! 🌟");
            } else if (scorePct >= 70) {
                System.out.println("Status: SOLID. Review the security and inheritance definitions one more time. 👍");
            } else {
                System.out.println("Status: KEEP PRACTICING. Run through the mock exam again to memorize key answers. 📚");
            }
        } else {
            System.out.println("No questions attempted yet.");
        }
        System.out.println("\nGood luck with your viva and presentation! You've got this!");
    }

    private static void runArchitectureModule() {
        totalQuestions = 0;
        correctAnswers = 0;
        clearScreen();
        printHeader("MODULE 1: ARCHITECTURE & PERSISTENCE");

        askQuestion(
            "1. How is data persisted in the TTT Wedding Planner application?",
            "A. In a MySQL relational database managed via Hibernate/JPA.",
            "B. In flat files (data/*.txt) using a custom Pipe-Delimited (|) text format.",
            "C. Locally inside an SQLite database file via custom JDBC connections.",
            "D. In memory only, using static ArrayLists that wipe on application restart.",
            'B',
            "WHY IT IS THERE:\n" +
            "The system uses zero-dependency flat-file storage inside 'data/users.txt', 'data/vendors.txt', etc.\n" +
            "This fulfills academic constraints of bypassing database servers and operating purely through Java File I/O\n" +
            "(using BufferedReader and BufferedWriter)."
        );

        askQuestion(
            "2. How does Component 06 (Admin Analytics) count records in other modules while remaining decoupled?",
            "A. It calls controller endpoints of other packages over HTTP.",
            "B. It autowires all other component repositories to access their .size() methods.",
            "C. It reads each flat file's line count directly via a utility method `countLines(String filePath)` using `Files.lines()`.",
            "D. It maintains duplicate list copies of users, bookings, and reviews in its own repository.",
            'C',
            "WHY IT IS THERE:\n" +
            "In `AdminController.java`, we use direct file path reading `countLines(\"data/users.txt\")`.\n" +
            "By doing so, the Admin component doesn't need to import or depend on Component 1, 2, 3, 4, or 5 repositories.\n" +
            "This is a brilliant showcase of high cohesion and low coupling in system design!"
        );

        askQuestion(
            "3. What happens in repository `save()` operations when an entity with an existing ID is updated?",
            "A. The save throws a runtime duplicate key exception.",
            "B. The repository appends the new state, leaving duplicate older lines in the text file.",
            "C. The repository reads all lines, matches the ID, replaces the item in the ArrayList, and rewrites the entire file.",
            "D. Flat files do not support updating; users must manually delete and recreate entries.",
            'C',
            "WHY IT IS THERE:\n" +
            "Because flat files lack indexes or transactional updates, the repository CRUD pattern is:\n" +
            "1) Load all records from text file into an ArrayList.\n" +
            "2) Search for the ID in the list. If found, replace the old object. If not, append it.\n" +
            "3) Rewrite the entire ArrayList back to the text file with clean overwrites."
        );

        pressEnterToContinue();
    }

    private static void runOOPModule() {
        totalQuestions = 0;
        correctAnswers = 0;
        clearScreen();
        printHeader("MODULE 2: OBJECT-ORIENTED PROGRAMMING (OOP) CORE");

        askQuestion(
            "1. What is the role of `FileOperations.java` in terms of OOP?",
            "A. It acts as an abstract base class containing static properties.",
            "B. It represents Abstraction (Interface) mandating that any model class must implement `toFileString()`.",
            "C. It represents Encapsulation by hiding how BufferedWriter writes lines.",
            "D. It provides method overriding to convert objects to JSON strings.",
            'B',
            "WHY IT IS THERE:\n" +
            "`FileOperations` is a public interface containing a single method signature: `String toFileString();`.\n" +
            "Every major domain model (User, Vendor, Booking, Payment, Review, Admin) implements this interface.\n" +
            "This represents a contract (Abstraction) that guarantees every object can serialize itself to a text row."
        );

        askQuestion(
            "2. How is Polymorphism demonstrated during file reading (deserialization) in `VendorRepository`?",
            "A. It reads all vendors into a single type-agnostic String list.",
            "B. It has multiple overloaded versions of the method `findAll()`.",
            "C. It reads a line, checks the category column, and uses a switch expression to return `VenueVendor`, `PhotographyVendor` or `CateringVendor`.",
            "D. It casts all objects dynamically to the base class Object.",
            'C',
            "WHY IT IS THERE:\n" +
            "When `VendorRepository.findAll()` parses a line from `data/vendors.txt`, it matches the category.\n" +
            "A \"switch (category.toUpperCase())\" instantiates the specific subclass (e.g. VenueVendor) and stores it in a `List<Vendor>`.\n" +
            "This lets us manipulate specialized classes under their parent type (Vendor), which is true Polymorphism!"
        );

        askQuestion(
            "3. How is Abstraction/Polymorphism implemented in Component 05 (Reviews) editing permissions?",
            "A. A boolean field is set via administrative session configuration.",
            "B. The base abstract class `Review` defines an abstract method `canEdit()`. `PublicReview` overrides it to return `false` while `VerifiedReview` overrides it to return `true`.",
            "C. All reviews are editable by default; permissions are checked on the front-end only.",
            "D. It uses reflection to change the access modifiers of class members at runtime.",
            'B',
            "WHY IT IS THERE:\n" +
            "In `ReviewController.java`, we invoke `r.canEdit()` before rendering the edit screen.\n" +
            "Since `canEdit()` is abstract in `Review`, each concrete type provides its own business logic.\n" +
            "This shows **Abstraction** (defining the abstract rule) and **Polymorphism** (executing different logic per review subclass)."
        );

        askQuestion(
            "4. How is Abstraction applied in the base `Vendor` class pricing models?",
            "A. The class provides a static database lookup query.",
            "B. It defines `public abstract double calculatePricing(int units);`. Subclasses override this with custom formulas (e.g., catering multiplies by plates; venue multiplies by hours).",
            "C. It forces all vendor pricing to be free.",
            "D. It implements standard currency conversion logic.",
            'B',
            "WHY IT IS THERE:\n" +
            "Different vendors bill in different ways! Catering charges per plate (guests). Photography/Venue charges hourly.\n" +
            "By declaring `calculatePricing(int units)` as abstract in the parent class `Vendor`, we force subclasses\n" +
            "to declare their custom pricing algorithms, letting the controller estimate budgets uniformly!"
        );

        pressEnterToContinue();
    }

    private static void runSecurityModule() {
        totalQuestions = 0;
        correctAnswers = 0;
        clearScreen();
        printHeader("MODULE 3: SECURITY & EDGE CASES");

        askQuestion(
            "1. Why does your flat-file database require `SecurityUtils.sanitizeForFile(input)`?",
            "A. To encrypt text passwords with MD5 hashing.",
            "B. To strip out pipe (|) characters and newlines so they don't break the record splitting layout.",
            "C. To prevent SQL injections into JDBC SQL statements.",
            "D. To convert text inputs to capital letters for easier queries.",
            'B',
            "WHY IT IS THERE:\n" +
            "Since your database uses pipe characters (`|`) as delimiters and newlines (`\\n`) as row separators,\n" +
            "if a user typed \"I love this | vendor\" in a review, standard splitting `line.split(\"\\\\|\")` would break!\n" +
            "This is called **Delimiter Injection**. `SecurityUtils` sanitizes inputs by removing pipes and newlines to preserve DB integrity."
        );

        askQuestion(
            "2. What security measure is implemented in `SecurityUtils` to protect JSP views from Cross-Site Scripting (XSS)?",
            "A. It validates and decodes JSON Web Tokens (JWT).",
            "B. It filters incoming HTTP requests to check user roles.",
            "C. It escapes standard HTML special characters like `<`, `>`, `&`, `\"`, and `'` with their HTML entities (e.g., `&lt;` and `&gt;`).",
            "D. It locks the files so users cannot write scripts.",
            'C',
            "WHY IT IS THERE:\n" +
            "If a malicious user submits `<script>alert('hack')</script>` in a review, anyone viewing the reviews list\n" +
            "would execute that script. By escaping special HTML entities during inputs or view rendering,\n" +
            "the browser safely displays the tags as plain text without executing them. This is **XSS Mitigation**."
        );

        pressEnterToContinue();
    }

    private static void runComponentsModule() {
        totalQuestions = 0;
        correctAnswers = 0;
        clearScreen();
        printHeader("MODULE 4: COMPONENT DETAILS (1 TO 6)");

        askQuestion(
            "1. In Component 01 (User), what are the properties stored inside the CoupleUser subclass?",
            "A. Business Category, Locations, Ratings.",
            "B. Table Numbers, RSVP Status, Plus One indicators.",
            "C. Wedding Date, Budget, Guest Count, Theme.",
            "D. Admin Permissions, Announcement creation dates.",
            'C',
            "WHY IT IS THERE:\n" +
            "`CoupleUser` extends base abstract class `User` (which stores common fields like ID, name, email, password, and role).\n" +
            "The properties specific to couple planning - wedding date, budget, guest count, and theme - are encapsulated in `CoupleUser`."
        );

        askQuestion(
            "2. What are the specific subclasses of `Admin` in Component 06?",
            "A. ExecutiveAdmin and LocalAdmin",
            "B. SuperAdmin and ModeratorAdmin",
            "C. DatabaseAdmin and SecurityAdmin",
            "D. ChiefPlanner and GuestModerator",
            'B',
            "WHY IT IS THERE:\n" +
            "Component 6 defines two types of admins: `SuperAdmin` (role SUPER_ADMIN, with permissions \"Full System Access, Add/Remove Admins\")\n" +
            "and `ModeratorAdmin` (role MODERATOR, with permissions \"Resolve Disputes, Verify Vendors\"). This shows polymorphism in action!"
        );

        askQuestion(
            "3. In Component 04 (Planning Tools), what three distinct models are managed under `PlanningController`?",
            "A. User, Vendor, and Booking.",
            "B. Review, Rating, and Verification.",
            "C. Task (Checklist), BudgetItem (Budget), and Guest (Guest List).",
            "D. Admin, Moderator, and SuperAdmin.",
            'C',
            "WHY IT IS THERE:\n" +
            "Component 4 handles the active wedding planning tools. It uses three separate file-backed repositories:\n" +
            "`TaskRepository` (tasks.txt), `BudgetItemRepository` (budget_items.txt), and `GuestRepository` (guests.txt)\n" +
            "under a single controller context `/planning` to organize the checklist, budget calculator, and guest list tracker."
        );

        pressEnterToContinue();
    }

    private static void runMockViva() {
        totalQuestions = 0;
        correctAnswers = 0;
        clearScreen();
        printHeader("MODULE 5: FULL COMPREHENSIVE MOCK VIVA (10 QUESTIONS)");


        askQuestion(
            "Q1. What happens if the `data/` folder or text files do not exist at startup?",
            "A. The application crashes immediately with a `FileNotFoundException` during Spring bean initialization.",
            "B. The repositories dynamically create the directory and empty text files using `f.getParentFile().mkdirs()` in a private `getFile()` method.",
            "C. The application halts until you manually run a shell setup script.",
            "D. The application connects to an in-memory backup database.",
            'B',
            "EXP: In every repository, `getFile()` returns the File object and runs `f.getParentFile().mkdirs();`.\n" +
            "If the parent folders do not exist, Java automatically creates them. If the file is missing, `findAll()` returns an empty list safely."
        );


        askQuestion(
            "Q2. How is dynamic polymorphism implemented in pricing calculation in `PhotographyVendor`?",
            "A. It overrides `calculatePricing(int hours)` to multiply hourly rate by hours times 1.2 (for editing premium).",
            "B. It has static properties that prevent hour-based billing.",
            "C. It divides the rate by a flat guest amount.",
            "D. It charges a standard $500 flat fee.",
            'A',
            "EXP: `PhotographyVendor` inherits `calculatePricing(int units)`. It calculates `Double.parseDouble(getPriceRange()) * hours * 1.2`,\n" +
            "representing an extra 20% overhead for post-production/photo-editing! Venue, on the other hand, multiplies by 0.8."
        );


        askQuestion(
            "Q3. How does `SecurityUtils.escapeHtml` prevent cross-site scripting (XSS)?",
            "A. It encrypts script commands using modern AES encryption.",
            "B. It sanitizes strings by stripping out script elements entirely.",
            "C. It converts dangerous symbols like `<` and `>` into HTML entities `&lt;` and `&gt;` so browsers treat them as display text rather than runnable code.",
            "D. It blocks request parameters that contain brackets.",
            'C',
            "EXP: Browsers parse `<` and `>` to run HTML tags. By converting them to HTML safe entities, the browser prints them safely as text."
        );


        askQuestion(
            "Q4. Which package contains standard Spring Boot entry properties such as port configuration and view resolver prefixes?",
            "A. com.ttt.shared.SecurityUtils",
            "B. src/main/resources/application.properties",
            "C. pom.xml maven dependencies",
            "D. src/main/webapp/WEB-INF/jsp/index.jsp",
            'B',
            "EXP: `application.properties` holds details like: `server.port=8080`, `spring.mvc.view.prefix=/WEB-INF/jsp/`,\n" +
            "and `spring.mvc.view.suffix=.jsp`. It is the central configuration file of your Spring Boot web app."
        );


        askQuestion(
            "Q5. How does the JSP view layer communicate with controllers in your Spring MVC application?",
            "A. Via direct socket streams and raw bytes.",
            "B. Controllers populate Spring's `Model` object (e.g. `model.addAttribute(...)`) and return the logical JSP view name, which the view engine resolves.",
            "C. JSPs fetch data asynchronously using fetch() and REST APIs only.",
            "D. JSPs read the flat files directly on the front-end.",
            'B',
            "EXP: Standard Spring MVC workflow: User requests a route -> Controller method runs -> Fetches data via Repository ->\n" +
            "Saves data in Spring `Model` -> Returns view name (e.g. \"component01/profile\") -> View resolver returns JSP view."
        );


        askQuestion(
            "Q6. How are individual IDs (like REVIEW-IDs or TASK-IDs) uniquely generated in the controllers?",
            "A. By auto-incrementing an integer from the flat file count.",
            "B. By parsing system milliseconds.",
            "C. Using `UUID.randomUUID().toString().substring(0, 5).toUpperCase()` prefixed with standard type letters (e.g., REV-, GST-, TSK-).",
            "D. Administrators manually assign IDs.",
            'C',
            "EXP: Random Universally Unique Identifiers (UUIDs) are truncated to 5 letters and prefixed to ensure every entry has a unique, short, human-friendly primary key."
        );


        askQuestion(
            "Q7. In `ReviewController.java`, what is the target redirect page after successfully submitting or deleting a review?",
            "A. redirect:/planning",
            "B. redirect:/reviews",
            "C. redirect:/admin",
            "D. redirect:/",
            'B',
            "EXP: Submitting a review redirects back to the reviews list page `/reviews` to display the updated feedback instantly."
        );


        askQuestion(
            "Q8. How does `SecurityUtils.clean` invoke both file sanitization and HTML escaping?",
            "A. By calling them in sequential order: `sanitizeForFile(escapeHtml(input))`.",
            "B. It executes them concurrently in separate threads.",
            "C. It delegates to the Spring Security framework.",
            "D. It throws an exception if the input contains pipes or brackets.",
            'A',
            "EXP: `clean(String input)` is a helper method that chains both protection schemes: first it escapes standard HTML code,\n" +
            "then it strips flat-file pipe delimiters. This guarantees double protection in a single method call!"
        );


        askQuestion(
            "Q9. What OOP principle is violated if repositories directly allowed outer classes to modify `FILE_PATH`?",
            "A. Polymorphism",
            "B. Abstraction",
            "C. Encapsulation / Information Hiding",
            "D. Inheritance",
            'C',
            "EXP: Encapsulation demands that internal implementation details (such as the database file path) should be kept private\n" +
            "and hidden from outside manipulation, exposing only safe, high-level interfaces (the repository methods)."
        );


        askQuestion(
            "Q10. How does a custom flat-file repository fetch a single record by ID?",
            "A. It runs an index scan on a file system tree.",
            "B. It loads all records using `findAll()` into a List, converts it to a Stream, filters by matching ID, and returns `findFirst()` as an `Optional`.",
            "C. It reads only a single targeted line from the middle of the text file directly.",
            "D. It throws an error unless you fetch the entire list.",
            'B',
            "EXP: Custom repos use streams: `findAll().stream().filter(u -> u.getUserId().equals(userId)).findFirst()`. It returns `Optional` to safely handle not-found cases."
        );

        pressEnterToContinue();
    }

    private static void askQuestion(String qText, String optA, String optB, String optC, String optD, char correctOpt, String expText) {
        System.out.println("==================================================================================");
        System.out.println(qText);
        System.out.println("----------------------------------------------------------------------------------");
        System.out.println(optA);
        System.out.println(optB);
        System.out.println(optC);
        System.out.println(optD);
        System.out.println("==================================================================================");

        char userAns = ' ';
        boolean valid = false;
        while (!valid) {
            System.out.print("Your answer (A, B, C, or D): ");
            String input = scanner.nextLine().trim().toUpperCase();
            if (input.length() == 1 && (input.charAt(0) == 'A' || input.charAt(0) == 'B' || input.charAt(0) == 'C' || input.charAt(0) == 'D')) {
                userAns = input.charAt(0);
                valid = true;
            } else {
                System.out.println("Invalid input. Please enter A, B, C, or D.");
            }
        }

        totalQuestions++;
        if (userAns == correctOpt) {
            System.out.println("\n[CORRECT!] 🎉 Nicely done.");
            correctAnswers++;
        } else {
            System.out.println("\n[INCORRECT] ❌ You selected " + userAns + ". The correct answer is " + correctOpt + ".");
        }
        System.out.println();
        System.out.println("EXPLANATION / VIVA TRICK:");
        System.out.println(expText);
        System.out.println();
        System.out.println("Press ENTER to proceed...");
        scanner.nextLine();
        clearScreen();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();

        for (int i = 0; i < 40; i++) System.out.println();
    }

    private static void printHeader(String title) {
        System.out.println("==================================================================================");
        System.out.printf("  %s  \n", title);
        System.out.println("==================================================================================");
        System.out.println();
    }

    private static void pressEnterToContinue() {
        System.out.println("Module Completed! Press ENTER to return to Main Menu...");
        scanner.nextLine();
    }
}
