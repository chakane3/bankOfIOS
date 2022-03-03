const { response } = require('express')
const pool = require('/Users/chakaneshegog/Desktop/BankingApplication/APIEndpoint/db.js')
const queries = require('./queries')

// functions for endpoints
const getUser = (req, res) => {
    pool.query(queries.getUsers, (error, results) => {
        if (error) throw error
        res.status(200).json(results.rows)
    })
}

const addUser = (req, res) => {
    const {first_name, last_name, email, password, account_number, amount} = req.body

    pool.query(queries.checkIfAccountNumberExists, [email], (error, results) => {
        if (results === undefined) {
            res.send("user already exists")
            console.log(results)
            return
        }

        pool.query(queries.addUser, [first_name, last_name, email, password, account_number, amount], (error, results) => {
            if (error) throw error
            res.status(201).send('success')
            console.log('student created')
        })
    })
}

const signIn = (req, res) => {
    const {email, password} = req.body
    pool.query(queries.authUser, [email, password], (error, results) => {
        if (error) throw error
        let checkCredentials = results.rows[0]["exists"]
        if (checkCredentials) {
            res.status(205).send("success")
        } else {
            res.status(299).send("wrong username or password")
        }
        
    })
}

module.exports = {
    getUser,
    addUser,
    signIn,
}