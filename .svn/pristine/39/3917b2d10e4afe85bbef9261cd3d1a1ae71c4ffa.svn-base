// ====================================
// Agent Login Flow (With Behalf Login)
// ====================================
$(document).ready(function () {
    const $agentLogin = $(".agent_login");

    const $email = $agentLogin.find(".agent_email");
    const $password = $agentLogin.find(".agent_password");
    const $pin = $agentLogin.find(".agent_pin");
    const $behalfEmail = $agentLogin.find(".onbehalf_email");

    const $btnPasswordToggle = $agentLogin.find(".password_hideShow");
    const $btnAgentLogin = $agentLogin.find(".btn_agentLogin");
    const $btnBehalfLogin = $agentLogin.find(".btn_behalfLogin");

    const $agentLoginInfo = $agentLogin.find(".agent_loginInfo");
    const $behalfLoginInfo = $agentLogin.find(".behalf_loginInfo");
    const $successBlock = $agentLogin.find(".submit_successfully");
    const $passwordError = $password.siblings(".error");

    let closeTimer = null;
    let agentLoginSucceeded = false;
    let agentTimerInterval = null;

    // ---------- Update Header ----------
    function updateLoginUI() {
        const isCustomer = localStorage.getItem('isLoggedIn') === 'true';
        const isAgent = localStorage.getItem('isAgentLoggedIn') === 'true';

        if (isCustomer || isAgent) {
            //$('.header .before_login').hide();
            //$('.header .after_login').show();
        } else {
            //$('.header .before_login').show();
            //$('.header .after_login').hide();
        }

        // Agent timer only visible if agent is logged in
        //if (isAgent) {
        //    $('.header .agent_logoutTime').show();
        //} else {
        //    $('.header .agent_logoutTime').hide();
        //}
    }
    updateLoginUI();

    // ---------- Initial State ----------
    $successBlock.hide();
    $behalfLoginInfo.hide();
    $btnPasswordToggle.prop("disabled", true);
    $btnAgentLogin.prop("disabled", true);
    $btnBehalfLogin.prop("disabled", true);
    $passwordError.hide();

    // ---------- Validation ----------
  /*  function validateEmail(email) { return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email); }*/
	function validateEmailOrUsername(value) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;     
    const usernameRegex = /^[a-zA-Z0-9._-]{3,}$/;         
    return emailRegex.test(value) || usernameRegex.test(value);
}
    function validatePassword(pass) { return pass.length >= 6; }
    function validatePin(pin) { return /^\d{6}$/.test(pin); }

   /* function validateAgentForm() {
        let isValid = true;

        if (!validateEmail($email.val().trim())) isValid = false;

        if (!validatePassword($password.val().trim())) {
            isValid = false;
            if ($password.val().trim() !== "") $passwordError.show();
            else $passwordError.hide();
        } else $passwordError.hide();

        if (!validatePin($pin.val().trim())) isValid = false;

        $btnAgentLogin.prop("disabled", !isValid);
        return isValid;
    }*/
	
function validateAgentForm() {
    let isValid = true;

    if (!validateEmailOrUsername($email.val().trim())) isValid = false;

    if (!validatePassword($password.val().trim())) {
        isValid = false;
        if ($password.val().trim() !== "") $passwordError.show();
        else $passwordError.hide();
    } else $passwordError.hide();

    if (!validatePin($pin.val().trim())) isValid = false;

    $btnAgentLogin.prop("disabled", !isValid);
    return isValid;
}

    function validateBehalfForm() {
        const val = $behalfEmail.val().trim();
        const isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val);
        $btnBehalfLogin.prop("disabled", !isValidEmail);
        return isValidEmail;
    }

    // ---------- Input Events ----------
    $password.on("input", function () {
        $btnPasswordToggle.prop("disabled", $(this).val().length === 0);
        validateAgentForm();
    });
    $email.on("input blur", validateAgentForm);
    $pin.on("input blur", validateAgentForm);
    $behalfEmail.on("input blur", validateBehalfForm);

    // ---------- Password Toggle ----------
    $btnPasswordToggle.on("click", function (e) {
        e.preventDefault();
        const type = $password.attr("type") === "password" ? "text" : "password";
        $password.attr("type", type);

        const $img = $(this).find("img");
        let src = $img.attr("src");
        src = type === "password" ? src.replace("eye.svg", "eye-off.svg") : src.replace("eye-off.svg", "eye.svg");
        $img.attr("src", src);
    });

    // ---------- Agent Login Click ----------
