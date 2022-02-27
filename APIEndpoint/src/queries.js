const getUsers = 'SELECT * FROM user_table'
const addUser = 'INSERT INTO user_table (first_name, last_name, email, password, account_number, amount) VALUES ($1, $2, $3, $4, $5, $6)'
const checkIfAccountNumberExists = 'SELECT * FROM user_table WHERE email = $1'

module.exports = {
    getUsers,
    addUser,
    checkIfAccountNumberExists,

}