const userServer = require('../database/users')

// 用户注册
exports.signUp = async (req, res) => {
    const { name, mail, password } = req.body
    try {
        // 先查询邮箱是否已被占用
        const lookUpResult = await userServer.countUserValue('email', mail)
        if (lookUpResult.length) return res.send({
            status: 400,
            msg: "邮箱被占用！"
        })
        // 新增用户
        const addUserResult = await userServer.buildUser(name, mail, password)

        if (addUserResult.affectedRows !== 1) return res.send({
            status: 400,
            msg: '注册失败！'
        })
        res.send({
            status: 200,
            msg: '注册成功！'
        })

    } catch(error) {
        console.log(error)
    }
}
