// 引入邮箱发送方法
const emailserver = require('../dao/emailserver')
// 注册服务
const signup = require('../server/signup')
// 登录服务
const signin = require('../server/signin')
// 搜索服务
const search = require('../server/search')
// 好友服务
const friend = require('../server/friend')

module.exports = (app) => {
    app.get('/test', (req, res) => res.send('这里是测试页面'))
    
    // 测试邮箱
    app.post('/mail', (req, res) => {
        let mail = req.body.mail
        emailserver.emailSignUp(mail, res)
    })

    // 注册
    app.post('/signup/add', (req, res) => {
        signup.signUp(req, res)
    })

    // 登录
    app.post('/signin/match', (req, res) => {
        signin.signIn(req, res)
    })

    // 搜索用户
    app.post('/search/user', (req, res) => {
        search.searchUser(req, res)
    })

    // 判断是否为好友
    app.post('/friend/verify', (req, res) => {
        friend.isFriend(req, res)
    })

    // 搜索群
    app.post('/search/group', (req, res) => {
        search.searchGroup(req, res)
    })
}
