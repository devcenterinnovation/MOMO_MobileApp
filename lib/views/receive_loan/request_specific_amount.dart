import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/constants.dart';
import 'package:momo/custom_text.dart';
import 'package:momo/input_field.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/receive_loan/submit_request.dart';
import 'package:momo/widget.dart';
import 'package:momo/widgets/custom_clipper.dart';
import 'package:momo/widgets/dropdown_widget.dart';

class RequestSpecificAmount extends StatefulWidget {
  final double amount;
  const RequestSpecificAmount({Key? key, required this.amount})
      : super(key: key);

  @override
  State<RequestSpecificAmount> createState() => _RequestSpecificAmountState();
}

class _RequestSpecificAmountState extends State<RequestSpecificAmount> {
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

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;

  late int _currentValue;
  void initState() {
    _currentValue = widget.amount.toInt();
    super.initState();
  }

  int _days = 7;

  @override
  Widget build(BuildContext context) {
    double _service = (15 / 100) * _currentValue;
    double _vat = (10 / 100) * _currentValue;
    double _charges = (_service + _vat);
    double _deposit = _currentValue - _charges;
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
              Slider(
                  value: _currentValue.toDouble(),
                  min: 0,
                  max: 50000,
                  label: "N" + _currentValue.toString(),
                  divisions: 5,
                  activeColor: AppColors.mainColor,
                  onChanged: (value) {}),
              SizedBox(height: 30.h),
              Slider(
                  value: _days.toDouble(),
                  min: 0,
                  max: 14,
                  label: _days.toString() + " days",
                  divisions: 14,
                  activeColor: AppColors.mainColor,
                  onChanged: (value) {}),
              SizedBox(height: 24.h),
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
                                        text: 'N${_currentValue.toInt()}',
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
                                        text: 'N${_service.toInt()} (15%)',
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
                                          text: 'Vat',
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: 'N${_vat.toInt()} (10%)',
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
                                          text: 'Amount to be paid',
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: 'N${_deposit.toInt()}',
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
                                          fontSize: 10,
                                          color: const Color(0xFFA47B7D),
                                          fontWeight: FontWeight.w400),
                                      SizedBox(height: 5.h),
                                      CustomText(
                                        text: 'N${_currentValue.toInt()}',
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
                      buttonHeight: 60.h,
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
                                    fontSize: 14,
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
//Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Bank Account Informtion',
                      fontSize: 14,
                    ),
                    const InputFormField(
                      label: 'GT Bank  - 0127338292',
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
                            hintSize: 14.0,
                            label: 'N${_currentValue.toInt()}',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Expanded(
                            child: InputFormField(
                          label: '7 days',
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        ))
                      ],
                    ),
                    CustomText(
                      text: 'View Calculations',
                      color: AppColors.laon3,
                      fontSize: 10,
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
                        Get.to(() => const SubmitRequest());
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
