import connection from '../database/database.js'; 

export async function getRanking (req, res){
    try {
        const users = await connection.query(`SELECT * FROM users;`);
        const urls = await connection.query(`SELECT * FROM urls ORDER BY ;`);
        let response = [];

        return res.status(200).send(response);
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}