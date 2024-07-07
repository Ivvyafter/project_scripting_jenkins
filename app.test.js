const request = require('supertest');
const express = require('express');

// Importer votre application express
const app = express();
app.use(express.static('public'));

describe('GET /', () => {
  it('should respond with status code 200', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
  });
});
