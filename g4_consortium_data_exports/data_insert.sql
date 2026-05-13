-- GENERAL
INSERT INTO institution (instId, instName) VALUES
(1, 'Hudson University'),
(2, 'Metro Medical'),
(3, 'Empire Institute'),
(4, 'North Tech'),
(5, 'Civic Lab'),
(6, 'Riverside Bioworks'),
(7, 'Summit Genomics'),
(8, 'Pinnacle Systems'),
(9, 'Valley Test Co.');

INSERT INTO researcher (researcherId, researcherName, instId, role) VALUES
(1, 'Maya Chen', 1, 'PI'),
(2, 'Omar Patel', 2, 'PI'),
(3, 'Elena Varga', 3, 'PI'),
(4, 'James Hall', 4, 'PI'),
(5, 'Sofia Ruiz', 5, 'PI'),
(6, 'Lena Brooks', 6, 'PI'),
(7, 'Kai Nguyen', 7, 'PI'),
(8, 'Priya Das', 8, 'PI'),
(9, 'Aaron Fitch', 9, 'Associate'),
(10, 'Yuki Tanaka', 1, 'PI'),
(11, 'Clara Ming', 1, 'Associate'),
(12, 'Felix Grant', 1, 'Associate'),
(13, 'Ravi Okonkwo', 2, 'Associate'),
(14, 'Hana Solis', 2, 'Associate'),
(15, 'Tessa Holm', 3, 'Associate'),
(16, 'Ben Adler', 3, 'Associate'),
(17, 'Daniel Park', 4, 'Associate'),
(18, 'Mia Fowler', 4, 'Associate'),
(19, 'Amara Diallo', 5, 'Associate'),
(20, 'Cleo Watts', 5, 'Associate'),
(21, 'Ivan Petrov', 6, 'Associate'),
(22, 'Zara Malik', 6, 'Associate'),
(23, 'Suki Yamamoto', 7, 'Associate'),
(24, 'Otto Reeves', 7, 'Associate'),
(25, 'Nora Stein', 1, 'Associate'),
(26, 'Jude Navarro', 1, 'Associate');
-- MAINTENANCE
INSERT INTO facility (facId, facName, facPurp, facDescript, fConfigName, instId) VALUES
(1, 'Wet Lab 1', 'Wet Lab', 'Cell culture and assays', 'Std-Bio', 1),
(2, 'Wet Lab 2', 'Wet Lab', 'Biochem and protein work', 'Std-Chem', 6),
(3, 'Imaging 1', 'Imaging', 'Confocal fluorescence suite', 'Confocal', 2),
(4, 'Imaging 2', 'Imaging', 'Cryo-EM suite', 'CryoEM', 7),
(5, 'Clean Room 1', 'Fabrication', 'Silicon chip fabrication', 'ISO7', 3),
(6, 'Compute 1', 'Compute', 'HPC GPU cluster A', 'GPU-A', 4),
(7, 'Compute 2', 'Compute', 'HPC GPU cluster B', 'GPU-B', 8),
(8, 'Test Bay 1', 'Testing', 'Thermal stress testing', 'Thermal', 5),
(9, 'Test Bay 2', 'Testing', 'Vibration and load testing', 'Vibration', 9);

INSERT INTO equipment (equipId, equipName, isMove, isReconfig, equipDescript, equipMethod) VALUES
(1, 'Centrifuge A', 1, 1, 'High-speed spin separator', 'Differential spin'),
(2, 'Centrifuge B', 1, 1, 'Ultra-speed spin separator', 'Ultracentrifugation'),
(3, 'Confocal Scope', 0, 1, 'Fluorescence imaging system', 'Confocal fluorescence'),
(4, 'Cryo-EM Unit', 0, 0, 'Cryo electron microscope', 'Cryo-electron microscopy'),
(5, 'Plasma Etcher', 0, 1, 'Silicon chip etch tool', 'Reactive ion etch'),
(6, 'Sputter Coater', 0, 1, 'Thin film deposition system', 'Magnetron sputtering'),
(7, 'GPU Rack A', 0, 1, 'NVIDIA A100 compute node', 'CUDA parallel'),
(8, 'GPU Rack B', 0, 1, 'NVIDIA H100 compute node', 'CUDA parallel'),
(9, 'Thermal Rig', 1, 0, 'Thermal cycling test rig', 'Cyclic thermal load'),
(10, 'Load Frame', 0, 1, 'Servo-hydraulic load tester', 'Servo-hydraulic'),
(11, 'PCR Thermocycler', 1, 1, 'Gene amplification system', 'Polymerase chain rxn'),
(12, 'Gel Electrophoresis', 1, 1, 'Protein band separation unit', 'SDS-PAGE');

