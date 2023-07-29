const userServer = require('../database/users')
const groupServer = require('../database/groups')

// 搜索用户
exports.searchUser = async (req, res) => {
    const data = req.body.data
    
    try {
        const resultArrVal = await userServer.searchUser(data)

        // console.log(resultArrVal)

        // 移除查询出来的用户表隐私信息
        //数组是引用类型, 深拷贝一下
        let newResultArrVal = JSON.parse(JSON.stringify(resultArrVal))
        //然后删除属性 password
        newResultArrVal.map(e => { delete e.password })

        res.send({
            status: 200,
            data: newResultArrVal
            // data: resultArrVal
        })
    } catch(error) {
        console.log(error)
    }
}

// 搜索群
exports.searchGroup = async (req, res) => {
    const data = req.body.data
    
    try {
        const resultArrVal = await groupServer.searchGroup(data)

        console.log(resultArrVal)

        res.send({
            status: 200,
            data: resultArrVal
        })
    } catch(error) {
        console.log(error)
    }
}
