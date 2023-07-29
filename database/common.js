const query = require('./query')

/**
 * 判断是否为好友/是否在群内
 * @param {*} type      需要判断的类型, 0：好友 1：群
 * @param {*} uid       账户id
 * @param {*} idArray   搜索的用户id组/群id组
 * @returns             为好友的用户信息组/在群内的群信息组
 */
exports.isFGVerify = async (type, uid, idArray) => {
    /* tip: 客户端传入账户id以及搜索的用户id组/群id组进行查询并返回为好友的用户信息组/在群内的群信息组 */

    // 查询语句
    const selectSql = type === 0
        ? `SELECT * FROM friend WHERE user_id = ${uid} AND friend_id = ?` :
        `SELECT * FROM groupmembers WHERE user_id = ${uid} AND group_id = ?`

    // 是好友/在群内の信息
    const newArray = []

    // 循环用户id组匹配查询

    /* 
        以下代码存在问题
            -> 并不会等待异步query执行完毕后再打印 newArray

            idArray.map(async (item) => {
                const result = await query(selectSql, item)
                console.log(result);
                if (result.length) {
                    newArray.push(result[0])
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
    const iterator = idArray[Symbol.iterator]();
    let res = iterator.next();
    while (!res.done) {
        const value = res.value;
        console.log(value);
        const result = await query(selectSql, value)
        
        // 有查询结果 -> 把当前用户信息/群信息添加到 newArray
        if (result.length) {
            newArray.push(result[0])
        }
        res = iterator.next();
    }

    /* 另外一种：直接使用 for...of */
    // for (value of idArray) {
    //     const result = await query(selectSql, value)
    //     if (result.length) {
    //         newArray.push(result[0])
    //     }
    // }

    console.log(newArray)

    return newArray
}
