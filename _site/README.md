# Ignacio's Website

## Docker Image
- build
```
docker build -t my-jekyll-site .
```

- Run on local host
```
docker run --rm -v "$PWD:/home/app" -p 4000:4000 jekyll-site
```

- Access local host
[http://localhost:4000/](http://localhost:4000/)
