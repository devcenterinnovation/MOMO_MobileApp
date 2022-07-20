import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momo/constants.dart';
import 'package:momo/controllers/user_controller.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/submit_request.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:momo/widgets/dropdown_widget.dart';

class RequestSpecificAmount extends StatefulWidget {
  final int amount;
  const RequestSpecificAmount({Key? key, required this.amount})
      : super(key: key);

  @override
  State<RequestSpecificAmount> createState() => _RequestSpecificAmountState();
}

class _RequestSpecificAmountState extends State<RequestSpecificAmount> {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  final amountController = TextEditingController();

  String maxBalance = '';
  UserController userController = Get.find();

  final _formKey = GlobalKey<FormState>();

  String? selectedValue = '7 days';

  String purpose = "";

  int _days = 7;

  late int _currentValue;

  final List<String> loanPurpose = [
    'Shopping',
    'Medical Expenses',
    'Education',
    'Travelling',
    'Marriage',
    'For Consumption',
    'For Renting',
    'For Buying a House'
  ];

  void initState() {
    _currentValue = widget.amount.toInt();
    maxBalance = userController.getWallet()!.maxBalance.toString();
    getAmount();
    super.initState();
  }

  getAmount() {
    if (widget.amount != null) {
      setState(() {
        amountController.text = widget.amount.toString();
        _currentValue = widget.amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _service = (25 / 100) * _currentValue;
    double _deposit = _currentValue - _service;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: BLACK,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, bottom: 27.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Request a specific amount',
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'How much do you want to borrow and\nfor how long',
                      color: AppColors.secondary,
                      fontSize: 12,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: InputFormField(
                  hintColor: BLACK,
                  hintSize: 14.0,
                  enabled: true,
                  autoFocus: true,
                  inputSize: 18.sp,
                  onChanged: (text) {
                    setState(() {
                      _currentValue = int.parse(text);
                    });
                  },
                  validator: (text) {
                    if (int.parse(text) > int.parse(maxBalance)) {
                      return 'Please enter an amount between N3,000 to N${myFormat.format(int.parse(maxBalance))}.';
                    }
                  },
                  controller: amountController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  prefixIcon: Container(
                    width: 40.w,
                    margin: EdgeInsets.only(left: 10.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'NGN',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ClipPath(
                  clipper: SmallClipper(),
                  child: Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(color: AppColors.captions),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, bottom: 20.h, left: 33.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: 'Loan Amount',
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text:
                                            'N${myFormat.format(_currentValue)}',
                                        fontSize: 12,
                                        color: BLACK,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: 'Duration',
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: '${_days.toInt()} days',
                                        fontSize: 12,
                                        color: BLACK,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: 'Service charge',
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: 'N${myFormat.format(_service)}',
                                        fontSize: 12,
                                        color: BLACK,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: 'Total Due',
                                          fontSize: 12,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text:
                                            'N${myFormat.format(_currentValue)}',
                                        fontSize: 14,
                                        color: BLACK,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: 'Disburse Amount',
                                          fontSize: 12,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: 'N${myFormat.format(_deposit)}',
                                        fontSize: 14,
                                        color: BLACK,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Purpose of Loan',
                      fontSize: 14,
                    ),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppColors.mainColor, width: 0.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.mainColor, width: 0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: AppColors.mainColor, width: 0.8),
                        ),
//Add more decoration as you want here
//Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      scrollbarAlwaysShow: true,
                      hint: Text(
                        'Select loan purpose',
                        style: TextStyle(
                            fontSize: 14.sp, color: GREY.withOpacity(0.9)),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainColor,
                      ),
                      buttonHeight: 55.h,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: loanPurpose
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select purpose of loan.';
                        }
                      },
                      onChanged: (value) {
                        purpose = value.toString();
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Repayment Plan',
                      fontSize: 14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFormField(
                            hintColor: BLACK,
                            hintSize: 15.0,
                            enabled: false,
                            label: 'N ${myFormat.format(_currentValue)}',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: InputFormField(
                            hintColor: BLACK,
                            hintSize: 15.0,
                            enabled: false,
                            label: '${_days.round()} days',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: customButton(
                    title: 'Next',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => SubmitRequest(
                              loanAmount: _currentValue.toInt(),
                              purpose: purpose,
                              days: _days,
                              serviceCharge: _service,
                              totalDue: _currentValue,
                              disburseAmount: _deposit,
                            ));
                        _formKey.currentState!.save();
                      }
                    }),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
