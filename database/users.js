const query = require('./query')
const bcrypt = require('../dao/bcrypt')
// 雪花算法(生成唯一ID)
const FlakeId = require('flake-idgen');
const intformat = require('biguint-format');
const flakeIdGen = new FlakeId();

/**
 * 匹配用户表字段个数
 * @param {*} fields 需要查询的字段
 * @param {*} data   字段值
 * @returns 
 */
exports.countUserValue = (fields, data) => {
    const selectSql = `SELECT * FROM users WHERE ${fields}=?`
    return query(selectSql, data)
}

/**
 * 新增用户
 * @param {*} name      用户名
 * @param {*} mail      邮箱
 * @param {*} password  密码
 * @returns 
 */
exports.buildUser = (name, mail, password) => {

    // 密码加密
    let bcryptPassword = bcrypt.encryption(password)

    // 插入数据对象
    let data = {
        user_id: intformat(flakeIdGen.next()),
        name: name,
        email: mail,
        password: bcryptPassword,
        register_time: new Date()
    }

    // 定义插入新用户信息的 SQL 语句
    const insertSql = 'INSERT INTO users SET ?'

    return query(insertSql, data)
}

/**
 * 搜索用户
 * @param {*} data 邮箱/用户名
 * @returns 
 */
exports.searchUser = data => {
    // 查询符合要求的除了密码以外的用户信息
    const selectSql = `SELECT * FROM users WHERE name LIKE ? OR email = ?`
    return query(selectSql, [`${data}%`, data])
}