INSERT INTO equip_assignment (equipId, facId, eAssignStart, eAssignEnd) VALUES
(1, 1, '2024-03-10', '2027-03-09'),
(2, 2, '2025-01-15', '2027-01-14'),
(3, 3, '2023-06-01', '2026-05-31'),
(4, 4, '2025-07-20', '2028-07-19'),
(5, 5, '2024-09-01', '2027-08-31'),
(6, 5, '2024-11-12', '2027-11-11'),
(7, 6, '2025-02-01', '2028-01-31'),
(8, 7, '2025-05-15', '2028-05-14'),
(9, 8, '2023-11-01', '2026-10-31'),
(10, 9, '2024-08-20', '2027-08-19'),
(11, 1, '2024-06-01', '2027-05-31'),
(12, 2, '2025-03-10', '2028-03-09');

-- EXPERIMENTS
INSERT INTO tech_staff (staffId, staffName, staffRole) VALUES
(1, 'Alex Turner', 'Wet Lab Tech'),
(2, 'Priya Nair', 'Imaging Specialist'),
(3, 'Leo Moss', 'Fab Engineer'),
(4, 'Grace Kim', 'Systems Engineer'),
(5, 'Noah Bell', 'Test Engineer'),
(6, 'Sam Rivera', 'Wet Lab Tech'),
(7, 'Dana Cho', 'Imaging Specialist'),
(8, 'Finn O''Brien', 'Compute Admin');

INSERT INTO request
(requestId, researcherId, requestCreatedDate, requestStatus, facilityTypeRequested, startDate, endDate, staffingNeeds, safetyConsiderations) VALUES
(1, 1, '2026-03-10', 'approved', 'Wet Lab', '2026-04-03', '2026-04-18', '2 techs', 'Bio-safety level 2'),
(2, 2, '2026-03-20', 'approved', 'Imaging', '2026-04-15', '2026-05-05', '1 tech', 'Laser eye protection'),
(3, 3, '2026-04-01', 'approved', 'Fabrication', '2026-05-05', '2026-05-30', '3 techs', 'Chemical and dust'),
(4, 4, '2026-04-20', 'approved', 'Compute', '2026-05-20', '2026-06-10', '1 tech', 'Secure data handling'),
(5, 5, '2026-05-01', 'approved', 'Testing', '2026-06-02', '2026-06-25', '2 techs', 'Heat and load hazards'),
(6, 6, '2026-03-25', 'approved', 'Wet Lab', '2026-04-20', '2026-05-10', '1 tech', 'Bio-safety level 1'),
(7, 7, '2026-04-10', 'approved', 'Imaging', '2026-05-12', '2026-06-01', '2 techs', 'Radiation shielding'),
(8, 10, '2026-04-28', 'approved', 'Compute', '2026-06-08', '2026-06-28', '1 tech', 'Secure access');

INSERT INTO request_decision (decisionId, requestId, staffId, decisionDate, decision) VALUES
(1, 1, 4, '2026-03-14', 'approved'),
(2, 2, 2, '2026-03-24', 'approved'),
(3, 3, 3, '2026-04-05', 'approved'),
(4, 4, 8, '2026-04-24', 'approved'),
(5, 5, 5, '2026-05-05', 'approved'),
(6, 6, 1, '2026-03-28', 'approved'),
(7, 7, 7, '2026-04-14', 'approved'),
(8, 8, 4, '2026-05-02', 'approved');

INSERT INTO experiment
(experimentId, leadResearcherId, requestId, experimentTitle, experimentStatus, globalStartDate, globalEndDate) VALUES
(1, 1, 1, 'Stem Cell Proliferation Assay', 'completed', '2026-04-03', '2026-04-18'),
(2, 2, 2, 'Retinal Ganglion Imaging', 'completed', '2026-04-15', '2026-05-05'),
(3, 3, 3, 'MEMS Chip Fabrication Trial', 'completed', '2026-05-05', '2026-05-30'),
(4, 4, 4, 'Climate Simulation HPC Run', 'completed', '2026-05-20', '2026-06-10'),
(5, 5, 5, 'Composite Material Stress Test', 'completed', '2026-06-02', '2026-06-25'),
(6, 6, 6, 'Protein Folding Kinetics Study', 'completed', '2026-04-20', '2026-05-10'),
(7, 7, 7, 'Cryo-EM Structural Analysis', 'active', '2026-05-12', '2026-06-01'),
(8, 10, 8, 'Neural Net Training Run', 'active', '2026-06-08', '2026-06-28');

