FROM ghcr.io/astral-sh/uv:python3.12-bookworm

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*


RUN uv venv --python 3.12

RUN uv pip install nv-ingest==25.4.2
RUN uv pip install nv-ingest-client==25.4.2
RUN uv pip install nv-ingest-api==25.4.2

#RUN uv pip install opencv-python llama-index-embeddings-nvidia pymilvus 'pymilvus[bulk_writer, model]' "milvus-lite==2.4.12" nvidia-riva-client unstructured-client markitdown

COPY ./ingest.py .
COPY ./simple.pdf .
COPY --recursive ./financial_dataset_small ./financial_dataset_small

ENV NVIDIA_API_KEY=
ENV NVIDIA_BUILD_API_KEY=

CMD ["uv", "run", "python", "ingest.py"]