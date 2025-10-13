// --------------------------------
//This is a common CSS, if you have already used it then remove it. (Start)
// --------------------------------

// ---------------------------
// Custom Select Dropdown
// ---------------------------
$(document).ready(function () {
    // $('.select_dropdown').each(function () {
    //     var $this = $(this);
    //     var $wrapper = $this.closest('.select_wrapper');
    //     var $options = $this.find('option');

    //     $this.addClass('hide-select');

    //     // ✅ Conditionally add readonly
    //     var isStateSelect = $this.hasClass('select_state');
    //     var readonlyAttr = isStateSelect ? '' : 'readonly';
    //     $this.after(`<input type="text" class="custom_select" autocomplete="off" ${readonlyAttr}>`);

    //     var $customSelect = $this.next('.custom_select');
    //     var $optionList = $('<ul class="select_options" />').insertAfter($customSelect);

    //     $options.each(function () {
    //         var $opt = $(this);
    //         if (!$opt.prop('hidden')) {
    //             var listItem = $('<li />', {
    //                 'data-val': $opt.val(),
    //                 class: $opt.prop('disabled') ? 'disabled' : ''
    //             });

    //             var optionHTML = $opt.html();
    //             listItem.html(optionHTML);
    //             $optionList.append(listItem);
    //         }
    //     });

    //     var $optionItems = $optionList.find('li');

    //     // ✅ Toggle dropdown on wrapper click
    //     $wrapper.on('click', function (e) {
    //         e.stopPropagation();

    //         var isActive = $customSelect.hasClass('active');

    //         // Close all others
    //         $('.custom_select').removeClass('active')
    //             .next('.select_options').slideUp();
    //         $('.select_wrapper').removeClass('active');

    //         if (!isActive) {
    //             // Open this one
    //             $customSelect.addClass('active').next('.select_options').slideDown();
    //             $wrapper.addClass('active');
    //             $customSelect.trigger('focus');
    //         }
    //     });

    //     // ✅ Search only for select_state
    //     if (isStateSelect) {
    //         $customSelect.on('keyup', function () {
    //             var searchTerm = $(this).val().toLowerCase();
    //             $optionItems.each(function () {
    //                 $(this).toggle($(this).text().toLowerCase().includes(searchTerm));
    //             });
    //         });
    //     }

    //     $optionItems.on('click', function (e) {
    //         e.stopPropagation();
    //         if ($(this).hasClass('disabled')) return;

    //         var value = $(this).data('val');
    //         var labelText = $(this).clone().children().remove().end().text().replace(/\s+/g, ' ').trim();

    //         $customSelect.val(labelText);
    //         $this.val(value).trigger('change');
    //         $optionList.slideUp();

    //         $wrapper.addClass('filled').removeClass('active');
    //         $customSelect.removeClass('active');
    //     });

    //     // ✅ Close dropdown if clicking outside
    //     $(document).on('mousedown', function (e) {
    //         if (!$(e.target).closest('.select_wrapper').length || ($(e.target).is('input, select') && !$(e.target).hasClass('custom_select'))) {
    //             $('.custom_select').removeClass('active');
    //             $('.select_options').slideUp();
    //             $('.select_wrapper').removeClass('active');
    //         }
    //     });

    //     // ✅ Set value if already selected on load
    //     if ($this.val()) {
    //         $wrapper.addClass('filled');
    //         var selectedOption = $this.find('option:selected');
    //         var selectedText = selectedOption.clone().children().remove().end().text().replace(/\s+/g, ' ').trim();
    //         $customSelect.val(selectedText);
    //     }
    // });
});

// ---------------------------
// Country Code Selection Plugin (intlTelInput)
// ---------------------------
$(document).ready(function () {
    $(".phone_number").intlTelInput({
        initialCountry: "in",
        separateDialCode: true,
    });
});

// ---------------------------
// Tooltip Js
// ---------------------------
$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});
// --------------------------------
//This is a common JS, if you have already used it then remove it. (End)
// --------------------------------

