#!/bin/bash
# Reproduce all experiments from the paper
# Usage: bash scripts/run_experiments.sh
# Runtime: ~60-90 min on CPU, ~20-30 min with GPU

echo "Step 1: Running full experiment notebook..."
jupyter nbconvert --to notebook --execute \
    notebooks/domain_adaptive_rag_pis.ipynb \
    --output notebooks/domain_adaptive_rag_pis_executed.ipynb

echo "Done. Results saved to results/tables/"
