# 🐘 PostgreSQL Syntax Master Repository

This repository is a **personal PostgreSQL knowledge base and training lab**.  
The goal is to **collect all important PostgreSQL syntax used in real backend projects**, with examples, explanations, and mini-projects.

You will build this repository step by step to:
- Master SQL syntax
- Understand real-world database design
- Practice PostgreSQL features used in production backends
- Have a strong portfolio proof for backend, data, and security roles

---

# 📚 Learning Philosophy
This repo is not just theory. It follows this rule:

> **10% theory, 90% practice (real SQL files + examples).**

Every folder will contain:
- `.sql` scripts
- Comments explaining each concept
- Sample datasets
- Exercises + solutions

---

# 🗂 Repository Structure

```

postgresql-syntax-master/
│
├── 01_basics/                 # Core SQL syntax
│   ├── create_database.sql
│   ├── create_table.sql
│   ├── insert_select_update_delete.sql
│   ├── constraints.sql
│   └── README.md
│
├── 02_data_types/             # PostgreSQL data types deep dive
│   ├── numeric_types.sql
│   ├── text_types.sql
│   ├── date_time_types.sql
│   ├── json_jsonb.sql
│   └── arrays.sql
│
├── 03_queries/                # Real-world query patterns
│   ├── joins.sql
│   ├── subqueries.sql
│   ├── cte_with.sql
│   ├── window_functions.sql
│   └── aggregation.sql
│
├── 04_schema_design/          # Database design concepts
│   ├── normalization.sql
│   ├── relationships.sql
│   ├── indexes.sql
│   └── partitioning.sql
│
├── 05_backend_features/       # Used in real backend systems
│   ├── transactions.sql
│   ├── locks_and_isolation.sql
│   ├── stored_procedures.sql
│   ├── triggers.sql
│   └── views_materialized_views.sql
│
├── 06_security/                # Security & roles
│   ├── users_roles.sql
│   ├── privileges.sql
│   ├── row_level_security.sql
│   └── encryption_extensions.sql
│
├── 07_performance/             # Optimization techniques
│   ├── explain_analyze.sql
│   ├── query_optimization.sql
│   ├── indexes_advanced.sql
│   └── caching_strategies.md
│
├── 08_real_world_projects/     # Mini backend DB projects
│   ├── student_management_db/
│   ├── ecommerce_db/
│   └── social_network_db/
│
├── datasets/                   # Sample CSV or SQL datasets
│
├── tools/                      # Useful scripts & CLI helpers
│
└── README.md

````

---

# 🧭 Roadmap (Step-by-Step Learning Plan)

## ✅ Phase 1 – Core SQL Foundations
You will learn:
- CREATE DATABASE / TABLE
- INSERT, SELECT, UPDATE, DELETE
- PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL

➡ Goal: Be able to build a clean database schema.

---

## ✅ Phase 2 – PostgreSQL Data Types
You will master:
- TEXT, VARCHAR, CHAR
- INTEGER, BIGINT, NUMERIC, FLOAT
- DATE, TIMESTAMP, INTERVAL
- JSON / JSONB
- ARRAY types

➡ Goal: Know when to use each type in real backend apps.

---

## ✅ Phase 3 – Advanced Queries
You will learn:
- INNER / LEFT / RIGHT / FULL JOIN
- Subqueries & correlated queries
- CTE (`WITH` queries)
- Window functions (`ROW_NUMBER`, `RANK`, etc.)
- GROUP BY, HAVING, aggregates

➡ Goal: Write complex backend queries like a professional.

---

## ✅ Phase 4 – Database Design & Indexing
You will study:
- Normalization (1NF → 3NF)
- Relationships (1-1, 1-N, N-N)
- Index types (B-tree, Hash, GIN, GiST)
- Partitioning & sharding basics

➡ Goal: Design scalable schemas.

---

## ✅ Phase 5 – Backend PostgreSQL Features
You will implement:
- Transactions & isolation levels
- Stored procedures & functions (PL/pgSQL)
- Triggers
- Views & Materialized Views

➡ Goal: Use PostgreSQL like backend frameworks do.

---

## ✅ Phase 6 – Security (Important for AI Security & Cybersecurity)
You will learn:
- Roles & permissions
- GRANT / REVOKE
- Row Level Security (RLS)
- Encryption & extensions (pgcrypto)

➡ Goal: Secure databases in production.

---

## ✅ Phase 7 – Performance & Optimization
You will practice:
- EXPLAIN & EXPLAIN ANALYZE
- Query optimization techniques
- Index tuning
- Caching strategies

➡ Goal: Make PostgreSQL fast and scalable.

---

## ✅ Phase 8 – Real Backend Database Projects
You will build:
- Student Management System DB
- E-commerce Database
- Social Network Database

➡ Goal: Show real backend DB architecture in your portfolio.

---

# 🛠 How to Use This Repository

1. Clone the repo
```bash
git clone https://github.com/DavFilsDev/postgresql-syntax-master.git
````

2. Run PostgreSQL locally or in Docker
3. Execute `.sql` files in order
4. Read comments inside each file
5. Do exercises and compare with solutions

---

# 🎯 Final Objective

By completing this repository, you will:

* Understand PostgreSQL deeply
* Be able to design real backend databases
* Be ready for backend developer & AI security roles
* Have a strong GitHub portfolio proof

---

# 🚀 Next Step

We will start with:

👉 **01_basics/create_database.sql**
and build everything step by step.

---

# 👨‍💻 Author

**Fanampinirina Miharisoa David Fils RATIANDRAIBE**
````
Full stack Developer | AI & Security Enthusiast