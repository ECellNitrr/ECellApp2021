import 'package:flutter/material.dart';
import 'package:ecellapp/screens/home/cubit/feedback_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<FeedbackCubit, FeedbackState>(listener: (context, state) {
          if (state is FeedbackError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is FeedbackSuccess) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Feedback Posted Successful")));
          }
        }, builder: (context, state) {
          if (state is FeedbackLoading) {
            return _buildLoading();
          } else {
            return _buildInitial(context);
          }
        }));
  }

  Widget _buildInitial(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: TextFormField(
                  controller: feedbackController,
                )),
            RaisedButton(
              child: Text("Submit Feedback"),
              onPressed: () => _postFeedback(context),
            )
          ],
        ));
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  void _postFeedback(BuildContext context) {
    final cubit = context.read<FeedbackCubit>();
    if (_formKey.currentState.validate()) cubit.postFeedback(feedbackController.text);
  }
}
