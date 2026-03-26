export interface LoginParams {
  username?: string;
  password?: string;
}

export interface LoginData {
  token: string;
  refreshToken: string;
  id: string;
  username: string;
  avatar: string;
  shareInfo: string;
  nickName: string;
  totalTime: number;
  clockinNumbers: number;
}

export interface ApiResponse<T> {
  success: boolean;
  code: number;
  message: string;
  data: T;
}
