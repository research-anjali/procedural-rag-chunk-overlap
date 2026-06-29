# Domain-Adaptive Chunk Overlap for Procedural RAG

**Paper:** Measuring Step Fragmentation in Retrieval-Augmented Generation: A Chunk-Level Integrity Metric and Overlap Experiments Across Procedural Corpora

**Authors:** Anjali and Navdeep Singh
Department of CSE, Punjabi University, Patiala, India
Contact: anjali28850@gmail.com · navdeepsony@gmail.com

---

## Overview

This repository contains the full implementation for the paper above. It includes:

- **Procedural Integrity Score (PIS):** Novel chunk-level metric combining Step Completeness Rate (SCR), Dependency Preservation (DP), and List Integrity (LI)
- **Seven fixed overlap conditions** (0-30%) evaluated across 960 documents (760 real + 200 synthetic)
- **ML-based adaptive chunker** (RandomForest, 95.3% cross-validation accuracy)
- **Retrieval evaluation:** FAISS dense retrieval, ROUGE-L, BERTScore, Extractive ROUGE-L
- **Full statistical analysis:** One-way ANOVA, Tukey HSD, bootstrap confidence intervals, permutation tests

---

## Repository Structure