// ---------------------------
// Reusable multi-instance date picker for .dob_input + .singleDate-calendar blocks with independent logic
// ---------------------------
function initSingleDateCalendars($scope = $(document)) {
    const today = new Date();
    const months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ];
    const shortMonths = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    function formatDate(date) {
        const day = String(date.getDate()).padStart(2, '0');
        const month = shortMonths[date.getMonth()];
        const year = date.getFullYear();
        return `${day} ${month}, ${year}`;
    }

    $scope.find('.single-calender').each(function () {
        const $block = $(this);
        if ($block.data("initialized")) return; // Prevent duplicate init
        $block.data("initialized", true);

        const calendarType = $block.find('.calender_input').data('calendartype');
        let selectedDate = new Date();
        let currentMonth = today.getMonth();
        let currentYear = today.getFullYear();

        const $calendar = $block.find('.singleDate-calendar');
        const $input = $block.find('.calender_input');
        const $monthSelect = $calendar.find('.month-select');
        const $yearSelect = $calendar.find('.year-select');
        const $datesContainer = $calendar.find('.calendar-dates');

        function isDateDisabled(date) {
            if (calendarType === 'dob' || calendarType === 'issue') {
                return date > today; // disable future dates
            } else if (calendarType === 'expiry' || calendarType === 'travel') {
                return date < today; // disable past dates
            }
            return false;
        }

        function populateMonthYear() {
            $monthSelect.empty();
            months.forEach((m, i) => {
                $monthSelect.append(`<option value="${i}" ${i === currentMonth ? 'selected' : ''}>${m}</option>`);
            });

            let startYear, endYear;
            if (calendarType === 'dob' || calendarType === 'issue') {
                startYear = today.getFullYear() - 100;
                endYear = today.getFullYear();
            } else if (calendarType === 'expiry' || calendarType === 'travel') {
                startYear = today.getFullYear();
                endYear = today.getFullYear() + 50;
            } else {
                startYear = today.getFullYear() - 100;
                endYear = today.getFullYear() + 50;
            }

            $yearSelect.empty();
            for (let y = endYear; y >= startYear; y--) {
                $yearSelect.append(`<option value="${y}" ${y === currentYear ? 'selected' : ''}>${y}</option>`);
            }
        }

        function renderCalendar(month, year) {
            $datesContainer.empty();

            const firstDay = new Date(year, month, 1).getDay();
            const start = (firstDay + 6) % 7;
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const prevMonthDays = new Date(year, month, 0).getDate();

            for (let i = start - 1; i >= 0; i--) {
                const day = prevMonthDays - i;
                const prevDate = new Date(year, month - 1, day);
                const disabled = isDateDisabled(prevDate);
                $datesContainer.append(`<span class="other-month ${disabled ? 'disabled' : ''}" data-date="${prevDate}">${day}</span>`);
            }

            for (let d = 1; d <= daysInMonth; d++) {
                const thisDate = new Date(year, month, d);
                const disabled = isDateDisabled(thisDate);
                const isSelected = selectedDate.toDateString() === thisDate.toDateString();
                $datesContainer.append(`<span class="${disabled ? 'disabled' : ''} ${isSelected ? 'selected' : ''}" data-date="${thisDate}">${d}</span>`);
            }

            const totalDisplayed = start + daysInMonth;
            const remaining = 42 - totalDisplayed;
            for (let i = 1; i <= remaining; i++) {
                const nextDate = new Date(year, month + 1, i);
                const disabled = isDateDisabled(nextDate);
                $datesContainer.append(`<span class="other-month ${disabled ? 'disabled' : ''}" data-date="${nextDate}">${i}</span>`);
            }
        }

        // Backdrop helpers
        function addCalendarBackdrop($calendar) {
            if (!$calendar.next('.custom-backdrop').length) {
                const $backdrop = $('<div class="custom-backdrop fade"></div>');
                $calendar.after($backdrop);
                $('body').css('overflow', 'hidden');
                setTimeout(() => $backdrop.addClass('show'), 10);
            }
        }

        function removeCalendarBackdrop($calendar) {
            const $backdrop = $calendar.next('.custom-backdrop');
            if ($backdrop.length) {
                $backdrop.removeClass('show');
                $('body').css('overflow', '');
                setTimeout(() => $backdrop.remove(), 150);
            }
        }

        // Input click toggle
        $input.on('click', function (e) {
            e.stopPropagation();
            if ($calendar.is(':visible')) {
                $calendar.slideUp(300);
                if (window.innerWidth < 768) {
                    removeCalendarBackdrop($calendar);
                }
            } else {
                $('.singleDate-calendar').not($calendar).slideUp(300).each(function () {
                    removeCalendarBackdrop($(this));
                });
                $calendar.stop(true, true).slideDown(300);

                if (window.innerWidth < 768) {
                    addCalendarBackdrop($calendar);
                }
            }
        });

        // Month/Year change
        $monthSelect.on('change', function () {
            currentMonth = parseInt($(this).val());
            renderCalendar(currentMonth, currentYear);
        });
        $yearSelect.on('change', function () {
            currentYear = parseInt($(this).val());
            renderCalendar(currentMonth, currentYear);
        });

        // Date select
        $datesContainer.on('click', 'span[data-date]:not(.disabled)', function () {
            const clickedDate = new Date($(this).attr('data-date'));
            selectedDate = clickedDate;
            $input.val(formatDate(clickedDate));
            $calendar.slideUp(200);
            renderCalendar(currentMonth, currentYear);
            removeCalendarBackdrop($calendar);

            const $childCard = $calendar.closest('.child_card');
            if ($childCard.length) {
                const $childWrapper = $childCard.closest('.childage_wrpr');
                $childWrapper.hide();
                $childWrapper.closest(".input_withDropdown").removeClass("open");
            }
        });

        // Init
        populateMonthYear();
        renderCalendar(currentMonth, currentYear);
    });
}

