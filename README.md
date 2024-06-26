# book_api
DockerHub image repository: https://hub.docker.com/repository/docker/rgb234/book_api/general <br></br>

This project was created to simulate a client-server architecture operating on a container environment.  
client : booksearch (https://github.com/RGB234/booksearch) (flutter) , server : book_api (https://github.com/RGB234/book_api) (express.js)  

The server is implemented through the 'main.js' file  
and just imitates a server by sending and receiving requests to Naver Open API. (MOCK SERVER)  

## How to run the server and clients

* Option A (Kubernetes)

Use .yaml files in /k8s_yaml  

Creating two Pods  
(https://hub.docker.com/r/rgb234/book_search/tags), (https://hub.docker.com/repository/docker/rgb234/book_api/general)  
```
> kubectl apply -f book-search.yml
```
Creating a kubernetes Service
```
> kubectl apply -f my-service.yml
```

* Option B (local PC)  

Start the server (https://github.com/RGB234/book_api/)  
```
> node main.js
```
Flutter run (https://github.com/RGB234/booksearch)  
```
> flutter run -d chrome
```

## Output Screen

> "/", GET  
<img src="https://github.com/RGB234/book_api/assets/67996767/13382f92-6be0-4d0b-b23b-41601ca5519b" width="80%" height="80%">  

> "/:keyword", GET
<img src="https://github.com/RGB234/book_api/assets/67996767/d7664e2e-e0cb-4937-a241-b21f6061bb29" width="90%" height="80%">  
