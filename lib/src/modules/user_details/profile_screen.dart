import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prox_web/src/commons/router/routes.dart';
import 'package:prox_web/src/modules/product_list/bloc/product_bloc.dart';
import 'package:prox_web/src/modules/user_details/bloc/profile_bloc.dart';
import 'package:prox_web/src/modules/user_details/bloc/profile_event.dart';
import 'package:prox_web/src/modules/user_details/bloc/profile_state.dart';
import 'package:prox_web/src/modules/user_details/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  late ProfileModel model;
  void initState() {
    super.initState();
    model = new ProfileModel(
        "test", "test", "test", "211212", "Karnataka", "", "0", false);
  }

  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _pinCodeController.dispose();
    _stateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is CreatedOrUpdatedProfileState) {
            _scaffoldKey.currentState!.showSnackBar(SnackBar(
              content: Text("Order is created"),
              backgroundColor: Colors.green,
            ));
            Future.delayed(Duration(seconds: 2), () {
              Navigator.popAndPushNamed(
                  context, "${Routes.ORDER_SUCCESS}/${state.orderModel.id}");
            });
          }
        },
        child: Scaffold(
            key: _scaffoldKey,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Personal Information"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Name"),
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          InputDecoration(labelText: "Please Enter Name"),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Address"),
                    TextFormField(
                      controller: _addressController,
                      decoration:
                          InputDecoration(labelText: "Please Enter Address"),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Text("Pincode"),
                              TextFormField(
                                controller: _pinCodeController,
                                decoration: InputDecoration(
                                    labelText: "Please Enter PinCode"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("State"),
                            TextFormField(
                              controller: _stateController,
                              decoration: InputDecoration(
                                  labelText: "Please Enter State Name"),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              BlocProvider.of<ProfileBloc>(context).add(CreateOrUpdateProfileEvent(
                                  profileModel: model,
                                  userId: BlocProvider.of<ProductBloc>(context).userId,
                                  productMaps: BlocProvider.of<ProductBloc>(context).productsInCart));
                            }

                          },
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Center(
                            child: Text("Save"),
                          ),
                          color: Colors.green,
                          textColor: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