// Run on page load
$(function () {
    initSingleDateCalendars();

    // Click outside
    $(document).on('mousedown', function (e) {
        const $target = $(e.target);
        if (
            !$target.closest('.single-calender').length ||
            (!$target.hasClass('calender_input') && !$target.closest('.singleDate-calendar').length)
        ) {
            $('.singleDate-calendar').slideUp(300).each(function () {
                const $cal = $(this);
                const $backdrop = $cal.next('.custom-backdrop');
                if ($backdrop.length) {
                    $backdrop.removeClass('show');
                    $('body').css('overflow', '');
                    setTimeout(() => $backdrop.remove(), 150);
                }
            });
        }
    });

    // Close button inside calendar
    $(document).on('click', '.btn_closeCalander', function () {
        const $calendar = $(this).closest('.singleDate-calendar');
        $calendar.slideUp(300);
        const $backdrop = $calendar.next('.custom-backdrop');
        if ($backdrop.length) {
            $backdrop.removeClass('show');
            $('body').css('overflow', '');
            setTimeout(() => $backdrop.remove(), 150);
        }
    });
});

// ===============================
// Promo Code Apply/Remove Logic
// ===============================
jQuery(document).ready(function () {
    const $input = jQuery('.promotional_offers .entrpromo_code input');
    const $clearBtn = jQuery('.btn_clear');

    // On clicking Apply/Remove button
    jQuery('.promotional_offers .coupon_crd .btn').on('click', function () {
        const $btn = jQuery(this);
        const $card = $btn.closest('.coupon_crd');
        const couponCode = $card.find('.cc_top span').text().trim();

        if ($card.hasClass('applied')) {
            // Remove coupon
            $card.removeClass('applied');
            $btn.text('Apply');
            $input.val('').trigger('input');
        } else {
            // Remove applied from all cards
            jQuery('.promotional_offers .coupon_crd').removeClass('applied')
                .find('.btn').text('Apply');

            // Apply this coupon
            $card.addClass('applied');
            $btn.text('Remove');
            $input.val(couponCode).trigger('input');
        }
    });

    // Input change: toggle clear button and remove applied class if empty
    $input.on('input', function () {
        const val = $input.val().trim();
        if (val !== "") {
            $clearBtn.show();
        } else {
            $clearBtn.hide();
            // Also remove any applied coupons
            jQuery('.promotional_offers .coupon_crd').removeClass('applied')
                .find('.btn').text('Apply');
        }
    });

    // Clear input
    $clearBtn.on('click', function () {
        $input.val('').trigger('input');
    });

    // Initial setup
    if ($input.val().trim() === "") {
        $clearBtn.hide();
    }
});

// -------------------------------------
// Promo Codes: View More/Less Toggle
// -------------------------------------

jQuery(function () {
    jQuery('.promo_codes').each(function () {
        var $parent = jQuery(this);
        var $btn = $parent.find('.btn_viewMore');
        var $hiddenCoupons = $parent.find('.coupon_crd:not(:first)');

        // Initially hide all except the first
        $hiddenCoupons.hide();

        $btn.on('click', function () {
            var isActive = $btn.hasClass('active');

            if (isActive) {
                // Hide (Slide Up)
                $hiddenCoupons.hide();
                $btn.removeClass('active')
                    .contents().filter(function () {
                        return this.nodeType === 3;
                    }).first().replaceWith('View More ');
            } else {
                // Show (Slide Down)
                $hiddenCoupons.show();
                $btn.addClass('active')
                    .contents().filter(function () {
                        return this.nodeType === 3;
                    }).first().replaceWith('View Less ');
            }
        });
    });
});

