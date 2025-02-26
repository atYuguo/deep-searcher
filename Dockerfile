# Use Python 3.10 as the base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/zilliztech/deep-searcher.git

# Change directory to deep-searcher
WORKDIR /app/deep-searcher

# Install dependencies
RUN pip install -e .

# Install unstructured-ingest with all document format support in one command
RUN pip install "unstructured-ingest[csv,doc,docx,epub,md,msg,odt,org,pdf,ppt,pptx,rtf,rst,tsv,xlsx,milvus,openai]"

# Run the application
CMD ["python", "main.py"] 