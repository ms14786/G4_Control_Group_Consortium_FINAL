PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS experiment_phase;
DROP TABLE IF EXISTS invoice_line;
DROP TABLE IF EXISTS charge;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS billing_period;
DROP TABLE IF EXISTS billing_account;
DROP TABLE IF EXISTS request_decision;
DROP TABLE IF EXISTS staff_usage;
DROP TABLE IF EXISTS tech_staff;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS experiment;
DROP TABLE IF EXISTS equipment_allocation;
DROP TABLE IF EXISTS equipment_usage;
DROP TABLE IF EXISTS equip_assignment;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS facility_allocation;
DROP TABLE IF EXISTS facility_usage;
DROP TABLE IF EXISTS facility;
DROP TABLE IF EXISTS researcher;
DROP TABLE IF EXISTS institution;
DROP TABLE IF EXISTS usage;

-- GENERAL
CREATE TABLE institution(
    instId INTEGER PRIMARY KEY,
    instName TEXT NOT NULL
);

CREATE TABLE researcher (
    researcherId INTEGER PRIMARY KEY,
    researcherName TEXT NOT NULL,
    instId INTEGER NOT NULL,
    role TEXT NOT NULL,
    CHECK (role IN ('PI', 'Associate'))
    FOREIGN KEY (instId) REFERENCES institution(instId)
);

-- MAINTENANCE
CREATE TABLE facility(
    facId INTEGER PRIMARY KEY,
    facName TEXT NOT NULL,
    facPurp TEXT,
    facDescript TEXT,
    fConfigName TEXT NOT NULL,
    instId INTEGER,
    FOREIGN KEY (instId) REFERENCES institution(instId)
);

CREATE TABLE facility_usage (
    usageId INTEGER PRIMARY KEY,
    facId INTEGER NOT NULL,
    FOREIGN KEY (usageId) REFERENCES usage(usageId),
    FOREIGN KEY (facId) REFERENCES facility(facId)
);

CREATE TABLE facility_allocation (
    fAllocationId INTEGER PRIMARY KEY,
    facId INTEGER NOT NULL,
    experimentId INTEGER NOT NULL,
    allocStartDate TEXT NOT NULL,
    allocEndDate TEXT NOT NULL,
    CHECK (allocEndDate>=allocStartDate),
    FOREIGN KEY (facId) REFERENCES facility(facId),
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId)
);
CREATE TABLE equipment (
    equipId INTEGER PRIMARY KEY, 
    equipName TEXT NOT NULL,
    isMove INTEGER NOT NULL, -- boolean
    isReconfig INTEGER NOT NULL,
    equipDescript TEXT NOT NULL,
    equipMethod TEXT NOT NULL,
    CHECK (isMove IN (0,1)),
    CHECK (isReconfig IN (0,1))
);


CREATE TABLE equip_assignment (
    equipId INTEGER NOT NULL,
    facId INTEGER NOT NULL,
    eAssignStart TEXT NOT NULL, -- DATE
    eAssignEnd TEXT NOT NULL,
    CHECK (eAssignEnd>=eAssignStart),
    PRIMARY KEY(equipId, facId),
    FOREIGN KEY(equipId) REFERENCES equipment(equipId),
    FOREIGN KEY(facId) REFERENCES facility(facId)
);

CREATE TABLE equipment_usage (
    usageId INTEGER PRIMARY KEY,
    equipId INTEGER NOT NULL,
    FOREIGN KEY (usageId) REFERENCES usage(usageId),
    FOREIGN KEY (equipId) REFERENCES equipment(equipId)
);

CREATE TABLE usage (
    usageId INTEGER PRIMARY KEY,
    experimentId INTEGER,
    usageType TEXT NOT NULL,
    usageStart TEXT NOT NULL,
    usageEnd TEXT NOT NULL,
    CHECK (usageEnd >= usageStart),
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId)
);


CREATE TABLE equipment_allocation (
    eAllocationId INTEGER PRIMARY KEY,
    equipId INTEGER NOT NULL,
    experimentId INTEGER NOT NULL,
    allocStartDate TEXT NOT NULL,
    allocEndDate TEXT,
    CHECK(allocEndDate >= allocStartDate),
    FOREIGN KEY (equipId) REFERENCES equipment(equipId),
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId)
);


-- EXPERIMENTS
CREATE TABLE experiment (
    experimentId INTEGER PRIMARY KEY,
    leadResearcherId INTEGER NOT NULL,
    requestId INTEGER,
    experimentTitle TEXT NOT NULL,
    experimentStatus TEXT,
    globalStartDate TEXT,
    globalEndDate TEXT,
    CHECK(globalEndDate>=globalStartDate),
    CHECK (experimentStatus IN ('pending', 'active', 'completed', 'cancelled')),
    FOREIGN KEY (leadResearcherId) REFERENCES researcher(researcherId),
    FOREIGN KEY (requestId) REFERENCES request(requestId)
);

