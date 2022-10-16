import connection from '../database/database.js';

export default async function authorizationMiddleware(req, res, next) {
    const token = req.headers.authorization?.replace('Bearer ', '');
    if(!token) return res.status(401).send('Login não autorizado!');
    const query = await connection.query(`SELECT * FROM sessions WHERE token = $1;`, [token]);   
    if (query.rows.length === 0) {
        return res.status(401).send('Login não autorizado!'); 
    }else{
        const queryUser = await connection.query(`SELECT * FROM users WHERE id = $1;`, [query.rows[0].userId]);   
        if(queryUser.rows.length === 0){
            return res.status(404).send('Usuário não existe!');
        }
        delete queryUser.rows[0].password;
        res.locals.user = queryUser.rows[0]; 
        res.locals.token = token;
    } 
    next();
  }



