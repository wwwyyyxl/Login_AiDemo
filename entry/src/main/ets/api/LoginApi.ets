import { http } from '../utils/Http';
import { ApiResponse, LoginData, LoginParams } from '../models/LoginModel';

export const loginApi = (data: LoginParams): Promise<ApiResponse<LoginData>> => {
  return http.post<null, ApiResponse<LoginData>>('/hm/login', data);
};