INSERT INTO experiment_phase
(phaseId, experimentId, phaseNo, actualStartDate, actualEndDate, phaseStatus) VALUES
(1, 1, 1, '2026-04-03', '2026-04-07', 'completed'),
(2, 1, 2, '2026-04-08', '2026-04-18', 'completed'),
(3, 2, 1, '2026-04-15', '2026-04-22', 'completed'),
(4, 2, 2, '2026-04-23', '2026-05-05', 'completed'),
(5, 3, 1, '2026-05-05', '2026-05-14', 'completed'),
(6, 3, 2, '2026-05-15', '2026-05-30', 'completed'),
(7, 4, 1, '2026-05-20', '2026-05-28', 'completed'),
(8, 4, 2, '2026-05-29', '2026-06-10', 'completed'),
(9, 5, 1, '2026-06-02', '2026-06-11', 'completed'),
(10, 5, 2, '2026-06-12', '2026-06-25', 'completed'),
(11, 6, 1, '2026-04-20', '2026-05-10', 'completed'),
(12, 7, 1, '2026-05-12', '2026-05-21', 'in_progress'),
(13, 7, 2, '2026-05-22', '2026-06-01', 'in_progress'),
(14, 8, 1, '2026-06-08', '2026-06-18', 'in_progress'),
(15, 8, 2, '2026-06-19', '2026-06-28', 'in_progress');

INSERT INTO facility_allocation
(fAllocationId, facId, experimentId, allocStartDate, allocEndDate) VALUES
(1, 1, 1, '2026-04-03', '2026-04-18'),
(2, 2, 1, '2026-04-10', '2026-04-18'),
(3, 3, 2, '2026-04-15', '2026-05-05'),
(4, 4, 2, '2026-04-28', '2026-05-05'),
(5, 5, 3, '2026-05-05', '2026-05-30'),
(6, 6, 4, '2026-05-20', '2026-06-10'),
(7, 7, 4, '2026-05-25', '2026-06-10'),
(8, 8, 5, '2026-06-02', '2026-06-25'),
(9, 9, 5, '2026-06-10', '2026-06-25'),
(10, 2, 6, '2026-04-20', '2026-05-10'),
(11, 3, 6, '2026-04-26', '2026-05-05'),
(12, 4, 7, '2026-05-12', '2026-06-01'),
(13, 3, 7, '2026-05-20', '2026-06-01'),
(14, 6, 8, '2026-06-08', '2026-06-28'),
(15, 7, 8, '2026-06-15', '2026-06-28');

INSERT INTO equipment_allocation
(eAllocationId, equipId, experimentId, allocStartDate, allocEndDate) VALUES
(1, 1, 1, '2026-04-03', '2026-04-18'),
(2, 11, 1, '2026-04-03', '2026-04-18'),
(3, 12, 1, '2026-04-08', '2026-04-18'),
(4, 3, 2, '2026-04-15', '2026-05-05'),
(5, 2, 2, '2026-04-28', '2026-05-05'),
(6, 5, 3, '2026-05-05', '2026-05-30'),
(7, 6, 3, '2026-05-12', '2026-05-30'),
(8, 7, 4, '2026-05-20', '2026-06-10'),
(9, 8, 4, '2026-05-25', '2026-06-10'),
(10, 9, 5, '2026-06-02', '2026-06-25'),
(11, 10, 5, '2026-06-10', '2026-06-25'),
(12, 12, 6, '2026-04-20', '2026-05-10'),
(13, 1, 6, '2026-04-26', '2026-05-10'),
(14, 4, 7, '2026-05-12', '2026-06-01'),
(15, 3, 7, '2026-05-20', '2026-06-01'),
(16, 7, 8, '2026-06-08', '2026-06-28'),
(17, 8, 8, '2026-06-15', '2026-06-28');

-- BILLING
INSERT INTO billing_account
(accountId, accountType, InstId, deptName, restrictions, accountStatus) VALUES
(1, 'grant', 1, 'Stem Cell Lab', 'Wet lab only', 'active'),
(2, 'institutional', 2, 'Ophthalmology', 'Imaging only', 'active'),
(3, 'grant', 3, 'MEMS Group', 'Fab only', 'active'),
(4, 'institutional', 4, 'Climate Computing', 'HPC only', 'active'),
(5, 'contract', 5, 'Materials Test', 'Test only', 'active'),
(6, 'grant', 6, 'Proteomics Lab', 'Wet lab & imaging', 'active'),
(7, 'institutional', 7, 'Structural Bio', 'Imaging only', 'active'),
(8, 'institutional', 8, 'AI Research', 'HPC only', 'active');

