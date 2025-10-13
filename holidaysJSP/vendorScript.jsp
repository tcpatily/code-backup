<style>
    .fixed_btn a,
    .fixed_btn button,
    .fixed_btn .option,
    .fixed_btn .toggle-btn,
    .fixed_btn .tacy-container,
    .fixed_btn img {
        cursor: pointer;
    }

    .request-call-model button.close {
        border: none;
        background: transparent;
    }

    .input_inr {
        position: relative;
        margin-bottom: 15px;
    }

    .input_label,
    .select_label {
        position: absolute;
        top: -10px;
        left: 12px;
        background: #fff;
        padding: 0 5px;
        font-size: 12px;
    }

    .error-message {
        font-size: 13px;
        margin-top: 2px;
    }

    .after_submission {
        text-align: center;
        padding: 20px;
    }

    .gif_blck img {
        width: 80px;
    }

    /*  */
    .request-call-model .left_block h2 {
        line-height: 133%;
        color: var(--color-white);
    }

    .request-call-model .left_block h6 {
        font-weight: 400;
        color: var(--color-white);
        margin-top: 20px;
    }

    .request-call-model .modal-content {
        width: 488px;
        /* padding: 40px 32px; */
        border-radius: 20px;
        border: 1px solid var(--Gray-Mode-100);
        background: var(--color-white);
        margin-left: auto;
    }

    .request-call-model .card_form h4 {
        color: var(--Gray-Mode-950);
        font-family: var(--font-primary);
    }

    .request-call-model .card_form .row {
        /* row-gap: 20px; */
    }

    .request-call-model .card_form .select_product {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .request-call-model .card_form .select_product .checkbox {
        display: flex;
        align-items: center;
        gap: 20px;
        padding-bottom: 15px;
    }

    .request-call-model .card_form .select_product .input_inr label {
        font: normal normal 400 12px / 16px var(--font-primary);
        color: var(--Gray-Mode-950);
        letter-spacing: 0.06px;
    }

    .request-call-model .card_form .select_product .form-check {
        padding: 0;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 8px;
        min-height: 1px;
    }

    .request-call-model .card_form .select_product .form-check-input {
        width: 20px;
        height: 20px;
        border: 1px solid var(--Gray-Mode-400);
        background-color: transparent;
        margin: 0;
    }

    .request-call-model .card_form .select_product .form-check-input:checked {
        background-image: url(/images/tcHolidays/check-circle.svg);
        background-size: 8px;
    }

    .request-call-model .card_form .select_product .form-check-input:checked {
        border-color: var(--color-primary);
    }

    .request-call-model .card_form .select_product .form-check-label {
        font: normal normal 500 14px/20px var(--font-primary);
        color: var(--Gray-Mode-950);
        letter-spacing: 0.035px;
    }

    .request-call-model .card_form .btn {
        width: 100%;
        margin-top: 8px;
    }

    @media only screen and (min-width: 1200px) and (max-width: 1439px) {
        .request-call-model {
            padding: 52px 0;
        }

        .request-call-model .left_block h6 {
            margin-top: 12px;
        }

        .request-call-model .modal-content {
            width: 450px;
            /* padding: 32px 25px; */
            border-radius: 16px;
        }

        .request-call-model .card_form .row {
            /* row-gap: 16px; */
        }

        .request-call-model .card_form .btn {
            font: normal normal 400 16px / 24px var(--font-primary);
            padding: 10px 18px;
            margin-top: 2px;
        }

        .request-call-model .card_form .btn img {
            width: 18px;
        }
    }

    @media only screen and (max-width: 767px) {
        .request-call-model {
            margin: 0;
            background-image: url(/images/tcHolidays/holidaysLP/TravelConsultation/cta-form-bg-mobile.png);
            padding: 32px 0;
            clip-path: unset;
            overflow: unset;
        }

        .request-call-model::before {
            border-radius: 0;
        }

        .request-call-model .modal-body {
            padding: 0;
        }

        .request-call-model .modal-content {
            width: 100%;
        }

        .request-call-model .row {
            /* row-gap: 24px; */
        }

        .request-call-model .left_block h2 {
            font: normal normal 600 24px / 133% var(--font-heading);
            text-align: center;
        }

        .request-call-model .left_block h2 br {
            display: none;
        }

        .request-call-model .left_block h6 {
            margin-top: 8px;
            font: normal normal 400 10px / 160% var(--font-primary);
            letter-spacing: 0.1px;
            text-align: center;
        }

        .request-call-model .card_form {
            width: 100%;
            padding: 20px 16px;
            border-radius: 16px;
        }

        .request-call-model .card_form .row {
            /* row-gap: 20px; */
        }

        .request-call-model .card_form .btn {
            font: normal normal 400 16px/24px var(--font-primary);
            letter-spacing: 0.024px;
            margin-top: 0;
            padding: 10px 18px;
        }

        .request-call-model .card_form .btn img {
            width: 20px;
        }
    }

    .request-call-model .after_submission h5 {
        color: var(--Gray-Mode-950);
        text-align: center;
        font-weight: 500;
        line-height: 32px;
        letter-spacing: 0.02px;
        max-width: 78%;
        margin: -24px auto 0;
    }

    .request-call-model .after_submission .gif_blck {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .request-call-model .after_submission .gif_blck img {
        width: 280px;
        height: auto;
    }


    /* ? */
    .chat-widget .options a {
        text-decoration: none;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 5px;
    }

    .input-error {
        border: 1px solid red !important;
    }

    .hide {
        display: none;
    }

    .clickToCallSuccessMessageShow {
        position: absolute;
        top: 0;
        right: 0px;
        background-color: #ffffff;
    }

    .clickToCallSuccessMessageShow-text {
        position: absolute;
        bottom: 104px;
        padding: 15px;
        font-size: 15px;
    }
</style>
<!------Fixed Button------->
<div class="fixed_btn">
    <div class="chat-widget">
        <div class="options">
            <div class="option">
                <a href="tel:1800-209-9100" target="_blank">
                    <button class="btn icon">
                        <img src="/images/tcHolidays/audio-call.svg" alt="">
                    </button>
                    <span>Talk to an Expert</span>
                </a>
            </div>
            <div class="option" data-bs-toggle="modal" data-bs-target="#talk_to_expert">
                <button class="btn icon">
                    <img src="/images/tcHolidays/call-back.svg" alt="">
                </button>
                <span>Request a Call Back</span>
                </a>
            </div>
            <div class="option">
                <a href="https://jump.saleassist.ai/jump/603817fc-d7ba-4274-ad3c-1472942e607a" target="_blank">
                    <button class="btn icon">
                        <img src="/images/tcHolidays/video-chat.svg" alt="">
                    </button>
                    <span>Live Video Call</span>
                </a>
            </div>
            <div class="option" onclick="openPopup()">
                <div class="btn icon tacy-container">
                    <img src="/images/tcHolidays/ai-icon.svg" alt="">
                </div>
                <span>I am Tacy, Your AI Travel Assistant</span>
            </div>
        </div>

        <!-- Toggle button -->
        <div class="toggle-btn">
            <img src="/images/tcHolidays/contact-icon.svg" alt="">
        </div>
    </div>

    <button class="btn back_toTop"><img src="/images/tcHolidays/chevron-up-double.svg" alt=""></button>
</div>

<div id="popupContainer"
    style="display: none; position: fixed; top: 0px; left: 0px; width: 100%; height: 279px; background: white; box-shadow: rgba(0, 0, 0, 0.3) -3px 0px 10px; z-index: 1000; overflow: hidden; box-sizing: border-box;">
    <!-- Minimize Button -->
    <button class="minimize-btn" onclick="minimizePopup()"
        style="position: absolute; top: 10px; right: 20px; border: none; padding: 8px; display: flex; justify-content: center; align-items: center; gap: 10px; border-radius: 5px; background: #0044a3; z-index: 1001; cursor: pointer; transition: background-color 0.2s ease;">
        <div style="width: 24px; height: 24px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M18 6L6 18" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                </path>
                <path d="M6 6L18 18" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                </path>
            </svg>
        </div>
    </button>

    <!-- Chat iframe -->
    <iframe id="popupIframe" src="" allow="microphone"
        sandbox="allow-same-origin allow-scripts allow-forms allow-popups allow-presentation"
        style="width: 100%; height: 279px; border: none; display: block; box-sizing: border-box;"></iframe>
</div>

<!-- Modal -->
<div class="modal fade request-call-model" id="talk_to_expert" tabindex="-1" aria-labelledby="talktoexpert"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="talktoexpert">Fill in the form and get best deals</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
                            <path d="M1 14.996L15 1M1 1L15 14.996" stroke="#444444" stroke-width="1.5"
                                stroke-linecap="round"></path>
                        </svg>
                    </span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <div class="card_form global_form" id="requestCallApp">
                    <div class="row" v-if="!showSuccessMessage">
                        <!-- Name -->
                        <div class="col-12">
                            <div class="input_inr">
                                <input type="text" v-model="name" class="form-control" @input="nameError = ''"
                                    placeholder="">
                                <label class="input_label">Enter Name</label>
                            </div>
                            <p v-if="nameError" class="text-danger error-message">{{ nameError }}</p>
                        </div>

                        <!-- Phone -->
                        <div class="col-12">
                            <div class="input_inr">
                                <input type="number" v-model="phoneNumber" class="form-control phone_number"
                                    placeholder="">
                                <label class="input_label">Mobile No.</label>
                            </div>
                            <p v-if="phoneNumberError" class="text-danger error-message">{{ phoneNumberError }}</p>
                        </div>

                        <!-- Email -->
                        <div class="col-12">
                            <div class="input_inr">
                                <span class="icon">
                                    <img src="/images/tcHolidays/email-icon.svg" alt="">
                                </span>
                                <input type="email" class="form-control" v-model="emailId" @input="emailError = ''"
                                    placeholder="">
                                <label class="input_label">Enter Mail ID</label>
                            </div>
                            <p v-if="emailError" class="text-danger error-message">{{ emailError }}</p>
                        </div>

                        <!-- Product Type -->
                        <div class="col-12">
                            <div class="select_product">
                                <div class="input_inr">
                                    <label>Select Product Type</label>
                                </div>
                                <div class="checkbox">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="Domestic1"
                                            v-model="selectedProduct" name="selectProduct" id="domestic1">
                                        <label class="form-check-label" for="domestic1">Domestic</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="International1"
                                            v-model="selectedProduct" name="selectProduct" id="international1">
                                        <label class="form-check-label" for="international1">International</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Destination Dropdown -->
                        <div class="col-12">
                            <div class="input_inr">
                                <div class="select_wrapper" :class="{ filled: selectedDestination !== '' }">

                                    <!-- Domestic -->
                                    <select class="form-select" v-if="selectedProduct === 'Domestic1'"
                                        v-model="selectedDestination">
                                     <option disabled value="">Select Destination</option>
                                                    <option>Andaman</option>
                                                    <option>Kerala</option>
                                                    <option>Himachal Pradesh</option>
                                                    <option>Jammu & Kashmir</option>
                                                    <option>Ladakh</option>
													<option>Rajasthan</option>
													<option>Sri Lanka</option>
													<option>Nepal</option>
													<option>Bhutan</option>
													<option>North East</option>
													<option>Kumbh Mela</option>
													<option>Char Dham</option>
													<option>Gujarat</option>
													<option>Uttarakhand</option>
													<option>Goa</option>
													<option>Others</option>
                                    </select>

                                    <!-- International -->
                                    <select class="form-select" v-else v-model="selectedDestination">
                                          <option disabled value="">Select Destination</option>
                                                    <option>Europe</option>
                                                    <option>Asia</option>
                                                    <option>Australia & New Zealand</option>
                                                    <option>Japan & Korea</option>
													<option>Africa</option>
													<option>America</option>
													<option>Dubai</option>
													<option>Maldives</option>
													<option>Singapore</option>
													<option>Thailand</option>
													<option>Vietnam & Cambodia</option>
													<option>Indonesia</option>
													<option>Mauritius</option>
													<option>Azerbaijan</option>
													<option>South America</option>
													<option>Others</option>
                                    </select>

                                    <label class="select_label">Select Destination</label>
                                </div>
                            </div>
                        </div>

                        <!-- Terms -->
                        <div class="col-12">
                            <div class="input_inr">
                                <div class="terms_conditions">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" v-model="termCheckbox"
                                            id="termsConditions1">
                                        <label class="form-check-label" for="termsConditions1">
                                            I accept the <a href="">Privacy Policy</a> and authorize Thomas Cook and
                                            Group of Companies to contact me with details.
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <p v-if="termError" class="text-danger error-message">{{ termError }}</p>
                        </div>

                        <!-- Submit -->
                        <div class="col-12">
                            <button class="btn btn_primary" @click="leadFormSubmit()">
                                Get a Callback <img src="/images/tcHolidays/arrow-narrow-up-right.svg" alt="">
                            </button>
                        </div>
                    </div>

                    <!-- After Submission -->
                    <div class="after_submission" v-if="showSuccessMessage">
                        <button class="btn btn_close" @click="showSuccessMessage = false">
                            <img src="/images/tcHolidays/x-close.svg" alt="">
                        </button>
                        <div class="gif_blck">
                            <img src="/images/tcHolidays/successful.gif" alt="">
                        </div>
                        <h5>Thank you for your interest in our holiday package. Our expert will contact you shortly</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ChatBoat HTML Start from here -->
<!-- <div class="chatBoatSectionNew hide">
    <div class="chatBoatNewUI">
        <button id="chatButton" onclick="openPopup()" class="tacy-container"><img src="/images/chatBoatNewUI.png"
                alt="TACY CHATBOT" class="TACY CHATBOT" />
            <span class="chatBoatNewUISmallText">Tacy</span>
            <span class="chatBoatNewUIText showDataTasy">Your AI Holiday Booking Assistant</span>
        </button>


    </div>
</div> -->
<!-- <script src="https://static.saleassist.ai/widgets/widget.js"></script>
<script>saleassist.mountWidget({ id: "603817fc-d7ba-4274-ad3c-1472942e607a" });</script> -->
<script>
    $(document).ready(function () {
        var path = window.location.pathname;
        if (
            path === "/" ||
            path === "/home" ||
            path.includes("/holidays/india-tour-packages") ||
            path.includes("/holidays/international-tour-packages")
        ) {
            $(".chatBoatSectionNew").removeClass('hide');
        }

        let isVisible = false;

        // Show/Hide fixed button on scroll
        $(window).on("scroll", function () {
            if ($(this).scrollTop() > 100) {
                if (!isVisible) {
                    $(".fixed_btn").css("display", "flex").hide().slideDown(300);
                    isVisible = true;
                }
            } else {
                if (isVisible) {
                    $(".fixed_btn").slideUp(300, function () {
                        $(this).css("display", "none");
                    });
                    isVisible = false;
                }
            }
        });

        // Toggle chat widget


        // Back to Top
        $(".back_toTop").on("click", function () {
            $("html, body").animate({ scrollTop: 0 }, 500);
        });
    });
</script>

<script>
    // Handle dynamic viewport height for mobile browsers
    function setViewportHeight() {
        const vh = window.innerHeight * 0.01;
        document.documentElement.style.setProperty('--vh', `${vh}px`);

        // Update popup container and iframe heights
        const popup = document.getElementById('popupContainer');
        const iframe = document.getElementById('popupIframe');

        if (popup && iframe) {
            const actualHeight = window.innerHeight + 'px';
            popup.style.height = actualHeight;
            iframe.style.height = actualHeight;
        }
    }

    // Set initial viewport height
    setViewportHeight();

    // Update viewport height on resize and orientation change
    window.addEventListener('resize', () => {
        setTimeout(setViewportHeight, 100);
    });

    window.addEventListener('orientationchange', () => {
        setTimeout(setViewportHeight, 300);
    });

    // iOS-specific viewport handling
    if (/iPad|iPhone|iPod/.test(navigator.userAgent)) {
        // Handle iOS Safari viewport issues
        const popup = document.getElementById('popupContainer');
        const iframe = document.getElementById('popupIframe');

        if (popup && iframe) {
            popup.style.height = '-webkit-fill-available';
            iframe.style.height = '-webkit-fill-available';
        }

        window.addEventListener('resize', () => {
            setTimeout(setViewportHeight, 300);
        });

        // Handle iOS keyboard appearance
        window.addEventListener('focusin', () => {
            setTimeout(setViewportHeight, 300);
        });

        window.addEventListener('focusout', () => {
            setTimeout(setViewportHeight, 300);
        });
    }

    // Android-specific handling
    if (/Android/.test(navigator.userAgent)) {
        window.addEventListener('resize', () => {
            setTimeout(() => {
                const popup = document.getElementById('popupContainer');
                const iframe = document.getElementById('popupIframe');

                if (popup && iframe && popup.style.display === 'block') {
                    const actualHeight = window.innerHeight + 'px';
                    popup.style.height = actualHeight;
                    iframe.style.height = actualHeight;
                }
            }, 100);
        });
    }

    function openPopup() {
        const iframeSrc = `https://travbridge.atirath.com/`;
        const popup = document.getElementById("popupContainer");
        const iframe = document.getElementById("popupIframe");
        const button = document.getElementById("chatButton");
        const body = document.body;
        const minimizeBtn = document.querySelector('.minimize-btn');

        iframe.src = iframeSrc;
        popup.style.display = "block";
        button.style.opacity = "0";

        // Prevent body scroll and fix position
        body.style.overflow = "hidden";
        body.style.position = "fixed";
        body.style.width = "100%";
        body.style.height = "100%";

        // Mobile-specific adjustments
        if (window.innerWidth <= 768) {
            button.style.bottom = "15px";
            button.style.right = "15px";
            button.style.padding = "12px 18px";

            minimizeBtn.style.top = "8px";
            minimizeBtn.style.right = "15px";
            minimizeBtn.style.padding = "10px";

            // Handle safe area insets for notch devices
            if (CSS.supports('padding-top: env(safe-area-inset-top)')) {
                popup.style.paddingTop = 'env(safe-area-inset-top)';
                popup.style.paddingBottom = 'env(safe-area-inset-bottom)';
                popup.style.paddingLeft = 'env(safe-area-inset-left)';
                popup.style.paddingRight = 'env(safe-area-inset-right)';

                minimizeBtn.style.top = 'calc(8px + env(safe-area-inset-top))';
                minimizeBtn.style.right = 'calc(15px + env(safe-area-inset-right))';
            }
        }

        setTimeout(() => {
            button.style.display = "none";
        }, 300);

        // Set proper heights after opening
        setTimeout(() => {
            setViewportHeight();
            const actualHeight = window.innerHeight + 'px';
            popup.style.height = actualHeight;
            iframe.style.height = actualHeight;
        }, 100);

        // Push state for back button handling
        history.pushState({ popup: true }, null, window.location.pathname);
    }

    function minimizePopup() {
        const popup = document.getElementById("popupContainer");
        const button = document.getElementById("chatButton");
        const body = document.body;
        const iframe = document.getElementById("popupIframe");

        popup.style.display = "none";

        // Re-enable body scroll
        body.style.overflow = "";
        body.style.position = "";
        body.style.width = "";
        body.style.height = "";

        setTimeout(() => {
            button.style.display = "block";
            button.style.opacity = "1";
        }, 300);

        // Clear iframe src to stop any ongoing processes
        setTimeout(() => {
            iframe.src = "";
        }, 500);
    }

    // Handle minimize button hover effects
    const minimizeBtn = document.querySelector('.minimize-btn');
    if (minimizeBtn) {
        minimizeBtn.addEventListener('mouseenter', function () {
            this.style.backgroundColor = '#003380';
        });

        minimizeBtn.addEventListener('mouseleave', function () {
            this.style.backgroundColor = '#0044a3';
        });

        minimizeBtn.addEventListener('mousedown', function () {
            this.style.backgroundColor = '#002266';
        });

        minimizeBtn.addEventListener('mouseup', function () {
            this.style.backgroundColor = '#003380';
        });
    }

    // Prevent zoom on iOS when touching inputs
    document.addEventListener('touchstart', (e) => {
        if (e.touches.length > 1) {
            e.preventDefault();
        }
    }, { passive: false });

    let lastTouchEnd = 0;
    document.addEventListener('touchend', (e) => {
        const now = (new Date()).getTime();
        if (now - lastTouchEnd <= 300) {
            e.preventDefault();
        }
        lastTouchEnd = now;
    }, false);

    // Allow iframe scrolling on touch devices
    document.addEventListener('touchmove', () => { }, { passive: true });

    // Enhanced message handling for cross-origin communication
    window.addEventListener("message", (event) => {
        // Verify origin for security
        const allowedOrigins = ['https://travbridge.atirath.com'];
        if (!allowedOrigins.some(origin => event.origin.includes(origin))) {
            return;
        }

        if (event.data === "getParentDomain") {
            const hostname = window.location.hostname;
            const parts = hostname.split(".");
            const domain = parts.slice(-2).join(".");
            const subdomain = parts.length > 2 ? parts.slice(0, -2).join(".") : parts.length === 2 ? parts[0] : "none";

            event.source.postMessage({
                type: "parentDomainInfo",
                domain,
                subdomain,
                viewport: {
                    width: window.innerWidth,
                    height: window.innerHeight
                }
            }, event.origin);
        }

        // Handle iframe resize requests
        if (event.data && event.data.type === "resize") {
            setViewportHeight();
        }

        // Handle close requests from iframe
        if (event.data && event.data.type === "close") {
            minimizePopup();
        }
    });

    // Handle back button on Android
    window.addEventListener('popstate', (e) => {
        const popup = document.getElementById("popupContainer");
        if (popup && popup.style.display === "block") {
            minimizePopup();
            history.pushState(null, null, window.location.pathname);
        }
    });

    // Additional viewport updates for better mobile handling
    window.addEventListener('load', () => {
        setTimeout(setViewportHeight, 500);
    });

    // Handle screen rotation
    window.addEventListener('orientationchange', () => {
        setTimeout(() => {
            setViewportHeight();
            const popup = document.getElementById('popupContainer');
            const iframe = document.getElementById('popupIframe');

            if (popup && iframe && popup.style.display === 'block') {
                const actualHeight = window.innerHeight + 'px';
                popup.style.height = actualHeight;
                iframe.style.height = actualHeight;
            }
        }, 500);
    });

    // Visual viewport API support for better mobile handling
    if (window.visualViewport) {
        window.visualViewport.addEventListener('resize', () => {
            setTimeout(() => {
                const popup = document.getElementById('popupContainer');
                const iframe = document.getElementById('popupIframe');

                if (popup && iframe && popup.style.display === 'block') {
                    const actualHeight = window.visualViewport.height + 'px';
                    popup.style.height = actualHeight;
                    iframe.style.height = actualHeight;
                }
            }, 100);
        });
    }
</script>
<!-- ChatBoath js code Ends from here -->

<script type="text/javascript" src="https://d1wrgmw2jqph3l.cloudfront.net/web-translate/on-the-fly.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        new VitraOnTheFly({
            api_key: "vitra.JYl4yyMmYyiGx3qxIzbbvRYC4oRw20",
            glossaryId: "7263b8ed-4805-45da-8490-f18373906cdb",
            position: "center-right",
            theme: "dark",
        });
    });


    function clicktoCalldestinationOnHoliday() {
        var a = "";
        a = "DOM" === $("#holidayType").val() ? '<option value="">Select Holidays</option><option value="Kashmir">Kashmir</option><option value="Ladakh">Ladakh</option><option value="North East">North East</option><option value="Himachal">Himachal</option><option value="Goa">Goa</option><option value="Andaman">Andaman</option><option value="Kerela">Kerela</option><option value="Sri Lanka">Sri Lanka</option><option value="Bhutan">Bhutan</option><option value="Rajasthan">Rajasthan</option><option value="Nepal">Nepal</option><option value="Gujrat">Gujrat</option><option value="Uttaranchal">Uttaranchal</option><option value="Tibet">Tibet</option><option value="Maldives">Maldives</option><option value="Others">Other</option>' : '<option value="">Select Holidays</option><option value="Europe">Europe</option><option value="Americas">Americas</option><option value="Africa">Africa</option><option value="Aus/NZ">Aus/NZ</option><option value="South America">South America</option><option value="Asia">Asia</option><option value="Thailand">Thailand</option><option value="Dubai">Dubai</option><option value="Singapore">Singapore</option><option value="Malaysia">Malaysia</option><option value="Mauritius">Mauritius</option><option value="Turkey">Turkey</option><option value="Bali">Bali</option><option value="Hongkong/Macau">Hongkong/Macau</option><option value="Others">Other</option>',
            $("#selectDestination").empty().append(a)
    }

    function showSuccessMessage() {
        document.getElementById("successMsg").classList.remove("hide");
    }
