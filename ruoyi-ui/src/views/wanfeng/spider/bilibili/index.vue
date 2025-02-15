<template>
  <el-container class="app-container">
    <el-header>
      <h2 class="header-title">用户信息</h2>
    </el-header>
    <el-main>
      <div v-if="userData">
        <el-card class="user-card" shadow="hover">
          <h3 class="username">用户名: {{ userData.uname }}</h3>
          <el-row>
            <el-col :span="12">会员状态: {{ userData.vipStatus === '1' ? '大会员' : '普通会员' }}</el-col>
            <el-col :span="12">硬币数: {{ userData.money }}</el-col>
          </el-row>
          <el-row>
            <el-col :span="12">经验数: {{ userData.currentExp }}</el-col>
            <el-col :span="12">B币卷余额: {{ userData.couponBalance }}</el-col>
          </el-row>
        </el-card>
      </div>
      <div v-else>
        <el-card class="empty-card" shadow="hover">
          <p class="empty-message">无用户信息</p>
          <el-button type="primary" class="create-button" @click="openQRCodeDialog">创建用户信息</el-button>
        </el-card>
      </div>
      <el-dialog title="二维码" :visible.sync="dialogVisible">
        <div v-if="qrCodeUrl">
          <img :src="qrCodeUrl" alt="QR Code">
          <el-button type="primary" @click="loginWithQR">检查登录状态</el-button>
        </div>
      </el-dialog>
    </el-main>
  </el-container>
</template>

<script>
import { getBilibiliInfo, genQR, loginByQR } from '@/api/wanfeng/spider/bilibili'
import qrcode from 'qrcode';
export default {
  data() {
    return {
      userData: null, // 用户数据
      qrCodeUrl: '', // 存储二维码图片的 URL
      qrcodeKey: '', // 存储二维码的 key
      dialogVisible: false, // 控制对话框的显示
    };
  },
  methods: {
    openQRCodeDialog() {
      this.generateQRCode();
      this.dialogVisible = true; // 打开二维码对话框
    },
    async generateQRCode() {
      try {
        const response = await genQR(); // 调用 genQR 接口
        const parts = response.data.split('|spilt|'); // 分割 URL 和 qrcode_key
        this.qrCodeUrl = await qrcode.toDataURL(parts[0]); // 只保留 URL
        this.qrcodeKey = parts[1]; // 存储 qrcode_key
      } catch (error) {
        console.error('生成二维码失败:', error);
      }
    },
    async loginWithQR() {
      try {
        const response = await loginByQR(this.qrcodeKey); // 调用 loginByQR 接口
        // 处理登录成功后的逻辑
        console.log('登录成功:', response.data);
        await this.fetchUserData(); // 登录成功后刷新用户数据
        this.dialogVisible = false; // 关闭对话框
      } catch (error) {
        console.error('登录失败:', error);
      }
    },
    async fetchUserData() {
      try {
        const response = await getBilibiliInfo();
        if (response) {
          this.userData = response.data; // 更新用户数据
        } else {
          this.userData = null; // 如果返回为空，保持为 null
        }
      } catch (error) {
        console.error('获取用户数据失败:', error);
      }
    },
  },
  mounted() {
    this.fetchUserData(); // 组件挂载时获取用户数据
  },
};
</script>

<style scoped>
.header-title {
  text-align: center;
  color: #409EFF; /* 标题颜色 */
  margin-bottom: 20px; /* 标题下方间距 */
}

.user-card {
  margin: 20px;
  background-color: #f5f7fa; /* 背景颜色 */
  border-radius: 10px; /* 圆角 */
  padding: 20px; /* 内边距 */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}

.qr-code-card {
  margin: 20px;
  text-align: center;
  background-color: #e6f7ff; /* 二维码卡片背景颜色 */
  border-radius: 10px; /* 圆角 */
  padding: 20px; /* 内边距 */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}

.username {
  font-size: 1.5em; /* 用户名字体大小 */
  color: #333; /* 用户名颜色 */
}

.empty-card {
  margin: 20px;
  text-align: center;
  background-color: #fff3f3; /* 背景颜色 */
  border-radius: 10px; /* 圆角 */
  padding: 20px; /* 内边距 */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}

.empty-message {
  font-size: 1.2em; /* 空信息字体大小 */
  color: #666; /* 空信息颜色 */
}

.create-button {
  margin-top: 10px; /* 按钮上方间距 */
  background-color: #67c23a; /* 按钮背景颜色 */
  border-color: #67c23a; /* 按钮边框颜色 */
}
</style>
