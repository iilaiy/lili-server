// token

const jwt = require('jsonwebtoken')

let secret = '挚爱佳佳'

// 生成token
exports.generateToken = (id, res) => {
    let payload = {
        id: id,
        time: new Date()
    }
    let token = jwt.sign(payload, secret, { expiresIn: 60 * 60 * 24 * 120 })

    return token
}

// 解码
exports.verifyToken = e => {
    let payload = jwt.verify(e, secret)

    return payload
}