</script>
<script>
    document.querySelector(".talk_to_submit").addEventListener("click", function (e) {
        e.preventDefault();

        let name = document.getElementById("talk_to_name");
        let email = document.getElementById("talk_to_email");
        let number = document.getElementById("talk_to_number");
        let isValid = true;

        // reset previous errors
        name.classList.remove("input-error");
        email.classList.remove("input-error");
        number.classList.remove("input-error");

        // Name check
        if (name.value.trim() === "") {
            name.classList.add("input-error");
            isValid = false;
        }

        // Email check
        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email.value)) {
            email.classList.add("input-error");
            isValid = false;
        }

        // Number check (basic: 10 digits)
        let numberPattern = /^\d{10}$/;
        if (!numberPattern.test(number.value)) {
            number.classList.add("input-error");
            isValid = false;
        }

        if (isValid) {
            document.querySelector(".clickToCallErrosMessageShow").classList.add("hide");
            document.querySelector(".clickToCallSuccessMessageShow").classList.remove("hide");
        } else {
            document.querySelector(".clickToCallSuccessMessageShow").classList.add("hide");
            document.querySelector(".clickToCallErrosMessageShow").classList.remove("hide");
        }

    });

</script>

<script>
    createApp({
        setup() {
            const name = Vue.ref("");
            const phoneNumber = Vue.ref("");
            const emailId = Vue.ref("");
            const selectedProduct = Vue.ref("Domestic1");
            const selectedDestination = Vue.ref("");
            const termCheckbox = Vue.ref(false);

            const nameError = Vue.ref("");
            const phoneNumberError = Vue.ref("");
            const emailError = Vue.ref("");
            const termError = Vue.ref("");
            const showSuccessMessage = Vue.ref(false);

            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const phoneNumberRegex = /^\d{10}$/;
            const nameRegex = /^[A-Za-z\s]+$/;

            const resetForm = () => {
                name.value = "";
                phoneNumber.value = "";
                emailId.value = "";
                selectedProduct.value = "Domestic1";
                selectedDestination.value = "";
                termCheckbox.value = false;
                nameError.value = "";
                phoneNumberError.value = "";
                emailError.value = "";
                termError.value = "";
            };

            const validateForm = () => {
                let isValid = true;
                nameError.value = phoneNumberError.value = emailError.value = termError.value = "";

                if (!name.value.trim()) {
                    nameError.value = "Name is required.";
                    isValid = false;
                } else if (!nameRegex.test(name.value.trim())) {
                    nameError.value = "Name should not contain numbers or special characters.";
                    isValid = false;
                }

                if (!String(phoneNumber.value).trim()) {
                    phoneNumberError.value = "Mobile No. is required.";
                    isValid = false;
                } else if (!phoneNumberRegex.test(String(phoneNumber.value))) {
                    phoneNumberError.value = "Please enter a valid 10-digit mobile number.";
                    isValid = false;
                }

                if (!emailId.value.trim()) {
                    emailError.value = "Email ID is required.";
                    isValid = false;
                } else if (!emailRegex.test(emailId.value)) {
                    emailError.value = "Please enter a valid email ID.";
                    isValid = false;
                }

                if (!termCheckbox.value) {
                    termError.value = "Please accept the terms and conditions.";
                    isValid = false;
                }

                return isValid;
            };

            const leadFormSubmit = () => {
                if (!validateForm()) return;

                const leadFormData = {
                    firstName: name.value,
                    email: emailId.value,
                    mobile: phoneNumber.value,
                    city: selectedDestination.value,
                    pkgSubType:
                        selectedProduct.value === "Domestic1"
                            ? "1"
                            : selectedProduct.value === "International1"
                                ? "3"
                                : "",
                };

                console.log("Lead Form Data:", leadFormData);

                setTimeout(() => {
                    showSuccessMessage.value = true;
                    resetForm();
                }, 500);
            };

            return {
                name,
                phoneNumber,
                emailId,
                selectedProduct,
                selectedDestination,
                termCheckbox,
                nameError,
                phoneNumberError,
                emailError,
                termError,
                showSuccessMessage,
                leadFormSubmit,
            };
        },
    }).mount("#requestCallApp");

</script>