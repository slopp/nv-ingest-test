FROM ghcr.io/astral-sh/uv:python3.12-bookworm

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*


RUN uv venv --python 3.12

RUN uv pip install --pre nv-ingest
RUN uv pip install --pre nv-ingest-client
RUN uv pip install --pre nv-ingest-api

RUN uv pip install opencv-python llama-index-embeddings-nvidia pymilvus 'pymilvus[bulk_writer, model]' "milvus-lite==2.4.12" nvidia-riva-client unstructured-client markitdown

COPY ./ingest.py .
COPY ./simple.pdf .

CMD ["uv", "run", "python", "ingest.py"]