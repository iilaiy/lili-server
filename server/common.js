const commonServer = require('../database/common')

// 判断是否为好友/在群内
exports.isFGVerify = async (req, res) => {

    const { type, user_id : uid, idArray } = req.body
    
    try {
        // 等待sql查询语句的异步函数执行完毕后获取结果并返回客户端
        const resultArrVal = await commonServer.isFGVerify(type, uid, idArray)

        res.send({
            status: 200,
            data: resultArrVal
        })

    } catch(error) {
        console.log(error)
    }
}