INSERT INTO billing_period
(periodId, periodStartDate, periodEndDate, periodStatus) VALUES
(1, '2026-01-01', '2026-03-31', 'closed'),
(2, '2026-04-01', '2026-06-30', 'closed'),
(3, '2026-07-01', '2026-09-30', 'closed'),
(4, '2026-10-01', '2026-12-31', 'closed');

INSERT INTO usage
(usageId, experimentId, usageType, usageStart, usageEnd) VALUES
(1,1,'facility','2026-04-04 08:00','2026-04-04 17:00'),
(2,1,'facility','2026-04-11 08:30','2026-04-11 15:30'),
(3,2,'facility','2026-04-16 09:00','2026-04-16 14:30'),
(4,2,'facility','2026-04-29 10:00','2026-04-29 16:00'),
(5,3,'facility','2026-05-07 07:30','2026-05-07 17:30'),
(6,3,'facility','2026-05-14 07:30','2026-05-14 16:00'),
(7,4,'facility','2026-05-22 06:00','2026-05-22 20:00'),
(8,4,'facility','2026-05-28 06:30','2026-05-28 19:30'),
(9,5,'facility','2026-06-05 07:00','2026-06-05 17:00'),
(10,5,'facility','2026-06-12 08:00','2026-06-12 17:30'),
(11,6,'facility','2026-04-22 09:00','2026-04-22 13:30'),
(12,6,'facility','2026-04-27 10:00','2026-04-27 14:00'),
(13,7,'facility','2026-05-14 08:00','2026-05-14 18:00'),
(14,7,'facility','2026-05-22 09:00','2026-05-22 15:00'),
(15,8,'facility','2026-06-10 07:00','2026-06-10 21:00'),
(16,8,'facility','2026-06-18 07:30','2026-06-18 20:30'),
(17,1,'equipment','2026-04-04 09:00','2026-04-04 11:30'),
(18,1,'equipment','2026-04-05 08:00','2026-04-05 10:00'),
(19,1,'equipment','2026-04-11 09:00','2026-04-11 13:00'),
(20,2,'equipment','2026-04-16 10:00','2026-04-16 14:00'),
(21,2,'equipment','2026-04-29 10:30','2026-04-29 13:30'),
(22,3,'equipment','2026-05-07 08:00','2026-05-07 15:00'),
(23,3,'equipment','2026-05-14 08:00','2026-05-14 13:30'),
(24,4,'equipment','2026-05-22 07:00','2026-05-22 19:00'),
(25,4,'equipment','2026-05-28 07:00','2026-05-28 18:30'),
(26,5,'equipment','2026-06-05 08:00','2026-06-05 16:00'),
(27,5,'equipment','2026-06-12 09:00','2026-06-12 17:00'),
(28,6,'equipment','2026-04-22 09:30','2026-04-22 13:00'),
(29,6,'equipment','2026-04-27 10:00','2026-04-27 12:00'),
(30,7,'equipment','2026-05-14 08:30','2026-05-14 17:30'),
(31,7,'equipment','2026-05-22 09:30','2026-05-22 15:00'),
(32,8,'equipment','2026-06-10 07:30','2026-06-10 20:00'),
(33,8,'equipment','2026-06-18 08:00','2026-06-18 20:00'),
(34,1,'staff','2026-04-04 08:00','2026-04-04 17:00'),
(35,1,'staff','2026-04-11 08:30','2026-04-11 15:30'),
(36,2,'staff','2026-04-16 09:00','2026-04-16 14:30'),
(37,2,'staff','2026-04-29 10:00','2026-04-29 16:00'),
(38,3,'staff','2026-05-07 07:30','2026-05-07 17:30'),
(39,3,'staff','2026-05-14 07:30','2026-05-14 16:00'),
(40,4,'staff','2026-05-22 06:00','2026-05-22 20:00'),
(41,4,'staff','2026-05-28 06:30','2026-05-28 19:30'),
(42,5,'staff','2026-06-05 07:00','2026-06-05 17:00'),
(43,5,'staff','2026-06-12 08:00','2026-06-12 17:30'),
(44,6,'staff','2026-04-22 09:00','2026-04-22 13:30'),
(45,6,'staff','2026-04-27 10:00','2026-04-27 14:00'),
(46,7,'staff','2026-05-14 08:00','2026-05-14 18:00'),
(47,7,'staff','2026-05-22 09:00','2026-05-22 15:00'),
(48,8,'staff','2026-06-10 07:00','2026-06-10 21:00'),
(49,8,'staff','2026-06-18 07:30','2026-06-18 20:30');

