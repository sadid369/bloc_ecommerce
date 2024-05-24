import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/route_pages.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'username',
                labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      fontSize: 20,
                    ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'email',
                labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      fontSize: 20,
                    ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'password',
                labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      fontSize: 20,
                    ),
              ),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state is SwitchChanged ? state.value : true,
                      onChanged: (value) {
                        context.read<RememberSwitchCubit>().switchToggle(value);
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        text: 'Sign Up',
        bg: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: () {
          context.pushNamed(Routes.REGISTER_ROUTE);
        },
      ),
    );
  }
}
