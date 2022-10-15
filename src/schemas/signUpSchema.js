import joi from 'joi';

export default async function signUpSchema(req, res, next) {
    const userSchema = joi.object({
        name: joi.string().required(),
        email: joi.string().email({ minDomainSegments: 2, tlds: { allow: ['com', 'net'] } }).required(),
        password: joi.string().required(),
        confirmPassword: joi.string().equal(joi.ref('password')).required()
    });
    const validation = userSchema.validate(req.body, { abortEarly: true });
    if (validation.error) {
        return res.status(422).send('Digite os seus dados corretamente!');
    };
    next();
}
