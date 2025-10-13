var axiosUrlLogin = 'TcilMyAccount/login/';

var setCookie = function (key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (48 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires + ';path=/';
}

var getCookie = function (key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
};

var delete_cookie = function (name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/';
};

function readCookie(name) {
    let nameEQ = name + "=";
    let ca = document.cookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return null;
}

if (getCookie("user") === null && localStorage.getItem("customerType") !== "Guest") {
    localStorage.removeItem("customerType");
    localStorage.removeItem("onBehalf");
    localStorage.removeItem("onBehalfCheck");
    localStorage.removeItem("onBehalfRedirectUrl");
    localStorage.removeItem("userDetailandFamilyTree");
    localStorage.removeItem("onBehalfEmail");
    localStorage.removeItem("onBehalfUserDetailandFamilyTree");
    localStorage.removeItem("guestEmailId");
    localStorage.removeItem("loginAccType");
    localStorage.removeItem("active");
    localStorage.removeItem("sideBar");
    localStorage.removeItem('onBehalfEmail');

    //localStorage.removeItem("mobile");
}

function getBaseConfig() {
    const server = window.location.href;
    let baseURL = 'https://services.thomascook.in/';
    let baseImageURL = 'https://resources.thomascook.in/images';

    if (server.includes("localhost")) {
        baseURL = "http://localhost:8080/";
        baseImageURL = "http://172.16.177.175/backup/development/upload/images";
    } else if (server.includes("172.16.177.175:28180")) {
        baseURL = "http://172.16.177.175:8080/";
        baseImageURL = "http://resources.thomascook.dev/images";
    } else if (server.includes("172.16.177.175:28480")) {
        baseURL = "http://172.16.177.175:35711/";
        baseImageURL = "http://resources.thomascook.sit/images";
    } else if (server.includes("uatastra2")) {
        baseURL = "https://services-uatastra2.thomascook.in/";
        baseImageURL = "https://resources-uatastra2.thomascook.in/images";
    } else if (server.includes("www.thomascook.in")) {
        baseURL = "https://services.thomascook.in/";
        baseImageURL = "https://resources.thomascook.in/images";
    }

    return { baseURL, baseImageURL };
}

function createApiInstance() {
    const userSession = getCookie('userSession') != null ? getCookie('userSession') : "";
    const requestId = getCookie('requestId') != null ? getCookie('requestId') : "";
    const sessionId = getCookie('c2Vzc2lvbklk') != null ? getCookie('c2Vzc2lvbklk') : "";
    // const baseURL = getBaseURL();
    const { baseURL } = getBaseConfig();
    return axios.create({
        baseURL: baseURL,
        headers: {
            requestid: requestId,
            sessionid: sessionId
        },
    })
}

async function doAxios({ method = '', url = '', data = {}, config = {} }) {
    console.log("API URL: " + url);
    try {
        const api = createApiInstance();
        let response;
        if (method.toLowerCase() === 'get') {
            response = await api.get(url, data, config);
        } else if (method.toLowerCase() === 'post') {
            response = await api.post(url, data, config);
        }
        // Handle headers
        if (response && response.headers) {
            const sessionEndTime = response.headers['sessionendtime'];
            if (sessionEndTime ) {
                delete_cookie('loginExpire');
                setCookie('loginExpire', sessionEndTime);
                startLogoutCountdown();
            }
            //Step 1 : Check wheater logixEcpire from cookies is equals to expiretime from response.
            //Step 2 : If does not match then update cookies and then call start CountDown Function .
            const userHeader = response.headers['user']; // or check with Object.keys
            if (userHeader) {
                setCookie('user', userHeader);
            }
        }
        if (response.status == 401) {
            sessionExpire();
        }
        return response;
    } catch (error) {
        console.error("doAxios error:", error);

        const { response, message } = error;

        // Handle errors based on status codes and response headers
        if (response) {
            const { status, headers } = response;
            if (status === 401) {
                const messageHeader = headers.message;
                if (messageHeader === "SIV" || messageHeader === "IPM") {
                    sessionExpire();
                } else if (messageHeader === "TIV") {
                    delete_cookie("requestId");
                    delete_cookie("c2Vzc2lvbklk");
                    window.location.reload();
                } else if (messageHeader === "REO") {
                    window.location.href = window.location.origin + '/error-page';
                }
            } else if (status === 400) {
                const messageHeader = headers['Message'];
                if (messageHeader === "INA") {
                    console.warn("Message payload invalid. URL : " + url);
                    window.location.href = window.location.origin + '/error-page';
                } else if (messageHeader === "PNA") {
                    console.warn("Request parameters invalid. URL : " + url);
                    window.location.href = window.location.origin + '/error-page';
                }
            }
        }

        // Rethrow the error for further handling if necessary
        throw error;
    }
}

let logOutTimer = "";
$("#agent-logout-timer").text(logOutTimer);

function startLogoutCountdown() {
    var expiryTime = getExpiryTime();
    var countdownInterval = setInterval(function () {
        var now = new Date();
        var diffMs = expiryTime - now;
        if (diffMs <= 0) {
            clearInterval(countdownInterval);
            return;
        }
        var totalSeconds = Math.floor(diffMs / 1000);
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = totalSeconds % 60;

        var formmatedTime = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
        logOutTimer = formmatedTime;

        // document.getElementById("agent-logout-timer").textContent = logOutTimer;
        $("#agent-logout-timer").text(logOutTimer);
    }, 1000);
}

function getExpiryTime() {
    let expiryString = getCookie("loginExpire");
    const normalized = expiryString.replace("IST", "+05:30");
    let expiry = new Date(normalized);
    let now = new Date();
    if (expiry <= now) {
        expiry.setDate(expiry.getDate() + 1);
    }
    return expiry;
}

function sessionExpire() {
    let sessionExpireURL = "../common/sessionExpire";

    axios.get(sessionExpireURL)
        .then(function (response) {
            // Assuming the response data is HTML and you want to append it to the body
            $('body').append(response.data);
            $('.modal').modal('hide');
            $('#myModal').modal('show');
            clearClientBrowser();
        })
        .catch(function (error) {
            console.error("Error during session expiry request:", error);
        });
}

function clearClientBrowser() {
    delete_cookie('c2Vzc2lvbklk');
    delete_cookie('requestId');
    delete_cookie('user');
    delete_cookie('menuList');
    delete_cookie('loginExpire');
    localStorage.removeItem("onBehalfRedirectUrl");
    localStorage.removeItem("onBehalfEmail");
    localStorage.removeItem("onBehalf");
    localStorage.removeItem("userDetailandFamilyTree");
    localStorage.removeItem("email");
    localStorage.removeItem("onBehalfUserDetailandFamilyTree");
    localStorage.removeItem("mobile");
    localStorage.removeItem("onBehalfCheck");
    $(".pathfndr").addClass("hide");
}

function getUrlParameter(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    let regexS = "[\\?&]" + name + "=([^&#]*)";
    let regex = new RegExp(regexS);
    let results = regex.exec(decodeURIComponent(window.location.href));
    if (results == null)
        return "";
    else
        return results[1];
}

function getGACampaignCodesnew() {
    let utmz = readCookie('__utmz'); //using a cookie reading function
    let vals = (function () {
        let pairs = utmz.split('.').slice(4).join('.');
        pairs = pairs.replace(/\|/g, '&');
        return pairs;
    })();
    return vals;
}

createApp({
    setup() {
        const temp = ref("tcLoginSignup");
        const loginNumber = ref("");
        const agentUserId = ref("");
        const agentPassword = ref("");
        const agentPin = ref("");
        const agentOTP = ref("");
        const loginMode = ref("");
        const isUserLoggedIn = ref(false);
        const onbehalfEmailId = ref("");
        const showOtpMaxAttemptCross = ref(false);

        const countdown = ref(0);
        const timer = ref(null);
        const showResendOtp = ref(false);
        const showLoginErrorMsg = ref(false);
        const loginErrorMsg = ref("");
        const randomString = ref('');
        const verifyRegisterHeaderEmailResponse = ref("");
        const otpDigits = ref(['', '', '', '', '', '']);
        const otp = computed(() => otpDigits.value.join(''));
        const loggedInUserFirstName = ref("");
        const onBehalfOption = ref("");
        logOutTimer = ref("");
        const isUserAgent = ref(false);
        const isDisabled = ref(false);
        const onBehalf = ref(localStorage.getItem('onBehalf'));

        async function sendOtp(loginType) {
            loginErrorMsg.value = "";
            showLoginErrorMsg.value = false;
            let sendOtpUrl = axiosUrlLogin + 'sendOTP/revamp/' + loginNumber.value;
            if (loginType === "Agent") {
                sendOtpUrl = axiosUrlLogin + 'sendOTP/revamp/' + agentUserId.value;
            }
            const apiObj = {
                "method": "get",
                "url": sendOtpUrl
            }
            const api = createApiInstance();
            const response = await doAxios(apiObj).then(function (response) {
                // This is your callback function handling the response
                showResendOtp.value = false;
                const resp = response.data;
                if (resp.text == "blocked") {
                    showOtpMaxAttemptCross.value = true;
                } else {
                    if (loginType != "Agent") {
                        startCountdown(60);
                    }
                    showOtpMaxAttemptCross.value = false;
                }
                // You can perform further processing here
            }).catch(function (error) {
                console.error('Error:', error);
            });
        }

        function startCountdown(seconds) {
            countdown.value = seconds;
            isDisabled.value = true;

            if (timer.value) {
                clearInterval(timer.value);
            }

            timer.value = setInterval(() => {
                if (countdown.value > 0) {
                    countdown.value--;
                } else {
                    showResendOtp.value = true;
                    clearInterval(timer.value);
                    isDisabled.value = false;
                }
            }, 1000);
        }

        async function getRandomString() {
            try {
                const response = await doAxios({
                    method: "get",
                    url: axiosUrlLogin + 'savePass'
                });
                randomString.value = response.data.text;
            } catch (err) {
                console.error("Error:", err);
            }
        }

        async function verifyUserDetails(userId, loginType) {
            try {
                let rString = randomString.value;
                let iterationCount = 1000;
                let keySize = 128;
                let iv = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text2
                let salt = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text1
                let aesUtil = new AesUtil(keySize, iterationCount);
                let actualUserJson = {
                    "userId": userId, //Need to keep dynamic for Agent login
                    "mobileNo": null
                };
                let ciphertext = aesUtil.encrypt(salt, iv, rString, JSON.stringify(actualUserJson));//text3
                let decrptedVal = aesUtil.decrypt(salt, iv, randomString.value, ciphertext);
                let createUserJson = { "text": salt + "." + iv + "." + ciphertext };
                const verifyUserResponseRawData = await doAxios({
                    method: "post",
                    data: createUserJson,
                    headers: { "Content-Type": "application/json" },
                    url: axiosUrlLogin + `verifyUser`
                });
                return verifyUserResponseRawData;
            } catch (err) {
                console.error("verifyUserDetails Error:", err);
            }
        }

        async function validateLogin(loginType) {
            loginMode.value = loginType;
            loginErrorMsg.value = "";
            showLoginErrorMsg.value = false;
            // isUserLoggedIn.value = true;
            let userId = loginType == "customer" ? loginNumber.value : agentUserId.value;
            await procceedLogin(userId, loginType);
            if (!verifyRegisterHeaderEmailResponse.value.activeSession) {
                if (randomString.value === '') {
                    await getRandomString();
                } else if (randomString !== '') {
                    //                    let testValidate = validateLoginPopUpForm();
                    //                    if (testValidate) {
                    validateCredential(userId, loginType);
                    //                    }
                }
            }
        }

        async function procceedLogin(userId, loginType) {
            // Await getRandomString
            await getRandomString();
            if (randomString.value !== '') {
                const verifyUserResponse = await verifyUserDetails(userId, loginType);
                const verifyUserResponseData = verifyUserResponse.data;
                if (verifyUserResponseData.status === 'true') {
                    // process response
                    const array = verifyUserResponseData.randomData.split(".");
                    const salt = array[0];
                    const iv = array[1];
                    const ciphertext = array[2];
                    const aesUtil = new AesUtil(128, 1000);
                    const mainText = aesUtil.decrypt(salt, iv, randomString.value, ciphertext);
                    verifyRegisterHeaderEmailResponse.value = JSON.parse(mainText);
                    if (verifyRegisterHeaderEmailResponse.value.accountType === 'TC') {
                        if (verifyRegisterHeaderEmailResponse.value.activeSession) {
                            if (confirm('Multiple sessions found, Click Ok to logout from all existing sessions and continue with this session. Click Cancel to continue without login')) {
                                const inValResp = await invalidateUserSession();
                                if (randomString.value !== '') {
                                    //                                    let testValidate = validateLoginPopUpForm();
                                    //                                    if (testValidate) {
                                    validateCredential(userId, loginType);
                                    //                                    }
                                }
                            } else {
                                return false; // user canceled
                            }
                        }
                        return true; // login process succeeded
                    }
                } else {
                    isUserLoggedIn.value = false;
                }
            } else {
                isUserLoggedIn.value = false;
            }
            return false; // fallback if conditions not met
        }

        async function validateCredential(userId, loginType) {
            let password = agentPassword.value;//Now password is empty for customer
            let iterationCount = 1000;
            let keySize = 128;
            let iv = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text2
            let salt = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text1
            let aesUtil = new AesUtil(keySize, iterationCount);
            let ciphertext = aesUtil.encrypt(salt, iv, randomString.value, password);//text3
            let otpradio = loginType == "customer" ? true : false;
            let passwordradio = loginType == "agent" ? true : false;
            let pin = agentPin.value;
            let finalOtp = loginType == "customer" ? otp.value : agentOTP.value;

            let createUserJson = {
                "userId": userId, "text1": salt, "text2": iv, "text3": ciphertext, "otp": finalOtp, "otpcheck": otpradio,
                "passwordcheck": passwordradio, "pin": pin
            };

            try {
                const validateUserRawData = await doAxios({
                    method: "post",
                    data: createUserJson,
                    headers: { "Content-Type": "application/json" },
                    url: axiosUrlLogin + `verifyCrediential`
                });
                const validateCredData = validateUserRawData.data;
                localStorage.setItem("userDetailandFamilyTree", JSON.stringify(validateCredData));
                if (validateCredData.message !== 'false') {
                    // window.location.href = window.location.href.split("sessionExpireLogin")[0];
                    isUserLoggedIn.value = true;
                    logedIn();
                    if (loginType == "agent") {
                        localStorage.setItem("onBehalf", "false");
                        showOnBehalfLogin();
                        // if (getCookie("loginExpire")) {
                        //     startLogoutCountdown();
                        // }
                    } else {
                        // window.location.reload();
                        loginSuccessModal();

                    }
                } else {
                    loginErrorMsg.value = validateCredData.reasonOfMessage;
                    showLoginErrorMsg.value = true;
                    showResendOtp.value = true;
                    isUserLoggedIn.value = false;
                    //Show error Message : Reason

                }
            } catch (error) {
                console.error("validateCredential Error: ", error);
            } finally {
                otpDigits.value = ['', '', '', '', '', ''];
                agentPassword.value = "";
                agentPin.value = "";
                agentOTP.value = "";
            }
        }

        // ---------- Agent Login Click ----------
        function showOnBehalfLogin() {
            //e.preventDefault();
            //if (!validateAgentForm()) return;
            $(".agent_loginInfo").hide();
            $(".behalf_loginInfo").show();
        }

        async function onBehalfContinue() {
            onBehalfOption.value = 'onbehalf';
            var departmentId = JSON.parse(localStorage.getItem('userDetailandFamilyTree')) ? JSON.parse(localStorage.getItem('userDetailandFamilyTree')).userDetail.departmentId : "";
            if (departmentId === 'Ebiz Staff' || departmentId === 'Ebiz call center' || departmentId === 'Non Ebiz shop' || departmentId === "GCP" || departmentId === "TA" || departmentId === "TBA" || departmentId === "HBA" || departmentId === "PSA") {
                localStorage.removeItem("onBehalfUserDetailandFamilyTree");
                await userEmailVerify();
                localStorage.setItem("onBehalfEmail", onbehalfEmailId.value);
                localStorage.setItem("email", onbehalfEmailId.value);
                localStorage.removeItem("onBehalf");
                localStorage.setItem("onBehalf", "true");
                localStorage.setItem("onBehalfCheck", true);
                // window.location.href = localStorage.getItem("onBehalfRedirectUrl");
                // window.location.reload();
                loginSuccessModal();
            } else {
                alert("You are not authorized to login on behalf of customer.");
                clearClientBrowserForLogout();
            }
        }

        function loginSuccessModal() {
            $(".agent_loginInfo").hide();
            $(".behalf_loginInfo").hide();
            $(".customer-login").hide();
            $(".submit_successfully").show();
            setTimeout(function () {
                $('#agentLoginModal').modal('hide');
                $('.customerLoginModal').modal('hide');
                window.location.reload();
            }, 4000);
        }

        async function userEmailVerify() {
            await getRandomString();
            if (randomString.value !== '') {
                let iterationCount = 1000;
                let keySize = 128;
                let iv = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text2
                let salt = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text1
                let aesUtil = new AesUtil(keySize, iterationCount);
                let ciphertext = aesUtil.encrypt(salt, iv, randomString.value, onbehalfEmailId.value);//text3
                var createUserJson = { "text": salt + "." + iv + "." + ciphertext };
                const res = await doAxios({
                    method: "post",
                    data: createUserJson,
                    headers: { "Content-Type": "application/json" },
                    url: axiosUrlLogin + `verifyData`
                });
                if (res.data.status === 'true') {
                    let array = res.data.randomData.split(".");
                    let iterationCount = 1000;
                    let keySize = 128;
                    let iv = array[1];
                    let salt = array[0];
                    let aesUtil = new AesUtil(keySize, iterationCount);
                    let mainText = aesUtil.decrypt(salt, iv, randomString.value, array[2]);//text3
                    localStorage.setItem("onBehalfUserDetailandFamilyTree", mainText);
                    // var onbehalf = localStorage.getItem("onBehalf");
                    // if (onbehalf === "true" || onbehalf == true) {
                    //     $(".pathfndr").removeClass("hide");
                    // } else {
                    //     $(".pathfndr").addClass("hide");
                    // }
                }
            }
        }

        async function invalidateUserSession() {
            let iterationCount = 1000;
            let keySize = 128;
            let iv = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text2
            let salt = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);//text1
            let aesUtil = new AesUtil(keySize, iterationCount);
            let userId = loginMode.value == "customer" ? loginNumber.value : agentUserId.value;
            let ciphertext = aesUtil.encrypt(salt, iv, randomString.value, userId);//text3
            let createUserJson = { "text": salt + "." + iv + "." + ciphertext };

            const invalidateUserRawData = await doAxios({
                method: "post",
                data: createUserJson,
                headers: { "Content-Type": "application/json" },
                url: axiosUrlLogin + `invalidateUserSession`
            });
            const invalidateUserResponse = invalidateUserRawData.data;
            isUserLoggedIn.value = false;
            return invalidateUserResponse;
        }

        function logedIn() {
            // $('.btn_login').hide();
            // $('.after_login').show();
            headerNameDisplay();
            // $("#loginProfilePic").attr("src", JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.profilePicUrl);
            localStorage.setItem("customerType", "Customer");
            // callHeaderPopup();
            $(".login_travellerCard").hide();
            setTimeout(function () {
                if (getCookie("loginExpire")) {
                    startLogoutCountdown();
                } else {
                }
            }, 3000);
        }

        function headerNameDisplay() {
            let loginDisplayName;
            let tempDisplay;
            if(localStorage.getItem("userDetailandFamilyTree")) {
                if (JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.fname !== undefined && JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.fname !== null) {
                    tempDisplay = JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.fname;
                    loginDisplayName = JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.fname;
                } else {
                    tempDisplay = JSON.parse(localStorage.getItem("userDetailandFamilyTree")).userDetail.userId;
                    if (tempDisplay.length < 10) {
                        loginDisplayName = tempDisplay;
                    } else {
                        loginDisplayName = tempDisplay.substring(0, 9) + "....";
                    }
                }
                loggedInUserFirstName.value = loginDisplayName;
            }
        }

        async function logout() {
            //            $("#LoginLogoutToggel").text("Login");
            try {
                const logoutResponseRaw = await doAxios({
                    method: "get",
                    url: axiosUrlLogin + 'logoutUser'
                });
                const logoutResponse = logoutResponseRaw.data;
                if (logoutResponse.message == "true") {
                    delete_cookie('c2Vzc2lvbklk');
                    delete_cookie('requestId');
                    delete_cookie('loginExpire');
                    isUserLoggedIn.value = false;
                    loggedInUserFirstName.value = "";
                    clearClientBrowserForLogout();
                    $(".login_travellerCard").show();
                    window.location.reload();
                } else {
                    //Do Validation
                }

            } catch (err) {
                console.error("Error:", err);
            }
        }

        async function verifyUserRole() {
            const verifyUserRoleRes = await doAxios({
                method: "post",
                data: { "userId": agentUserId.value },
                headers: { "Content-Type": "application/json" },
                url: axiosUrlLogin + `verifyUserIdRole`
            });
            if (verifyUserRoleRes.data.status == "Success" && verifyUserRoleRes.data.randomData == "Agent") {
                isUserAgent.value = true;
                sendOtp("Agent");
            } else {
                isUserAgent.value = false;
            }
        }

        function clearClientBrowserForLogout() {
            delete_cookie('c2Vzc2lvbklk');
            delete_cookie('requestId');
            delete_cookie('user');
            delete_cookie('menuList');
            delete_cookie('loginExpire');
            localStorage.removeItem("onBehalfRedirectUrl");
            localStorage.removeItem("onBehalfEmail");
            localStorage.removeItem("onBehalf");
            localStorage.removeItem("userDetailandFamilyTree");
            localStorage.removeItem("email");
            localStorage.removeItem("onBehalfUserDetailandFamilyTree");
            localStorage.removeItem("mobile");
            localStorage.removeItem("onBehalfCheck");
            $(".pathfndr").addClass("hide");
        }

        function editNumber() {
            $(".login_section").show();
            $(".otp_section").hide();

        }

        function detectDeviceType() {
            const screenWidth = window.innerWidth;
            const html = document.documentElement;
            if (screenWidth < 767) {
                html.classList.add("mobile-device");
                sessionStorage.setItem("deviceType", "Mobile");
            } else {
                html.classList.add("desktop-device");
                sessionStorage.setItem("deviceType", "Desktop");
            }
        }

        onMounted(() => {
            detectDeviceType();
            let session = getCookie("user");
            if (!(session === null || session === "" || session === undefined || session === 'null')) {
                isUserLoggedIn.value = true;
                logedIn();
            }
            loginMode.value = localStorage.getItem("onBehalf") != undefined && localStorage.getItem("onBehalf") == 'true' ? "agent" : "customer";
        });

        return {
            temp,
            loginNumber,
            sendOtp,
            timer,
            countdown,
            showResendOtp,
            showLoginErrorMsg,
            loginErrorMsg,
            validateLogin,
            loginMode,
            otpDigits,
            otp,
            loggedInUserFirstName,
            logout,
            agentUserId,
            agentPin,
            agentOTP,
            agentPassword,
            isUserLoggedIn,
            onBehalfContinue,
            onbehalfEmailId,
            logOutTimer,
            isUserAgent,
            verifyUserRole,
            showOtpMaxAttemptCross,
            editNumber,
            onBehalf,
        };
    },
}).mount("#header-revamp");


