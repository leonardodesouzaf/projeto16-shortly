import connection from '../database/database.js'; 
import { nanoid } from 'nanoid';

export async function postUrls (req, res){
    try {
        let nanoId = nanoid(8);
        await connection.query(`INSERT INTO urls ("userId",url,"shortUrl","visitCount") VALUES ($1,$2,$3,$4);`, [res.locals.user.id, req.body.url, nanoId, 0]);
        return res.status(201).send({shortUrl: nanoId});
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}

export async function getUrlsId (req, res){
    try {
        let id = req.params.id;
        const query = await connection.query(`SELECT * FROM urls WHERE id = $1;`, [id]);
        if(query.rows.length === 0){
            return res.status(404).send();
        }else{
            return res.status(200).send({
                id: id,
                shortUrl: query.rows[0].shortUrl,
                url: query.rows[0].url
            });
        }
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}

export async function getUrlsOpen (req, res){
    try {
        let shortUrl = req.params.shortUrl;
        const query = await connection.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`, [shortUrl]);
        if(query.rows.length === 0){
            return res.status(404).send();
        }else{
            await connection.query(`UPDATE urls SET "visitCount" = $1 WHERE id = $2;`, [(query.rows[0].visitCount + 1), query.rows[0].id]);
            return res.redirect(301, query.rows[0].url);
        }
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}

export async function deleteUrl (req, res){
    try {
        let id = req.params.id;
        const query = await connection.query(`SELECT * FROM urls WHERE id = $1;`, [id]);
        if(query.rows.length === 0){
            return res.status(404).send();
        }else{
            if(query.rows[0].userId === res.locals.user.id){
                await connection.query(`DELETE FROM urls WHERE id = $1;`, [id]);
                return res.status(204).send();
            }else{
                return res.status(401).send('Esse URL não pertence ao usuário!');
            }
        }
    } catch (error) {
        return res.status(500).send('Não foi possível conectar ao servidor!');
    }
}