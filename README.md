# 登录通 (企业级 HarmonyOS 登录模版)

本工程实现了一个符合企业级标准的高颜值 HarmonyOS NEXT 登录页面模版。整体应用采用最新的 ArkTS API 12 标准与 V2 状态管理机制，具备优秀的代码分层设计与多端适配能力。

## 🎯 核心技术点 (Core Technical Highlights)

### 1. V2 状态管理机制 (@ComponentV2)
- 采用了最新的 **V2 状态管理机制** 体系。
- 以 `@ComponentV2` 和 `@Local` 替代原有的装饰器，实现 `username`、`password` 与 `isAgreementChecked` 的细粒度、高性能 UI 状态监控追踪。

### 2. 架构编排与代码分层 (MVC/MVVM)
- **模块化设计**：严格按照 `models/` (数据模型)、`utils/` (工具与网络底座)、`api/` (接口服务)、`pages/` (视图层) 进行结构化代码分层，耦合度极低。
- **TypeScript 强类型**：使用 Interface 严格定义了网络请求入参 `LoginParams`、业务返回体 `LoginData` 及其最外层响应包装模型 `ApiResponse<T>`。

### 3. 多端自适应与栅格系统 (Responsive Design)
- 接入系统原生的 **栅格布局体系 (GridRow/GridCol)**。
- 采用 `sm` (手机端/折叠屏外屏)、`md` (折痕展开)、`lg` (大平板及外接大屏) 三维断点体系。登录表单的宽度能够在不同视口下自动居中占比及补齐，完美避开由于大屏大尺寸拉伸所导致的失帧变形。

### 4. 视觉沉浸式与微动效重构 (UI & Immersive)
- **SafeArea 规避区处理**：运用了 `expandSafeArea` 将视图延伸到了状态栏与导航条底部，打造全屏沉浸式的视觉连贯感受。
- **精制微动效设计**：
  - `<TextInput>` 控件采用极致的下划线焦点风格 (`border: { width: { bottom: 1 } }`)。
  - 使用了 `linearGradient` 实现操作按钮高辨识度的橙色渐变光影贴图。
  - 引入了最新的图形组件库 `SymbolGlyph`，实现了极小宽带占用的矢量返回图标与事件打通。

### 5. Axios 核心网络层与权限打通 (Networking & Security)
- 接入并深度重构了官方及三方双认定的 `@ohos/axios` 网络层：
  - **拦截器闭环**：实现了完整的 Request 与 Response 拦截链路；网络连接异常与业务级异常 (`code !== 10000`) 统一被集中截获，并由 `promptAction.showToast` 进行全局 Toast 全链路通报，释放业务端代码量。
  - **网络访问安全与赋权**：主动于 `module.json5` 内完成 `"ohos.permission.INTERNET"` 的系统底层显式授权，保证在模拟器以及真机设备上均能顺利握手外网。

### 6. 入口及 Router 路由自洽
- 更新了工程目录默认的主从依赖关系，在 `main_pages.json` 和 `module.json5` 配置内将应用初始生命周期加载窗花精确挂载至 `LoginAbility` 模块之下。
- 深度集成了系统级 `@kit.ArkUI` -> Router 堆栈管理，登录凭据校验并下发成功后，自动执行可回收的 `router.pushUrl` 压栈或 `router.replaceUrl` 换站动作跳往 `Index` 后台母页。

---

**🛠 运行及编译环境建议**:
- **API Version**: API 12 / HarmonyOS NEXT 以上版本。
- **Language**: ArkTS (TypeScript strictly typed).
- **IDE**: DevEco Studio 5.0+
