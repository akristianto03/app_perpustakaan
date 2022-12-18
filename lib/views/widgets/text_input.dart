part of 'widgets.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.controller,
      required this.error,
      required this.hint,
      required this.obscure,
      required this.number})
      : super(key: key);
  final TextEditingController controller;
  final String error;
  final String hint;
  final bool obscure;
  final bool number;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              hint,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: obscure,
            keyboardType: !number ? TextInputType.text : TextInputType.number,
            controller: controller,
            maxLines: 1,
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
              contentPadding: EdgeInsets.all(10),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return error;
              } else {
                return null;
              }
            },
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}

class TextInputPasswordField extends StatelessWidget {
  TextInputPasswordField(
      {Key? key,
      required this.controller,
      required this.error,
      required this.hint})
      : super(key: key);

  final TextEditingController controller;
  final String error;
  final String hint;

  final passwordC = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            hint,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(() => TextFormField(
              keyboardType: TextInputType.text,
              obscureText: !passwordC.showPass.value ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              controller: controller,
              maxLines: 1,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      passwordC.switchShow();
                    },
                    icon: !passwordC.showPass.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                fillColor: Colors.grey[300],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return error;
                } else {
                  return null;
                }
              },
              style: Theme.of(context).textTheme.bodyText2,
            ))
      ],
    );
  }
}