//    $btnAgentLogin.on("click", function (e) {
//        e.preventDefault();
//        if (!validateAgentForm()) return;
//
//        const formData = {
//            email: $email.val().trim(),
//            password: $password.val().trim(),
//            pin: $pin.val().trim()
//        };
//        localStorage.setItem("agentLoginData", JSON.stringify(formData));
//
//        $agentLoginInfo.hide();
//        $behalfLoginInfo.show();
//    });

    // ---------- Behalf Login Click ----------
//    $btnBehalfLogin.on("click", function (e) {
//        e.preventDefault();
//        if (!validateBehalfForm()) return;
//
//        $behalfLoginInfo.hide();
//        $successBlock.show();
//
//        agentLoginSucceeded = true;
//
//        // Set logout timestamp for 60s
//        localStorage.setItem('agentLogoutAt', Date.now() + 60000);
//
//        closeTimer = setTimeout(() => {
//            const modalEl = $agentLogin.closest(".modal");
//            if (modalEl.length) {
//                const modalInstance = bootstrap.Modal.getInstance(modalEl[0]);
//                if (modalInstance) modalInstance.hide();
//            }
//        }, 2000);
//    });

    // ---------- On Modal Hide ----------
    $agentLogin.closest(".modal").on("hidden.bs.modal", function () {
        if (agentLoginSucceeded) {
            localStorage.setItem("isAgentLoggedIn", "true");
            updateLoginUI();
            // startAgentTimerFromStorage();
            agentLoginSucceeded = false;
        }
        if (closeTimer) { clearTimeout(closeTimer); closeTimer = null; }
    });

    // ---------- Agent Timer with localStorage ----------
    function startAgentTimerFromStorage() {
        const $timerSpan = $('.header .timer_logout');
        $timerSpan.show();

        if (agentTimerInterval) clearInterval(agentTimerInterval);

        agentTimerInterval = setInterval(() => {
            const logoutAt = parseInt(localStorage.getItem('agentLogoutAt'), 10);
            if (!logoutAt) return;

            const now = Date.now();
            let remaining = Math.floor((logoutAt - now) / 1000);

            if (remaining <= 0) {
                clearInterval(agentTimerInterval);
                localStorage.removeItem("isAgentLoggedIn");
                localStorage.removeItem("agentLoginData");
                localStorage.removeItem("agentLogoutAt");
                updateLoginUI();
                location.reload();
            } else {
                const minutes = Math.floor(remaining / 60);
                const seconds = remaining % 60;
                $timerSpan.text(`${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`);
            }
        }, 1000);
    }

    // ---------- Call on page load ----------
    if (localStorage.getItem('agentLogoutAt')) {
        // startAgentTimerFromStorage();
    }

    // ---------- Log Out ----------
    $(".header .btn_logout").on("click", function (e) {
        e.preventDefault();
        localStorage.removeItem("isAgentLoggedIn");
        localStorage.removeItem("agentLoginData");
        localStorage.removeItem("agentLogoutAt");
        updateLoginUI();
        // location.reload();
    });

    // ---------- Autofill from localStorage ----------
    const savedData = localStorage.getItem("agentLoginData");
    if (savedData) {
        const data = JSON.parse(savedData);
        if (data.email) $email.val(data.email);
        if (data.password) $password.val(data.password);
        if (data.pin) $pin.val(data.pin);
        validateAgentForm();
    }




    $(function () {
  $(".otp_section").hide();

  $("#sendOtp").click(function (e) {
    e.preventDefault();
    $(".login_section").toggle();
    $(".otp_section").toggle();
  });

  $(".otp_section .cb_top a").click(function (e) {
    e.preventDefault();
    $(".login_section").toggle();
    $(".otp_section").toggle();
  });
});