// TDP Login Code Start
$(document).ready(function () {
    let session = getCookie("user");
    if (!(session === null || session === "" || session === undefined || session === 'null')) {
        $(".login_travellerCard").hide();
    }

    if (localStorage.getItem("customerEmail")) {
        $("#guest-user-email").val(localStorage.getItem("customerEmail"));
        $(".btn-continue-guest").prop("disabled", false);
    }
    if (localStorage.getItem("customerMobileNo")) {
        $(".customer_email").val(localStorage.getItem("customerMobileNo"));
        $("#sendOtp").prop("disabled", false);
    }

    $(".btn-continue-guest").on('click', function () {
        $(".login_wrpr").hide();
        $(".after_login").show();

        localStorage.setItem("onBehalf", "false");
        localStorage.setItem("customerType", "Guest");
        localStorage.setItem("guestEmailId", $("#guest-user-email").val());

        setTimeout(() => {
            $(".login_travellerCard.card_login").slideUp(() => {
                hasLoginCardClosed = true;
                $('body').css('overflow', '');
            });
            removeBackdrop();
        }, 2000);
    });
});
// TDP Login Code End

// Currency Format Code 
function formatCurrency(amount) {
    return new Intl.NumberFormat('en-IN', {
        style: 'currency',
        currency: 'INR',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
    }).format(amount);
}