import request from '@/utils/request'
// 
export function getBilibiliInfo() {
    return request({
      url: '/wanfeng/spider/bilibili/getBilibiliInfo',
      method: 'GET'
    })
  }


export function genQR() {
return request({
    url: '/wanfeng/spider/bilibili/genQR',
    method: 'GET'
})
}
export function loginByQR(qrcode_key) {
    return request({
        url: '/wanfeng/spider/bilibili/loginByQR/' + qrcode_key,
        method: 'GET'
    })
}