$(document).ready(function () {
    const $popup = $('.login_popup');

    // ------------------------------
    // Step Switcher Logic
    // ------------------------------
    let i = 0;
    const $blocks = $popup.find('.login_cntr');
    $blocks.hide().css('opacity', 1);
    $blocks.eq(0).css('display', 'flex').show();

    $popup.find('.btn_primary').click(function () {
        if (i < $blocks.length - 1) {
            $blocks.eq(i).fadeOut(300, function () {
                i++;
                $blocks.eq(i).css('display', 'flex').fadeIn(300);
            });
        }
    });

    // ------------------------------
    // Phone/Email Input Logic
    // ------------------------------
    $('.phoneEmail_field').each(function () {
        const $field = $(this);
        const $input = $field.find('input.form-control');

        // Find button in the same login_cntr block
        const $stepBlock = $field.closest('.login_cntr');
        const $btn = $stepBlock.find('.btn_primary');

        $input.removeClass('phone_number').removeAttr('style').unwrap('.iti');
        let itiInitialized = false;

        function validateEmail(v) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim());
        }

        function validatePhone(v) {
            return /^\d{10}$/.test(v.trim());
        }

        function checkValid() {
            const val = $input.val().trim();
            const valid = $input.hasClass('phone_number') ? validatePhone(val) : validateEmail(val);
            $btn.prop('disabled', !valid);
        }

        $input.on('input', function () {
            let val = $input.val();
            const cursor = $input[0].selectionStart;

            if (val.length === 1) {
                if (/^\d$/.test(val)) {
                    $input.addClass('phone_number');
                    if (!itiInitialized) {
                        $input.intlTelInput({ initialCountry: "in", separateDialCode: true });
                        itiInitialized = true;
                        $input.focus()[0].setSelectionRange(cursor, cursor);
                    }
                } else {
                    $input.removeClass('phone_number');
                    if (itiInitialized) {
                        $input.intlTelInput("destroy");
                        itiInitialized = false;
                    }
                    $input.removeAttr("style");
                    if ($input.parent().hasClass('iti')) $input.unwrap();
                    $input.focus()[0].setSelectionRange(cursor, cursor);
                }
            }

            if ($input.hasClass('phone_number')) {
                val = val.replace(/\D/g, '').slice(0, 10);
                $input.val(val);
            }

            checkValid();
        });

        checkValid();
    });

    // ------------------------------
    // OTP Input Autofocus & Validation
    // ------------------------------
    $popup.find('.otp_fill').each(function () {
        const $otpContainer = $(this);
        const $inputs = $otpContainer.find('input');
        const $stepBlock = $otpContainer.closest('.login_cntr');
        const $btn = $stepBlock.find('.btn_primary');

        function checkOTPComplete() {
            let allFilled = true;
            $inputs.each(function () {
                const val = $(this).val().trim();
                if (val.length !== 1 || !/^\d$/.test(val)) {
                    allFilled = false;
                    return false;
                }
            });
            $btn.prop('disabled', !allFilled);
        }

        $inputs.on('input', function () {
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 1);
            if (this.value.length === 1) {
                $(this).next('input').focus();
            }
            checkOTPComplete();
        });

        $inputs.on('paste', function (e) {
            e.preventDefault();
            const paste = (e.originalEvent.clipboardData || window.clipboardData).getData('text').replace(/\D/g, '');
            $inputs.each(function (i) {
                $(this).val(paste[i] || '');
            });
            checkOTPComplete();
        });

        checkOTPComplete();
    });
});
});