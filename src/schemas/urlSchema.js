import joi from 'joi';

export default async function urlSchema(req, res, next) {
    const userSchema = joi.object({
        url: joi.string().uri().required()
    });
    const validation = userSchema.validate(req.body, { abortEarly: true });
    if (validation.error) {
        return res.status(422).send('Digite os seus dados corretamente!');
    }
    next();
}