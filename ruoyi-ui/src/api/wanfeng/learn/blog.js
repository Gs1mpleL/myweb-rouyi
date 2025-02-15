import request from '@/utils/request'

// 查询博客列表
export function listBlog() {
  return request({
    url: '/wanfeng/learn/blog/list',
    method: 'get'
  })
}

// 新增博客
export function addBlog(data) {
  return request({
    url: '/wanfeng/learn/blog',
    method: 'post',
    data: data
  })
}

// 修改博客
export function updateBlog(data) {
  return request({
    url: '/wanfeng/learn/blog',
    method: 'put',
    data: data
  })
}

// 删除博客
export function delBlog(blogId) {
  return request({
    url: '/wanfeng/learn/blog/' + blogId,
    method: 'delete'
  })
}

// 查询单条博客
export function getOne(blogId) {
  return request({
    url: '/wanfeng/learn/blog/' + blogId,
    method: 'get'
  })
}