CREATE TABLE request (
    requestId INTEGER PRIMARY KEY,
    researcherId INTEGER NOT NULL,
    requestCreatedDate TEXT NOT NULL,
    requestStatus TEXT,
    facilityTypeRequested TEXT,
    startDate TEXT,
    endDate TEXT,
    staffingNeeds TEXT,
    safetyConsiderations TEXT,
    CHECK(endDate>=startDate),
    CHECK (requestStatus IN ('submitted', 'under_review', 'approved', 'rejected', 'withdrawn')),
    FOREIGN KEY (researcherId) REFERENCES researcher(researcherId)
);

CREATE TABLE tech_staff (
    staffId INTEGER PRIMARY KEY,
    staffName TEXT NOT NULL,
    staffRole TEXT
);


CREATE TABLE staff_usage (
    usageId INTEGER PRIMARY KEY,
    staffId INTEGER NOT NULL,
    FOREIGN KEY (usageId) REFERENCES usage(usageId),
    FOREIGN KEY (staffId) REFERENCES tech_staff(staffId)
);
CREATE TABLE request_decision (
    decisionId INTEGER PRIMARY KEY,
    requestId INTEGER,
    staffId INTEGER,
    decisionDate TEXT DATE,
    decision TEXT,
    CHECK (decision IN ('approved', 'rejected', 'deferred')),
    FOREIGN KEY (requestId) REFERENCES request(requestId),
    FOREIGN KEY (staffId) REFERENCES tech_staff(staffId)
);  

-- BILLING

CREATE TABLE  billing_account (
    accountId INTEGER PRIMARY KEY,
    accountType TEXT,
    InstId INTEGER,
    deptName TEXT NOT NULL,
    restrictions TEXT,
    accountStatus TEXT,
    CHECK (accountType IN ('grant', 'institutional', 'contract', 'internal')),
    CHECK (accountStatus IN ('active', 'suspended', 'closed'))
);

CREATE TABLE billing_period (
    periodId INTEGER PRIMARY KEY,
    periodStartDate TEXT NOT NULL,
    periodEndDate TEXT NOT NULL,
    periodStatus TEXT,
    CHECK(periodEndDate >= periodStartDate),
    CHECK (periodStatus IN ('open', 'closed', 'locked'))

);

CREATE TABLE invoice (
    invoiceId INTEGER PRIMARY KEY,
    periodId INTEGER NOT NULL,
    accountId INTEGER NOT NULL,
    invoiceDate TEXT,
    invoiceStatus TEXT,
    CHECK (invoiceStatus IN ('draft', 'issued', 'paid', 'voided', 'overdue')),
    FOREIGN KEY (accountId) REFERENCES billing_account (accountId)
);

CREATE TABLE charge (
    chargeId INTEGER PRIMARY KEY,
    usageId INTEGER,
    chargeStatus TEXT,
    baseAmount REAL,
    finalAmount REAL NOT NULL,
    responsibleAccountId INTEGER NOT NULL,
    createdAt TEXT,
    finalizedAt TEXT,
    CHECK (baseAmount >= 0),
    CHECK (finalAmount >= 0),
    CHECK (finalizedAt >= createdAt),
    CHECK (chargeStatus IN ('pending', 'finalized', 'disputed')),
    CHECK (baseAmount >= 0),
    CHECK (finalAmount >= 0),
    CHECK (finalizedAt >= createdAt),
    FOREIGN KEY (usageId) REFERENCES usage(usageId),
    FOREIGN KEY (responsibleAccountId) REFERENCES billing_account(accountId)
);

CREATE TABLE invoice_line (
    invoiceId INTEGER NOT NULL,
    chargeId INTEGER NOT NULL,
    lineAmount REAL,
    CHECK(lineAmount >=0),
    PRIMARY KEY (invoiceId, chargeId),
    FOREIGN KEY (invoiceId) REFERENCES invoice(invoiceId),
    FOREIGN KEY (chargeId) REFERENCES charge(chargeId)
);

CREATE TABLE experiment_phase (
    phaseId INTEGER PRIMARY KEY,
    experimentId INTEGER,
    phaseNo INTEGER,
    actualStartDate TEXT DATE,
    actualEndDate TEXT DATE,
    phaseStatus TEXT,
    CHECK(actualEndDate >=actualStartDate),
    CHECK (phaseStatus IN ('planned', 'in_progress', 'completed', 'skipped')),
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId)
);


