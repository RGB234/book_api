const express = require('express');
const request = require('request');

const API_CLIENT_ID = "tMfKtRmuy_fJa5dxsAFa";
const API_CLIENT_SECRET = "3KTsM8LPGr";

const app = express();

// Middleware for POST request 
//json데이터를 담은 request body 를 parsing 하여 받아들일 수 있게 함
app.use(express.json());

app.get('/', (req, res) => {
    res.send(`<h1>Hello World</h1>`);
});

//reference(API-request) : https://velog.io/@mingtorr/node.js-%EC%97%90%EC%84%9C-api%EC%9A%94%EC%B2%AD%ED%95%98%EA%B8%B0

app.get('/:keyword', (req, res) => {
    const options = {
        uri: "https://openapi.naver.com/v1/search/book.json",
        qs: {
            query: req.params.keyword, //:keyword
        },
        headers: {
            "X-Naver-Client-Id": API_CLIENT_ID,
            "X-Naver-Client-Secret": API_CLIENT_SECRET,
        },
    };
    request(options, function (err, response, body) {
        res.send(response.body);
    });
});

app.listen(3000, () => {
    console.log("Listening on port:3000")
});