$(document).ready(function () {
    function isDesktop() {
        return window.innerWidth >= 768;
    }
    $('.points_withTooltip, .viewTcs_block, .calculation_mobile').on('click', '.btn_tooltip', function (e) {
        if (!isDesktop()) {
            e.stopPropagation();
            const $tooltip = $(this).closest('.points_withTooltip, .viewTcs_block, .calculation_mobile').find('.custom_tooltip');
            $('.custom_tooltip').not($tooltip).removeClass('show');
            $tooltip.toggleClass('show');
        }
    });
    if (isDesktop()) {
        $('.points_withTooltip .btn_tooltip, .viewTcs_block .btn_tooltip, .calculation_mobile .btn_tooltip').hover(
            function () {
                $(this).closest('.points_withTooltip, .viewTcs_block, calculation_mobile').find('.custom_tooltip').addClass('show');
            },
            function () {
                $(this).closest('.points_withTooltip, .viewTcs_block, calculation_mobile').find('.custom_tooltip').removeClass('show');
            }
        );
    }
    $(document).on('click', function () {
        if (!isDesktop()) {
            $('.custom_tooltip').removeClass('show');
        }
    });
});

// Fare Details: Toggle Fare Wrapper Section
// -------------------------------------------
jQuery(document).ready(function () {
    jQuery(".price_offers .btn_fareBreakup").on("click", function () {
        var $btn = jQuery(this);

        if ($btn.hasClass("active")) {
            // Agar active hai to close karo
            jQuery(".fare_container").slideUp(300);
            $btn.removeClass("active");
        } else {
            // Agar active nahi hai to open karo
            jQuery(".fare_container").slideDown(300);
            $btn.addClass("active");
        }
    });
});

jQuery(document).ready(function ($) {
    // Function to format number in Indian style
    function formatIndianNumber(num) {
        num = num.replace(/,/g, ''); // Remove existing commas
        if (isNaN(num) || num === '') return '';
        return num.replace(/\B(?=(\d{3})+(?!\d))/g, ",") // Standard commas
            .replace(/(\d+)(?=(\d{2})+\d{3}\b)/g, "$1,"); // Indian style
    }

    // Loop through each .amount_utilized section
    $('.amount_utilized').each(function () {
        const $section = $(this);
        const $amountInput = $section.find('input[type="text"]');
        const $applyBtn = $section.find('.btn_amountApply');
        const $checkedIcon = $section.find('.checked');
        const $editBtn = $section.find('.btn_amountEdit');
        const $tcsCalculator = $section.find('.tcs_calculator');

        // Hide check icon & edit button initially
        $checkedIcon.hide();
        $editBtn.hide();
        $tcsCalculator.hide();

        // Format on input & enable/disable Apply button
        $amountInput.on('input', function () {
            let rawVal = $(this).val().replace(/,/g, '');
            if (!isNaN(rawVal) && rawVal.length > 0) {
                $(this).val(formatIndianNumber(rawVal));
                $applyBtn.prop('disabled', false);
            } else {
                $applyBtn.prop('disabled', true);
                $checkedIcon.hide();
                $editBtn.hide();
            }
        });

        // On Apply click → show check icon & edit button, disable Apply
        $applyBtn.on('click', function (e) {
            e.preventDefault();

            $checkedIcon.stop(true, true).show();
            $tcsCalculator.stop(true, true).show();

            if ($(window).width() <= 768 && $(this).closest('.tcsDeclaration_wrpr').length) {
                $editBtn.stop(true, true).show();
                $applyBtn.hide();
            } else {
                $editBtn.stop(true, true).show();
                $applyBtn.prop('disabled', true);
            }
        });


        // On Edit click → focus input, enable Apply, hide check icon
        $editBtn.on('click', function (e) {
            e.preventDefault();
            $amountInput.val('');
            $editBtn.hide();
            $amountInput.focus();
            $applyBtn.prop('disabled', false).show();
            $checkedIcon.hide();
            $tcsCalculator.hide();
        });

    });
});

jQuery(document).ready(function ($) {
    $('.tcsDeclaration_wrpr').each(function () {
        const $wrapper = $(this);
        const $checkboxes = $wrapper.find('input[type="checkbox"]');
        const $continueBtn = $wrapper.find('.btn_tcsDeclaration');

        function toggleContinueButton() {
            const allChecked = $checkboxes.length === $checkboxes.filter(':checked').length;
            $continueBtn.prop('disabled', !allChecked);
        }

        // Checkbox change → toggle button
        $checkboxes.on('change', toggleContinueButton);

        // Continue click → close only its accordion & scroll
        $continueBtn.on('click', function (e) {
            e.preventDefault();

            const $accordionItem = $(this).closest('.accordion-item');
            const $collapse = $accordionItem.find('.accordion-collapse');

            // Close only this accordion
            $collapse.collapse('hide');

            // Smooth scroll to fixed_payStrip
            $('html, body').animate({
                scrollTop: $('#fixed_payStrip').offset().top
            }, 600);
        });

        // Initial check
        toggleContinueButton();
    });
});

