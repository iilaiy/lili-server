const userServer = require('../database/users')
// 解密
const bcrypt = require('../dao/bcrypt')
// token
const jwt = require('../dao/jwt')

// 用户登录
exports.signIn = async (req, res) => {
    const { mail, password } = req.body

    try {
        // 先查询邮箱是否已注册
        const lookUpResult = await userServer.countUserValue('email', mail)
        // console.log(lookUpResult)
        // 未注册
        if (!lookUpResult.length) return res.send({
            status: 400,
            msg: "邮箱未注册！"
        })
        // 已注册
        // 查询加密密码是否一致
        let pwdMatch = bcrypt.verification(password, lookUpResult[0].password)
        // console.log(pwdMatch)
        
        if (pwdMatch) {
            // 密码正确
            let token = jwt.generateToken(lookUpResult[0].user_id)
            let data = {
                id: lookUpResult[0].user_id,
                name: lookUpResult[0].name,
                imgurl: lookUpResult[0].imgurl,
            }
            res.send({
                status: 200,
                data,
                token
            })
        } else {
            // 密码错误
            res.send({
                status: 400,
                msg: "密码错误！"
            })
        }

    } catch (error) {
        console.log(error)
    }
}
