
	$(document).ready(function () {
	$('#tcHomeMainBanner .owl-carousel').trigger('destroy.owl.carousel');
    $('#tcHomeMainBanner').find('.owl-carousel ').addClass('hero_slider');
	
	$('#tcHomeMainBanner .owl-carousel').owlCarousel({
        items: 1,
        autoplay: true,
        loop: true,
        nav: true,
        dots: false,
		center: true,
        autoplayHoverPause: true,
		autoplayTimeout: 2000,
        margin:0,
        nav:false,
          navText: [
            "<img src='assets/images/common-img/chevron-left.svg' alt='Previous'>",
            "<img src='assets/images/common-img/chevron-right.svg' alt='Next'>"
        ],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
    });
});
$('#tcHomeMainBanner .owl-carousel').trigger('destroy.owl.carousel');


// ===============================
// Forex Strip Slider Js
// ===============================
$(document).ready(function () {
    const $marquee = $(".forex_strip .forex_group");
    const speed = 1;
    let scrollAmount = 0;
    let isHovered = false;

    // Duplicates the content
    const marqueeContent = $marquee.html();
    $marquee.html(marqueeContent + marqueeContent);

    function startScrolling() {
        if (!isHovered) {
            scrollAmount -= speed;
            if (Math.abs(scrollAmount) >= $marquee[0].scrollWidth / 2) {
                scrollAmount = 0;
            }
            $marquee.css("transform", `translateX(${scrollAmount}px)`);
        }
        requestAnimationFrame(startScrolling);
    }

    $marquee.on("mouseenter", function () {
        isHovered = true;
    });

    $marquee.on("mouseleave", function () {
        isHovered = false;
    });

    startScrolling();
});

$(document).ready(function () {
    $('.select_dropdown').each(function () {
        var $this = $(this);
        var $wrapper = $this.closest('.select_wrapper');
        var $options = $this.find('option');

        $this.addClass('hide-select');

        // ✅ Conditionally add readonly
        var isStateSelect = $this.hasClass('select_state');
        var readonlyAttr = isStateSelect ? '' : 'readonly';

        // ✅ Get selected option text first
        var initialText = $this.find("option:selected").text().trim();

        // ✅ Create the input with initial value
        $this.after(`<input type="text" class="custom_select" autocomplete="off" ${readonlyAttr} value="${initialText}">`);
        var $customSelect = $this.next('.custom_select');

        // ✅ Build options list
        var $optionList = $('<ul class="select_options" />').insertAfter($customSelect);

        $options.each(function () {
            var $opt = $(this);
            if (!$opt.prop('hidden')) {
                var listItem = $('<li />', {
                    'data-val': $opt.val(),
                    class: $opt.prop('disabled') ? 'disabled' : ''
                }).text($opt.text().trim());
                $optionList.append(listItem);
            }
        });

        var $optionItems = $optionList.find('li');

        // ✅ Toggle dropdown
        $wrapper.on('click', function (e) {
            e.stopPropagation();
            var isActive = $customSelect.hasClass('active');

            // Close all others
            $('.custom_select').removeClass('active')
                .next('.select_options').slideUp();
            $('.select_wrapper').removeClass('active');

            if (!isActive) {
                $customSelect.addClass('active').next('.select_options').slideDown();
                $wrapper.addClass('active');
                $customSelect.trigger('focus');
            }
        });

        // ✅ Search only for select_state
        if (isStateSelect) {
            $customSelect.on('keyup', function () {
                var searchTerm = $(this).val().toLowerCase();
                $optionItems.each(function () {
                    $(this).toggle($(this).text().toLowerCase().includes(searchTerm));
                });
            });
        }

        // ✅ Select option
        $optionItems.on('click', function (e) {
            e.stopPropagation();
            if ($(this).hasClass('disabled')) return;

            var value = $(this).data('val');
            var labelText = $(this).text().trim();

            $customSelect.val(labelText);
            $this.val(value).trigger('change');
            $optionList.slideUp();

            $wrapper.addClass('filled').removeClass('active');
            $customSelect.removeClass('active');
        });

        // ✅ Close dropdown if clicking outside
        $(document).on('mousedown', function (e) {
            if (!$(e.target).closest('.select_wrapper').length ||
                ($(e.target).is('input, select') && !$(e.target).hasClass('custom_select'))) {
                $('.custom_select').removeClass('active');
                $('.select_options').slideUp();
                $('.select_wrapper').removeClass('active');
            }
        });

        // ✅ Pre-fill if already selected
        if ($this.val()) {
            $wrapper.addClass('filled');
            var selectedText = $this.find('option:selected').text().trim();
            $customSelect.val(selectedText);
        }
    });
});



$(document).ready(function () {
  $(".filters_tab .btn").click(function () {
    // Remove active class from all
    $(".filters_tab .btn").removeClass("active");
    // Add active class to clicked
    $(this).addClass("active");

    // Hide all tab contents
    $(".tab-content > div").hide();

    // Show the selected tab content
    var target = $(this).data("target");
    $(target).show();
  });
});


function initWtcCarousel() {
  $('#holidaysLPThomasCookSpecials-Msite').find('.owl-carousel ').addClass('tcspecial_slide');
    if (jQuery(window).width() <= 767) {
        if (!jQuery(".tcspecial_slide").hasClass("owl-loaded")) {
            jQuery(".tcspecial_slide").owlCarousel({
                items: 1,
                margin: 8,
                loop: false,
                autoplay: false,
                nav: false,
                dots: true,
                autoplayTimeout: 7000,
                smartSpeed: 800,
            });
        }
    } else {
        if (jQuery(".tcspecial_slide").hasClass("owl-loaded")) {
            jQuery(".tcspecial_slide").trigger("destroy.owl.carousel");
            jQuery(".tcspecial_slide").find(".owl-stage-outer").children().unwrap();
            jQuery(".tcspecial_slide").removeClass("owl-loaded owl-carousel");
        }
    }
}

// Run on load and resize
jQuery(document).ready(initWtcCarousel);
jQuery(window).resize(initWtcCarousel);


    function initWtcCarousel() {
        if (jQuery(window).width() <= 767) {
            if (!jQuery(".forex_msite").hasClass("owl-loaded")) {
                jQuery(".forex_msite").owlCarousel({
                    items: 1.5,
                    margin: 8,
                    loop: false,
                    autoplay: false,
                    nav: false,
                    dots: true,
                    autoplayTimeout: 7000,
                    smartSpeed: 800,
                });
            }
        } else {
            if (jQuery(".forex_msite").hasClass("owl-loaded")) {
                jQuery(".forex_msite").trigger("destroy.owl.carousel");
                jQuery(".forex_msite").find(".owl-stage-outer").children().unwrap();
                jQuery(".forex_msite").removeClass("owl-loaded owl-carousel");
            }
        }
    }

    initWtcCarousel();
    jQuery(window).resize(function () {
        initWtcCarousel();
    });
