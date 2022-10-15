import { v4 as uuid } from 'uuid';
import bcrypt from 'bcrypt';
import connection from '../database/database.js'; 

export async function signIn (req, res){ 
    try {
        const user = req.body;
        const query = await connection.query(`SELECT email,password,id FROM users WHERE email = $1;`, [user.email]);
        if(query.rows.length === 0){
            return res.status(401).send('Login não autorizado!'); 
        }else{
            if(bcrypt.compareSync(user.password, query.rows[0].password)){
                const token = uuid();
                await connection.query(`INSERT INTO sessions ("userId",token) VALUES ($1,$2);`, [query.rows[0].id,token]);
                return res.status(200).send({token: token});
            }
        } 
    } catch (error) {
       return res.status(500).send('Não foi possível conectar ao servidor!');
    }
};

export async function signUp (req, res){
    try {
        const user = req.body;
        const query = await connection.query(`SELECT email,password,id FROM users WHERE email = $1;`, [user.email]);
        if(query.rows.length === 0){
            const passwordHash = bcrypt.hashSync(user.password, 10);
            await connection.query(`INSERT INTO users (name,email,password) VALUES ($1,$2,$3);`, [user.name,user.email,passwordHash]);
            return res.status(201).send('Registro completo!'); 
        }else{
            return res.status(409).send('E-mail já utilizado!'); 
        } 
    } catch (error) {
       return res.status(500).send('Não foi possível conectar ao servidor!');
    }
};



