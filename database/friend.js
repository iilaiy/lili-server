const query = require('./query')

/**
 * 判断是否为好友
 * @param {*} uid       账户id
 * @param {*} fidArray  搜索的用户id组
 * @returns 为好友的用户信息组
 */
exports.isFriend = async (uid, fidArray) => {
    /* tip: 客户端传入账户id以及搜索的用户id组进行查询并返回为好友的用户信息组 */

    // 查询语句
    const selectSql = `SELECT * FROM friend WHERE user_id=${uid} AND friend_id=?`

    // 是好友の用户信息
    const yFriendArray = []

    // 循环用户id组匹配查询

    /* 
        以下代码存在问题
            -> 并不会等待异步query执行完毕后再打印 yFriendArray

            fidArray.map(async (item) => {
                const result = await query(selectSql, item)
                console.log(result);
                if (result.length) {
                    yFriendArray.push(result[0])
                }
            })

            forEach
                -> 底层实现方式：
                    for (var i = 0; i < length; i++) {
                        if (i in array) {
                            var element = array[i];
                            callback(element, i, array);
                        }
                    }
    */
    
    /* 
        解决：利用迭代器来确保异步任务的顺序执行, 通过while循环执行query直到无法next
    */
    let iterator = fidArray[Symbol.iterator]();
    let res = iterator.next();
    while (!res.done) {
        let value = res.value;
        const result = await query(selectSql, value)
        // 有查询结果 -> 把当前用户信息添加到 yFriendArray
        if (result.length) {
            yFriendArray.push(result[0])
        }
        res = iterator.next();
    }

    /* 另外一种：直接使用 for...of */

    console.log(yFriendArray)

    return yFriendArray
}
