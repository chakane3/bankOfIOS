const express = require('express')
const bankRouting = require('./src/routes.js')
const app = express()
const port = 8080

// middleware (for json response on our endpoints)
app.use( express.json() )

app.use('/api/bank', bankRouting)
app.listen(port, () => console.log(`head to http://localhost:${port}`))