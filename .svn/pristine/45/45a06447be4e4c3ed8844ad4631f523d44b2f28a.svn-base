var pgdeviceType = 'Desktop';
if ($(window).width() < 767) {
    pgdeviceType = 'Mobile';
}

createApp({
    setup() {
        const txnId = ref("");
        const productId = ref("");
        const holidaysHeaderData = ref();
        const selectedPGId = ref(null);
        const fareBreakup = ref({});
        const mobileRedeem = ref("");
        const showLoyalityNoInput = ref(false);
        const showLoyalityLp = ref(true);
        const redeemPointsOtp = ref(['', '', '', '', '', '']);
        const invalidOtpError = ref(false)
        const isEdgeMemberError = ref(false);
        const redeemPointsSuccess = ref(false);
        const pointsAppliedSuccess = ref(false);
        const redeemPointsChangeNo = ref(false);
        const redeemableEdgePoints = ref(0);
        const showTCSDeclerationSection = ref(false);
        const utilAmtFinYearWise = ref(0);
        const amountUtilized = ref(null);
        const isTcsCalculatedBefore = ref(false);
        const selectedTravellerTCS = ref(0);
        const tcsRes = ref(null);
        const isPckgInt = ref(false);
        const isBookingOnbehalf = ref(false);
        const promoCodeValue = ref("");
        const isPromoApplied = ref(false);
        const promoValid = ref(false);
        // card
        const cNo = ref("");
        const cName = ref("");
        const cMonth = ref("");
        const cYear = ref("");
        const cvv = ref("");
        const isConvFeeCalculated = ref("");
        // upi
        const vpa = ref("");
        const vpaName = ref("");
        const isVPAValid = ref(true);
        const qrImagePath = ref("/images/tcHolidays/common-img/qr-code.png")
        // emi
        const emiBanks = ref("")
        const selectedEMIPlan = ref(null);
        const pgInfo = ref({});
        const convenienceFeeOutput = ref({});
        const promocodeOutput = ref({});
        const showConvenienceFeeSection = ref(false);
        const isLoading = ref(false);
        const pckgTotalPrice = ref(0);
        const payNowFinalAmount = ref(0);
        const isPayNowDisabled = ref(true);
        const modeOfPayment = ref({});
        const otpTimer = ref(60);
        const isOtpTimerRunning = ref(false); 



function startOtpTimer() {
  otpTimer.value = 60; // reset to 60
  isOtpTimerRunning.value = true;

  const interval = setInterval(() => {
    if (otpTimer.value > 0) {
      otpTimer.value--;
    } else {
      clearInterval(interval);
      isOtpTimerRunning.value = false; // allow resending or enabling submit
    }
  }, 1000);
}


        async function getProductId() {
            const prodId = await doAxios({
                method: "get",
                url: `TcilPortalPG/webresources/getProductId?txnId=` + txnId.value
            });
            productId.value = prodId.data.productID;
        }

        async function getHolidaysHeaderData() {
            const res = await doAxios({
                method: "get",
                url: `tcHolidayRS/holidayBooking/pgHolidayHeader/` + txnId.value
                // url: "tcHolidayRS/pgHolidayHeader?quotationId=" + txnId.value + "&isHolidayPlus=Y&isFlight=N&custId=1"
            });
            holidaysHeaderData.value = res.data;
            isPckgInt.value = holidaysHeaderData.value.tdpDetails.pkgSubtypeId > 2 ? true : false;
            // Fare Breakup Start
            fareBreakup.value = {
                "tourTotalCost": holidaysHeaderData.value.tdpDetails.tourCost,
                "optionalActivity": holidaysHeaderData.value.optionalsTourCost || 0,
                "earlyBirdDiscount": holidaysHeaderData.value.earlyBirdDiscount || 0,
                "promoDiscount": holidaysHeaderData.value.tdpDetails.promocodeAmount,
                "gst": holidaysHeaderData.value.tdpDetails.gst,
                "totalPrice": holidaysHeaderData.value.tdpDetails.totalPrice,
                "currencyBreakup": { "CCode": "USD", "CValue": 100, "CRate": 90.90 }
            };
            // Fare Breakup End
            pckgTotalPrice.value = parseInt(holidaysHeaderData.value.tdpDetails.totalPrice);
            payNowFinalAmount.value = parseInt(holidaysHeaderData.value.tdpDetails.totalPrice);
        }

        function formatDate(dateStr) {
            const [day, month, year] = dateStr.split('-');
            const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            const monthName = monthNames[parseInt(month, 10) - 1];
            return `${day} ${monthName}, ${year}`;
        }

        function getPckgEndDate(departureDate, nights) {
            const [day, month, year] = departureDate.split('-').map(Number);
            const date = new Date(year, month - 1, day);
            date.setDate(date.getDate() + nights);
            const endDay = String(date.getDate()).padStart(2, '0');
            const endMonth = String(date.getMonth() + 1).padStart(2, '0');
            const endYear = date.getFullYear();

            const endDateStr = `${endDay}-${endMonth}-${endYear}`;

            return formatDate(endDateStr);
        }

        function getRoomDetails(room) {
            let totalRooms = room.length;
            let totalAdults = 0;
            for (let r of room) {
                totalAdults += parseInt(r.noOfAdults);
            }
            let roomsText = totalRooms > 1 ? totalRooms + " Rooms - " : totalRooms + " Room - ";
            let adultsText = totalAdults > 1 ? totalAdults + " Adults" : totalAdults + " Adult";
            return roomsText + adultsText;
        }

        const custType = computed(() => {
            return localStorage.getItem("customerType") ? localStorage.getItem("customerType") : "Guest";
        });

        // Traveler Details Start
        const groupedTravellersByRoom = computed(() => {
            if (!holidaysHeaderData.value || !holidaysHeaderData.value.pgTravellerDetails) return {};
            const groups = {};
            holidaysHeaderData.value.pgTravellerDetails.forEach(traveller => {
                const room = traveller.roomNo;
                if (!groups[room]) groups[room] = [];
                groups[room].push(traveller);
            });
            return groups;
        });

        function getTravellerIcon(traveller) {
            const age = getAge(traveller.dob);
            if (age <= 2) return "/images/tcHolidays/common-img/user-icon-05.svg";
            if (age < 18) return "/images/tcHolidays/common-img/user-icon-02.svg";
            if (traveller.isPayer === "Y") return "/images/tcHolidays/common-img/user-icon-01.svg";
            return "/images/tcHolidays/common-img/user-icon-02.svg";
        }

        function getAge(dob) {
            if (!dob) return "";
            const [day, month, year] = dob.split('-').map(Number);
            const birthDate = new Date(year, month - 1, day);
            const today = new Date();
            let age = today.getFullYear() - birthDate.getFullYear();
            const m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            return age;
        }
        // Traveler Details End

        // TCS Start
        async function getUtilizedAmount(payer) {
            let jsonData = {
                "transactionId": txnId.value,
                "panCardNo": payer.panNumber,
                "travllerId": payer.travellerId,
                "productId": productId.value
            }
            const res = await doAxios({
                method: "post",
                url: "tcHolidayRS/getUtilizedAmountPanNoWise",
                data: jsonData
            });
            if (res.data.code == "0") {
                utilAmtFinYearWise.value = res.data.utilAmtFinYearWise;
                selectedTravellerTCS.value = payer.travellerId;
                if (isTcsCalculatedBefore.value == true) {
                    calculateTcs(true);
                }
            } else {
                alert("Error in getUtilizedAmount.");
            }
        }

        async function calculateTcs(onloadCall) {
            let jsonData = {
                "tid": txnId.value,
                "utilizedAmount": parseInt(utilAmtFinYearWise.value) + parseInt(amountUtilized.value),
                "productId": productId.value,
                "totalAmount": pckgTotalPrice.value,
                "travellerDetailId": selectedTravellerTCS.value,
                "utilizedAmountByCust": parseInt(amountUtilized.value),
                "isCallOnLoad": onloadCall == undefined ? false : true,
            };
            const res = await doAxios({
                method: "post",
                url: "tcHolidayRS/tcs/calculateTcs",
                data: jsonData
            });
            tcsRes.value = res.data;
            if (res.data.code == "0") {
                payNowFinalAmount.value = res.data.tcsResponse.revisedBookingAmount;
                isTcsCalculatedBefore.value = true;
            } else {
                isTcsCalculatedBefore.value = false;
            }
        }
        // TCS End

        // Redeem Points Start
        async function sendOtp() {
            let jsonData = {
                "custID": "1",
                "emailID": localStorage.getItem("email"),
                "phoneNo": mobileRedeem.value,
                "tId": txnId.value
            }
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/OtpVerification/sendOTP",
                data: jsonData
            });
            if (res.data.otpVerified == "true") {
                showLoyalityNoInput.value = true;
                showLoyalityLp.value = false;
				startOtpTimer(); 
			
            } else {
                // todo - show validation error
                showLoyalityNoInput.value = false;
                showLoyalityLp.value = true;
            }

        }

        async function verifyOtp() {
            isLoading.value = true;
            let jsonData = {
                "custID": "1",
                "emailID": localStorage.getItem("email"),
                "phoneNo": mobileRedeem.value,
                "productId": 11,
                "tId": txnId.value
            }
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/OtpVerification/verifyOTP/" + redeemPointsOtp.value.join(''),
                data: jsonData
            });
            if (res.data.errorCode == "0") { // success
                redeemPointsChangeNo.value = false;
                invalidOtpError.value = false;
                isEdgeMemberError.value = false;
                redeemPointsSuccess.value = true;
                redeemableEdgePoints.value = parseInt(res.data.redeemablePoints);
            } else if (res.data.isCustomer == "N") { // not a member
                redeemPointsChangeNo.value = true;
                invalidOtpError.value = false;
                isEdgeMemberError.value = true;
            } else if (res.data.errorCode == "3") { // invalid otp
                redeemPointsChangeNo.value = true;
                isEdgeMemberError.value = false;
                invalidOtpError.value = true;
            } else {
                redeemPointsChangeNo.value = true;
                alert("OTP Verification failed. Please try again.");
            }
            isLoading.value = false;
        }

        function changeNo() {
            redeemPointsChangeNo.value = false;
            showLoyalityNoInput.value = false;
            showLoyalityLp.value = true;
            redeemPointsSuccess.value = false;
            pointsAppliedSuccess.value = false;
            redeemPointsOtp.value = ['', '', '', '', '', ''];
            mobileRedeem.value = "";
        }

        async function applyRedeemPoints() {
            let tcPgId = modeOfPayment.value.tcPgId ? modeOfPayment.value.tcPgId : 0;
            let tcBankId = modeOfPayment.value.tcBankId ? modeOfPayment.value.tcBankId : 0;
            let jsonData = {
                "phoneNo": mobileRedeem.value,
                "reedemAmount": redeemableEdgePoints.value,
                "transactionId": txnId.value,
            }
            jsonData.convFeePromoCodeInput = {
                'modeOfPayment': modeOfPayment.value.fopId ? modeOfPayment.value.fopId : 0,
                'convenienceFeeInput': {
                    'transactionId': txnId.value,
                    'productId': productId.value,
                    'tcPgId': tcPgId,
                    "tcBankId": tcBankId,
                    'deviceType': pgdeviceType,
                }
            }
            if (modeOfPayment.value.fopId && modeOfPayment.value.fopId == 0) {
                let cardNumber = cNo.value.substring(0, 6).trim(); //ccnumber.substring(0, 6) - card No truncated to 6 digits
                if (!isNaN(cardNumber) && cardNumber.length == 6)
                    jsonData.convFeePromoCodeInput.ConvenienceFeeInput.cardNumber = cardNumber;
            }
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/OtpVerification/blockeasypointredemption",
                data: jsonData
            });
            if (res.data.returnCode == "0") {
                pointsAppliedSuccess.value = true;
                redeemPointsSuccess.value = false;
                payNowFinalAmount.value = parseInt(res.data.revisedAmount);
            }
        }

        async function removeRedeemPoints() {
            let jsonData = {
                "transactionId": txnId.value,
            }
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/OtpVerification/removeEzPoints",
                data: jsonData
            });
            if (res.data.returnCode == "0") {
                changeNo();
                payNowFinalAmount.value = res.data.revisedAmount;
            } else {
                alert("Something went wrong.")
            }

        }
        // Redeem Points End



        // pginfo start
        async function getPGInfo() {
            const res = await doAxios({
                method: "post",
                url: `TcilPortalPG/webresources/pginfo?txnId=` + txnId.value
            });
            pgInfo.value = res.data;
            isBookingOnbehalf.value = pgInfo.value.bookingType === 'SELFBOOKING' ? false : true;

        }

        function getAllBanks(categories) {
            const allBanksCategory = categories.find(cat => cat.categoryName === "All Banks");
            return allBanksCategory ? allBanksCategory.categoryValues : [];
        }
        // pginfo end

        //Promocode start
        function promoInputEvent() {
            isPromoApplied.value = false;
        }

        function selectPromo(promo){
            if (promo != undefined) {
                promoCodeValue.value = promo;
            }

        }

        async function applyPromocode() {
            isPromoApplied.value = false;
            let tcPgId = modeOfPayment.value.tcPgId ? modeOfPayment.value.tcPgId : 0;
            let tcBankId = modeOfPayment.value.tcBankId ? modeOfPayment.value.tcBankId : 0;
            let paymentMode = 0;
            let convenienceFee = {
                'convenienceFeeInput': {
                    'transactionId': txnId.value,
                    'productId': productId.value,
                    'tcPgId': tcPgId,
                    "tcBankId": tcBankId
                }
            };
            if (modeOfPayment.value.fopId && modeOfPayment.value.fopId == 0) {
                paymentMode = modeOfPayment.value.fopId;
                let cardNumber = cNo.value.substring(0, 6).trim(); //ccnumber.substring(0, 6) - card No truncated to 6 digits
                if (!isNaN(cardNumber) && cardNumber.length == 6)
                    convenienceFee.convenienceFeeInput.cardNumber = cardNumber;
            }
            convenienceFee.convenienceFeeInput.deviceType = pgdeviceType;
            convenienceFee.promoCode = promoCodeValue.value;

            if (productId.value == 4 || productId.value == 11) {
                convenienceFee.lrsValue = false;
                convenienceFee.utilizedAmount = parseInt(utilAmtFinYearWise.value) + (amountUtilized.value != null ? parseInt(amountUtilized.value) : 0);
                convenienceFee.tcsPercentageForHolidays = 0;
                convenienceFee.modeOfPayment = paymentMode;
                await holidayPromoCalculate(convenienceFee, true, false);
            } else {
                console.log("DISABLED");
            }

        }

        function removePromoCode() {
            promoCodeValue.value = "";
            applyPromocode();
        }
        //Promocde End

        async function calculateConvFee(option, categoryId) {
            let tcPgId = null;
            let tcBankId = null;
            if (option.fopId == 0 || option.fopId == 13 || option.fopId == 14) { // CC || DC || UPI || EMI
                tcPgId = option.category[0].categoryValues[0].categoryPg
            } else if (option.fopId == 1) { // NB
                let allBanks = getAllBanks(option.category);
                tcPgId = allBanks[0].categoryPg;
                tcBankId = categoryId ? categoryId : "";
            }
            var convenienceFee = {
                'convenienceFeeInput': {
                    'transactionId': txnId.value,
                    'productId': productId.value,
                    'tcPgId': tcPgId,
                    "tcBankId": tcBankId
                }
            };
            modeOfPayment.value = {
                "fopId": option.fopId,
                'tcPgId': tcPgId,
                "tcBankId": tcBankId
            }
            if (option.fopId == 0) {
                let cardNumber = cNo.value.substring(0, 6).trim(); //ccnumber.substring(0, 6) - card No truncated to 6 digits
                if (!isNaN(cardNumber) && cardNumber.length == 6)
                    convenienceFee.convenienceFeeInput.cardNumber = cardNumber;
            }
            if (promoCodeValue.value != '') {
                convenienceFee.promoCode = promoCodeValue.value;
                convenienceFee.modeOfPayment = option.fopId;
            }
            if (productId.value == 4 || productId.value == 11) {
                convenienceFee.convenienceFeeInput.deviceType = pgdeviceType;
                convenienceFee.lrsValue = false;
                convenienceFee.utilizedAmount = parseInt(utilAmtFinYearWise.value) + (amountUtilized.value != null ? parseInt(amountUtilized.value) : 0);
                convenienceFee.tcsPercentageForHolidays = 5;
                await holidayPromoCalculate(convenienceFee, false, true);
            } else {
                console.log("DISABLED");
            }

        }

        function handleCNOInput(option) {
            const cNoIp = this.cNo.trim();
            if (cNoIp.length >= 7 && !this.isConvFeeCalculated) {
                this.isConvFeeCalculated = true;
                this.calculateConvFee(option);
            } else if (cNoIp.length < 7) {
                this.isConvFeeCalculated = false;
            }

        }

        async function holidayPromoCalculate(convenienceFee, isPromoCall, isConvFeeCall) {
            const res = await doAxios({
                method: "post",
                url: "tcHolidayRS/holidayBooking/holidayPromoConvFee",
                data: convenienceFee
            });
            if (res.data != undefined) {
                pckgTotalPrice.value = res.data.holidayResponseBean.priceResponseBean.totalPrice;
                fareBreakup.value.promoDiscount = res.data.promoCodeAmount.discountAmount;
                fareBreakup.value.totalPrice = res.data.holidayResponseBean.priceResponseBean.totalPrice;
                fareBreakup.value.gst = res.data.holidayResponseBean.priceResponseBean.totalServicetax;
                if (res.data.convenienceFeeOutput != undefined && res.data.convenienceFeeOutput.revisedTotalTxnAmount) {
                    payNowFinalAmount.value = res.data.convenienceFeeOutput.revisedTotalTxnAmount;
                }
                if (res.data.promoCodeAmount != undefined && res.data.promoCodeAmount.discountAmount > 0) {
                    payNowFinalAmount.value = res.data.convenienceFeeOutput.revisedTotalTxnAmount > 0 ? res.data.convenienceFeeOutput.revisedTotalTxnAmount : res.data.promoCodeAmount.revisedBookingAmount;
                    isPromoApplied.value = true;
                    promoValid.value = true;
                    if (isTcsCalculatedBefore.value && !isConvFeeCall) {
                        calculateTcs(false);
                    }
                } else if (isPromoCall) {
                    isPromoApplied.value = true;
                    if (promoValid.value && isTcsCalculatedBefore.value && !isConvFeeCall) {
                        calculateTcs(false);
                    }
                    promoValid.value = false;
                    alert("Invalid promocode");
                }
                promocodeOutput.value = res.data.promoCodeAmount;
                convenienceFeeOutput.value = res.data.convenienceFeeOutput;
                isPayNowDisabled.value = false;
            }
        }
        // pay now start
        function payNowClick() {
            if (modeOfPayment.value.fopId != undefined) {
                if (modeOfPayment.value.fopId == 1) {
                    netBankingPayNow();
                } else if (modeOfPayment.value.fopId == 0) {
                    creditCardPayNow();
                } else if (modeOfPayment.value.fopId == 13) {
                    upiPayNow();
                } else if (modeOfPayment.value.fopId == 14) {
                    emiPayNow();
                } else {
                    alert("");
                }
            } else {
                alert("Select Payment Mode.");
            }
        }

        function netBankingPayNow() {
            let jsonBody = {
                'transactionId': txnId.value,
                'paymentMode': modeOfPayment.value.fopId == 1 ? modeOfPayment.value.fopId : 0,
                'productId': productId.value,
                'tcPgId': modeOfPayment.value.fopId == 1 ? modeOfPayment.value.tcPgId : 0,
                'tcBankId': modeOfPayment.value.fopId == 1 ? modeOfPayment.value.tcBankId : 0,
                'transactionAmount': payNowFinalAmount.value,
                'userType': custType.value,
                'userEmail': localStorage.getItem("email"),
            };
            paymentProceed(jsonBody, false);
        }

        function creditCardPayNow() {
            // let cardNumber = cNo.value.trim();
            let cardNumber = cNo.value.replace(/\s+/g, '');
            var jsonBody = {
                'transactionId': txnId.value,
                'paymentMode': modeOfPayment.value.fopId == 0 ? modeOfPayment.value.fopId : -1,
                'productId': productId.value,
                'tcPgId': modeOfPayment.value.fopId == 0 ? modeOfPayment.value.tcPgId : -1,
                'transactionAmount': payNowFinalAmount.value,
                'cardDetails': {
                    'cardHolderName': cName.value,
                    'cardExpiryDate': cMonth.value + "" + cYear.value,
                    'cvvNumber': cvv.value,
                    'cardNumber': cardNumber,
                },
                'userType': custType.value,
                'userEmail': localStorage.getItem("email"),
            };
            paymentProceed(jsonBody, false)
        }

        function upiPayNow() {
            var paymentPlatform = pgdeviceType;
            // if ($("#pay-with-app").is(":checked")) {
            //     paymentPlatform = "Mobile";
            // }
            var jsonBody = {
                'transactionId': txnId.value,
                'paymentMode': modeOfPayment.value.fopId == 13 ? modeOfPayment.value.fopId : -1,
                'productId': productId.value,
                'tcPgId': modeOfPayment.value.fopId == 13 ? modeOfPayment.value.tcPgId : -1,
                'transactionAmount': payNowFinalAmount.value,
                'userType': custType.value,
                'userEmail': localStorage.getItem("email"),
                'vpaAddress': vpa.value,
                'platform': paymentPlatform
            };
            paymentProceed(jsonBody, false);

        }

        function emiPayNow() {
            var jsonBody = {
                'transactionId': txnId.value,
                'tcBankId': emiBanks.value + "," + selectedEMIPlan.value,
                'paymentMode': modeOfPayment.value.fopId == 14 ? modeOfPayment.value.fopId : -1,
                'productId': productId.value,
                'tcPgId': modeOfPayment.value.fopId == 14 ? modeOfPayment.value.tcPgId : -1,
                'transactionAmount': payNowFinalAmount.value,
                'cardDetails': {
                    'cardHolderName': cName.value,
                    'cardExpiryDate': cMonth.value + "" + cYear.value,
                    'cvvNumber': cvv.value,
                    'cardNumber': cNo.value.replace(/\s+/g, ''),
                },
                'userType': custType.value,
                'userEmail': localStorage.getItem("email"),
            };
            paymentProceed(jsonBody, false);
        }

        function verifyUPI() {
            let upiId = vpa.value;
            let upiPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{3,}$/;
            if (upiPattern.test(upiId)) {
                var razorpay = new Razorpay({ key: 'rzp_live_OO7gChDqJj5Jmo' });
                $('#vpa').removeClass("parsley-error");
                razorpay.verifyVpa(upiId).then((data) => {
                    if (data.success && data.customer_name) {
                        vpaName.value = data.customer_name;
                        isVPAValid.value = true;
                    } else {
                        vpaName.value = "";
                        isVPAValid.value = false;
                        // $('#vpa').addClass("parsley-error");
                    }
                }).catch(() => {
                    vpaName.value = "";
                    isVPAValid.value = false;
                    // $('#vpa').addClass("parsley-error");
                });
            } else {
                vpaName.value = "";
                isVPAValid.value = false;
                // $('#vpa').addClass("parsley-error");
            }
        }

        async function createQrCode() {
            let privacyPolicyAccept = "Y";
            let whatsappConsent = "N";
            var notes = {
                purpose: productId.value + "_" +
                    txnId.value + "_" +
                    privacyPolicyAccept + "_" +
                    whatsappConsent + "_" +
                    custType.value
            }
            notes.purpose += "_" + null; // for promo code
            let utilizeAmt = parseInt(utilAmtFinYearWise.value) + (amountUtilized.value != null ? parseInt(amountUtilized.value) : 0);
            notes.purpose += "_" + false + "_" + utilizeAmt;
            var createQrCodeRequest = { "payment_amount": payNowFinalAmount.value * 100, "notes": notes }
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/qrcode/create",
                data: createQrCodeRequest
            });
            if (res.data.image_url) {
                qrImagePath.value = res.data.image_url;
                $(".card_info .btn_qr").hide();
                $(".bottom_qr").addClass("show-qr");
            }
        }

        async function paymentProceed(jsonBody, isQRCode) {
            jsonBody.isQRCode = isQRCode;
            if (productId.value == 11) {
                hpFareReconfirmCall(jsonBody);
            } else {
                if (isQRCode) {
                    createQrCode()
                }
                else {
                    finalPaymentCall(jsonBody);
                }
            }
        }

        async function hpFareReconfirmCall(jsonBody) {
            var fareReconfirmObj = {
                "transactionId": txnId.value,
                "tcpgId": modeOfPayment.value.tcPgId
            };
            if (jsonBody.paymentMode == 1) {
                fareReconfirmObj.tcBankId = jsonBody.tcBankId;
            }
            let promoCode = promoCodeValue.value;
            if (promoCode != '') {
                fareReconfirmObj.promoCode = promoCode;
                fareReconfirmObj.modeOfPayment = modeOfPayment.value.fopId;
            }
            fareReconfirmObj.lrsValue = false;
            fareReconfirmObj.deviceType = pgdeviceType;
            const res = await doAxios({
                method: "post",
                url: "TcilDynamicPackaging/webresources/pg/payNowFareReconfirm",
                data: fareReconfirmObj
            });
            if (res.data.message == "Success") {
                if (jsonBody.isQRCode) {
                    createQrCode();
                } else {
                    finalPaymentCall(jsonBody);
                }
            }
        }

        async function finalPaymentCall(jsonBody) {
            //   insertPancard(pancard);
            let paymentJsonObj = jsonBody;
            paymentJsonObj.privacyPolicyAccept = 'Y';
            paymentJsonObj.whatsappConsent = 'N';
            paymentJsonObj.lrsValue = false;
            paymentJsonObj.utilizedAmount = parseInt(utilAmtFinYearWise.value) + (amountUtilized.value != null ? parseInt(amountUtilized.value) : 0);
            // if (isRewardPointsFlag) {
            //     paymentJsonObj.earnedPoints = parseInt($("#rewardPoints").html());
            // }
            paymentJsonObj.deviceType = pgdeviceType;
            const res = await doAxios({
                method: "post",
                url: "TcilPortalPG/webresources/pgSubmit/getPgMessage",
                data: paymentJsonObj
            });
            // Assuming 'res' contains the message string similar to your JavaScript `message`
            let message = res.data.paymentMessage; // Adjust this if the response structure differs
            if (message == "Payment was done successfully") {
                // todo
                alert("Payment was done successfully.");
            } else if ("easebuzzpaymentinitiated" == message) {
                url = res.data.paymentUrl;
                window.location.href = url;
            } else if (message.indexOf("razorPayOrderId") > -1) {
                let params = message.split('&');
                let form = '';
                params.forEach(param => {
                    let paramsPair = param.split('#');
                    form += `<input type="hidden" name="${paramsPair[0]}" id="${paramsPair[0]}" value="${paramsPair[1]}">`;
                });
                let formFinal = document.createElement('div');
                formFinal.innerHTML = form;
                document.body.appendChild(formFinal);
                const razorpay = new Razorpay({
                    key: document.getElementById('razorPayKey').value,
                    callback_url: document.getElementById('razorPayReturnUrl').value + "&razorPayTransId=" + document.getElementById('razorPayMerchantTxnId').value + "&razorPayAmount=" + document.getElementById('razorPayAmount').value,
                    redirect: true
                });
                let data = {
                    amount: document.getElementById('razorPayAmount').value,  // in paise, 1000 equals ₹10
                    email: document.getElementById('razorPayEmail').value,
                    contact: document.getElementById('razorPayMobile').value,
                    notes: {
                        custom_field: document.getElementById('razorPayMerchantTxnId').value
                    },
                    order_id: document.getElementById('razorPayOrderId').value,
                    method: document.getElementById('method').value
                };
                if (message.indexOf("razorPayCardHolder") > -1 && message.indexOf("emi_duration") == -1) {
                    data['card[name]'] = document.getElementById('razorPayCardHolder').value;
                    data['card[number]'] = document.getElementById('razorPayNumber').value;
                    data['card[cvv]'] = document.getElementById('razorPayCvv').value;
                    data['card[expiry_month]'] = document.getElementById('razorPayExpiryMonth').value;
                    data['card[expiry_year]'] = document.getElementById('razorPayExpiryYear').value;
                } else if (message.indexOf("razorBankName") > -1) {
                    data.bank = document.getElementById('razorBankName').value;
                } else if (message.indexOf("emi_duration") > -1) {
                    data.emi_duration = document.getElementById('emi_duration').value;
                    data['card[name]'] = document.getElementById('razorPayCardHolder').value;
                    data['card[number]'] = document.getElementById('razorPayNumber').value;
                    data['card[cvv]'] = document.getElementById('razorPayCvv').value;
                    data['card[expiry_month]'] = document.getElementById('razorPayExpiryMonth').value;
                    data['card[expiry_year]'] = document.getElementById('razorPayExpiryYear').value;
                } else if (message.indexOf("razorUPI") > -1) {
                    data.vpa = document.getElementById('razorUPI').value;
                } else {
                    data.wallet = document.getElementById('razorPaywallet').value;
                }
                razorpay.createPayment(data);
            } else {
                // todo
                alert("Error in generating payment.")
            }
        }



        onMounted(() => {
            txnId.value = getQueryParam('tid') || "NcZ3Ob4kfV2bvNsZVXY12g%3D%3D";
            getProductId().then(() => {
                if (productId.value == '4' || productId.value == '11') {
                    getHolidaysHeaderData().then(() => {
                        //Apply promocode if already applied from PDP . 
                        if (holidaysHeaderData.value.tdpDetails.promocode != undefined && holidaysHeaderData.value.tdpDetails.promocode != '') {
                            promoCodeValue.value = holidaysHeaderData.value.tdpDetails.promocode;
                            applyPromocode();
                        }
                        //Calculate TCS if already calculated before.
                        if (holidaysHeaderData.value.travellersList != undefined) {
                            let travellersList = holidaysHeaderData.value.travellersList;
                            const traveller = travellersList.find(t => t.paymentPayer === "Y" && t.utilizedAmount > 0);
                            isTcsCalculatedBefore.value = traveller ? true : false;
                            if (isTcsCalculatedBefore.value == true) {
                                $(`#flexRadioPayer${traveller.travellerId}`).click();
                                amountUtilized.value = traveller ? traveller.utilizedAmount : 0;
                            }
                        }
                    });
                    showTCSDeclerationSection.value = true;
                }
                else {
                    console.log("Invalid Product ID: ", productId.value);
                }
                getPGInfo().then(() => {
                    if (pgInfo.value.bookingDetails.loyaltyPoints > 0) {
                        showLoyalityNoInput.value = false;
                        showLoyalityLp.value = false;
                        redeemPointsChangeNo.value = false;
                        invalidOtpError.value = false;
                        isEdgeMemberError.value = false;
                        pointsAppliedSuccess.value = true;
                        redeemPointsSuccess.value = false;
                        mobileRedeem.value = pgInfo.value.bookingDetails.loyaltyPhoneNumber;
                        redeemableEdgePoints.value = parseInt(pgInfo.value.bookingDetails.loyaltyPoints);
                    }
                    payNowFinalAmount.value = parseInt(pgInfo.value.amount);
                });
            });
        });

        function getQueryParam(name) {
            const query = window.location.search.substring(1);
            const params = query.split('&');

            for (const param of params) {
                const [key, value] = param.split('=');
                if (decodeURIComponent(key) === name) {
                    return value;
                }
            }
            return null;
        }

        function currencyFormatter(num) {
            let [integerPart, decimalPart] = num.toString().split('.');

            let last3 = integerPart.slice(-3);
            let rest = integerPart.slice(0, -3);
            let res = '';

            while (rest.length > 2) {
                res = ',' + rest.slice(-2) + res;
                rest = rest.slice(0, -2);
            }

            let formattedInt = (rest ? rest + res + ',' : '') + last3;
            return decimalPart ? formattedInt + '.' + decimalPart : formattedInt;
        }

       onMounted(async () => {
       await getProductId();
       await getHolidaysHeaderData();

  
       await nextTick();

       const $paymentSection = $('.complete_payment');
       $paymentSection.find('.payment_mode').removeClass('active');
       $paymentSection.find('.payment_info').hide();


       $paymentSection.on('change', 'input[name="paymentMethod"]', function () {
       const $selectedMode = $(this).closest('.payment_mode');
       $paymentSection.find('.payment_mode').removeClass('active');
       $paymentSection.find('.payment_info').slideUp();

      $selectedMode.addClass('active');
      $selectedMode.find('.payment_info').slideDown();
      });
      });


        return {
            productId,
            holidaysHeaderData,
            formatDate,
            getPckgEndDate,
            getRoomDetails,
            groupedTravellersByRoom,
            getTravellerIcon,
            getAge,
            fareBreakup,
            mobileRedeem,
            sendOtp,
            showLoyalityNoInput,
            showLoyalityLp,
            redeemPointsOtp,
            verifyOtp,
            changeNo,
            invalidOtpError,
            isEdgeMemberError,
            redeemPointsChangeNo,
            redeemPointsSuccess,
            pointsAppliedSuccess,
            redeemableEdgePoints,
            applyRedeemPoints,
            removeRedeemPoints,
            selectedPGId,
            getUtilizedAmount,
            pgInfo,
            getAllBanks,
            isLoading,
            currencyFormatter,
            isPckgInt,
            showTCSDeclerationSection,
            utilAmtFinYearWise,
            amountUtilized,
            calculateTcs,
            tcsRes,
            calculateConvFee,
            promoCodeValue,
            convenienceFeeOutput,
            promocodeOutput,


            cNo,
            cName,
            cMonth,
            cYear,
            cvv,
            handleCNOInput,
            vpa,
            verifyUPI,
            vpaName,
            isVPAValid,
            qrImagePath,
            emiBanks,
            selectedEMIPlan,

            pckgTotalPrice,
            payNowFinalAmount,
            modeOfPayment,
            paymentProceed,
            finalPaymentCall,
            payNowClick,
            isPayNowDisabled,
            isPromoApplied,
            promoValid,
            selectPromo,
            applyPromocode,
            removePromoCode,
            promoInputEvent,
			otpTimer, 
			isOtpTimerRunning, 
			sendOtp,
			verifyOtp
        };
    },
}).mount("#pg-app");

// $('.select_dropdown').on('change', function() {
//     const selectedBank = $(this).val();
//     console.log("Selected Bank:", selectedBank);
// });