const { Router } = require('express')
const router = Router()
const controller = require('./controller')

router.get('/users', controller.getUser)

router.post('/addNewUser', controller.addUser)

module.exports = router