-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 04:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastlearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `course_id`, `created_at`) VALUES
(58, 3, 14, '2024-10-17 17:03:24'),
(64, 1, 2, '2024-10-20 15:06:48'),
(72, 1, 3, '2024-10-29 06:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Programming', 'Courses related to programming and software development', '2024-10-02 17:28:32'),
(2, 'Graphic Design', 'Courses on image and graphic design', '2024-10-02 17:28:32'),
(3, 'Marketing', 'Courses on marketing and online advertising', '2024-10-02 17:28:32'),
(4, 'Business', 'Courses on management and entrepreneurship', '2024-10-02 17:28:32'),
(5, 'Languages', 'Courses on various languages', '2024-10-02 17:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `detail_course` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `content`, `image`, `price`, `category_id`, `created_at`, `detail_course`) VALUES
(1, 'Basic Java Programming Course', 'This course will help you master the basic concepts of Java programming.', 'Imgs/home_img_2.png', 150.00, 1, '2024-10-02 17:29:40', '<p>Introduction to Java</p>\n<p>Installation and Environment Setup</p>\n<p>Basic Syntax</p>\n<p>Control Structures</p>\n<p>Functions and Methods</p>\n<p>Object Oriented Programming (OOP)</p>\n<p>Exception Handling</p>\n<p>Collections Framework</p>\n<p>File I/O</p>\n<p>Practice Project</p>\n<p>Conclusion and Evaluation</p>'),
(2, 'Graphic Design with Photoshop', 'This course will teach you how to use Photoshop for graphic design.', 'https://redresscompliance.com/wp-content/uploads/2023/12/Adobe-Photoshop-Tips.webp', 200.00, 2, '2024-10-02 17:29:40', '<p>Introduction to Photoshop</p>\n<p>Installation and Environment Setup</p>\n<p>User Interface and Tools</p>\n<p>Basic Concepts of Graphic Design</p>\n<p>Working with Layers</p>\n<p>Image Cropping and Editing</p>\n<p>Using Drawing Tools</p>\n<p>Effects and Filters</p>\n<p>Typography in Design</p>\n<p>Graphic Design for Web and Print</p>\n<p>Practice Project</p>\n<p>Conclusion and Evaluation</p>'),
(3, 'Effective Online Marketing Course', 'This course will teach you the essential skills for online marketing.', 'https://media.licdn.com/dms/image/D4D12AQErT7wlJdGkag/article-cover_image-shrink_720_1280/0/1663330985298?e=2147483647&v=beta&t=cU_vDXorRkSeqJgJPBonbWhMirLG3OFfHRaydIswVIY', 100.00, 3, '2024-10-02 17:29:40', '<p>Introduction to Online Marketing</p>\n<p>Understanding Digital Marketing Channels</p>\n<p>Search Engine Optimization (SEO)</p>\n<p>Content Marketing Strategies</p>\n<p>Social Media Marketing</p>\n<p>Email Marketing Techniques</p>\n<p>Pay-Per-Click (PPC) Advertising</p>\n<p>Analytics and Performance Measurement</p>\n<p>Building a Brand Online</p>\n<p>Creating a Digital Marketing Plan</p>\n<p>Case Studies and Best Practices</p>\n<p>Conclusion and Next Steps</p>'),
(4, 'Entrepreneurship Business Course', 'This course will guide you on how to start and manage a business.', 'https://qph.cf2.quoracdn.net/main-qimg-ebb359083a2b35a771d11ee793986e44', 250.00, 4, '2024-10-02 17:29:40', '<p>Introduction to Entrepreneurship</p>\n<p>The Entrepreneurial Mindset</p>\n<p>Identifying Business Opportunities</p>\n<p>Market Research and Analysis</p>\n<p>Business Planning and Strategy</p>\n<p>Funding Your Business</p>\n<p>Building a Brand</p>\n<p>Marketing Your Business</p>\n<p>Operations Management</p>\n<p>Financial Management for Entrepreneurs</p>\n<p>Networking and Building Relationships</p>\n<p>Scaling Your Business</p>\n<p>Conclusion and Future Steps</p>'),
(5, 'English Conversation Course', 'This course helps you improve your English conversation skills.', 'https://play-lh.googleusercontent.com/_IZ7uKFwkHxtLbuEBGMCEVn4zIm1Ig6fmFTmyyXXoo0aw1pfS8AdpZzSnl47UZ9A24Gn', 120.00, 5, '2024-10-02 17:29:40', '<p>Introduction to English Conversation</p>\n<p>Basic Greetings and Introductions</p>\n<p>Everyday Vocabulary and Phrases</p>\n<p>Asking Questions and Clarifying</p>\n<p>Describing People, Places, and Things</p>\n<p>Discussing Daily Routines</p>\n<p>Expressing Opinions and Preferences</p>\n<p>Making Plans and Invitations</p>\n<p>Handling Social Situations</p>\n<p>Using Idioms and Slang</p>\n<p>Listening Skills and Comprehension</p>\n<p>Role-Playing and Practice Scenarios</p>\n<p>Conclusion and Tips for Continued Practice</p>'),
(6, 'Codecademy - Learn Python ', 'This course provides basic knowledge about Python, suitable for beginners.', 'https://simpleprogrammer.com/wp-content/uploads/2023/07/Codecademy-Python.jpg', 200.00, 1, '2024-10-04 14:04:12', '<p>Introduction to Python</p>\n<p>Setting Up Your Environment</p>\n<p>Basic Syntax and Variables</p>\n<p>Data Types and Type Conversion</p>\n<p>Control Flow: Conditionals and Loops</p>\n<p>Functions and Scope</p>\n<p>Data Structures: Lists, Tuples, Sets, and Dictionaries</p>\n<p>File Input and Output</p>\n<p>Error Handling and Exceptions</p>\n<p>Object-Oriented Programming (OOP)</p>\n<p>Modules and Packages</p>\n<p>Working with Libraries (e.g., NumPy, Pandas)</p>\n<p>Final Project and Review</p>'),
(7, 'Coursera - Programming for Everybody ', 'Lecturer: Charles Severance. This course helps learners understand programming with Python.', 'https://www.mltut.com/wp-content/uploads/2022/01/Python-for-Everybody-Review.jpg', 150.00, 1, '2024-10-06 13:42:55', '<p>Introduction to Programming</p>\r\n<p>Setting Up Your Programming Environment</p>\r\n<p>Basic Concepts: Variables and Expressions</p>\r\n<p>Control Structures: Conditionals and Loops</p>\r\n<p>Functions: Definition and Scope</p>\r\n<p>Data Structures: Lists and Dictionaries</p>\r\n<p>Working with Strings</p>\r\n<p>Reading and Writing Files</p>\r\n<p>Error Handling and Debugging</p>\r\n<p>Introduction to Object-Oriented Programming</p>\r\n<p>Using Libraries and Modules</p>\r\n<p>Final Project: Applying Your Skills</p>\r\n<p>Conclusion and Next Steps</p>'),
(8, 'EDX - CS50\'s Introduction To Computer Science', 'One of the most famous programming courses from Harvard, including many basic languages ​​and concepts.', 'https://keystoneacademic-res.cloudinary.com/image/upload/element/19/195938_190613_152694_edX_Logo_Reg_BLACK.jpg', 230.00, 1, '2024-10-06 13:42:55', '<p>Introduction to Computer Science</p>\n<p>Programming Fundamentals with C</p>\n<p>Arrays and Algorithms</p>\n<p>Memory Management and Pointers</p>\n<p>Data Structures: Linked Lists, Stacks, and Queues</p>\n<p>Introduction to Python</p>\n<p>Web Programming Basics: HTML, CSS, and JavaScript</p>\n<p>SQL and Databases</p>\n<p>Security and Cryptography</p>\n<p>Final Project: Building a Complete Application</p>\n<p>Wrap-Up and Future Learning Paths</p>'),
(9, 'Udacity - Intro to JavaScript', 'This course helps you understand JavaScript, an important programming language for web development', 'https://jigya.co.in/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBaTlZIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--108b8e263e408980665b8c9dc3a9938b37912985/Udacity-logo-vertical-blue.webp', 150.00, 1, '2024-10-06 13:42:55', '<p>Introduction to JavaScript</p>\n<p>Setting Up Your Development Environment</p>\n<p>Basic Syntax and Data Types</p>\n<p>Control Flow: Conditionals and Loops</p>\n<p>Functions: Declaration and Invocation</p>\n<p>Working with Objects and Arrays</p>\n<p>DOM Manipulation</p>\n<p>Event Handling</p>\n<p>Asynchronous JavaScript: Callbacks and Promises</p>\n<p>Introduction to ES6 Features</p>\n<p>Debugging and Error Handling</p>\n<p>Final Project: Building a Web Application</p>\n<p>Conclusion and Next Steps</p>'),
(10, 'Freecodecamp - Responsive Web Design Certification', 'This free course teaches you how to create response websites, including HTML and CSS.', 'https://pbs.twimg.com/media/GNQXcdRW4AADG33?format=jpg&name=4096x4096', 0.00, 1, '2024-10-06 13:42:55', '<p>Introduction to Responsive Web Design</p>\n<p>Basic HTML and HTML5</p>\n<p>Basic CSS and CSS3</p>\n<p>Responsive Web Design Principles</p>\n<p>Creating a Responsive Layout with Flexbox</p>\n<p>Creating a Responsive Layout with Grid</p>\n<p>Responsive Typography and Images</p>\n<p>Using Media Queries</p>\n<p>Building Projects: Tribute Page</p>\n<p>Building Projects: Survey Form</p>\n<p>Building Projects: Product Landing Page</p>\n<p>Building Projects: Technical Documentation Page</p>\n<p>Building Projects: Personal Portfolio Webpage</p>\n<p>Conclusion and Certification</p>'),
(11, 'Udemy - The Complete Web Developer Course 2.0', 'This comprehensive course includes HTML, CSS, JavaScript, PHP, and many other technologies for web development', 'https://i0.wp.com/software.centrix.asia/wp-content/uploads/2024/06/udemy-la-gi.png', 220.00, 1, '2024-10-06 13:42:55', '<p>Introduction to Web Development</p>\n<p>HTML: The Basics</p>\n<p>CSS: Styling Your Website</p>\n<p>JavaScript: Programming Fundamentals</p>\n<p>jQuery: Simplifying JavaScript</p>\n<p>Responsive Web Design with Bootstrap</p>\n<p>Building Websites with HTML5 and CSS3</p>\n<p>Node.js: Introduction to Server-Side Development</p>\n<p>Databases: MongoDB and Mongoose</p>\n<p>RESTful APIs and AJAX</p>\n<p>Version Control with Git and GitHub</p>\n<p>Deployment: Hosting Your Website</p>\n<p>Building Projects: Portfolio Website</p>\n<p>Building Projects: Complete Web Applications</p>\n<p>Conclusion and Next Steps in Web Development</p>'),
(12, 'Coursera - Specialized in graphic design', 'Lecturer: California Art Institute. Any study includes many aspects of moderate design', 'https://www.georgeanimatrix.com/blog/wp-content/uploads/2023/09/Untitled-design-2023-09-04T191457.256.jpg', 150.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>Fundamentals of Design: Color Theory and Typography</p>\n<p>Creating Visual Hierarchy and Composition</p>\n<p>Using Design Software: Adobe Illustrator and Photoshop</p>\n<p>Logo Design and Branding</p>\n<p>Layout and Print Design Principles</p>\n<p>User Interface (UI) Design Basics</p>\n<p>User Experience (UX) Design Fundamentals</p>\n<p>Designing for Web and Mobile</p>\n<p>Creating Effective Presentations</p>\n<p>Portfolio Development and Presentation</p>\n<p>Capstone Project: Complete Graphic Design Project</p>\n<p>Conclusion and Career Opportunities in Graphic Design</p>'),
(13, 'Udemy - The Complete Graphic Design Course - Beginner to Advanced ', 'This course provides knowledge from basic to advanced in graphic design, including Photoshop, Illustrator, and InDesign.', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/2/26/b604774f-65c3-4e43-93fe-98fb9b8e0b7b.jpg', 299.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>Understanding Design Principles</p>\n<p>Color Theory and Its Applications</p>\n<p>Typography: Choosing and Using Fonts</p>\n<p>Using Adobe Photoshop: Basics to Advanced Techniques</p>\n<p>Using Adobe Illustrator: Creating Vector Graphics</p>\n<p>Logo Design: From Concept to Completion</p>\n<p>Layout Design: Creating Effective Compositions</p>\n<p>Creating Marketing Materials: Flyers, Posters, and Brochures</p>\n<p>Web Design Basics: UI/UX Principles</p>\n<p>Photo Editing and Retouching Techniques</p>\n<p>Creating Social Media Graphics</p>\n<p>Building a Professional Portfolio</p>\n<p>Capstone Project: Comprehensive Design Assignment</p>\n<p>Conclusion and Next Steps in Graphic Design</p>'),
(14, 'Skillshare - Graphic Design Basics', 'Core Principles for Visual Design This course focuses on the fundamentals of graphic design, helping you develop a design mindset.', 'https://smartlifeskills.ai/wp-content/uploads/2024/08/SkillshareBonus-3.png', 230.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>Understanding Design Elements: Line, Shape, and Color</p>\n<p>Typography: Fundamentals and Best Practices</p>\n<p>Layout and Composition Techniques</p>\n<p>Using Adobe Photoshop for Beginners</p>\n<p>Using Adobe Illustrator for Vector Graphics</p>\n<p>Creating Visual Hierarchy in Design</p>\n<p>Basic Branding Principles</p>\n<p>Designing for Print vs. Digital</p>\n<p>Exploring Color Theory and Palettes</p>\n<p>Working with Images and Graphics</p>\n<p>Creating Simple Projects: Flyers and Social Media Posts</p>\n<p>Developing Your Personal Style as a Designer</p>\n<p>Conclusion and Resources for Continued Learning</p>'),
(15, 'LinkedIn Learning - Graphic Design Fundamentals', 'Composition and Layout This course helps you understand composition and how to arrange elements in a design.', 'https://media.licdn.com/dms/image/v2/C4D22AQH6zrGgnT_Kcg/feedshare-shrink_800/feedshare-shrink_800/0/1660241195184?e=2147483647&v=beta&t=XSEo-v1mg-Xvany6h7QigF-DPGKbVrop9ndSIJDMmiM', 189.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>The Principles of Design: Balance, Contrast, and Harmony</p>\n<p>Understanding Color Theory and Color Harmony</p>\n<p>Typography: Choosing and Pairing Fonts</p>\n<p>Creating Effective Layouts and Compositions</p>\n<p>Working with Images and Graphics</p>\n<p>Branding Basics: Logos and Identity Design</p>\n<p>Print vs. Digital Design Considerations</p>\n<p>Using Adobe Photoshop for Graphic Design</p>\n<p>Using Adobe Illustrator for Vector Art</p>\n<p>Designing for Social Media and Web</p>\n<p>Creating a Portfolio of Your Work</p>\n<p>Capstone Project: Applying Design Skills</p>\n<p>Conclusion and Next Steps in Graphic Design</p>'),
(16, 'Canva Design School - Graphic Design Basics', ' A free course from Canva, helping you grasp the principles of design and how to use Canva to create design products.', 'https://static-cse.canva.com/blob/753489/Graphicdesignbasicsactivitytintsandshades.png', 0.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>Understanding Design Principles: Balance, Contrast, and Alignment</p>\n<p>Color Theory: Choosing the Right Colors</p>\n<p>Typography: Basics of Font Selection and Pairing</p>\n<p>Creating Compelling Layouts</p>\n<p>Working with Images and Graphics</p>\n<p>Branding Essentials: Developing a Visual Identity</p>\n<p>Designing for Print vs. Digital Media</p>\n<p>Using Canva: Navigating the Platform</p>\n<p>Creating Social Media Graphics and Marketing Materials</p>\n<p>Design Projects: Flyers, Posters, and Infographics</p>\n<p>Building a Professional Portfolio</p>\n<p>Conclusion and Resources for Further Learning</p>'),
(17, 'EDX - Introduction to Graphic Design', 'This course provides an overview of graphic design, including basic tools and techniques.', 'https://openlearning.mit.edu/sites/default/files/styles/event_news_detail/public/news-events/2019-06/169.jpg?h=8b58cd30&itok=ON6LAm-a', 139.00, 2, '2024-10-06 13:55:30', '<p>Introduction to Graphic Design</p>\n<p>The History and Evolution of Graphic Design</p>\n<p>Understanding Design Principles: Balance, Contrast, and Unity</p>\n<p>Color Theory: Using Color Effectively</p>\n<p>Typography: Fundamentals and Best Practices</p>\n<p>Layout Design: Grids and Composition</p>\n<p>Working with Images and Graphics</p>\n<p>Branding and Identity Design</p>\n<p>Digital vs. Print Design Considerations</p>\n<p>Introduction to Design Software: Adobe Photoshop and Illustrator</p>\n<p>Creating Effective Visual Communication</p>\n<p>Capstone Project: Developing a Design Portfolio</p>\n<p>Conclusion and Next Steps in Graphic Design</p>'),
(18, 'Coursera - Digital Marketing Specialization Instructor', 'University of Illinois. This course covers key aspects of digital marketing such as SEO, SEM, and data analytics.', 'https://coursereport-production.imgix.net/uploads/image/file/251/GA_Digital_Marketing_Career_Path_infographic_updated.png?auto=compress%2Cformat&w=727&h=800', 135.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Digital Marketing</p>\n<p>Marketing in a Digital World</p>\n<p>Search Engine Optimization (SEO) Fundamentals</p>\n<p>Social Media Marketing Strategies</p>\n<p>Content Marketing: Creating Valuable Content</p>\n<p>Email Marketing: Best Practices and Strategies</p>\n<p>Pay-Per-Click (PPC) Advertising</p>\n<p>Analytics: Measuring and Analyzing Marketing Performance</p>\n<p>Digital Marketing Capstone Project</p>\n<p>Building a Digital Marketing Plan</p>\n<p>Emerging Trends in Digital Marketing</p>\n<p>Conclusion and Career Opportunities in Digital Marketing</p>'),
(19, 'HubSpot Academy - Inbound Marketing Certification', 'This free course teaches how to attract customers through quality content and inbound marketing strategies.', 'https://media.licdn.com/dms/image/C5612AQEBp4fC87QnDw/article-cover_image-shrink_600_2000/0/1520212098976?e=2147483647&v=beta&t=FmYRw2nK2n6368RD8ey1bzp0q9uuwC2uGIpxXhe7dO0', 0.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Inbound Marketing</p>\n<p>The Inbound Marketing Methodology</p>\n<p>Understanding Buyer Personas</p>\n<p>Creating Compelling Content</p>\n<p>Blogging for Business Growth</p>\n<p>Search Engine Optimization (SEO) Strategies</p>\n<p>Social Media Marketing: Engaging Your Audience</p>\n<p>Email Marketing: Nurturing Leads</p>\n<p>Lead Generation Techniques</p>\n<p>Analyzing and Measuring Marketing Performance</p>\n<p>Creating a Comprehensive Inbound Marketing Strategy</p>\n<p>Conclusion and Next Steps in Inbound Marketing</p>'),
(20, 'Udemy - The Complete Digital Marketing Course', 'This comprehensive course covers a wide range of topics from SEO, Google Ads, to email marketing and social media.', 'https://i.ytimg.com/vi/A1WFyYkFLCY/hqdefault.jpg', 320.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Digital Marketing</p>\n<p>Understanding the Digital Marketing Landscape</p>\n<p>Search Engine Optimization (SEO) Techniques</p>\n<p>Social Media Marketing Strategies</p>\n<p>Content Marketing: Creating and Distributing Content</p>\n<p>Email Marketing: Building and Engaging Your Audience</p>\n<p>Pay-Per-Click (PPC) Advertising</p>\n<p>Google Analytics: Measuring Success</p>\n<p>Affiliate Marketing Basics</p>\n<p>Building Your Digital Marketing Strategy</p>\n<p>Creating a Personal Brand Online</p>\n<p>Final Project: Developing a Comprehensive Marketing Plan</p>\n<p>Conclusion and Career Opportunities in Digital Marketing</p>'),
(21, 'LinkedIn Learning - Marketing Foundations ', 'This course helps you understand the fundamentals of marketing and how to apply them in practice.', 'https://play.vidyard.com/J32PoRRzUGW9U7fEKqFfcV.jpg', 230.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Marketing Foundations</p>\n<p>Understanding Market Research and Analysis</p>\n<p>Identifying Target Markets and Buyer Personas</p>\n<p>Creating a Unique Value Proposition</p>\n<p>Marketing Mix: Product, Price, Place, Promotion</p>\n<p>Branding Basics and Brand Strategy</p>\n<p>Digital Marketing Fundamentals</p>\n<p>Content Marketing Strategies</p>\n<p>Social Media Marketing Essentials</p>\n<p>Email Marketing Best Practices</p>\n<p>Measuring Marketing Effectiveness and ROI</p>\n<p>Developing a Comprehensive Marketing Plan</p>\n<p>Conclusion and Next Steps in Marketing</p>'),
(22, 'EDX - Marketing Analytics', 'This course from Columbia University helps you grasp how to use data analytics to improve your marketing strategy.', 'https://prod-discovery.edx-cdn.org/cdn-cgi/image/quality=60,format=webp,width=350/media/course/image/ead84fcd-48ed-42d4-95af-93f54851297f-cdeacabf7fe5.jpeg', 249.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Marketing Analytics</p>\n<p>Understanding Data and Metrics for Marketing</p>\n<p>Market Research Techniques and Tools</p>\n<p>Customer Segmentation and Targeting</p>\n<p>Analyzing Marketing Campaign Performance</p>\n<p>Using Predictive Analytics in Marketing</p>\n<p>Social Media Analytics and Insights</p>\n<p>Email Marketing Metrics and Analysis</p>\n<p>Search Engine Optimization (SEO) Analytics</p>\n<p>Marketing Attribution Models</p>\n<p>Data Visualization for Marketing Insights</p>\n<p>Creating a Marketing Analytics Strategy</p>\n<p>Capstone Project: Applying Marketing Analytics</p>\n<p>Conclusion and Future Trends in Marketing Analytics</p>'),
(23, 'Google Digital Garage - Digital Marketing Fundamentals ', 'This free course provides an overview of digital marketing, including SEO, online advertising, and content strategy.', 'https://i.ytimg.com/vi/zF9GkWXMs2w/maxresdefault.jpg', 115.00, 3, '2024-10-06 14:07:11', '<p>Introduction to Digital Marketing</p>\n<p>Understanding Digital Marketing Channels</p>\n<p>Search Engine Optimization (SEO) Basics</p>\n<p>Content Marketing: Creating Valuable Content</p>\n<p>Social Media Marketing Essentials</p>\n<p>Email Marketing Strategies</p>\n<p>Online Advertising: Pay-Per-Click (PPC) Overview</p>\n<p>Analytics and Measuring Success</p>\n<p>Building a Digital Marketing Strategy</p>\n<p>Introduction to E-commerce and Online Sales</p>\n<p>Mobile Marketing: Reaching Customers on the Go</p>\n<p>Developing an Effective Digital Presence</p>\n<p>Conclusion and Certification Overview</p>'),
(24, 'Coursera - Business Foundations Major Instructor', ' University of Pennsylvania. This course covers the fundamental aspects of business such as finance, marketing and management.', 'https://d15cw65ipctsrr.cloudfront.net/bb/a0b5642d924caabb6101aa7e1afa66/IBM-AI-Foundations-for-Business.png', 450.00, 4, '2024-10-06 14:21:45', '<p>Introduction to Business Foundations</p>\n<p>Understanding Business Models and Strategies</p>\n<p>Financial Accounting Basics</p>\n<p>Managerial Accounting Principles</p>\n<p>Introduction to Marketing Concepts</p>\n<p>Business Analytics: Data-Driven Decision Making</p>\n<p>Organizational Behavior and Management</p>\n<p>Operations Management Fundamentals</p>\n<p>Business Communication Skills</p>\n<p>Legal Aspects of Business</p>\n<p>Entrepreneurship and Innovation</p>\n<p>Capstone Project: Integrating Business Concepts</p>\n<p>Conclusion and Future Career Paths in Business</p>'),
(25, 'EDX - MicroMasters in Business Leadership Instructor', ' University of Queensland. This course helps you develop leadership and management skills in a business environment.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLUJw0DxDPWnk5THV_w8tW-bZSAZ0VOfkOqw&s', 234.00, 4, '2024-10-06 14:21:45', '<p>Introduction to Business Leadership</p>\n<p>Leadership Theories and Styles</p>\n<p>Strategic Thinking and Decision Making</p>\n<p>Managing Teams and Organizational Behavior</p>\n<p>Effective Communication and Influence</p>\n<p>Financial Acumen for Leaders</p>\n<p>Marketing Strategies and Customer Engagement</p>\n<p>Operations Management and Process Improvement</p>\n<p>Ethics and Corporate Social Responsibility</p>\n<p>Negotiation and Conflict Resolution</p>\n<p>Leading Change in Organizations</p>\n<p>Capstone Project: Applying Leadership Skills</p>\n<p>Conclusion and Next Steps in Business Leadership</p>'),
(26, 'Udemy - Complete Business Course', 'This course provides comprehensive knowledge of business, finance including finance, marketing and entrepreneurship.', 'https://cdn.salla.sa/mQZeAo/13b7aa11-7af0-4abb-b811-412fdfc48613-1000x663.75-YxcXUgs1H3I3tMV3ITJjbI5e7GJMdW83gJI160w1.jpg', 320.00, 4, '2024-10-06 14:21:45', '<p>Introduction to Business Fundamentals</p>\n<p>Understanding Business Models and Types</p>\n<p>Market Research and Analysis Techniques</p>\n<p>Financial Management and Accounting Basics</p>\n<p>Marketing Strategies and Planning</p>\n<p>Sales Techniques and Customer Engagement</p>\n<p>Operations Management Essentials</p>\n<p>Human Resources Management</p>\n<p>Business Communication and Presentation Skills</p>\n<p>Entrepreneurship and Startup Strategies</p>\n<p>Creating a Business Plan</p>\n<p>Case Studies of Successful Businesses</p>\n<p>Final Project: Developing a Comprehensive Business Strategy</p>\n<p>Conclusion and Career Opportunities in Business</p>'),
(27, 'LinkedIn Learning - Business Analysis Foundations', 'This course helps you master the analytical skills needed to succeed in the business field.', 'https://media.licdn.com/dms/image/v2/D560DAQH3dUQYhefIZg/learning-public-crop_288_512/learning-public-crop_288_512/0/1723137556887?e=2147483647&v=beta&t=3ggeLfImUxQZHQPfZP_4WpLlFB5GbVwZcHutR0v1EMs', 159.00, 4, '2024-10-06 14:21:45', '<p>Introduction to Business Analysis</p>\n<p>The Role of a Business Analyst</p>\n<p>Understanding Business Needs and Requirements</p>\n<p>Techniques for Gathering Requirements</p>\n<p>Documenting and Analyzing Requirements</p>\n<p>Stakeholder Engagement and Communication</p>\n<p>Modeling Business Processes</p>\n<p>Using Data Analysis in Business Decisions</p>\n<p>Evaluating Solutions and Making Recommendations</p>\n<p>Agile Methodologies and Business Analysis</p>\n<p>Tools and Software for Business Analysts</p>\n<p>Case Studies and Real-World Applications</p>\n<p>Conclusion and Next Steps in Business Analysis</p>'),
(28, 'Harvard Business School Online - CORe', 'This course provides knowledge of finance, marketing and data analysis, suitable for those who want to understand business.', 'https://hbr.org/resources/images/article_assets/2023/05/1200x627_frame_earn.png', 510.00, 4, '2024-10-06 14:21:45', '<p>Introduction to CORe: Overview and Objectives</p>\n<p>Business Analytics: Data-Driven Decision Making</p>\n<p>Economics for Managers: Understanding Market Dynamics</p>\n<p>Financial Accounting: Principles and Practices</p>\n<p>Marketing: Creating Value and Building Brands</p>\n<p>Leadership and Management Essentials</p>\n<p>Business Strategy: Aligning Resources and Goals</p>\n<p>Negotiation and Conflict Resolution Skills</p>\n<p>Capstone Project: Integrating Concepts Across Disciplines</p>\n<p>Networking and Career Development in Business</p>\n<p>Conclusion and Certification Overview</p>'),
(29, 'FutureLearn - Business and Management ', 'This course focuses on the fundamental concepts in management and business strategy.', 'https://bizequals.com/media/com_jbusinessdirectory/pictures/companies/80/futurelearn_become_better_manager_course.webp', 320.00, 4, '2024-10-06 14:21:45', '<p>Introduction to Business and Management</p>\n<p>Understanding Business Structures and Functions</p>\n<p>Principles of Management and Leadership</p>\n<p>Strategic Planning and Decision Making</p>\n<p>Marketing Fundamentals and Consumer Behavior</p>\n<p>Financial Management Basics</p>\n<p>Operations Management and Supply Chain</p>\n<p>Human Resource Management Essentials</p>\n<p>Business Ethics and Corporate Social Responsibility</p>\n<p>Project Management Techniques</p>\n<p>Digital Transformation in Business</p>\n<p>Case Studies in Business Management</p>\n<p>Conclusion and Future Trends in Business and Management</p>'),
(30, 'Duolingo - Language Courses ', 'Duolingo offers a variety of courses for different languages ​​such as Spanish, French, German and many more, with fun and interactive learning methods.', 'https://blog.duolingo.com/content/images/2023/11/DLR23_List-Global-top-ten.png', 640.00, 5, '2024-10-06 14:37:11', '<p>Introduction to Language Learning</p>\n<p>Basic Vocabulary and Phrases</p>\n<p>Grammar Fundamentals</p>\n<p>Listening and Speaking Skills</p>\n<p>Reading Comprehension Techniques</p>\n<p>Writing and Sentence Structure</p>\n<p>Cultural Context and Usage</p>\n<p>Advanced Vocabulary and Expressions</p>\n<p>Practice Exercises and Quizzes</p>\n<p>Conversational Skills Development</p>\n<p>Language Proficiency Assessment</p>\n<p>Conclusion and Continued Learning Resources</p>'),
(31, 'Coursera - Learn Spanish', 'Basic Spanish Vocabulary Instructor: University of California, Davis. This course helps learners build basic vocabulary in Spanish.', 'https://tlcdenia.com/wp-content/uploads/2021/07/learning-spanish-for-beginners-tips.jpg', 420.00, 5, '2024-10-06 14:37:11', '<p>Introduction to Spanish Language and Culture</p>\n<p>Basic Spanish Vocabulary and Phrases</p>\n<p>Essential Grammar: Nouns, Verbs, and Adjectives</p>\n<p>Constructing Simple Sentences</p>\n<p>Common Greetings and Introductions</p>\n<p>Listening Comprehension Skills</p>\n<p>Speaking Practice: Pronunciation and Dialogue</p>\n<p>Reading Comprehension: Short Texts and Stories</p>\n<p>Writing Skills: Basic Sentence Construction</p>\n<p>Cultural Insights: Spanish-Speaking Countries</p>\n<p>Intermediate Vocabulary and Expressions</p>\n<p>Conversational Spanish: Everyday Situations</p>\n<p>Final Project: Presenting in Spanish</p>\n<p>Conclusion and Resources for Continued Learning</p>'),
(32, 'Rosetta Stone - Learn Languages', 'Rosetta Stone offers courses for many languages, focusing on improving listening, speaking, reading and writing skills.', 'https://i.pcmag.com/imagery/reviews/06Dnt5LBgnp44bWmv412F3a-32.fit_lim.size_1050x591.v1615218609.png', 300.00, 5, '2024-10-06 14:37:11', '<p>Introduction to Language Learning Methodology</p>\n<p>Basic Vocabulary: Common Words and Phrases</p>\n<p>Fundamentals of Grammar and Syntax</p>\n<p>Listening Skills: Understanding Spoken Language</p>\n<p>Speaking Practice: Pronunciation and Fluency</p>\n<p>Reading Comprehension: Engaging with Texts</p>\n<p>Writing Skills: Constructing Sentences</p>\n<p>Cultural Context and Language Use</p>\n<p>Advanced Vocabulary and Contextual Usage</p>\n<p>Real-Life Conversations: Simulated Scenarios</p>\n<p>Progress Tracking and Assessment</p>\n<p>Final Review and Continuing Language Development</p>'),
(33, 'Babbel - Language Courses', 'Babbel offers courses for many languages, with practical content suitable for beginners.', 'https://play-lh.googleusercontent.com/KlnTdYieCr7ZSty2wR5MmIgCQt1yWW76ZFn5w0-j9nvHHTDO-sg5k1SO5Hp8oPrAm04x', 290.00, 5, '2024-10-06 14:37:11', '<p>Introduction to Language Learning</p>\n<p>Basic Vocabulary and Everyday Phrases</p>\n<p>Essential Grammar: Sentence Structure and Rules</p>\n<p>Pronunciation Practice and Listening Skills</p>\n<p>Conversational Skills: Dialogues and Role-Playing</p>\n<p>Cultural Insights: Language in Context</p>\n<p>Reading Comprehension: Engaging with Texts</p>\n<p>Writing Practice: From Words to Sentences</p>\n<p>Intermediate Vocabulary and Expressions</p>\n<p>Real-Life Scenarios: Applying Language Skills</p>\n<p>Review and Reinforcement Activities</p>\n<p>Progress Tracking and Language Assessment</p>\n<p>Conclusion and Resources for Continued Learning</p>'),
(34, 'EDX - Mandarin Chinese Essentials ', 'This course from MandarinX helps you grasp the basic concepts of Chinese, including vocabulary and grammar.', 'https://em5b2ccmzk4.exactdn.com/wp-content/uploads/2023/09/Mandarin-Chinese-Essentials-Online-Course.png?strip=all&lossy=1&ssl=1', 370.00, 5, '2024-10-06 14:37:11', '<p>Introduction to Mandarin Chinese Language</p>\n<p>Understanding Chinese Characters and Pinyin</p>\n<p>Basic Vocabulary: Greetings and Everyday Phrases</p>\n<p>Essential Grammar: Sentence Structure and Particles</p>\n<p>Pronunciation and Tones: Mastering the Basics</p>\n<p>Common Expressions for Daily Conversations</p>\n<p>Listening Comprehension: Engaging with Audio</p>\n<p>Speaking Practice: Interactive Dialogues</p>\n<p>Reading Comprehension: Short Texts and Dialogues</p>\n<p>Writing Basics: Stroke Order and Simple Characters</p>\n<p>Cultural Context: Understanding Chinese Culture</p>\n<p>Intermediate Vocabulary and Situational Dialogues</p>\n<p>Final Project: Simple Conversations in Mandarin</p>\n<p>Conclusion and Resources for Continued Learning</p>'),
(35, 'Udemy - The Complete French Course', 'Learn French for Life This course provides comprehensive knowledge of French, from basic to advanced.', 'https://img-c.udemycdn.com/user/200_H/152724532_1aaa.jpg', 500.00, 5, '2024-10-06 14:37:11', '<p>Introduction to French Language and Culture</p>\r\n<p>Basic Vocabulary: Greetings and Common Phrases</p>\r\n<p>Essential Grammar: Nouns, Verbs, and Adjectives</p>\r\n<p>Constructing Simple Sentences</p>\r\n<p>Pronunciation: Mastering French Sounds</p>\r\n<p>Listening Comprehension: Engaging with Audio Content</p>\r\n<p>Speaking Practice: Interactive Dialogues</p>\r\n<p>Reading Comprehension: Short Texts and Articles</p>\r\n<p>Writing Skills: From Simple Sentences to Paragraphs</p>\r\n<p>Cultural Insights: French Etiquette and Customs</p>\r\n<p>Intermediate Vocabulary and Expressions</p>\r\n<p>Conversational French: Everyday Situations</p>\r\n<p>Final Project: Presenting in French</p>\r\n<p>Conclusion and Resources for Continued Learning</p>');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `course_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 150.00, 'completed', '2024-10-16 17:14:01', '2024-10-18 11:32:44'),
(2, 1, 1, 200.00, 'completed', '2024-10-16 17:20:12', '2024-10-19 02:12:51'),
(9, 1, 7, 115.00, 'pending', '2024-10-16 17:47:12', '2024-10-16 17:47:12'),
(25, 7, 17, 139.00, 'pending', '2024-10-18 11:32:07', '2024-10-18 11:32:07'),
(26, 7, 1, 150.00, 'pending', '2024-10-18 11:32:07', '2024-10-18 11:32:07'),
(27, 7, 2, 200.00, 'pending', '2024-10-18 12:22:30', '2024-10-18 12:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `date_of_birth`, `gender`, `created_at`, `name`, `phone_number`, `address`, `bio`) VALUES
(1, 'xintuoiquan@gmail.com', '12345', '2004-09-19', 'male', '2024-10-02 16:40:43', 'Trần Thế Quân', '0396865585', 'Hà Nội', 'Từng là sinh viên trường Đại Học Thủ Đô Hà Nội'),
(3, 'ngochuyenn1504@gmail.com', '15042004', '2004-04-15', 'male', '2024-10-04 11:42:03', 'Nguyễn Ngọc Huyền', '0973334429', 'Hà Nội', 'Từng là sinh viên trường Đại Học Thủ Đô Hà Nội'),
(7, 'Danggiap@gmail.com', '12345', '2004-02-12', 'male', '2024-10-07 13:07:17', 'Lê Đăng Giáp', '0923344664', 'Hà Nội', 'Từng là sinh viên trường Đại Học Thủ Đô Hà Nội zzzz'),
(18, 'Admin@gmail.com', 'admin123', NULL, NULL, '2024-10-19 02:10:59', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
