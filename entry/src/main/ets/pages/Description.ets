@Entry
@Component
struct Description {
  build() {
    Text("该页面不做任何设计，旨在说明，并提供需求！！！");
    /**
     * 借助Ai的全部提示词，均放在这里，供参考优化，也供Ai打造项目
    # 角色与任务
    你是一位资深的 HarmonyOS 专家架构师。请使用最新版 ArkTS 语法（HarmonyOS NEXT / API 12+ 标准）和 **V2 状态管理（@ComponentV2, @Local 等）**，为我编写一个企业级的“登录通” App 登录页面。

    # 核心开发需求：Axios 网络层与企业级架构

    ## 1. 数据模型定义 (Data Models)
    请使用 TypeScript 强类型定义接口数据结构：
     * **LoginParams**：包含 `username` (string), `password` (string)。
     * **LoginData**：包含 `token`, `refreshToken`, `id`, `username`, `avatar`, `shareInfo`, `nickName` (string 类型)，以及 `totalTime`, `clockinNumbers` (number 类型)。
     * **ApiResponse<T>**：通用响应体，包含 `success` (boolean), `code` (number), `message` (string), `data` (T)。

    ## 2. Axios 核心封装 (Service Layer)
    目前项目已安装 `@ohos/axios` (V2.2.8)。请独立编写一段用于网络请求封装的代码：
     * **创建实例**：使用 `axios.create` 创建一个 axios 实例，设置 `baseURL` 为 `https://api-harmony-teach.itheima.net`，并设置超时时间 `timeout`。
     * **拦截器配置**：
     * **请求拦截器**：预留添加 Token 的 TODO 注释。
     * **响应拦截器**：直接提取并返回 `response.data`，如果网络错误或业务 `code` 非 0（非10000），使用 `promptAction.showToast` 统一抛出错误提示，并返回 `Promise.reject`。
     * **API 方法**：导出一个 `loginApi(data: LoginParams): Promise<ApiResponse<LoginData>>` 方法，内部调用封装好的 axios 实例执行 POST 请求 `/hm/login`。

    ## 3. 响应式与多端适配（折叠屏与平板）
     * **断点工具**：使用 `@media` 媒体查询或 Grid 系统，划分为 `sm`、`md`、`lg` 三个断点。
     * **网格布局（GridRow/GridCol）**：页面主体表单必须使用网格布局。在 `sm` 下占满全宽（保留安全边距），在 `md` 和 `lg` 下居中显示（限制栅格占比，避免大屏拉伸失调）。

    ## 4. 沉浸式与规避区
     * 使用 `expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])`。
     * 完美处理顶部状态栏和底部导航条的规避，确保内容不被遮挡。

    ## 5. 登录页 UI 与状态逻辑 (V2 状态管理)
    请使用 `@ComponentV2` 和 `@Local` 实现页面组件：
     * **状态定义**：定义 `username`、`password` 和 `isAgreementChecked`。
     * **顶部与品牌区**：左侧返回图标，居中 App Icon 占位图，大标题“登录通”，副标题“搞定企业登录，就用登录通”。
     * **表单输入区**：用户名输入框、密码输入框（需支持密文显示）。样式要求极简或下划线设计。
     * **用户协议区**：Checkbox 及协议文本（使用 Span 组件实现高亮并支持点击）。
     * **核心操作区**：“立即登录” 按钮。`onClick` 逻辑如下：
    1.  校验：未勾选协议则 Toast 提示“请先阅读并同意用户协议”并 return；账号密码为空则 Toast 提示并 return。
    2.  请求：调用 `loginApi({username, password})`。
    3.  成功处理：控制台打印 token，Toast 提示“登录成功”（预留路由跳转 TODO）。
    4.  异常捕获：使用 `try...catch` 捕获拦截器抛出的异常（无需重复 Toast，拦截器已处理）。
     * **第三方登录区**：底部“其他登录方式”及华为 Logo 登录按钮（预留华为授权登录 TODO）。

    # 输出要求
     * 代码必须结构清晰，按 `Model`、`Service/Http`、`UI View` 的逻辑分块或加注释区分。
     * 确保代码兼容 HarmonyOS NEXT 和 V2 状态管理机制，可直接在 IDE 运行。
     */
  }
}