// ===============================
// GST Form Toggle and Validation
// ===============================
jQuery(function () {
    // Initial hide
    jQuery('.GSTnumber, .GSTdetails').hide();

    // Checkbox show/hide GST form
    jQuery('#GSTforBooking').on('change', function () {
        if (jQuery(this).is(':checked')) {
            jQuery('.GSTnumber').slideDown();
        } else {
            jQuery('.GSTnumber, .GSTdetails').slideUp();
            jQuery('.GSTnumber .btn').text('Verify').prop('disabled', true); // reset button
            jQuery('.GSTnumber input').val(''); // reset input
        }
    });

    // Enable button on valid GSTIN input
    jQuery('.GSTnumber input').on('input', function () {
        const gstin = jQuery(this).val().trim();
        if (gstin.length === 15) {
            jQuery('.GSTnumber .btn').prop('disabled', false);
        } else {
            jQuery('.GSTnumber .btn').prop('disabled', true).text('Verify');
        }
    });

    // Button click: show GST details, change button text
    jQuery('.GSTnumber .btn').on('click', function (e) {
        e.preventDefault();
        jQuery(this).text('Verified').addClass('verified');
        jQuery('.GSTdetails').slideDown();
    });
});

jQuery(document).ready(function ($) {
     $('.promotionalOffers_modal').each(function () {
         const $modal = $(this);
         const $inputField = $modal.find('.top_input .form-control');
         const $clearBtn = $modal.find('.top_input .btn_clearCoupon');
         const $couponCards = $modal.find('.coupon_card');
         // ✅ On load: show clear button & select matching card if code exists
         const initialCode = $inputField.val().trim().toUpperCase();
         toggleClearButton(initialCode);
         if (initialCode) {
             matchCode(initialCode);
         }

         // Coupon Apply Button
         $modal.find('.coupon_codes').on('click', '.btn_apply', function () {
             const $card = $(this).closest('.coupon_card');
             selectCard($card);
         });

         // Clear Button
         $clearBtn.on('click', function () {
             $inputField.val('');
             $couponCards.removeClass('selected');
             toggleClearButton('');
             $inputField.trigger('focus');
         });

         // Typing in Input Field
         $inputField.on('input', function () {
             const typedCode = $(this).val().trim().toUpperCase();
             toggleClearButton(typedCode);
             matchCode(typedCode);
         });

          // Apply Button in Footer
          $modal.find('.btn_promoApply').on('click', function () {
              const selectedCode = $inputField.val().trim();
              updateMainPromoState(selectedCode);
              $modal.modal('hide');
          });

    //     // Select Card Helper
         function selectCard($card) {
             $couponCards.removeClass('selected');
             $card.addClass('selected');

             const couponCode = $card.data('code') || $card.find('.top_blck span').first().text().trim();
             $inputField.val(couponCode);
             toggleClearButton(couponCode);

             // Auto-scroll into view
             $card[0].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
         }

         // Match Code Helper
         function matchCode(code) {
             $couponCards.removeClass('selected');
             if (!code) return;

             $couponCards.each(function () {
                 const cardCode = $(this).data('code') || $(this).find('.top_blck span').first().text().trim().toUpperCase();
                 if (cardCode === code) {
                     $(this).addClass('selected');
                 }
             });
         }

         // Clear Button Toggle
         function toggleClearButton(value) {
             if (value) {
                 $clearBtn.fadeIn(150);
             } else {
                 $clearBtn.fadeOut(150);
             }
         }
         // Update Main Block after Apply
         function updateMainPromoState(code) {
             const $promoWrapper = $('.applied_promo');
             $promoWrapper.find('.promoApply, .promoApplied, .promoInvalid').hide();
             if (!code) {
                 $promoWrapper.find('.promoApply').fadeIn();
                 return;
             }
             const matched = $couponCards.filter(function () {
                 const cardCode = $(this).data('code') || $(this).find('.top_blck span').first().text().trim().toUpperCase();
                 return cardCode === code.toUpperCase();
             }).length > 0;

             if (matched) {
                 $promoWrapper.find('.promoApplied').fadeIn();
                 $promoWrapper.find('.promoApplied h6')
                     .contents().filter(function () {
                         return this.nodeType === 3;
                     }).remove();
                 $promoWrapper.find('.promoApplied h6')
                     .append(code);
             } else {
                 $promoWrapper.find('.promoInvalid').fadeIn();
                 $promoWrapper.find('.promoInvalid h6')
                     .contents().filter(function () {
                         return this.nodeType === 3;
                     }).remove();
                 $promoWrapper.find('.promoInvalid h6')
                     .append(`${code} <span>is invalid</span>`);
             }
         }
     });
});

