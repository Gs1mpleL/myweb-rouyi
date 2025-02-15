<template>
  <div class="index-container">
    <div class="weather-container">
      <el-card v-if="weatherData" class="weather-card" shadow="hover">
        <h2>天气信息</h2>
        <p><strong>天气状况:</strong> {{ weatherData.textDay }}</p>
        <p><strong>最高温度:</strong> {{ weatherData.tempMax }} °C</p>
        <p><strong>最低温度:</strong> {{ weatherData.tempMin }} °C</p>
      </el-card>
      <div v-else>
        <p>正在获取天气信息...</p>
      </div>
    </div>
  </div>
</template>

<script>
import { getWeather } from '@/api/wanfeng/spider/weather';

export default {
  name: 'Index',
  data() {
    return {
      weatherData: null, // 存储天气信息
    };
  },
  methods: {
    getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          (position) => {
            const jingdu = position.coords.longitude; // 经度
            const weidu = position.coords.latitude; // 纬度
            this.fetchWeather(jingdu, weidu); // 获取天气信息
          },
          (error) => {
            console.error('获取位置失败:', error);
          }
        );
      } else {
        console.error('浏览器不支持地理定位');
      }
    },
    async fetchWeather(jingdu, weidu) {
      try {
        const response = await getWeather({ jingdu, weidu }); // 调用 getWeather 接口
        this.weatherData = response.data; // 从响应中获取天气信息
      } catch (error) {
        console.error('获取天气信息失败:', error);
      }
    },
  },
  mounted() {
    this.getLocation(); // 组件挂载时获取用户的经纬度
  },
};
</script>

<style scoped>
.index-container {
  text-align: center;
  margin: 20px;
}

.weather-container {
  display: inline-block; /* 使卡片不占据整个宽度 */
  margin-top: 20px; /* 卡片上方间距 */
}

.weather-card {
  width: 300px; /* 设置卡片宽度 */
  padding: 20px; /* 卡片内边距 */
}
</style>

