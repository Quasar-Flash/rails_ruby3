# Depĺoyment

## Docker Hub

* Log into the Docker Hub from your local terminal:

```bash
docker login --email=youremail@company.com
```

* Build a new version of the image:

```bash
docker build -t user/ruby3:1.0.0 .
```

* Upload to the hub:

```bash
docker push user/ruby3:1.0.0
```