jQuery(document).ready(function () {
    jQuery(".tcsDeclaration_wrpr").each(function () {
        var $parent = jQuery(this);

        $parent.find(".payer_info").on("click", function () {
            var $this = jQuery(this);
            $parent.find(".payer_info").removeClass("active");
            $this.addClass("active");
            $this.find("input[type=radio]").prop("checked", true);
        });
    });
});

// ---------------------------
// Payment Validation Script
// ---------------------------
jQuery(document).ready(function ($) {
    const $bookingInfo = $('.booking_info');
    const $paymentSection = $('.complete_payment');

    function validateFields($section, method) {
        let isValid = true;

        if (method === 'creditdebitCard') {
            $section.find('input[type="text"]').each(function () {
                if ($(this).val().trim() === '') {
                    isValid = false;
                    return false;
                }
            });
        } else if (method === 'netBanking') {
            const bankSelected = $section.find('select').val();
            if (!bankSelected) isValid = false;
        } else if (method === 'upi') {
            const upiInput = $section.find('input[type="text"]').val();
            if (!upiInput.trim()) {
                isValid = false;
            }

            const isVerifiedShown = $section.find('.verified').is(':visible');
            if (!isVerifiedShown) isValid = false;
        }

        // Enable/disable Pay button
        $section.find('.btn_pay').prop('disabled', !isValid);
    }

    // Hide all payment_info and .verified initially
    $paymentSection.find('.payment_info').hide();
    $paymentSection.find('.verified').hide();

    // Radio button change (only for paymentMethod group)
    $paymentSection.find('input[type="radio"][name="paymentMethod"]').on('change', function () {
        const $selectedMode = $(this).closest('.payment_mode');

        $paymentSection.find('.payment_mode').removeClass('active');
        $selectedMode.addClass('active');

        $paymentSection.find('.payment_info').slideUp();
        $selectedMode.find('.payment_info').slideDown();

        $paymentSection.find('.btn_pay').prop('disabled', true);
    });

    // Input change for Card & UPI
    $paymentSection.find('.payment_info input[type="text"]').on('input', function () {
        const $section = $(this).closest('.payment_info');
        const method = $(this).closest('.payment_mode').find('.form-check-input').attr('id');

        // 👉 If input is cleared and .verified is showing, hide it
        if (method === 'upi') {
            if ($(this).val().trim() === '') {
                $section.find('.verified').fadeOut();
            }
        }

        validateFields($section, method);
    });


    // Net Banking select change
    $paymentSection.find('select').on('change', function () {
        const $section = $(this).closest('.payment_info');
        validateFields($section, 'netBanking');
    });

    // ✅ UPI Verify Button
    // $paymentSection.find('.btn_verify').on('click', function () {
    //     const $section = $(this).closest('.payment_info');
    //     const $verified = $section.find('.verified');

    //     // Show verified name
    //     $verified.fadeIn();

    //     // Trigger validation again
    //     validateFields($section, 'upi');
    // });

    // ✅ Handle Pay Button Click
    // $bookingInfo.find('.btn_pay').on('click', function () {
    //     if (!$(this).prop('disabled')) {
    //         $('.make_payment').hide();
    //         $('.booking_confirmation ').show();
    //         $(".confirmation_card").addClass("active");
    //         setTimeout(() => $(".confirmation_card").removeClass("active"), 3000);
    //         const target = document.querySelector('.booking_confirmation');
    //         target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    //         setTimeout(() => {
    //             window.scrollBy({ top: -110, behavior: 'smooth' });
    //         }, 300);
    //     }
    // });

    // EMI Bank selection: show plans_list on bank selection
    $paymentSection.on('change', '.plansEmi_wrpr select', function () {
        const $section = $(this).closest('.payment_info');
        const selectedValue = $(this).val();

        if (selectedValue) {
            $section.find('.plans_list').stop(true, true).slideDown();
        } else {
            $section.find('.plans_list').stop(true, true).slideUp(); // optional: hide again if no bank selected
        }
    });

    // Gift Card: Hide .card_giftCard initially
    $paymentSection.find('.card_giftCard').hide();

    // Gift Card: Add E-Gift Voucher (max 2 total blocks)
    $paymentSection.on('click', '.btn_addGiftCard', function () {
        const $section = $(this).closest('.payment_info');
        const $giftCards = $section.find('.card_giftCard');
        const $divider = $section.find('.divider');
        const visibleCards = $giftCards.filter(':visible');

        if (visibleCards.length === 0) {
            $giftCards.first().slideDown();
        } else if (visibleCards.length === 1) {
            const $clone = $giftCards.first().clone();
            $clone.find('input[type="text"]').val('');
            $clone.hide();

            $clone.insertBefore($divider).slideDown();
        } else {
            return false;
        }
    });

    // Gift Card: Remove E-Gift Voucher (one by one)
    $paymentSection.on('click', '.btn_giftRemove', function () {
        const $card = $(this).closest('.card_giftCard');
        const $allCards = $card.closest('.payment_info').find('.card_giftCard');

        if ($allCards.index($card) === 0) {
            // If it's the first/original card — just hide and clear inputs
            $card.slideUp(() => {
                $card.find('input[type="text"]').val('');
            });
        } else {
            // If it's a cloned card — slide up and remove
            $card.slideUp(() => {
                $card.remove();
            });
        }
    });

    // Gift Card: Verify PAN Card (basic non-empty check only)
    $paymentSection.on('click', '.btn_verifiedPan', function () {
        const $section = $(this).closest('.payment_info');
        const $btn = $(this);

        // Get the 3 required fields (loosely validate just non-empty)
        const name = $section.find('input').filter((i, el) => $(el).siblings('label').text().trim() === 'Name as on PAN Card').val().trim();
        const dob = $section.find('input').filter((i, el) => $(el).siblings('label').text().trim() === 'Date of Birth').val().trim();
        const pan = $section.find('input').filter((i, el) => $(el).siblings('label').text().trim() === 'PAN Card Number').val().trim();

        // If none are blank, verify
        if (name && dob && pan) {
            $btn.text('PAN Card Verified').addClass('verified');
        } else {
            alert('Please fill all PAN Card details before verifying.');
        }
    });

});

