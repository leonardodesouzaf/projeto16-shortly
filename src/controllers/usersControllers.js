import connection from '../database/database.js'; 

export async function getUsers (req, res){
    try {
        const user = res.locals.user;
        const query = await connection.query(`SELECT id,"shortUrl",url,"visitCount" FROM urls WHERE "userId" = $1;`, [user.id]);
        let visitTotalCount = 0;
        for(let i=0; i<query.rows.length; i++){
            visitTotalCount += query.rows[i].visitCount;
        }
        return res.status(200).send({
            id: user.id,
            name: user.name,
            visitCount: visitTotalCount,
            shortenedUrls: query.rows
        });
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}