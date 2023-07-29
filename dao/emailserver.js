// 引入发送邮件插件
const nodemailer = require('nodemailer')
// 引入证书文件
const credentials = require('../config/credentials')

// 创建传输方式
const transporter = nodemailer.createTransport({
    service: 'qq',
    auth: {
        user: credentials.qq.user,
        pass: credentials.qq.pass
    }
})

// 注册发送邮件给用户
exports.emailSignUp = (email, res) => {
    // 发送信息
    let options = {
        from: '1469854373@qq.com',
        to: email,
        subject: '欢迎新用户！！！',
        html: '<span>感谢你的加入, lili欢迎你。</span>'
    }

    // 发送邮件
    transporter.sendMail(options, (err, msg) => {
        if (err) {
            res.send(err)
          console.log(err)
        } else {
            // console.log(msg)
            res.send('邮箱发送成功！')
            console.log('邮箱发送成功！')
        }
    })
}


