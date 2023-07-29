const query = require('./query')

/**
 * 搜索群
 * @param {*} data 群id/群名称
 * @returns 
 */
exports.searchGroup = data => {
    // 查询符合要求的群信息
    const selectSql = `SELECT * FROM groups WHERE name LIKE ? OR group_id = ?`
    return query(selectSql, [`${data}%`, data])
}


