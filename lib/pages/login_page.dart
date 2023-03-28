import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formfield = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final name_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final pass_confirm_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String text = "";
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard))
      ]),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
                key: _formfield,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.jpg',
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(text),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: name_controller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: email_controller,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(input!);
                        if (!emailValid) {
                          return "Enter Valid Email";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: pass_controller,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (input) {
                        bool passValid = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(input!);
                        if (!passValid) {
                          return "Password should contain at least 8 characters";
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: pass_confirm_controller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (input) {
                        if (is_Matched(pass_controller.value.toString(),
                                pass_confirm_controller.value.toString()) ==
                            false) {
                          return "Password not matched!!";
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.confirmation_num)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print(email_controller.value);
                          email_controller.clear();
                          name_controller.clear();
                          pass_controller.clear();
                          pass_confirm_controller.clear();
                          setState(() {
                            text = "Succeded";
                          });
                        } else {}
                      },
                      child: Container(
                        color: Colors.blue,
                        height: 50,
                        child: const Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }

  bool is_Matched(String str1, String str2) {
    if (str1.compareTo(str2) == 0) {
      return true;
    }
    return false;
  }
}
