part of 'pages.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: loginVM.obx((state) {
        return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: loginVM.formKey,
                  child: Column(children: [
                    TextInputField(
                        controller: loginVM.ctrlEmail,
                        error: "Mohon isi area ini",
                        hint: "Email",
                        obscure: false,
                        number: false),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInputPasswordField(
                        controller: loginVM.ctrlPassword,
                        error:
                            "Kata sandi harus memiliki 8 karakter atau lebih",
                        hint: "Kata Sandi")
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                ActionButton(
                    text: "Log In",
                    press: () async {
                      loginVM.login();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(text: "Tidak punya akun? ", children: <TextSpan>[
                    TextSpan(
                        text: "Daftar disini",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(RegisterPage());
                          })
                  ]),
                )
              ])),
        );
      }, onLoading: Service.loadingDialog()),
    );
  }
}
