import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:webspark_test_task/router/router.dart';
import 'package:webspark_test_task/utils/helpers/validate_url.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _urlController;
  bool isRequestSended = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _urlController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocListener<ResponseDataBloc, ResponseDataState>(
      listener: (context, state) {
        if (state is ResponseDataSuccess) {
          setState(() {
            isRequestSended = false;

            AutoRouter.of(context).push(ProcessRoute());
          });
        } else if (state is ResponseDataLoading) {
          setState(() {
            isRequestSended = true;
          });
        } else if (state is ResponseDataFailure) {
          setState(() {
            isRequestSended = false;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set valid API base URL in order to continue',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.compare_arrows,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Form(
                        key: _formKey,
                        child: Expanded(
                          child: TextFormField(
                            controller: _urlController,
                            validator: (value) => validator(value),
                            decoration: const InputDecoration(
                              hintText: 'Enter URL here...',
                              focusedBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: _size.width * 0.9,
                height: 40,
                child: ElevatedButton(
                  onPressed: isRequestSended
                      ? null
                      : () {
                          _responseData(context, _urlController.text);
                        },
                  child: isRequestSended
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              // color: Colors.white,
                              ),
                        )
                      : const Text('Start counting process'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _responseData(BuildContext context, String url) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ResponseDataBloc>().add(GetUrl(url: url));
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    } else if (!isValidUrl(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }
}