// jQuery(document).ready(function ($) {
//     $('.card_info .btn_qr').on('click', function () {
//         const $button = $(this);
//         const $bottomQr = $button.closest('.bottom_qr');
//         $bottomQr.addClass('show-qr');
//         $button.hide();
//     });
// });

jQuery(document).ready(function () {

    const $section = jQuery('.redeem_section');

    // STEP 1: Enable Check button on number input
    $section.find('.phone_number').on('input', function () {
        const number = jQuery(this).val();
        if (number.length >= 10) {
            $section.find('.btn_check').prop('disabled', false);
        } else {
            $section.find('.btn_check').prop('disabled', true);
        }
    });

    // STEP 2: Show OTP section on Check button click
    // $section.find('.btn_check').on('click', function () {
    //     $section.find('.mobile_number').hide();
    //     $section.find('.otp_number').show();
    // });

    // STEP 3 & 4: OTP digit input auto move and enable submit
    $section.find('.otp_digits input').on('keyup', function (e) {
        const key = e.which || e.keyCode;

        if (jQuery(this).val().length === 1 && key !== 8) {
            jQuery(this).next('input').focus();
        } else if (key === 8 && jQuery(this).val() === '') {
            jQuery(this).prev('input').focus();
        }

        const allFilled = $section.find('.otp_digits input').toArray().every(input => jQuery(input).val().length === 1);
        $section.find('.btn_submit').prop('disabled', !allFilled);
    });

    // STEP 5: Submit OTP
    $section.find('.btn_submit').on('click', function () {
        $section.find('.otp_number').hide();
        $section.find('.change_number').show();
    });

    // STEP 6: Change Number click
    // $section.find('.btn_changeNo').on('click', function () {
    //     $section.find('.change_number').hide();
    //     $section.find('.points_available').show();
    // });

    // STEP 7: Apply Now clicked
    // $section.find('.btn_apply').on('click', function () {
    //     $section.find('.points_available').hide();
    //     $section.find('.redeem_points').show();
    // });

    // STEP 8: Reset everything on btn_remove click
    // $section.find('.btn_remove').on('click', function () {
    //     // Hide all sections
    //     $section.find('.otp_number, .change_number, .points_available, .redeem_points').hide();

    //     // Clear input values
    //     $section.find('.phone_number').val('');
    //     $section.find('.otp_digits input').val('');

    //     // Disable buttons
    //     $section.find('.btn_check').prop('disabled', true);
    //     $section.find('.btn_submit').prop('disabled', true);

    //     // Show mobile input section again
    //     $section.find('.mobile_number').show();
    // });

    // STEP 9: Initial state - hide all except mobile_number
    $section.find('.otp_number, .change_number, .points_available, .redeem_points').hide();

});

