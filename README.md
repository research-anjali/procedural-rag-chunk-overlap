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

---

## Requirements

```bash
pip install -r requirements.txt
```

Key dependencies:
- numpy==1.26.4, pandas==2.1.4, scipy==1.11.4
- scikit-learn==1.3.2
- sentence-transformers==2.7.0
- faiss-cpu==1.8.0
- langchain==0.1.14
- groq==1.2.0
- pypdf==4.2.0, python-docx==1.1.0
- torch==2.3.1, transformers==4.41.2
- bert-score==0.3.13

**Groq API key** is required only for LLM generation cells (GEN-1 to GEN-13).
All other cells run without a key.

---

## How to Reproduce

### 1. Clone the repository
```bash
git clone https://github.com/research-anjali/procedural-rag-chunk-overlap
cd procedural-rag-chunk-overlap
pip install -r requirements.txt
```

### 2. Prepare the corpus
Place documents at:

URL list for downloading real documents is provided in `data/corpus_urls.txt`

### 3. Set Groq API key (optional)
```bash
export GROQ_API_KEY=gsk_your_key_here
```

### 4. Run the notebook
Open `notebooks/domain_adaptive_rag_pis.ipynb`
Select: **Kernel → Restart and Run All**
Runtime: ~60-90 min on CPU, ~20-30 min with GPU

---

## Key Results

| Method            | ROUGE-L | Extractive ROUGE-L | BERTScore F1 | Storage Overhead |
|-------------------|---------|-------------------|--------------|-----------------|
| No overlap (0%)   | 0.2408  | 0.3751            | 0.8531       | 0%              |
| LangChain default | 0.2407  | 0.3010            | 0.8505       | varies          |
| **Fixed 25%**     | **0.3375** | **0.6570**     | **0.8745**   | +25.4%          |
| Adaptive (ours)   | 0.2363  | 0.3640            | 0.8517       | +8.8%           |

**PIS Validation:** Pearson r = 0.749 (p < 0.001) against simulated human annotation across 80 documents.

**ANOVA:** F(6, 6517) = 0.175, p = 0.98 on real documents (ceiling effect). F = 11.20, p < 0.001 on procedurally rich augmented subset.

---

## Corpus Details

- **Total:** 960 documents (760 real + 200 synthetic)
- **Domains:** Medical (250), Technical (250), Software (256), Recipes (204)
- **Median lengths:** Software 54 words, Medical 230 words, Technical 313 words, Recipes 382 words
- **Real document URLs:** provided in `data/corpus_urls.txt`

---

## Random Seeds

All experiments use:
- `random_state=42` for RandomForest classifier
- `numpy.random.seed(42)` for bootstrap resampling (n=5,000)
- `n=10,000` for permutation tests

---

## Citation

To be added upon paper acceptance.

---

## License

MIT License — see LICENSE file.
