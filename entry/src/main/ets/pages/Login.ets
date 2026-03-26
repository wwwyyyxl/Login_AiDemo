import { promptAction, router } from "@kit.ArkUI";
import { loginApi } from "../api/LoginApi";

@Entry
@ComponentV2
struct Login {
  @Local username: string = "";
  @Local password: string = "";
  @Local isAgreementChecked: boolean = false;

  build() {
    Column() {
      // 沉浸式，顶部与底部规避区处理
      Row() {
        SymbolGlyph($r("sys.symbol.chevron_backward"))
          .fontSize(24)
          .fontColor([Color.Black])
          .onClick(() => {
            // TODO: 返回上一页
          })
      }
      .width("100%")
      .padding({ top: 40, left: 16, right: 16 })
      .height(88)

      // 栅格系统响应式布局
      GridRow({
        columns: { sm: 4, md: 8, lg: 12 },
        gutter: { x: 0, y: 0 },
        breakpoints: { value: ["320vp", "600vp", "840vp"] },
      }) {
        GridCol({
          span: { sm: 4, md: 6, lg: 6 },
          offset: { sm: 0, md: 1, lg: 3 },
        }) {
          Column() {
            // 图标
            Image($r("app.media.startIcon"))
              .width(80)
              .height(80)
              .margin({ top: 20, bottom: 20 })
              .alt("Icon")

            // 标题
            Text("登录一下")
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .fontColor("#333333")
              .margin({ bottom: 12 })

            // 副标题
            Text("搞定企业登录，就用登录通")
              .fontSize(14)
              .fontColor("#999999")
              .margin({ bottom: 40 })

            // 用户名输入
            TextInput({ placeholder: "请输入用户名", text: this.username })
              .type(InputType.Normal)
              .backgroundColor(Color.Transparent)
              .border({ width: { bottom: 1 }, color: "#EEEEEE" })
              .padding({ left: 0, right: 0 })
              .height(50)
              .margin({ bottom: 20 })
              .onChange((value: string) => {
                this.username = value;
              })

            // 密码输入
            TextInput({ placeholder: "请输入密码", text: this.password })
              .type(InputType.Password)
              .backgroundColor(Color.Transparent)
              .border({ width: { bottom: 1 }, color: "#EEEEEE" })
              .padding({ left: 0, right: 0 })
              .height(50)
              .margin({ bottom: 20 })
              .onChange((value: string) => {
                this.password = value;
              })
              .showPasswordIcon(true)

            // 用户协议区
            Row() {
              Checkbox()
                .select(this.isAgreementChecked)
                .shape(CheckBoxShape.ROUNDED_SQUARE)
                .width(14)
                .height(14)
                .margin({ right: 8 })
                .onChange((value: boolean) => {
                  this.isAgreementChecked = value;
                })
              Text() {
                Span("已阅读并同意 ")
                  .fontColor("#999999")
                  .fontSize(12)
                Span("用户协议")
                  .fontColor("#333333")
                  .fontSize(12)
                  .onClick(() => {
                    // TODO: 跳转协议
                  })
                Span(" 和 ")
                  .fontColor("#999999")
                  .fontSize(12)
                Span("隐私政策")
                  .fontColor("#333333")
                  .fontSize(12)
                  .onClick(() => {
                    // TODO: 跳转隐私政策
                  })
              }
            }
            .width("100%")
            .alignItems(VerticalAlign.Center)
            .margin({ top: 10, bottom: 30 })

            // 登录按钮
            Button("立即登录")
              .width("100%")
              .height(44)
              .fontSize(16)
              .fontColor(Color.White)
              .linearGradient({
                angle: 90,
                colors: [
                  ["#FFB25A", 0.0],
                  ["#F27A29", 1.0],
                ],
              })
              .type(ButtonType.Normal)
              .borderRadius(4)
              .onClick(() => {
                this.handleLogin();
              })

            // 占位符推送其他登录方式到地步
            Blank()

            // 其他登录方式
            Column() {
              Text("其他登录方式")
                .fontSize(12)
                .fontColor("#999999")
                .margin({ bottom: 20 })
              Button({ type: ButtonType.Circle, stateEffect: true }) {
                Image($r("app.media.startIcon"))
                  .width(28)
                  .height(28)
                  .alt("鸿")
              }
              .width(48)
              .height(48)
              .backgroundColor(Color.White)
              .border({ width: 1, color: "#EEEEEE" })
              .onClick(() => {
                // TODO: 华为授权登录
              })
            }
            .width("100%")
            .alignItems(HorizontalAlign.Center)
            .margin({ bottom: 40 })
          }
          .padding({ left: 32, right: 32 })
          .width("100%")
          .height("100%")
        }
      }
      .width("100%")
      .layoutWeight(1)
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.White)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM]);
  }

  async handleLogin() {
    if (!this.isAgreementChecked) {
      promptAction.showToast({ message: "请先阅读并同意用户协议" });
      return;
    }
    if (!this.username || !this.password) {
      promptAction.showToast({ message: "请输入用户名和密码" });
      return;
    }
    // try {
    const res = await loginApi({ username: this.username, password: this.password });
    if (res && res.data) {
      console.info("Login success token: ", res.data.token);
      promptAction.showToast({ message: "登录成功" });
      router.pushUrl({ url: "pages/Index" });
    }
    // } catch (e) {
    //   // 错误已由拦截器处理
    //   console.error('Login failed');
    // }
  }
}
