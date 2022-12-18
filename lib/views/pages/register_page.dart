part of 'pages.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final registerVM = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: registerVM.obx((state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Text(
                "Register",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: registerVM.formKey,
                child: Column(children: [
                  TextInputField(
                      controller: registerVM.ctrlName,
                      error: "Mohon isi area ini",
                      hint: "Nama",
                      obscure: false,
                      number: false),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                      controller: registerVM.ctrlEmail,
                      error: "Mohon isi area ini",
                      hint: "Email",
                      obscure: false,
                      number: false),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputPasswordField(
                      controller: registerVM.ctrlPassword,
                      error: "Kata sandi harus memiliki 8 karakter atau lebih",
                      hint: "Kata Sandi"),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Role",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: false,
                        child: Text("Anggota"),
                      ),
                      DropdownMenuItem(
                        value: true,
                        child: Text("Admin"),
                      )
                    ],
                    onChanged: (value) {
                      registerVM.changeRoleValue(value!);
                    },
                    isExpanded: true,
                  ),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              ActionButton(
                  text: "Register",
                  press: () {
                    registerVM.register();
                  }),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(text: "Sudah punya akun? ", children: <TextSpan>[
                  TextSpan(
                      text: "Log In disini",
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(LoginPage());
                        })
                ]),
              )
            ]),
          ),
        );
      }, onLoading: Service.loadingDialog()),
    );
  }
}
