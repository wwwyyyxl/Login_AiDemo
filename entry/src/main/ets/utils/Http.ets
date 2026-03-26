import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';

export const http = axios.create({
  baseURL: 'https://api-harmony-teach.itheima.net',
  timeout: 10000,
});

http.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // TODO: Add Token
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});

http.interceptors.response.use((response: AxiosResponse) => {
  if (response.data.code !== 10000 && response.data.code !== 0) {
    promptAction.showToast({ message: response.data.message || '网络错误' });
    return Promise.reject(new Error(response.data.message || '网络错误'));
  }
  return response.data;
}, (error: AxiosError) => {
  promptAction.showToast({ message: '网络请求失败' });
  return Promise.reject(error);
});
