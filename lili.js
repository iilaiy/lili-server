const express = require('express')
const app = express()
const port = 3000

// 解析body插件
const bodyParser = require('body-parser')

//设置允许跨域访问该服务.
app.all('*', function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-with,  Content-Type, Accept')
    res.header('Access-Control-Allow-Credentials', true)
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS')
    res.header('X-Powered-By', '3.2.1')
    res.header('Content-Type', 'application/json;charset=utf-8')
    if (req.method == 'OPTIONS') {
        res.sendStatus(200)
    } else {
        next()
    }
})

// 解析前端数据
app.use(bodyParser.json())  // 此插件似乎无效！！！
app.use(express.json()); // 解析json请求
app.use(express.urlencoded({extended: false})) // 解析URL-encoded请求

app.get('/', (req, res) => res.send('hello world!'))

require('./router/index')(app)

// 404
app.use((req, res, next) => {
    let err = new Error('Not Found')
    err.status = 404
    next(err)
})

// 错误处理
app.use((err, req, res, next) => {
    res.status(err.status || 500)
    res.send(err.message)
})

app.listen(port, () => console.log(`服务器已启动，端口：${port}!`))