INSERT INTO facility_usage (usageId, facId) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,5),(7,6),(8,7),
(9,8),(10,9),(11,2),(12,3),(13,4),(14,3),(15,6),(16,7);

INSERT INTO equipment_usage (usageId, equipId) VALUES
(17,1),(18,11),(19,12),(20,3),(21,2),(22,5),(23,6),(24,7),
(25,8),(26,9),(27,10),(28,12),(29,1),(30,4),(31,3),(32,7),(33,8);

INSERT INTO staff_usage (usageId, staffId) VALUES
(34,1),(35,6),(36,2),(37,7),(38,3),(39,3),(40,4),(41,8),
(42,5),(43,5),(44,1),(45,6),(46,2),(47,7),(48,4),(49,8);

INSERT INTO invoice
(invoiceId, periodId, accountId, invoiceDate, invoiceStatus) VALUES
(1,1,1,'2026-03-31','issued'),
(2,1,2,'2026-03-31','issued'),
(3,2,3,'2026-05-31','issued'),
(4,2,4,'2026-05-31','issued'),
(5,3,5,'2026-09-30','issued'),
(6,1,6,'2026-03-31','issued'),
(7,2,7,'2026-05-31','issued'),
(8,4,8,'2026-12-31','issued');

INSERT INTO charge
(chargeId, usageId, chargeStatus, baseAmount, finalAmount, responsibleAccountId, createdAt, finalizedAt) VALUES
(1,1,'finalized',800,800,1,'2026-04-04 18:00','2026-04-05 09:00'),
(2,2,'finalized',640,640,1,'2026-04-11 16:00','2026-04-12 09:00'),
(3,17,'finalized',210,210,1,'2026-04-04 12:00','2026-04-05 09:00'),
(4,18,'finalized',160,160,1,'2026-04-05 11:00','2026-04-06 09:00'),
(5,19,'finalized',175,175,1,'2026-04-11 14:00','2026-04-12 09:00'),
(6,3,'finalized',580,580,2,'2026-04-16 15:00','2026-04-17 09:00'),
(7,4,'finalized',720,720,2,'2026-04-29 17:00','2026-04-30 09:00'),
(8,20,'finalized',310,310,2,'2026-04-16 15:00','2026-04-17 09:00'),
(9,5,'finalized',1050,1050,3,'2026-05-07 18:00','2026-05-08 09:00'),
(10,6,'finalized',870,870,3,'2026-05-14 17:00','2026-05-15 09:00'),
(11,22,'finalized',430,430,3,'2026-05-07 16:00','2026-05-08 09:00'),
(12,7,'finalized',1200,1200,4,'2026-05-22 21:00','2026-05-23 09:00'),
(13,8,'finalized',1150,1150,4,'2026-05-28 20:00','2026-05-29 09:00'),
(14,24,'finalized',540,540,4,'2026-05-22 20:00','2026-05-23 09:00'),
(15,9,'finalized',700,700,5,'2026-07-05 18:00','2026-07-06 09:00'),
(16,10,'finalized',690,690,5,'2026-07-12 18:00','2026-07-13 09:00'),
(17,26,'finalized',380,380,5,'2026-07-05 17:00','2026-07-06 09:00'),
(18,11,'finalized',490,490,6,'2026-04-22 14:00','2026-04-23 09:00'),
(19,12,'finalized',420,420,6,'2026-04-27 15:00','2026-04-28 09:00'),
(20,13,'finalized',950,950,7,'2026-05-14 19:00','2026-05-15 09:00'),
(21,14,'finalized',830,830,7,'2026-05-22 16:00','2026-05-23 09:00'),
(22,15,'finalized',1380,1380,8,'2026-10-10 22:00','2026-10-11 09:00'),
(23,16,'finalized',1310,1310,8,'2026-10-18 21:00','2026-10-19 09:00');

INSERT INTO invoice_line
(invoiceId, chargeId, lineAmount) VALUES
(1,1,800),(1,2,640),(1,3,210),(1,4,160),(1,5,175),
(2,6,580),(2,7,720),(2,8,310),
(3,9,1050),(3,10,870),(3,11,430),
(4,12,1200),(4,13,1150),(4,14,540),
(5,15,700),(5,16,690),(5,17,380),
(6,18,490),(6,19,420),
(7,20,950),(7,21,830),
(8,22,1380),(8,23,1310);

