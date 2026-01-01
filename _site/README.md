# Ignacio's Website

## Docker Image
- build
```
docker build -t my-jekyll-site .
```

- Run on local host
```
docker run --rm -p 4000:4000 -v D:/my_files/my_webpage/tnacho-23.github.io:/home/app my-jekyll-site
```

- Access local host
[http://localhost:4000/](http://localhost:4000/)