$(function () {
    const backdropClass = 'custom-backdrop fade';

    $('.fareBreakup_mobile').each(function () {
        const $parent = $(this);
        const $toggleBtn = $parent.find('.btn_fareBreakup');
        const $closeBtn = $parent.find('.btn_close');
        const $wrapper = $parent.find('.fareWapper_mobile');

        // Toggle open/close
        $toggleBtn.on('click', function (e) {
            e.stopPropagation();
            const isVisible = $wrapper.is(':visible');

            closeAllFareBreakups();

            if (!isVisible) {
                $wrapper.slideDown(300);
                $parent.addClass('active');
                addBackdrop();
            }
        });

        // Close on cross button
        $closeBtn.on('click', function () {
            $wrapper.slideUp(300);
            $parent.removeClass('active');
            removeBackdrop();
        });
    });

    // Close on backdrop click
    $(document).on('click', `.${backdropClass.replace(/ /g, '.')}`, function () {
        closeAllFareBreakups();
    });

    // Close on outside click
    $(document).on('click', '.buttons_stepper .btn', function () {
        closeAllFareBreakups();
    });

    function closeAllFareBreakups() {
        $('.fareWapper_mobile').slideUp(300);
        $('.fareBreakup_mobile').removeClass('active');
        removeBackdrop();
    }

    function addBackdrop() {
        if (!$(`.${backdropClass.replace(/ /g, '.')}`).length) {
            const $backdrop = $(`<div class="${backdropClass}"></div>`);
            $('body').append($backdrop);
            $('body').css('overflow', 'hidden'); // Disable scroll
            setTimeout(() => $backdrop.addClass('show'), 10);
        }
    }

    function removeBackdrop() {
        const $backdrop = $(`.${backdropClass.replace(/ /g, '.')}`);
        $backdrop.removeClass('show');
        $('body').css('overflow', ''); // Restore scroll
        setTimeout(() => $backdrop.remove(), 150);
    }
});

$(document).ready(function () {
    jQuery(document).on('click', '.make_payment .btn-continue-pay', function () {
        if (window.innerWidth < 768) {
            jQuery('.notes_block, .applied_promo').css('display', 'flex');
            jQuery('.complete_payment, .fixed_payStrip, .mobile_edgePoint, .btn-pay-now').show();
            jQuery('.make_payment .accordion, .make_payment .applied_promo, .make_payment .top_cards, .make_payment .total_wrapper, .make_payment .redeem_section, .make_payment .btn-continue-pay').hide();
        }
    });
});

jQuery(document).on('click', '.make_payment .btn-pay-now', function () {
    if (window.innerWidth < 768) {
        jQuery('.make_payment').hide();
        jQuery('.booking_confirmation, .booking_confirmation .accordion, .price_offers .total_wrapper').show();
    }
});

jQuery(document).ready(function () {

    const backdropHTML = '<div class="custom-backdrop fade"></div>';

    function insertBackdrop() {
        jQuery('.custom-backdrop').remove(); // Remove any existing
        const $backdrop = jQuery(backdropHTML).appendTo('body');
        jQuery('body').css('overflow', 'hidden'); // disable scroll
        setTimeout(() => {
            $backdrop.addClass('show'); // Bootstrap-style fade-in
        }, 10);
    }

    function removeBackdrop() {
        jQuery('.custom-backdrop').removeClass('show');
        jQuery('body').css('overflow', ''); // restore scroll
        setTimeout(() => {
            jQuery('.custom-backdrop').remove();
        }, 150); // Matches fade transition
    }

    // Button click handler
    jQuery(document).on('click', '.mobile_edgePoint .btn_edgePoint', function () {
        if (window.innerWidth < 768) {
            const $redeemSection = jQuery('.redeem_section');

            // Agar hidden hai to slideDown + backdrop
            if ($redeemSection.is(':hidden')) {
                $redeemSection.stop(true, true).slideDown(300);
                insertBackdrop();
            }
        }
    });

    // Close on backdrop click
    jQuery(document).on('click', '.custom-backdrop', function () {
        const $redeemSection = jQuery('.redeem_section');
        $redeemSection.stop(true, true).slideUp(300);
        removeBackdrop();
    });

});