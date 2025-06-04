# Test nv-ingest with build endpoints

1. Update the env var keys in `Dockerfile` 

2. `docker build . -t nvingest-test`

3. `docker run --cpus=8 --shm-size=10.24gb nvingest-test` 

