express = require('express');

app = express()

app.use(express.static('.'));
app.listen(5000)
