const friendServer = require('../database/friend')

// 判断是否为好友
exports.isFriend = async (req, res) => {

    const { user_id : uid, fidArray } = req.body
    
    try {
        const resultArrVal = await friendServer.isFriend(uid, fidArray)

        res.send({
            status: 200,
            data: resultArrVal
        })

    } catch(error) {
        console.log(error)
    }
}

