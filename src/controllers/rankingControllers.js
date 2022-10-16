import connection from '../database/database.js'; 

export async function getRanking (req, res){
    try {
        const ranking = await connection.query(`SELECT users.id,users.name,COUNT (urls.id) AS "linksCount",SUM(urls."visitCount") AS "visitCount" FROM users LEFT JOIN urls ON users.id=urls."userId" GROUP BY users.id ORDER BY SUM(urls."visitCount") DESC NULLS LAST LIMIT 10;`);
        for(let i=0; i<ranking.rows.length; i++){
            if(ranking.rows[i].visitCount === null){
                ranking.rows[i].visitCount = '0';
            }
        }
        return res.status(200).send(ranking.rows);
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}