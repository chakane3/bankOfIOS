const { Router } = require('express')
const router = Router()
const controller = require('./controller')

router.get('/users', controller.getUser)

router.post('/addNewUser', controller.addUser)

router.post('/signIn', controller.signIn)

module.exports = router