$(document).ready(function () {

// ===============================
// Landing  Page Banner Slider
// ===============================
$(document).ready(function () {




    var owl = $('.mainBannerlide').owlCarousel({
        autoplay: false,
        items: 1,
        loop: true,
        nav: false,
        dots: true,
        autoplayTimeout: 8000,
        smartSpeed: 800,
        // animateOut: 'fadeOut',
        // animateIn: 'fadeIn',
    });
	
	// SEARCH RESULT FOCUS
  var $searchInput = $('.searchInput');

  function getResultLinks() {
    // Get all <a> inside <li> inside any .search_result
    return $('.search_result ul li a');
  }

  function setActiveLink($links, index) {
    $links.removeClass('active');
    if (index >= 0 && index < $links.length) {
      $links.eq(index).addClass('active').focus();
    }
  }

  function moveFocus($links, currentIndex, direction) {
    var length = $links.length;
    if (length === 0) return;

    var nextIndex;
    if (direction === 'down') {
      nextIndex = (currentIndex + 1) % length;
    } else if (direction === 'up') {
      nextIndex = (currentIndex - 1 + length) % length;
    }

    setActiveLink($links, nextIndex);
  }

  // Arrow key navigation from search input
  $searchInput.on('keydown', function (e) {
    var $links = getResultLinks();
    var direction = null;

    if (e.keyCode === 40) direction = 'down'; // Arrow Down
    if (e.keyCode === 38) direction = 'up';   // Arrow Up

    if (direction) {
      //e.preventDefault();
      // From input, treat as starting before first (down) or at end (up)
      var index = direction === 'down' ? -1 : $links.length;
      moveFocus($links, index, direction);
    }
  });

  // Arrow + Enter navigation on result links
  $(document).on('keydown', '.search_result ul li a', function (e) {
	  var $links = getResultLinks();
	  var currentIndex = $links.index(this);

	  if (e.keyCode === 40) { // Arrow down
		e.preventDefault();
		moveFocus($links, currentIndex, 'down');
	  } else if (e.keyCode === 38) { // Arrow up
		e.preventDefault();
		moveFocus($links, currentIndex, 'up');
	  } else if (e.keyCode === 13) { // Enter
		//e.preventDefault();
		$(this).trigger('click');
	  }
	});

  // Mouse click handling
  $(document).on('click', '.search_result ul li a', function (e) {
    var $links = getResultLinks();
    var index = $links.index(this);
    setActiveLink($links, index);
  });

  // Optional: Remove active class on blur
  $(document).on('blur', '.search_result ul li a', function () {
    $(this).removeClass('active');
  });

  
  $(".search_box .searchInput").focus(function(){
  	setTimeout(function(){
		$(".search_popup .searchInput").val('');
		$(".search_popup .searchInput").focus();
	},200)
  })
  
});

var windowWidth = $(window).width();

$(document).ready(function () {
	
	$(".srpcountry_tab h3, .srpcountry_tab h4").click(function(){
			if(windowWidth > 767){
				$(".srpcountry_tab").removeClass("active");
				$(this).parent().addClass("active");	
			}else{
				setTimeout(function(){
					$(this).parent().addClass("active");	
				},100)
			}
			$(".tabs_content a").remove();
			$(this).parent().find("a").clone().appendTo(".tabs_content");
		})
	$('<div class="interlinks_tabs"><div class="tabs_nav"></div><div class="tabs_content d-none d-lg-block"></div></div>').appendTo(".taggingSEOData");
	$(".srpcountry_tab").appendTo(".tabs_nav");
	$(".vertical_tabs_section .tabs_nav > .srpcountry_tab:nth-child(1) h3").trigger("click");
	$(".vertical_tabs_section .tabs_nav > .srpcountry_tab:nth-child(1) a").clone().appendTo(".tabs_content");
});

// ===============================
// Landing  Page Banner Slider
// ===============================


document.querySelector('video').play();
 var owl = $(".banner .owl-carousel");
    owl.owlCarousel({
      		autoplay: false,
            loop: false,
            nav: true,
            dots: true,
            touchDrag: true,
            mouseDrag: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            navText: [
                "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
                "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 3,
                    margin: 16
                },
                1440: {
                    items: 3,
                    margin: 24
                }
            }
    });
$('#holidaysLPExploreHolidaysByTheme').owlCarousel({
        loop: false,
        margin: 10,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 5
            }
        }
    });
	
	/*$('.international_package .owl-carousel').trigger('destroy.owl.carousel');
	$('.international_package .owl-carousel').owlCarousel({
        loop: false,
        margin: 15,
        nav: false,
        responsive: {
            0: {
                items: 1.10
            },
            640: {
                items: 2
            },
            768: {
                items: 3
            },
            1200: {
                items: 3
            }
        }
    });*/
$('.selling_packages .owl-carousel').trigger('destroy.owl.carousel');
	$('.selling_packages .owl-carousel').owlCarousel({
      autoplay: false,
            loop: false,
            nav: true,
            dots: true,
            touchDrag: true,
            mouseDrag: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            navText: [
                "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
                "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.35,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 3,
                    margin: 16
                },
                1440: {
                    items: 3,
                    margin: 24
                }
            }
    });


	/*($('.international_package .owl-carousel').trigger('destroy.owl.carousel');
	$('.international_package .owl-carousel').owlCarousel({
        loop: false,
        margin: 15,
        nav: false,
		 navText: [
            "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
            "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
        ],
        responsive: {
            0: {
                items: 1.10
            },
            640: {
                items: 2
            },
            768: {
                items: 3
            },
            1200: {
                items: 3
            }
        }
    });*/
	
	//international_package carousel
$(document).ready(function () {


  const $owl = $('.international_package .owl-carousel');

  function updateNavState(e) {
    const $wrap = $owl.closest(".international_package");
    const i = e.item.index, shown = e.page.size, total = e.item.count;
    $wrap.find(".owl-prev").toggleClass("disabled", i === 0);
    $wrap.find(".owl-next").toggleClass("disabled", i + shown >= total);
  }

  // bind events first
  $owl.on("initialized.owl.carousel translated.owl.carousel", updateNavState);

  // init carousel
  $owl.trigger('destroy.owl.carousel').owlCarousel({
    loop: false,
    margin: 15,
    nav: false,
    smartSpeed: 600,
    navText: [
      "<img src='/images/tcHolidays/chevron-left.svg' alt='Prev'>",
      "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
    ],
    responsive: {
      0:   { items: 1.10, loop: true },
      640: { items: 2 },
      768: { items: 3 },
      1200:{ items: 3 }
    }
  });

  // custom prev/next
  $owl.closest(".international_package").find(".owl-prev, .owl-next")
    .on("click", e => $owl.trigger(
      $(e.currentTarget).hasClass("owl-prev") ? "prev.owl.carousel" : "next.owl.carousel"
    ));
});




var $owl = $('.visa_package .owl-carousel');

// Destroy & re-init
$owl.trigger('destroy.owl.carousel');
$owl = $owl.owlCarousel({
    loop: false,
    margin: 15,
    nav: false,
    navText: [
        "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
        "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
    ],
    smartSpeed: 800,
    responsive: {
        0: { items: 1.10, loop: true },
        640: { items: 2 },
        768: { items: 3 },
        1200: { items: 4 }
    }
});

// Function to update nav state
function updateNavState(event) {
    var $container = $owl.closest(".visa_package");
    $container.find(".owl-prev").toggleClass("disabled", event.item.index === 0);
    $container.find(".owl-next").toggleClass(
        "disabled",
        event.item.index + event.page.size >= event.item.count
    );
}

// Custom nav clicks
$owl.closest(".visa_package").find(".owl-prev, .owl-next").click(function () {
    $owl.trigger($(this).hasClass("owl-prev") ? "prev.owl.carousel" : "next.owl.carousel");
});

// Bind events
$owl.on("initialized.owl.carousel", function (event) {
    updateNavState(event);
    $owl.closest(".visa_package").find(".owl-prev").addClass("disabled");
});

$owl.on("translated.owl.carousel", updateNavState);








$('.trending_section .tcHolidaysTheamData').trigger('destroy.owl.carousel');
$('.trending_section .tcHolidaysTheamData').owlCarousel({
    autoplay: false,
    nav: false,
    dots: false,
    autoplayTimeout: 7000,
    smartSpeed: 800,
    navText: [
        "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
        "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
    ],
    responsive: {
        0: {
            items: 2.4,
            margin: 24,
            center: true,
            loop: true,
        },
        1024: {
            items: 2,
            margin: 16,
        },
        1200: {
            items: 6,
            margin: 16,
        },
        1440: {
            items: 6,
            margin: 24,
        }
    }
});
$('.trending_section .tcHolidaysTheamData').trigger('destroy.owl.carousel');
$('#holidaysLPExploreHolidaysByTheme').trigger('destroy.owl.carousel');
$('#holidaysLPExploreHolidaysByTheme').find('.carousel-wrapper').addClass('inner__gapTop');



$('#holidaysLPBestSellingPackagesIndia').trigger('destroy.owl.carousel');
$('#holidaysLPBestSellingPackagesIndia').find('.carousel-wrapper').addClass('selling_packages');
	
$(document).ready(function() {
	$('.holidaysLPThomasCookSpecialsSlider').find('.carousel-wrapper').addClass('wildlife_slide');
    $('.holidaysLPThomasCookSpecialsSlider .owl-carousel').trigger('destroy.owl.carousel');
    if($(window).width() > 767){
        $('.holidaysLPThomasCookSpecialsSlider .owl-carousel .item:last-child').remove();
    }
	
    $('.holidaysLPThomasCookSpecialsSlider .owl-carousel').owlCarousel({
        autoplay: true,
        items: 1,
        loop: true,
        nav: false,
        dots: true,
        autoplayTimeout: 3000,
        smartSpeed: 800,
		   responsive: {
        0: { items: 1 },     
        480: { items: 1 },   
        768: { items: 1 },    
        1024: { items: 1 }    
    }
    });
})
	$('.spiritual_package .owl-carousel').trigger('destroy.owl.carousel');
	$('.spiritual_package .owl-carousel').owlCarousel({
        loop: false,
        margin: 15,
        nav: false,
        responsive: {
            0: {
                items: 1.5 
            },
            640: {
                items: 2
            },
            768: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });
	
	/*$('.international_package .owl-carousel').trigger('destroy.owl.carousel');
	$('.holiday-landing-page .international_package .owl-carousel').owlCarousel({
        loop: false,
        margin: 15,
        nav: false,
        responsive: {
            0: {
                items: 1.10
            },
            640: {
                items: 2
            },
            768: {
                items: 3
            },
            1200: {
                items: 3
            },
        }
    });
	$('body:not(.holiday-landing-page) .international_package .owl-carousel').owlCarousel({
        loop: false,
        margin: 15,
        nav: false,
        responsive: {
            0: {
                items: 1.10
            },
            640: {
                items: 2
            },
            768: {
                items: 3
            },
            1200: {
                items: 3
            },
			1300: {
                items: 4
            }
        }
    });*/

    $('.trending_section .owl-carousel').trigger('destroy.owl.carousel');
    $('.trending_section .owl-carousel').addClass("destinations_slide");
	$('.trending_section .owl-carousel').owlCarousel({
        autoplay: false,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        navText: [
            "<img src='/images/tcHolidays/common-img/chevron-left.svg' alt='Previous'>",
            "<img src='/images/tcHolidays/common-img/chevron-right.svg' alt='Next'>"
        ],
        responsive: {
            0: {
                items: 2.4,
                margin: 24,
                center: true,
                loop: true,
            },
            1024: {
                items: 2,
                margin: 16,
            },
            1200: {
                items: 6,
                margin: 16,
            },
            1440: {
                items: 6,
                margin: 24,
            }
        }
    });
/*
 	$('#holidaysLPThomasCookSpecialsSlider').owlCarousel({
        autoplay: false,
        items: 1,
        loop: false,
        nav: false,
        dots: true,
        autoplayTimeout: 5000,
        smartSpeed: 800,
    });
*/
	
     

    //$(".carousel-image-link").each(function () {
    //  const href = $(this).attr("href");
    //  if (href && href.includes("?")) {
    //    $(this).attr("href", href.split("?")[0]);
    //  }
    //});
})

//-----------Bannner transition effect---------------------//
jQuery(window).on("scroll", function () {
    if (window.innerWidth > 991) {
        var scrollY = jQuery(window).scrollTop();
        var $hero = jQuery(".hero_wrapper");

        if ($hero.length) {
            var maxScroll = 100;
            var value = Math.max(0, 24 - (scrollY / maxScroll) * 24);

            $hero.css({
                "clip-path": `inset(0px ${value}px 0px ${value}px round ${value}px)`
            });

            var textMove = Math.min(scrollY * 0.5, 80);
            jQuery(".hero_section .bnr_text").css({
                transform: `translateY(-${textMove}px)`
            });
        }
    }
	starImprovment();
});
// Honeymoon Package Scroll Clip + Text Animation
// ===============================
jQuery(window).on("scroll", function () {
    if (window.innerWidth > 991) {
        var scrollY = jQuery(window).scrollTop();
        var $honeymoon = jQuery(".honeymoon_package");

        if ($honeymoon.length) {
            var sectionTop = $honeymoon.offset().top;
            var maxScroll = 300;
            var distanceFromTop = sectionTop - scrollY;

            if (distanceFromTop <= maxScroll) {
                var progress = 1 - Math.max(distanceFromTop / maxScroll, 0);
                var percent = (1 - progress) * 4;
                var radius = (1 - progress) * 44;

                $honeymoon.css({
                    "clip-path": `inset(${percent}% round ${radius}px)`
                });

                var textMove = progress * 80;
                $honeymoon.find(".bnr_text").css({
                    transform: `translateY(-${textMove}px)`
                });
            } else {
                $honeymoon.css({
                    "clip-path": "inset(4% round 44px)"
                });
                $honeymoon.find(".bnr_text").css({
                    transform: "translateY(0px)"
                });
            }
        }
    }
});
//---------------------Bannner Transition Effect ends-----------//

//---------------------Slider Animation Effects ----------------//
function animateCarouselItems($carousel) {
  $carousel.find('.owl-item:not(.cloned)').each(function (index, el) {
    const $el = $(el).find('.item');

    // Reset transform and opacity
    $el.css({
      opacity: 0,
      transform: 'translateX(50px)',
      transition: 'none',
    });

    // Force reflow
    void $el[0].offsetWidth;

    // Animate with stagger
    setTimeout(() => {
      $el.css({
        transition: 'transform 600ms ease, opacity 600ms ease',
        transform: 'translateX(0)',
        opacity: 1,
      });
    }, index * 100);
  });
}




//-------------------------Slider Animation Effects Ends----------------------//


// ===============================
// Mobile Menu Toggle
// ===============================
$(document).ready(function () { 
    $('.menu_btn').click(function () {
        $('.mobile_menu').addClass('open');
        $('body').addClass('menu-open');

        if ($('.custom-backdrop[data-backdrop-for="menu"]').length === 0) {
            const $backdrop = $('<div class="custom-backdrop fade" data-backdrop-for="menu"></div>');
            $('body').append($backdrop);

            // Delay adding 'show' to trigger fade-in transition
            setTimeout(() => {
                $backdrop.addClass('show');
            }, 10); // 10ms delay is enough to trigger transition
        }
    });

    function closeMenu() {
        $('.mobile_menu').removeClass('open');
        $('body').removeClass('menu-open');

        const $backdrop = $('.custom-backdrop[data-backdrop-for="menu"]');
        $backdrop.removeClass('show');

        // Remove from DOM after fade-out completes (150ms = CSS duration)
        setTimeout(() => {
            $backdrop.remove();
        }, 150);
    }

    $(document).on('click', '.custom-backdrop[data-backdrop-for="menu"], .btn_close', closeMenu);
	
	var imgs = jQuery('#holidaysLPExploreHolidaysByTheme .item');
    var firstItem = imgs.first();
    var lastHovered = firstItem; // Initially, first image is active
    var isMobile = window.innerWidth <= 768;

    function applyStyles() {
        imgs.css({
            'transition': isMobile ? 'height 0.6s ease-in-out' : 'width 0.6s ease-in-out'
        });

        if (isMobile) {
            firstItem.css('height', '438px').addClass('active');
            firstItem.siblings().css('height', '100px').removeClass('active');

            imgs.off('mouseenter mouseleave click').on('click', function () {
                imgs.css('height', '100px').removeClass('active');
                jQuery(this).css('height', '438px').addClass('active');
                lastHovered = jQuery(this);
            });

        } else {
            firstItem.css('width', '42%').addClass('active');
            firstItem.siblings().css('width', '22.212%').removeClass('active');

            imgs.off('mouseenter mouseleave click').on('mouseenter', function () {
                imgs.css('width', '22.212%').removeClass('active');
                jQuery(this).css('width', '42%').addClass('active');
                lastHovered = jQuery(this);
            });

            jQuery('.image_grid').off('mouseleave').on('mouseleave', function () {
                if (lastHovered.length) {
                    imgs.css('width', '22.212%').removeClass('active');
                    lastHovered.css('width', '42%').addClass('active');
                }
            });
        }
    }

    function checkViewport() {
        var newIsMobile = window.innerWidth <= 768;
        if (newIsMobile !== isMobile) {
            isMobile = newIsMobile;
            imgs.removeAttr('style').removeClass('active'); // Reset styles
            firstItem = imgs.first(); // Reset first item
            lastHovered = firstItem; // Reset last hovered
            applyStyles();
        }
    }

    applyStyles();
    jQuery(window).resize(checkViewport);
	
	

	$('#holidaysLPExploreHolidaysByTheme .carousel-caption-overlay .subtext').wrap('<div class="caption-wrapper"></div>');

});


// ===============================
// Hero Section Clip-Path Scroll Effect
// ===============================
jQuery(window).on("scroll", function () {
    if (window.innerWidth > 991) {
        var scrollY = jQuery(window).scrollTop();
        var $hero = jQuery(".hero_wrapper");

        if ($hero.length) {
            var maxScroll = 100;
            var value = Math.max(0, 24 - (scrollY / maxScroll) * 24);

            $hero.css({
                "clip-path": 'inset(0px ${value}px 0px ${value}px round ${value}px)'
            });

            var textMove = Math.min(scrollY * 0.5, 80);
            jQuery(".hero_section .bnr_text").css({
                transform: 'translateY(-${textMove}px)'
            });
        }
    }
});

// ===============================
// Form Section Clip-Path Animation on Scroll
// ===============================
jQuery(window).on("scroll", function () {
    if (window.innerWidth > 991) {
        var scrollY = jQuery(window).scrollTop();
        var $form = jQuery(".form__section");

        if ($form.length) {
            var maxScroll = 300;
            var sectionTop = $form.offset().top;

            if (scrollY + 500 >= sectionTop) {
                var distance = scrollY + 500 - sectionTop;
                var clampedDistance = Math.min(distance, maxScroll);

                var marginValue = (clampedDistance / maxScroll) * 40;
                var radiusValue = (clampedDistance / maxScroll) * 20;

                $form.css({
                    "clip-path": 'inset(0px ${marginValue}px 0px ${marginValue}px round ${radiusValue}px)'
                });
            } else {
                $form.css({
                    "clip-path": "inset(0px 0px 0px 0px round 0px)"
                });
            }
        }
    }
});

// ===============================
// Honeymoon Package Scroll Clip + Text Animation
// ===============================
jQuery(window).on("scroll", function () {
    if (window.innerWidth > 991) {
        var scrollY = jQuery(window).scrollTop();
        var $honeymoon = jQuery(".honeymoon_package");

        if ($honeymoon.length) {
            var sectionTop = $honeymoon.offset().top;
            var maxScroll = 300;
            var distanceFromTop = sectionTop - scrollY;

            if (distanceFromTop <= maxScroll) {
                var progress = 1 - Math.max(distanceFromTop / maxScroll, 0);
                var percent = (1 - progress) * 4;
                var radius = (1 - progress) * 44;

                $honeymoon.css({
                    "clip-path": 'inset(${percent}% round ${radius}px)'
                });

                var textMove = progress * 80;
                $honeymoon.find(".bnr_text").css({
                    transform: 'translateY(-${textMove}px)'
                });
            } else {
                $honeymoon.css({
                    "clip-path": "inset(4% round 44px)"
                });
                $honeymoon.find(".bnr_text").css({
                    transform: "translateY(0px)"
                });
            }
        }
    }
});

// ===============================
// Chat Widget Toggle
// ===============================
$(document).ready(function () {
    let isVisible = false;

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
    $(".toggle-btn").on("click", function () {
        $(".chat-widget").toggleClass("open");
    });
});

// ===============================
// Recent Slider (OwlCarousel)
// ===============================
$(document).ready(function () {
$('.recent_slider').trigger('destroy.owl.carousel');
    jQuery(".recent_slider").each(function () {
        var $this = jQuery(this);
        var owl = $this.owlCarousel({
            loop: false,
            autoplay: false,
            nav: false,
            dots: false,
            touchDrag: true,
            mouseDrag: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            responsive: {
                0: {
                    items: 1.21,
                    margin: 16,
                    autoplay: true,
                    loop: false,
                },
                768: {
                    items: 2,
                    margin: 24
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 4,
                    margin: 16
                },
                1440: {
                    items: 4,
                    margin: 24
                }
            }
        });

        function updateNavState(event) {
            $this.closest(".recents_searches").find(".owl-prev").toggleClass("disabled", event.item.index === 0);
            $this.closest(".recents_searches").find(".owl-next").toggleClass("disabled", event.item.index + event.page.size >= event.item.count);
        }

        $this.closest(".recents_searches").find(".owl-prev, .owl-next").click(function () {
            owl.trigger($(this).hasClass("owl-prev") ? "prev.owl.carousel" : "next.owl.carousel");
        });

        owl.on("initialized.owl.carousel", function (event) {
            updateNavState(event);
            $this.closest(".recents_searches").find(".owl-prev").addClass("disabled");
        });

        owl.on("translated.owl.carousel", updateNavState);
    });
});

// ===============================
// Image Slider (OwlCarousel)
// ===============================
$(document).ready(function () {
    $('.img_slider').owlCarousel({
        autoplay: false,
        items: 1,
        loop: false,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        navText: [
            "<img src='assets/img/arrow-left-src.svg' alt='Previous'>",
            "<img src='assets/img/arrow-right-src.svg' alt='Next'>"
        ],
    });
	
});

// ===============================
// Package Slider with Filters (International)
// ===============================
$(document).ready(function () {
    //var $carousel = $('#holidaysLPBestSellingPackagesInternational .owl-carousel');
    //var allItems = $carousel.children('#holidaysLPBestSellingPackagesInternational .item').clone(); // store all items

    function initOwl() {
        $carousel.owlCarousel({
            autoplay: false,
            loop: false,
            nav: true,
            dots: false,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            touchDrag: true,
            mouseDrag: true,
            navText: [
                "<img src='assets/img/chevron-left.svg' alt='Previous'>",
                "<img src='assets/img/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.15,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 3,
                    margin: 16
                },
                1440: {
                    items: 3,
                    margin: 24
                }
            }
        });
    }

    // function filterItems(filterClass) {
    //     $carousel.trigger('destroy.owl.carousel').html('');
    //     var filteredItems = allItems.filter(filterClass);
    //     $carousel.append(filteredItems.clone());
    //     initOwl();
    // }

    function filterItems(filterClass) {
        $carousel.trigger('destroy.owl.carousel');
        $carousel.html('');

        var filteredItems = allItems.filter(filterClass);
        $carousel.append(filteredItems.clone());

        // Animate each item: fade in + slide from right with delay
        $carousel.children().each(function (index, el) {
            $(el).css({
                opacity: 0,
                transform: 'translateX(50px)', // slide from right
            });

            setTimeout(function () {
                $(el).css({
                    transition: 'all 600ms ease',
                    opacity: 1,
                    transform: 'translateX(0)',
                });
            }, index * 100); // staggered delay
        });

        initOwl();
    }

    // Default: Show Europe
    var defaultFilter = '.europe';
    $('.international_package .filters_tab .btn').removeClass('active');
    $('.international_package .filters_tab .btn[data-owl-filter="' + defaultFilter + '"]').addClass('active');
    filterItems(defaultFilter);

    // Filter button click
    $('.international_package .filters_tab').on('click', '.btn', function () {
        var filter = $(this).data('owl-filter');

        $('.international_package .filters_tab .btn').removeClass('active');
        $(this).addClass('active');

        filterItems(filter);
    });
});

// ===============================
// Holiday Package Slider with Filters (India)
// ===============================
$(document).ready(function () {
    var $carousel = $('.india_slide, .visa_slide');
    var allItems = $carousel.children('.item_card').clone();
    var $filterBtns = $('.india_package .filters_tab .btn[data-owl-filter]');

    function initOwl() {
        $carousel.owlCarousel({
            loop: false,
            nav: true,
            dots: false,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            touchDrag: true,
            mouseDrag: true,
            navText: [
                "<img src='assets/img/chevron-left.svg' alt='Previous'>",
                "<img src='assets/img/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.35,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },

                // 768: {
                //   items: 2,
                //   margin: 24
                // },

                1024: {
                    items: 4,
                    margin: 24
                },
                1200: {
                    items: 4,
                    margin: 16
                },
                1440: {
                    items: 4,
                    margin: 24
                }
            }
        });
    }

    function filterItems(filterClass) {
        $carousel.trigger('destroy.owl.carousel');
        $carousel.html('');

        var filteredItems = allItems.filter(filterClass);
        $carousel.append(filteredItems.clone());

        // Animate each item: fade in + slide from right with delay
        $carousel.children().each(function (index, el) {
            $(el).css({
                opacity: 0,
                transform: 'translateX(50px)',
            });

            setTimeout(function () {
                $(el).css({
                    transition: 'all 600ms ease',
                    opacity: 1,
                    transform: 'translateX(0)',
                });
            }, index * 100);
        });

        initOwl();
    }

    if ($filterBtns.length > 0) {
        // Filter buttons present → enable filtering
        var defaultFilter = $filterBtns.first().data('owl-filter');
        $filterBtns.removeClass('active');
        $filterBtns.first().addClass('active');
        filterItems(defaultFilter);

        $('.india_package .filters_tab').on('click', '.btn', function () {
            var filter = $(this).data('owl-filter');
            $filterBtns.removeClass('active');
            $(this).addClass('active');
            filterItems(filter);
        });
    } else {
        // No filter buttons → show all items
        $carousel.html('');
        $carousel.append(allItems.clone());
        initOwl();
    }
});


// ===============================
// Spiritual Journeys Slider with Filter
// ===============================
$(document).ready(function () {
    var $carousel = $('.spiritual_slide');
    var allItems = $carousel.children('.item_card').clone(); // store all items

    function initOwl() {
        $carousel.owlCarousel({
            autoplay: false,
            loop: false,
            nav: true,
            dots: false,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            touchDrag: true,
            mouseDrag: true,
            navText: [
                "<img src='assets/img/chevron-left.svg' alt='Previous'>",
                "<img src='assets/img/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.35,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },

                // 768: {
                //   items: 2,
                //   margin: 24
                // },

                1024: {
                    items: 3,
                    margin: 24
                },
                1200: {
                    items: 4,
                    margin: 16
                },
                1440: {
                    items: 4,
                    margin: 24
                }
            }
        });
    }

    function filterItems(filterClass) {
        $carousel.trigger('destroy.owl.carousel');
        $carousel.html('');

        var filteredItems = allItems.filter(filterClass);
        $carousel.append(filteredItems.clone());

        // Animate each item: fade in + slide from right with delay
        $carousel.children().each(function (index, el) {
            $(el).css({
                opacity: 0,
                transform: 'translateX(50px)', // slide from right
            });

            setTimeout(function () {
                $(el).css({
                    transition: 'all 600ms ease',
                    opacity: 1,
                    transform: 'translateX(0)',
                });
            }, index * 100); // staggered delay
        });

        initOwl();
    }

    // Default: Show North
    var defaultFilter = '.dham';
    $('.spiritual_package .filters_tab .btn').removeClass('active');
    $('.spiritual_package .filters_tab .btn[data-owl-filter="' + defaultFilter + '"]').addClass('active');
    filterItems(defaultFilter);

    // Filter button click
    $('.spiritual_package .filters_tab').on('click', '.btn', function () {
        var filter = $(this).data('owl-filter');

        $('.spiritual_package .filters_tab .btn').removeClass('active');
        $(this).addClass('active');

        filterItems(filter);
    });
});

// ===============================
// Offer Slider with Filters
// ===============================
/*
$(document).ready(function () {
    var $carousel = $('.offers_slide');
    var allItems = $carousel.children('.item_card').clone(); // store all items
    var $filterBtns = $('.offers_section .filters_tab .btn[data-owl-filter]');

    function initOwl() {
        $carousel.owlCarousel({
            autoplay: false,
            loop: false,
            nav: true,
            dots: false,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            touchDrag: true,
            mouseDrag: true,
            navText: [
                "<img src='assets/img/chevron-left.svg' alt='Previous'>",
                "<img src='assets/img/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.2,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 3,
                    margin: 16
                },
                1440: {
                    items: 3,
                    margin: 24
                }
            }
        });
    }

    function filterItems(filterClass) {
        $carousel.trigger('destroy.owl.carousel');
        $carousel.html('');

        var filteredItems = allItems.filter(filterClass);
        $carousel.append(filteredItems.clone());

        // Animate each item: fade in + slide from right with delay
        $carousel.children().each(function (index, el) {
            $(el).css({
                opacity: 0,
                transform: 'translateX(50px)',
            });

            setTimeout(function () {
                $(el).css({
                    transition: 'all 600ms ease',
                    opacity: 1,
                    transform: 'translateX(0)',
                });
            }, index * 100);
        });

        initOwl();
    }

    if ($filterBtns.length > 0) {
        // Filter buttons present → enable filtering
        var defaultFilter = $filterBtns.first().data('owl-filter');
        $filterBtns.removeClass('active');
        $filterBtns.first().addClass('active');
        filterItems(defaultFilter);

        $('.offers_section .filters_tab').on('click', '.btn', function () {
            var filter = $(this).data('owl-filter');
            $filterBtns.removeClass('active');
            $(this).addClass('active');
            filterItems(filter);
        });
    } else {
        // No filter buttons → show all items
        $carousel.html('');
        $carousel.append(allItems.clone());
        initOwl();
    }
});
*/
$(document).ready(function() {
	// $('.holidaysLPOffersForYou .filters_tab button[data-target=".tabOffersTabInternational"]').trigger("click");


	
  $('.tabOffersTabInternational .owl-carousel, .tabOffersTabIndaAround .owl-carousel').owlCarousel({
    autoplay: false,
    loop: false,
    nav: true,
    dots: false,
    autoplayTimeout: 7000,
    smartSpeed: 800,
    touchDrag: true,
    mouseDrag: true,
    navText: [
      "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
      "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
    ],
    responsive: {
      0: {
        items: 1.2,
        margin: 16,
        autoplay: true,
        loop: true
      },
      1024: {
        items: 2,
        margin: 24
      },
      1200: {
        items: 3,
        margin: 16
      },
      1440: {
        items: 3,
        margin: 24
      }
    }
  });
});


// ===============================
// Selling Slide with Filters
// ===============================
$(document).ready(function () {
    var $carousel = $('.selling_slide');
    var allItems = $carousel.children('.item_card').clone(); // store all items
    var $filterBtns = $('.selling_packages .filters_tab .btn[data-owl-filter]');

    function initOwl() {
        $carousel.owlCarousel({
            autoplay: false,
            loop: false,
            nav: true,
            dots: false,
            touchDrag: true,
            mouseDrag: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            navText: [
                "<img src='assets/img/chevron-left.svg' alt='Previous'>",
                "<img src='assets/img/chevron-right.svg' alt='Next'>"
            ],
            responsive: {
                0: {
                    items: 1.35,
                    margin: 16,
                    autoplay: true,
                    loop: true,
                },
                1024: {
                    items: 2,
                    margin: 24
                },
                1200: {
                    items: 3,
                    margin: 16
                },
                1440: {
                    items: 3,
                    margin: 24
                }
            }
        });
    }

    function filterItems(filterClass) {
        $carousel.trigger('destroy.owl.carousel');
        $carousel.html('');

        var filteredItems = allItems.filter(filterClass);
        $carousel.append(filteredItems.clone());

        // Animate each item: fade in + slide from right with delay
        $carousel.children().each(function (index, el) {
            $(el).css({
                opacity: 0,
                transform: 'translateX(50px)', // slide from right
            });

            setTimeout(function () {
                $(el).css({
                    transition: 'all 600ms ease',
                    opacity: 1,
                    transform: 'translateX(0)',
                });
            }, index * 100); // staggered delay
        });

        initOwl();
    }

    if ($filterBtns.length > 0) {
        // Filter buttons present → enable filtering
        var defaultFilter = $filterBtns.first().data('owl-filter');
        $filterBtns.removeClass('active');
        $filterBtns.first().addClass('active');
        filterItems(defaultFilter);

        // Filter button click
        $('.selling_packages .filters_tab').on('click', '.btn', function () {
            var filter = $(this).data('owl-filter');
            $filterBtns.removeClass('active');
            $(this).addClass('active');
            filterItems(filter);
        });
    } else {
        // No filter buttons → show all items
        $carousel.html('');
        $carousel.append(allItems.clone());
        initOwl();
    }
});

// ===============================
// Blogs Slide
// ===============================

$(document).ready(function () {
    // $('.blogs_slide').owlCarousel({
    //     autoplay: false,
    //     loop: false,
    //     nav: true,
    //     dots: false,
    //     autoplayTimeout: 7000,
    //     smartSpeed: 800,
    //     touchDrag: true,
    //     mouseDrag: true,
    //     navText: [
    //         "<img src='assets/img/chevron-left.svg' alt='Previous'>",
    //         "<img src='assets/img/chevron-right.svg' alt='Next'>"
    //     ],
    //     responsive: {
    //         0: {
    //             items: 1.12,
    //             margin: 16,
    //             autoplay: true,
    //             loop: true,
    //         },
    //         1024: {
    //             items: 3,
    //             margin: 24
    //         },
    //         1200: {
    //             items: 3,
    //             margin: 16
    //         },
    //         1440: {
    //             items: 3,
    //             margin: 24
    //         }
    //     }
    // });
});

// ===============================
// Managers Slide
// ===============================

$(document).ready(function () {
    $('.managers_slide').owlCarousel({
        autoplay: true,
        loop: false,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        navText: [
            "<img src='assets/img/chevron-left.svg' alt='Previous'>",
            "<img src='assets/img/chevron-right.svg' alt='Next'>"
        ],
        responsive: {
            0: {
                items: 1.3,
                margin: 20,
                loop: true,
            },
            1024: {
                items: 3,
                margin: 24
            },
            1300: {
                items: 3,
                margin: 24
            }
        }
    });
});

// ===============================
// Navigation Menu Image Switcher
// ===============================

// $(document).ready(function () {
//     function switchImage($img, from, to) {
//         const src = $img.attr("src");
//         if (src && src.includes(from)) {
//             $img.attr("src", src.replace(from, to));
//         }
//     }

//     const $navItems = jQuery(".header .nav-item");
//     const $firstNav = $navItems.first();

//     // First parent active by default
//     $navItems.removeClass("active");
//     $firstNav.addClass("active");
//     switchImage($firstNav.find("> a > span > img"), "-01.svg", "-02.svg");

//     // Parent click behavior
//     $navItems.on("click", function (e) {
//         // e.preventDefault();

//         $navItems.removeClass("active");
//         $navItems.find("> a > span > img").each(function () {
//             switchImage(jQuery(this), "-02.svg", "-01.svg");
//         });

//         jQuery(this).addClass("active");
//         switchImage(jQuery(this).find("> a > span > img"), "-01.svg", "-02.svg");

//         jQuery(".sub-menu .dropdown-item").removeClass("active");
//         jQuery(".sub-menu .dropdown-item img").each(function () {
//             switchImage(jQuery(this), "-02.svg", "-01.svg");
//         });
//     });

//     // Parent hover image change only if not active
//     $navItems.hover(
//         function () {
//             const $img = jQuery(this).find("> a > span > img");
//             if (!jQuery(this).hasClass("active")) {
//                 switchImage($img, "-01.svg", "-02.svg");
//             }
//         },
//         function () {
//             const $img = jQuery(this).find("> a > span > img");
//             if (!jQuery(this).hasClass("active")) {
//                 switchImage($img, "-02.svg", "-01.svg");
//             }
//         }
//     );

//     // Child hover image change only (no class toggle)
//     jQuery(".sub-menu .dropdown-item").hover(
//         function () {
//             const $img = jQuery(this).find("img").first();
//             if (!jQuery(this).hasClass("active")) {
//                 switchImage($img, "-01.svg", "-02.svg");
//             }
//         },
//         function () {
//             const $img = jQuery(this).find("img").first();
//             if (!jQuery(this).hasClass("active")) {
//                 switchImage($img, "-02.svg", "-01.svg");
//             }
//         }
//     );

//     // Child click: set active class and change image for clicked child only
//     jQuery(".sub-menu .dropdown-item").on("click", function (e) {
//         e.preventDefault();

//         jQuery(".sub-menu .dropdown-item").removeClass("active");
//         jQuery(".sub-menu .dropdown-item img").each(function () {
//             switchImage(jQuery(this), "-02.svg", "-01.svg");
//         });

//         jQuery(this).addClass("active");
//         const $img = jQuery(this).find("img").first();
//         switchImage($img, "-01.svg", "-02.svg");
//     });

//     // Outside click to close only dropdown nav-items
//     $(document).on("click", function (e) {
//         const $target = $(e.target);
//         const $dropdownParents = $(".header .nav-item.has-dropdown");

//         if (
//             !$target.closest(".header .nav-item.has-dropdown").length &&
//             !$target.closest(".sub-menu .dropdown-item").length
//         ) {
//             $dropdownParents.removeClass("active");
//             $dropdownParents.find("> a > span > img").each(function () {
//                 switchImage($(this), "-02.svg", "-01.svg");
//             });

//             $(".sub-menu .dropdown-item").removeClass("active");
//             $(".sub-menu .dropdown-item img").each(function () {
//                 switchImage($(this), "-02.svg", "-01.svg");
//             });
//         }
//     });

// });

$(document).ready(function () {
    function switchImage($img, from, to) {
        const src = $img.attr("src");
        if (src && src.includes(from)) {
            $img.attr("src", src.replace(from, to));
        }
    }

    const $navItems = $(".header .nav-item");
    const $firstNav = $navItems.first();

    // Set first nav active
    $navItems.removeClass("active");
    $firstNav.addClass("active");
    switchImage($firstNav.find("> a > span > img"), "-01.svg", "-02.svg");

    // Handle top-level nav item click
    $navItems.on("click", function (e) {
        e.stopPropagation();

        // Reset all navs
        $navItems.removeClass("active");
        $navItems.find("> a > span > img").each(function () {
            switchImage($(this), "-02.svg", "-01.svg");
        });

        // Set current active
        $(this).addClass("active");
        switchImage($(this).find("> a > span > img"), "-01.svg", "-02.svg");

        // Close all submenus
        $(".submenu-list .dropdown-item").removeClass("active");
        $(".submenu-list").removeClass("open");
        $(".submenu-list .dropdown-item img").each(function () {
            switchImage($(this), "-02.svg", "-01.svg");
        });
    });

    // Handle sub-menu and nested-dropdown item click
    $(".submenu-list .dropdown-item").on("click", function (e) {
        e.preventDefault();
        e.stopPropagation();

        const $clicked = $(this);
        const $submenu = $clicked.closest(".submenu-list");
        const $allDropdownItems = $submenu.find(".dropdown-item");
        const $clickedImg = $clicked.find("img").first();

        const isNested = $clicked.closest(".nested-dropdown").length > 0;
        const isActive = $clicked.hasClass("active");

        if (isNested) {
            const $nestedDropdown = $clicked.closest(".nested-dropdown");

            if (isActive) {
                // Toggle off
                $clicked.removeClass("active");
                $nestedDropdown.removeClass("open");
                switchImage($clickedImg, "-02.svg", "-01.svg");
            } else {
                // Remove all actives from this nested-dropdown only
                $nestedDropdown.find(".dropdown-item").removeClass("active").find("img").each(function () {
                    switchImage($(this), "-02.svg", "-01.svg");
                });

                // Add active and open
                $clicked.addClass("active");
                $nestedDropdown.addClass("open");
                $clicked.parents(".dropdown-item").addClass("active");
                switchImage($clickedImg, "-01.svg", "-02.svg");
            }

        } else {
            if (isActive) {
                // Toggle off
                $clicked.removeClass("active");
                $clicked.next(".nested-dropdown").removeClass("open");
                switchImage($clickedImg, "-02.svg", "-01.svg");
            } else {
                // Remove all others
                $allDropdownItems.not($clicked).removeClass("active").find("img").each(function () {
                    switchImage($(this), "-02.svg", "-01.svg");
                });

                // Add active
                $clicked.addClass("active");
                switchImage($clickedImg, "-01.svg", "-02.svg");

                // Open nested dropdown if exists
                const $childDropdown = $clicked.next(".nested-dropdown");
                if ($childDropdown.length) {
                    $childDropdown.addClass("open");
                }
            }
        }
    });



    // Hover effects
    $(".submenu-list .dropdown-item").hover(
        function () {
            const $img = $(this).find("img").first();
            if (!$(this).hasClass("active")) {
                switchImage($img, "-01.svg", "-02.svg");
            }
        },
        function () {
            const $img = $(this).find("img").first();
            if (!$(this).hasClass("active")) {
                switchImage($img, "-02.svg", "-01.svg");
            }
        }
    );

    $navItems.hover(
        function () {
            const $img = $(this).find("> a > span > img");
            if (!$(this).hasClass("active")) {
                switchImage($img, "-01.svg", "-02.svg");
            }
        },
        function () {
            const $img = $(this).find("> a > span > img");
            if (!$(this).hasClass("active")) {
                switchImage($img, "-02.svg", "-01.svg");
            }
        }
    );

    // Close on outside click
    $(document).on("click", function (e) {
        if (
            !$(e.target).closest(".header .nav-item").length &&
            !$(e.target).closest(".submenu-list").length
        ) {
            $navItems.removeClass("active");
            $navItems.find("> a > span > img").each(function () {
                switchImage($(this), "-02.svg", "-01.svg");
            });

            $(".submenu-list .dropdown-item").removeClass("active");
            $(".submenu-list").removeClass("open");
            $(".submenu-list .dropdown-item img").each(function () {
                switchImage($(this), "-02.svg", "-01.svg");
            });
        }
    });
});


// ===============================
// FAQ Accordion: Toggle active class based on clicked accordion button
// ===============================
$(document).ready(function () {
    jQuery('.faq_section .accordion-button').on('click', function () {
        jQuery('.faq_section .accordion-item').removeClass('active');
        let parentItem = jQuery(this).closest('.accordion-item');
        if (!jQuery(this).hasClass('collapsed')) {
            parentItem.addClass('active');
        }
    });
});

// ===============================
// Card Block Responsive Hover and Click Effects
// ===============================
$(document).ready(function () {
    var imgs = jQuery('.card_block');
    var firstItem = imgs.first();
    var lastHovered = firstItem; // Initially, first image is active
    var isMobile = window.innerWidth <= 768;

    function applyStyles() {
        imgs.css({
            'transition': isMobile ? 'height 0.6s ease-in-out' : 'width 0.6s ease-in-out'
        });

        if (isMobile) {
            firstItem.css('height', '438px').addClass('active');
            firstItem.siblings().css('height', '100px').removeClass('active');

            imgs.off('mouseenter mouseleave click').on('click', function () {
                imgs.css('height', '100px').removeClass('active');
                jQuery(this).css('height', '438px').addClass('active');
                lastHovered = jQuery(this);
            });

        } else {
            firstItem.css('width', '33.37%').addClass('active');
            firstItem.siblings().css('width', '17.212%').removeClass('active');

            imgs.off('mouseenter mouseleave click').on('mouseenter', function () {
                imgs.css('width', '17.212%').removeClass('active');
                jQuery(this).css('width', '33.37%').addClass('active');
                lastHovered = jQuery(this);
            });

            jQuery('.image_grid').off('mouseleave').on('mouseleave', function () {
                if (lastHovered.length) {
                    imgs.css('width', '17.212%').removeClass('active');
                    lastHovered.css('width', '33.37%').addClass('active');
                }
            });
        }
    }

    function checkViewport() {
        var newIsMobile = window.innerWidth <= 768;
        if (newIsMobile !== isMobile) {
            isMobile = newIsMobile;
            imgs.removeAttr('style').removeClass('active'); // Reset styles
            firstItem = imgs.first(); // Reset first item
            lastHovered = firstItem; // Reset last hovered
            applyStyles();
        }
    }

    applyStyles();
    jQuery(window).resize(checkViewport);
});

// ===============================
// Owl Carousel Initialization for Explorer Slide
// ===============================
$(document).ready(function () {
    var owl = $('.explorer_slide').owlCarousel({
        autoplay: false,
        margin: 0,
        center: true,
        loop: true,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        navText: [
            "<img src='assets/img/chevron-left-ex.svg' alt='Previous'>",
            "<img src='assets/img/chevron-right-ex.svg' alt='Next'>"
        ],
        responsive: {
            0: {
                items: 1,
                stagePadding: 28,
                margin: 28,
            },
            1024: {
                items: 2,
            },
            1300: {
                items: 3,
            }
        }
    });
});

// ===============================
// Custom Video Controls: Play/Pause, Mute, Fullscreen, Time Display and Auto-hide Controls
// ===============================
$(document).ready(function () {
    const $video = $("#video");
    const $playPauseBtn = $("#playPauseBtn");
    const $muteBtn = $("#muteBtn");
    const $muteIcon = $("#muteIcon");
    const $fullscreenBtn = $("#fullscreenBtn");
    const $timeDisplay = $("#time");
    const $videoContainer = $(".video_container");

    let controlsTimeout;

    function hideControls() {
        if (!$video[0].paused) {
            $videoContainer.addClass("hide-controls");
        }
    }

    function showControls() {
        $videoContainer.removeClass("hide-controls");

        if (!$video[0].paused) {
            clearTimeout(controlsTimeout);
            controlsTimeout = setTimeout(hideControls, 2000);
        }
    }

    // Play/Pause Button
    $playPauseBtn.on("click", function () {
        if ($video[0].paused) {
            $video[0].play();
            $playPauseBtn.html('<img src="../images/tcHolidays/holidaysLP/YourDailyDose/pause.svg" alt="Pause">');
            showControls();
        } else {
            $video[0].pause();
            $playPauseBtn.html('<img src=" ../images/tcHolidays/holidaysLP/YourDailyDose/play.svg" alt="Play">');
            showControls();
        }
    });

    // Mute/Unmute Button
    $muteBtn.on("click", function () {
        $video[0].muted = !$video[0].muted;
        $muteIcon.attr("src", $video[0].muted ? "assets/img/volume-x.svg" : "assets/img/volume-max.svg");
        showControls();
    });

    // Fullscreen Button
    $fullscreenBtn.on("click", function () {
        if (!document.fullscreenElement) {
            $video[0].requestFullscreen();
        } else {
            document.exitFullscreen();
        }
        showControls();
    });

    // Time Update
    $video.on("timeupdate", function () {
        const minutes = Math.floor($video[0].currentTime / 60);
        const seconds = Math.floor($video[0].currentTime % 60);
        $timeDisplay.text('${minutes}:${seconds < 10 ? "0" : ""}${seconds}');
    });

    // Auto-hide Controls on Play
    $video.on("play", showControls);

    // Ensure Controls Stay Visible on Pause
    $video.on("pause", function () {
        $videoContainer.removeClass("hide-controls");
    });

    // Show Controls on Mouse Move
    $videoContainer.on("mousemove", showControls);

    // Hide Controls after 2 seconds if playing
    controlsTimeout = setTimeout(hideControls, 2000);
});

// ===============================
// Instagram Slide Owl Carousel Initialization and Navigation State Management
// ===============================
$(document).ready(function () {
    var owl = jQuery(".ig_slide").owlCarousel({
        autoplayHoverPause: true,
        nav: false,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        responsive: {
            0: {
                items: 1.22,
                margin: 24,
                center: true,
                loop: true,
                dots: true,
            },
            // 768: {
            //   items: 2,
            // },
            1024: {
                items: 2,
                margin: 28,
            },
            1200: {
                items: 3,
                margin: 16,
            },
            1440: {
                items: 3,
                margin: 28,
            }
        }
    });

    function updateNavState(event) {
        $(".owl-prevIg").toggleClass("disabled", event.item.index === 0);
        $(".owl-nextIg").toggleClass("disabled", event.item.index + event.page.size >= event.item.count);
    }

    jQuery(".owl-prevIg, .owl-nextIg").click(function () {
        owl.trigger($(this).hasClass("owl-prevIg") ? "prev.owl.carousel" : "next.owl.carousel");
    });

    // Initial state update on load
    owl.on("initialized.owl.carousel", function (event) {
        updateNavState(event);
        $(".owl-prevIg").addClass("disabled"); // On window load, prev button disable rahega
    });

    owl.on("translated.owl.carousel", updateNavState);
});

// ===============================
// Custom Search Modal: Show, Hide, Filter Search Results, and Clear Input
// ===============================
$(document).ready(function () {
    let ignoreOutsideClick = false;

    const $body = $('body'),
        $searchInput = $('.searchInput'),
        $searchPopup = $('.search_popup'),
        $searchCard = $('.search_card'),
        $topItem = $('.top_item'),
        $resultBox = $('.result_box'),
        $btnCross = $('.btn_cross'),
        $btnBack = $('.btn_back');

    //const $noResultsMessage = $('<div class="no-results">No results found</div>').hide();
    //$searchCard.append($noResultsMessage);

    function showSearchModal() {
        ignoreOutsideClick = true; // ✅ temporarily ignore click
        setTimeout(() => ignoreOutsideClick = false, 300); // ✅ after 300ms allow again

        if ($('.custom-backdrop').length === 0) {
            $body.append('<div class="custom-backdrop fade" data-backdrop-for="search"></div>');
        }

        const $backdrop = $('.custom-backdrop[data-backdrop-for="search"]');
        $backdrop.addClass('show').fadeIn(300);

        if (!$body.hasClass('modal-open')) {
            $body.attr('data-search-open', 'true').css({
                overflow: 'hidden',
                paddingRight: window.innerWidth > 768 ? '15px' : ''
            });
        }

        $searchPopup.show();
        setTimeout(() => $searchPopup.addClass('show'), 10);
    }

    function hideSearchModal() {
        const $backdrop = $('.custom-backdrop[data-backdrop-for="search"]');
        $backdrop.removeClass('show').fadeOut(300, function () {
            $(this).remove();

            // Animation complete hone ke baad hi body ki styling remove karen
            if ($body.attr('data-search-open') === 'true' && !$body.hasClass('modal-open')) {
                $body.removeAttr('style');
                $body.removeAttr('data-search-open');
            }
        });

        $searchPopup.removeClass('show');
        setTimeout(() => $searchPopup.hide(), 300);
    }


    // 🔍 Input focus triggers popup
    $searchInput.on('focus', function () {
        showSearchModal();
        if (!this.value.trim()) {
            $topItem.show();
            $resultBox.hide();
        }
    });

    // ⌨️ Input typing logic
    $searchInput.on('input', function () {
        const query = this.value.toLowerCase().trim();
        $btnCross.toggle(query.length > 0);
        $topItem.toggle(!query.length);
        $resultBox.toggle(!!query.length);

        let hasResults = false;
        $resultBox.each(function () {
            const $items = $(this).find('ul li');
            const matches = $items.filter((_, li) =>
                $(li).text().toLowerCase().includes(query)
            );

            $items.hide().filter(matches).show();
            $(this).toggle(matches.length > 0);
            if (matches.length > 0) hasResults = true;
        });

        //$noResultsMessage.toggle(!hasResults && query.length > 0);
    });

    // ❌ Clear input
    $btnCross.on('click', function () {
        $searchInput.val('').trigger('input').focus();
    });

    // 📄 Click outside to close (but ignore right after open)
    $(document).on('click', function (e) {
        if (ignoreOutsideClick) return;
        if (!$(e.target).closest('.search_popup').length &&
            $('.custom-backdrop[data-backdrop-for="search"]').length) {
            hideSearchModal();
        }
    });

    // 🟤 Click on backdrop also closes
    $(document).on('click', '.custom-backdrop[data-backdrop-for="search"]', hideSearchModal);

    // 🔙 Back button
    $btnBack.on("click", function (e) {
        e.preventDefault();
        hideSearchModal();
    });
});


// ===============================
// Filters Tab Slider: Slider Position and Width Update on Button Click
// ===============================
$(document).ready(function () {
    $(".filters_tab").each(function () {
        const $tab = $(this);
        const $slider = $tab.find(".slider");
        const $buttons = $tab.find(".btn");

        // Agar koi button pehle se active nahi hai toh pehla button active kar do by default
        if ($buttons.filter(".active").length === 0) {
            $buttons.first().addClass("active");
        }

        function updateSlider($btn) {
            if ($btn.length) {
                $slider.css({
                    left: $btn.position().left + "px",
                    width: $btn.outerWidth() + "px"
                });
            }
        }

        // Initialize slider position on the active button
        updateSlider($buttons.filter(".active"));

        // Button click event per slider update and active class set karo
        $buttons.on("click", function () {
            $buttons.removeClass("active");
            const $thisBtn = $(this);
            $thisBtn.addClass("active");
            updateSlider($thisBtn);
        });

        // Window resize par bhi slider update karna zaruri hota hai
        $(window).on('resize', function () {
            updateSlider($buttons.filter(".active"));
        });
    });
});

// ===============================
// Why Thomas Cook Slide Owl Carousel: Responsive Initialization and Destroy on Resize
// ===============================
$(document).ready(function () {
    function initOwlCarousel() {
        if (jQuery(window).width() <= 767) {
            if (!jQuery(".wtc_slide").hasClass("owl-loaded")) {
                jQuery(".wtc_slide").addClass("owl-loaded").owlCarousel({
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
            jQuery(".wtc_slide").removeClass("owl-loaded").trigger("destroy.owl.carousel");
        }
    }

    initOwlCarousel();
    jQuery(window).resize(function () {
        initOwlCarousel();
    });
});


// ===============================
// TCP Slide Owl Carousel: Responsive Initialization and Destroy on Resize
// ===============================
$(document).ready(function () {
    function initOwlCarousel() {
        if (jQuery(window).width() <= 767) {
            if (!jQuery(".tcp_slide").hasClass("owl-loaded")) {
                jQuery(".tcp_slide").addClass("owl-loaded").owlCarousel({
                    items: 1,
                    margin: 8,
                    nav: false,
                    dots: true,
                    autoplayTimeout: 7000,
                    smartSpeed: 800,
                });
            }
        } else {
            jQuery(".tcp_slide").removeClass("owl-loaded").trigger("destroy.owl.carousel");
        }
    }

    initOwlCarousel();
    jQuery(window).resize(function () {
        initOwlCarousel();
    });
});

// ===============================
// TD Slide Owl Carousel: Responsive Initialization and Destroy on Resize
// ===============================
$(document).ready(function () {
    function initOwlCarousel() {
        if (jQuery(window).width() <= 767) {
            if (!jQuery(".td_slide").hasClass("owl-loaded")) {
                jQuery(".td_slide").addClass("owl-loaded").owlCarousel({
                    items: 2.4,
                    margin: 24,
                    autoplay: false,
                    loop: true,
                    center: true,
                    nav: false,
                    dots: false,
                    autoplayTimeout: 7000,
                    smartSpeed: 800,
                });
            }
        } else {
            jQuery(".td_slide").removeClass("owl-loaded").trigger("destroy.owl.carousel");
        }
    }

    initOwlCarousel();
    jQuery(window).resize(function () {
        initOwlCarousel();
    });
});

// ===============================
// Tourism Board Partners Slide Owl Carousel with Responsive Settings
// ===============================
$(document).ready(function () {
    var owl = $('.tourism_slide').owlCarousel({
        autoplay: true,
        loop: true,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        responsive: {
            0: {
                items: 1.15,
                margin: 8,
                dots: true,
                center: true,
            },
            1024: {
                items: 2,
                margin: 28,
            },
            1200: {
                items: 1,
                margin: 16,
                stagePadding: 180,
            },
            1440: {
                items: 1,
                margin: 3,
                stagePadding: 242,
            }
        }
    });
});

// ===============================
// Wildlife Slide Owl Carousel with Fade Animations
// ===============================
$(document).ready(function () {
    var owl = $('.wildlife_slide').owlCarousel({
        autoplay: false,
        items: 1,
        loop: true,
        nav: false,
        dots: true,
        autoplayTimeout: 5000,
        smartSpeed: 800,
        // animateOut: 'fadeOut',
        // animateIn: 'fadeIn',
    });
});


// ===============================
// Customer Slide Owl Carousel: Centered and Responsive
// ===============================
$(document).ready(function () {
    var owl = $('.customer_slide').owlCarousel({
        autoplay: false,
        center: true,
        loop: true,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        responsive: {
            0: {
                items: 1,
                stagePadding: 14,
                margin: 28,
            },
            1024: {
                items: 2,
            },
            1200: {
                items: 3.2,
                margin: 16,
            },
            1440: {
                items: 3.5,
                margin: 24,
            }
        }
    });
});

// ===============================
// Back to Top Button Smooth Scroll
// ===============================
$(document).ready(function () {
    $('.back_toTop').click(function () {
        $("html, body").animate({ scrollTop: "0" }, 500);
    });
});

// ===============================
// Sort Dropdown Toggle and Selection Handling
// ===============================
$(document).ready(function () {
    jQuery('.sort_selected').on('click', function () {
        jQuery('.sort_dropdown').toggleClass('active');
        jQuery('.sort_options').slideToggle(200);
    });

    jQuery('.sort_options li').on('click', function () {
        var selectedText = jQuery(this).text();
        jQuery('.selected_option').text(selectedText);

        jQuery('.sort_options li').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.sort_options').slideUp(200);
        jQuery('.sort_dropdown').removeClass('active');
    });

    jQuery(document).on('click', function (e) {
        if (!jQuery(e.target).closest('.sort_dropdown').length) {
            jQuery('.sort_options').slideUp(200);
            jQuery('.sort_dropdown').removeClass('active');
        }
    });

    jQuery('.short_filter .btn').on('click', function () {
        $(this).siblings('.sort_option').slideToggle(300);
    });

    // Optional: close dropdown if clicked outside
    jQuery(document).on('click', function (e) {
        if (!$(e.target).closest('.short_filter').length) {
            $('.sort_option').slideUp(300);
        }
    });
});

// ---------------------------
// Read More / Read Less Toggle
// ---------------------------
$(document).ready(function () {
    $('.read-more').click(function () {
        $('.read_moreText').slideToggle();
        let span = $(this).find('span');
        let img = $(this).find('.arrow_icon');

        if (span.text() === "Read More") {
            span.text("Read Less");
            img.css('transform', 'rotate(180deg)');
        } else {
            span.text("Read More");
            img.css('transform', 'rotate(0deg)');
        }
    });
});

// ---------------------------
// Language Dropdown (Mobile + Desktop)
// ---------------------------
// $(document).ready(function () {
//     const locales = [
//         "en-GB", "ar-SA", "zh-CN", "de-DE", "es-ES", "fr-FR", "hi-IN", "it-IT",
//         "in-ID", "ja-JP", "ko-KR", "nl-NL", "no-NO", "pl-PL", "pt-BR",
//         "sv-SE", "fi-FI", "th-TH", "tr-TR", "uk-UA", "vi-VN", "ru-RU", "he-IL"
//     ];

//     function getFlagSrc(countryCode) {
//         return /^[A-Z]{2}$/.test(countryCode)
//             ? `https://flagsapi.com/${countryCode.toUpperCase()}/shiny/64.png`
//             : "";
//     }

//     function initLanguageDropdown(dropdownBtnId, dropdownContentId) {
//         const dropdownBtn = document.getElementById(dropdownBtnId);
//         const dropdownContent = document.getElementById(dropdownContentId);
//         if (!dropdownBtn || !dropdownContent) return;

//         function setSelectedLocale(locale) {
//             const intlLocale = new Intl.Locale(locale);
//             const langCode = intlLocale.language.toUpperCase();
//             dropdownContent.innerHTML = "";

//             const otherLocales = locales.filter((loc) => loc !== locale);
//             otherLocales.forEach((otherLocale) => {
//                 const otherIntlLocale = new Intl.Locale(otherLocale);
//                 const otherLangName = new Intl.DisplayNames([otherLocale], {
//                     type: "language",
//                 }).of(otherIntlLocale.language);

//                 const listEl = document.createElement("li");
//                 listEl.innerHTML = `<img src="${getFlagSrc(otherIntlLocale.region)}" /> ${otherLangName}`;
//                 listEl.value = otherLocale;
//                 listEl.addEventListener("mousedown", function () {
//                     setSelectedLocale(otherLocale);
//                 });
//                 dropdownContent.appendChild(listEl);
//             });

//             dropdownBtn.innerHTML = `<span><img src="assets/img/globe.svg"></span> ${langCode}`;
//         }

//         setSelectedLocale(locales[0]);

//         const browserLang = new Intl.Locale(navigator.language).language;
//         for (const locale of locales) {
//             const localeLang = new Intl.Locale(locale).language;
//             if (localeLang === browserLang) {
//                 setSelectedLocale(locale);
//             }
//         }
//     }

//     initLanguageDropdown("dropdown-btn-mobile", "dropdown-content-mobile");
//     initLanguageDropdown("dropdown-btn-desktop", "dropdown-content-desktop");
// });

// ---------------------------
// Custom Video Player (Play/Pause + Control Hide)
// ---------------------------
$(document).ready(function () {
    const $allVideos = $("video");

    $(".video-container").each(function () {
        const $videoContainer = $(this);
        const $video = $videoContainer.find("video");
        const $playPauseBtn = $videoContainer.find(".play-pause-btn");
        const $playPauseIcon = $videoContainer.find(".play-pause-btn img");
        const $overlay = $videoContainer.find(".overlay");

        let hideTimeout;
        let isHovered = false;

        function hideControls() {
            clearTimeout(hideTimeout);
            hideTimeout = setTimeout(() => {
                if (!$video[0].paused && !isHovered) {
                    $videoContainer.addClass("control-hide");
                }
            }, 2000);
        }

        $playPauseBtn.on("click", function () {
            if ($video[0].paused) {
                $allVideos.each(function () {
                    this.pause();
                    $(this).closest(".video-container").find(".play-pause-btn img").attr("src", "../images/tcHolidays/holidaysLP/YourDailyDose/play.svg");
                });

                $video[0].play();
                $playPauseIcon.attr("src", "../images/tcHolidays/holidaysLP/YourDailyDose/pause.svg");
                hideControls();
            } else {
                $video[0].pause();
                $playPauseIcon.attr("src", "../images/tcHolidays/holidaysLP/YourDailyDose/play.svg");
                $overlay.fadeIn();
                $videoContainer.removeClass("control-hide");
            }
        });

        $video.on("play", function () {
            hideControls();
        });

        $video.on("pause", function () {
            $videoContainer.removeClass("control-hide");
        });

        $videoContainer.on("mouseenter", function () {
            isHovered = true;
            $videoContainer.removeClass("control-hide");
        });

        $videoContainer.on("mouseleave", function () {
            isHovered = false;
            hideControls();
        });
    });
});

// ---------------------------
// Typing Effect in Search Placeholder
// ---------------------------
$(document).ready(function () {
    const dataLists = {
        default: ["Dubai", "USA", "India", "Japan", "France", "Canada"],
        domestic: ["Delhi", "Mumbai", "Bangalore", "Hyderabad", "Chennai", "Kolkata"],
        international: ["USA", "UK", "Australia", "Japan", "France", "Germany", "Canada"]
    };

    document.querySelectorAll(".searchInput").forEach((input) => {
        const type = input.getAttribute("data-type") || "default";
        const countries = dataLists[type];
        if (!countries) return;

        let index = 0;
        let charIndex = 0;
        let isDeleting = false;

        function typeEffect() {
            const currentText = countries[index];

            if (isDeleting) {
                input.placeholder = 'Search “' + currentText.substring(0, charIndex - 1) + '”';
            } else {
                input.placeholder = 'Search “' + currentText.substring(0, charIndex + 1) + '”';
            }

            if (!isDeleting && charIndex === currentText.length) {
                isDeleting = true;
                setTimeout(typeEffect, 1000);
            } else if (isDeleting && charIndex === 0) {
                isDeleting = false;
                index = (index + 1) % countries.length;
                setTimeout(typeEffect, 500);
            } else {
                charIndex += isDeleting ? -1 : 1;
                setTimeout(typeEffect, isDeleting ? 70 : 120);
            }
        }

        typeEffect();
    });
});


// ---------------------------
// App Strip Close Button
// ---------------------------
$(document).ready(function () {
    $("#closeBtn").on("click", function () {
        $(".app_strip").animate({ top: "-100px", opacity: 0 }, 300, function () {
            $(this).hide();
        });
    });
});


// --------------------------------
// Login Popup - Step Switcher, OTP Input, Button Enable
// --------------------------------
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

// ---------------------------
// Datepicker Initialization
// ---------------------------
$(document).ready(function () {
    $('.datepick').datepicker({
        format: 'dd M, yyyy', // → 21 Apr, 1998
        autoclose: true
    });
});

// ---------------------------
// Modal Switcher (Login <-> Register)
// ---------------------------
$(document).ready(function () {
    $('#loginModal').removeClass('show').hide();
    $('#registerModal').removeClass('show').hide();

    $('#loginModal a[data-bs-toggle="modal"][data-bs-target="#registerModal"]').on('click', function (e) {
        e.preventDefault();
        $('#loginModal').modal('hide');
        $('#registerModal').modal('show');
    });

    $('#registerModal a[href=""]').on('click', function (e) {
        e.preventDefault();
        $('#registerModal').modal('hide');
        $('#loginModal').modal('show');
    });
});

// ---------------------------
// Custom Select Dropdown
// ---------------------------
$(document).ready(function () {
    $('.select_dropdown').each(function () {
        var $this = $(this);
        var $wrapper = $this.closest('.select_wrapper');
        var $options = $this.find('option');

        $this.addClass('hide-select');

        // ✅ Conditionally add readonly
        var isStateSelect = $this.hasClass('select_state');
        var readonlyAttr = isStateSelect ? '' : 'readonly';
        $this.after('<input type="text" class="custom_select" autocomplete="off" ${readonlyAttr}>');

        var $customSelect = $this.next('.custom_select');
        var $optionList = $('<ul class="select_options" />').insertAfter($customSelect);

        $options.each(function () {
            var $opt = $(this);
            if (!$opt.prop('hidden')) {
                var listItem = $('<li />', {
                    'data-val': $opt.val(),
                    class: $opt.prop('disabled') ? 'disabled' : ''
                });

                var optionHTML = $opt.html();
                listItem.html(optionHTML);
                $optionList.append(listItem);
            }
        });

        var $optionItems = $optionList.find('li');

        $customSelect.on('focus click', function (e) {
            e.stopPropagation();
            $('.custom_select').not(this).removeClass('active')
                .next('.select_options').slideUp()
                .prev('.custom_select').closest('.select_wrapper').removeClass('active');

            $(this).addClass('active').next('.select_options').slideDown();
            $(this).closest('.select_wrapper').addClass('active');
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

        $optionItems.on('click', function (e) {
            e.stopPropagation();
            if ($(this).hasClass('disabled')) return;

            var value = $(this).data('val');
            var labelText = $(this).clone().children().remove().end().text().replace(/\s+/g, ' ').trim();

            $customSelect.val(labelText);
            $this.val(value).trigger('change');
            $optionList.slideUp();

            $wrapper.addClass('filled').removeClass('active');
            $customSelect.removeClass('active');
        });

        $(document).on('click', function () {
            $('.custom_select').removeClass('active');
            $('.select_options').slideUp();
            $('.select_wrapper').removeClass('active');
        });

        // ✅ Set value if already selected on load
        if ($this.val()) {
            $wrapper.addClass('filled');
            var selectedOption = $this.find('option:selected');
            var selectedText = selectedOption.clone().children().remove().end().text().replace(/\s+/g, ' ').trim();
            $customSelect.val(selectedText);
        }
    });
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
// Grid / List View Toggle & Filter Button
// ---------------------------
// $(document).ready(function () {
//     $('.tour_packages').each(function () {
//         const $section = $(this);
//         const $gridBtns = $section.find('.gridlist_buttons .btn:first-child');
//         const $listBtns = $section.find('.gridlist_buttons .btn:last-child');
//         const $filterBtn = $section.find('.filter_btn');
//         const $packageGrids = $section.find('.package_grids');
//         const $filterBlock = $section.find('.filter_block');
//         const $filterCards = $section.find('.filter_andCards');
//         const $allFilter = $section.find('.all_filters');
//         const $owl = $section.find('.package_grids .owl-carousel');

//         function refreshOwl() {
//             if ($owl.hasClass('owl-loaded')) {
//                 $owl.trigger('refresh.owl.carousel');
//             }
//         }

//         function activateGrid() {
//             $gridBtns.addClass('active');
//             $listBtns.removeClass('active');
//             $filterBtn?.removeClass('active list').addClass('grid');

//             $packageGrids.removeClass('list').addClass('grid');
//             $packageGrids.find('.col-12, .col-lg-6').removeClass('col-12 col-lg-6').addClass('col-lg-4 col-md-4');

//             $allFilter.removeClass('active').hide();
//             $filterBlock.removeClass('grid-with-filter').addClass('grid-reset');
//             $filterCards.removeClass('grid-with-filter').addClass('grid-default');

//             refreshOwl();
//         }

//         function activateList() {
//             $listBtns.addClass('active');
//             $gridBtns.removeClass('active');
//             $filterBtn?.removeClass('grid').addClass('list active');

//             $packageGrids.removeClass('grid').addClass('list');
//             $packageGrids.find('.col-lg-4, .col-md-4, .col-lg-6').removeClass('col-lg-4 col-md-4 col-lg-6').addClass('col-12');

//             $allFilter.addClass('active').show();
//             $filterBlock.removeClass('grid-reset').addClass('grid-with-filter');
//             $filterCards.removeClass('grid-default').addClass('grid-with-filter');

//             refreshOwl();
//         }

//         // Grid button clicked
//         $gridBtns.on('click', function () {
//             activateGrid();
//         });

//         // List button clicked
//         $listBtns.on('click', function () {
//             activateList();
//         });

//         // Filter toggle button
//         $filterBtn?.on('click', function () {
//             const isFilterActive = $(this).hasClass('active');

//             if (!isFilterActive) {
//                 // Enable filter mode
//                 $filterBtn.addClass('active');
//                 $allFilter.addClass('active').show();
//                 $filterBlock.removeClass('grid-reset').addClass('grid-with-filter');
//                 $filterCards.removeClass('grid-default').addClass('grid-with-filter');

//                 if ($listBtns.hasClass('active')) {
//                     $packageGrids.find('[class*="col-"]').removeClass('col-lg-3 col-lg-4 col-lg-6 col-12').addClass('col-12');
//                     $filterBtn.removeClass('grid').addClass('list');
//                 } else {
//                     $packageGrids.find('[class*="col-"]').removeClass('col-lg-3 col-lg-4 col-lg-6 col-12').addClass('col-lg-6');
//                     $filterBtn.removeClass('list').addClass('grid');
//                 }

//                 // Backdrop logic (same as menu)
//                 if (window.innerWidth <= 767) {
//                     if ($('.custom-backdrop[data-backdrop-for="filter"]').length === 0) {
//                         $('body').append('<div class="custom-backdrop fade" data-backdrop-for="filter"></div>');
//                     }
//                     const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
//                     $backdrop.addClass('show').fadeIn(300);
//                     $('body').addClass('filter-open');
//                 }

//             } else {
//                 // Disable filter mode
//                 $filterBtn.removeClass('active');
//                 $allFilter.removeClass('active').hide();
//                 $filterBlock.removeClass('grid-with-filter').addClass('grid-reset');
//                 $filterCards.removeClass('grid-with-filter').addClass('grid-default');

//                 activateGrid();

//                 // Backdrop remove
//                 const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
//                 $backdrop.removeClass('show').fadeOut(300, function () {
//                     $(this).remove();
//                 });
//                 $('body').removeClass('filter-open');
//             }

//             refreshOwl();
//         });

//         // Handle resize
//         const node = $packageGrids.get(0);
//         if (node && window.ResizeObserver) {
//             const resizeObserver = new ResizeObserver(() => {
//                 refreshOwl();
//             });
//             resizeObserver.observe(node);
//         }
//     });
// });

$(document).ready(function () {
    $('.tour_packages').each(function () {
        const $section = $(this);
        const $gridBtns = $section.find('.gridlist_buttons .btn:first-child');
        const $listBtns = $section.find('.gridlist_buttons .btn:last-child');
        const $filterBtn = $section.find('.filter_btn');
        const $packageGrids = $section.find('.package_grids');
        const $filterBlock = $section.find('.filter_block');
        const $filterCards = $section.find('.filter_andCards');
        const $allFilter = $section.find('.all_filters');
        const $owl = $section.find('.package_grids .owl-carousel');

        function refreshOwl() {
            if ($owl.hasClass('owl-loaded')) {
                $owl.trigger('refresh.owl.carousel');
            }
        }

        function activateGrid() {
            $gridBtns.addClass('active');
            $listBtns.removeClass('active');
            $filterBtn?.removeClass('active list').addClass('grid');

            $packageGrids.removeClass('list').addClass('grid');
            $packageGrids.find('.col-12, .col-lg-6').removeClass('col-12 col-lg-6').addClass('col-lg-4 col-md-4');

            if (window.innerWidth <= 767) {
                $allFilter.removeClass('active');
            } else {
                $allFilter.removeClass('active').hide();
            }

            $filterBlock.removeClass('grid-with-filter').addClass('grid-reset');
            $filterCards.removeClass('grid-with-filter').addClass('grid-default');

            refreshOwl();
        }

        function activateList() {
            $listBtns.addClass('active');
            $gridBtns.removeClass('active');
            $filterBtn?.removeClass('grid').addClass('list active');

            $packageGrids.removeClass('grid').addClass('list');
            $packageGrids.find('.col-lg-4, .col-md-4, .col-lg-6').removeClass('col-lg-4 col-md-4 col-lg-6').addClass('col-12');

            if (window.innerWidth <= 767) {
                $allFilter.addClass('active');
            } else {
                $allFilter.addClass('active').show();
            }

            $filterBlock.removeClass('grid-reset').addClass('grid-with-filter');
            $filterCards.removeClass('grid-default').addClass('grid-with-filter');

            refreshOwl();
        }

        function closeFilter() {
            $filterBtn.removeClass('active');
            if (window.innerWidth <= 767) {
                $allFilter.removeClass('active');

                // Remove inline styles to prevent display:none/block
                setTimeout(() => {
                    $allFilter.removeAttr('style');
                }, 400); // Match your CSS transition time
            } else {
                $allFilter.removeClass('active').hide();
            }

            $filterBlock.removeClass('grid-with-filter').addClass('grid-reset');
            $filterCards.removeClass('grid-with-filter').addClass('grid-default');

            activateGrid();

            const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
            $backdrop.removeClass('show').fadeOut(300, function () {
                $(this).remove();
            });

            $('body').removeClass('filter-open');
        }

        // Grid button clicked
        $gridBtns.on('click', function () {
            activateGrid();
        });

        // List button clicked
        $listBtns.on('click', function () {
            activateList();
        });

        // Filter toggle button
        $filterBtn?.on('click', function () {
            const isFilterActive = $(this).hasClass('active');

            if (!isFilterActive) {
                $filterBtn.addClass('active');
                if (window.innerWidth <= 767) {
                    $allFilter.addClass('active');
                } else {
                    $allFilter.addClass('active').show();
                }

                $filterBlock.removeClass('grid-reset').addClass('grid-with-filter');
                $filterCards.removeClass('grid-default').addClass('grid-with-filter');

                if ($listBtns.hasClass('active')) {
                    $packageGrids.find('[class*="col-"]').removeClass('col-lg-3 col-lg-4 col-lg-6 col-12').addClass('col-12');
                    $filterBtn.removeClass('grid').addClass('list');
                } else {
                    $packageGrids.find('[class*="col-"]').removeClass('col-lg-3 col-lg-4 col-lg-6 col-12').addClass('col-lg-6');
                    $filterBtn.removeClass('list').addClass('grid');
                }

                if (window.innerWidth <= 767) {
                    if ($('.custom-backdrop[data-backdrop-for="filter"]').length === 0) {
                        $('body').append('<div class="custom-backdrop fade" data-backdrop-for="filter"></div>');
                    }
                    const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
                    $backdrop.addClass('show').fadeIn(300);
                    $('body').addClass('filter-open');
                }

            } else {
                closeFilter();
            }

            refreshOwl();
        });

        // btn_close click
        $section.on('click', '.btn_close', function () {
            closeFilter();
        });

        // backdrop click
        $(document).on('click', '.custom-backdrop[data-backdrop-for="filter"]', function () {
            closeFilter();
        });

        // Handle resize
        const node = $packageGrids.get(0);
        if (node && window.ResizeObserver) {
            const resizeObserver = new ResizeObserver(() => {
                refreshOwl();
            });
            resizeObserver.observe(node);
        }
    });
});


// ---------------------------
// Checkbox Toggles & Sticky Header
// ---------------------------
$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    // ---------------------------
    // Add to Compare Checkbox Logic
    // ---------------------------
    $('.addTo_Compare').on('change', function () {
        const isAnyChecked = $('.addTo_Compare:checked').length > 0;

        if (isAnyChecked) {
            $('.addtoCompare_blc').addClass('active');
        } else {
            $('.addtoCompare_blc').removeClass('active');
        }
    });

    // ---------------------------
    // Compare Check Toggle (Only controlled by checkbox)
    // ---------------------------
    jQuery('.compareCheck').on('change', function () {
        var isChecked = jQuery(this).is(':checked');
        jQuery('.compareCheck').prop('checked', isChecked);

        if (isChecked) {
            jQuery('.compare').addClass('active');
        } else {
            jQuery('.compare').removeClass('active');
        }
    });

    // ---------------------------
    // Block Outside Click from affecting `.compare`
    // ---------------------------
    $(document).off('click.compareClose');

    // If someone added outside-click logic, override it
    $(document).on('click.compareClose', function (e) {
        if ($(e.target).closest('.compare, #compareCheck').length === 0) {
        }
    });

    $(window).on('scroll', function () {
        var scrollTop = $(window).scrollTop();
        var $filterCards = $('.filter_andCards');
			if ($filterCards.length === 0) {
        return; 
    }
        var triggerOffsetTop = $filterCards.offset().top;
        var triggerOffsetBottom = triggerOffsetTop + $filterCards.outerHeight();

        var $filter = $('.onScroll_filter');
        var $allFilters = $('.all_filters');

        if (scrollTop >= triggerOffsetTop && scrollTop < triggerOffsetBottom) {
            // Scroll is within filter_andCards section
            $filter.addClass('is-sticky');
            $allFilters.addClass('is-sticky');
        } else {
            // Scroll is before or after filter_andCards section
            $filter.removeClass('is-sticky');
            $allFilters.removeClass('is-sticky');
        }
    });
});


// ---------------------------
// Load More Button Functionality
// ---------------------------
$(document).ready(function () {
    var itemsToShow = 9;
    var items = $(".filter_andCards .col-lg-4");
    var totalItems = items.length;
    var currentVisible = itemsToShow;

    items.hide();
    items.slice(0, currentVisible).show();

    $(".btn_loadMore").click(function () {
        currentVisible += itemsToShow;
        items.slice(0, currentVisible).slideDown();
        if (currentVisible >= totalItems) {
            $(this).fadeOut();
        }
    });
});


// ---------------------------
// Price and N Value Sliders with Fill and Display Update
// ---------------------------
$(document).ready(function () {
    function fillSlider(from, to, sliderColor, rangeStartColor, rangeEndColor, controlSlider) {
        const rangeDistance = to.max - to.min;
        const fromPosition = ((from.value - to.min) / rangeDistance) * 100;
        const toPosition = ((to.value - to.min) / rangeDistance) * 100;

        controlSlider.style.background = `
        linear-gradient(to right,
            ${sliderColor} 0%,
            ${sliderColor} ${fromPosition}%,
            ${rangeStartColor} ${fromPosition}%,
            ${rangeEndColor} ${toPosition}%,
            ${sliderColor} ${toPosition}%,
            ${sliderColor} 100%
        )`;
    }

    function formatINR(value) {
        return '₹' + value.toLocaleString('en-IN');
    }

    // Price Slider setup and update
    const priceMinSlider = document.querySelector('#priceMinSlider');
    const priceMaxSlider = document.querySelector('#priceMaxSlider');
    const priceMinDisplay = document.querySelector('#priceMinDisplay');
    const priceMaxDisplay = document.querySelector('#priceMaxDisplay');

    priceMinSlider.min = 0;
    priceMaxSlider.min = 0;
    priceMinSlider.max = 125000;
    priceMaxSlider.max = 125000;

    priceMinSlider.value = 40000;
    priceMaxSlider.value = 125000;

    function updatePriceDisplays() {
        let fromVal = parseInt(priceMinSlider.value);
        let toVal = parseInt(priceMaxSlider.value);

        priceMinDisplay.textContent = formatINR(fromVal);
        priceMaxDisplay.textContent = formatINR(toVal);

        fillSlider(priceMinSlider, priceMaxSlider, '#d7dae0', '#2E90FA', '#175CD3', priceMaxSlider);
    }

    priceMinSlider.addEventListener('input', () => {
        if (parseInt(priceMinSlider.value) > parseInt(priceMaxSlider.value)) {
            priceMinSlider.value = priceMaxSlider.value;
        }
        updatePriceDisplays();
    });

    priceMaxSlider.addEventListener('input', () => {
        if (parseInt(priceMaxSlider.value) < parseInt(priceMinSlider.value)) {
            priceMaxSlider.value = priceMinSlider.value;
        }
        updatePriceDisplays();
    });

    updatePriceDisplays();

    // N Value Slider setup and update
    const fromSlider = document.querySelector('#fromSlider');
    const toSlider = document.querySelector('#toSlider');
    const minValueDisplay = document.querySelector('#minValueDisplay');
    const maxValueDisplay = document.querySelector('#maxValueDisplay');

    fromSlider.min = 0;
    toSlider.min = 0;
    fromSlider.max = 8;
    toSlider.max = 8;

    fromSlider.value = 4;
    toSlider.value = 8;

    function updateValueDisplays() {
        const fromVal = parseInt(fromSlider.value);
        const toVal = parseInt(toSlider.value);

        minValueDisplay.textContent = '${fromVal}N';
        maxValueDisplay.textContent = '${toVal}N';

        if (fromVal >= 4) {
            minValueDisplay.classList.add('activeValue');
        } else {
            minValueDisplay.classList.remove('activeValue');
        }

        fillSlider(fromSlider, toSlider, '#d7dae0', '#2E90FA', '#175CD3', toSlider);
    }

    fromSlider.addEventListener('input', () => {
        let fromVal = parseInt(fromSlider.value);
        let toVal = parseInt(toSlider.value);

        if (fromVal < 0) fromVal = 0;
        if (fromVal > toVal) fromVal = toVal;

        fromSlider.value = fromVal;
        updateValueDisplays();
    });

    toSlider.addEventListener('input', () => {
        let fromVal = parseInt(fromSlider.value);
        let toVal = parseInt(toSlider.value);

        if (toVal > 8) toVal = 8;
        if (toVal < fromVal) toVal = fromVal;

        toSlider.value = toVal;
        updateValueDisplays();
    });

    updateValueDisplays();
});


// ---------------------------
// Yearly calendar functionality
// ---------------------------
$(document).ready(function () {
    (function () {
        let currentYear = new Date().getFullYear();
        let displayedYear = currentYear;

        const calendarYear = document.getElementById('calendar-year');
        const monthsGrid = document.querySelector('.months-grid');
        const prevBtn = document.getElementById('prevYearBtn');
        const nextBtn = document.getElementById('nextYearBtn');

        function updatePrevBtnState() {
            if (displayedYear <= currentYear) {
                prevBtn.classList.add('disabled');
                prevBtn.disabled = true;
            } else {
                prevBtn.classList.remove('disabled');
                prevBtn.disabled = false;
            }
        }

        function generateYearlyCalendar(year) {
            calendarYear.textContent = year;
            monthsGrid.innerHTML = '';

            const monthNames = [
                "Jan", "Feb", "Mar", "Apr",
                "May", "Jun", "Jul", "Aug",
                "Sep", "Oct", "Nov", "Dec"
            ];

            monthNames.forEach((monthName, index) => {
                const monthDiv = document.createElement('div');
                monthDiv.className = 'month';
                monthDiv.textContent = monthName;
                monthDiv.dataset.monthIndex = index;

                monthDiv.addEventListener('click', () => {
                    // Remove selected class from all months
                    document.querySelectorAll('.month').forEach(m => m.classList.remove('selected'));
                    // Add selected class to clicked month
                    monthDiv.classList.add('selected');
                });

                monthsGrid.appendChild(monthDiv);
            });

            updatePrevBtnState();
        }

        prevBtn.addEventListener('click', () => {
            if (displayedYear > currentYear) {
                displayedYear--;
                generateYearlyCalendar(displayedYear);
            }
        });

        nextBtn.addEventListener('click', () => {
            displayedYear++;
            generateYearlyCalendar(displayedYear);
        });

        // Initialize
        generateYearlyCalendar(displayedYear);
    })();
});

// ---------------------------
// Dropdown filter See More / See Less and search filter
// ---------------------------
$('.dropdown_filter.themes_filter').each(function () {
    var $dropdown = $(this);
    var $input = $dropdown.find('.search_box input');
    var $items = $dropdown.find('> .dropdown_list > ul.dropdown_items > li');
    var $btnMore = $dropdown.find('.seemore_btn');
    var $img = $btnMore.find('img');
    var visibleCount = 5;

    $items.hide().slice(0, visibleCount).show();
    $btnMore.data('expanded', false);

    $btnMore.click(function () {
        var isExpanded = $btnMore.data('expanded');
        if (!isExpanded) {
            $items.slice(visibleCount).slideDown();
            $btnMore.contents().first()[0].textContent = 'See Less ';
            $img.css('transform', 'rotate(180deg)');
            $btnMore.data('expanded', true);
        } else {
            $items.slice(visibleCount).slideUp();
            $btnMore.contents().first()[0].textContent = 'See More ';
            $img.css('transform', 'rotate(0deg)');
            $btnMore.data('expanded', false);
        }
    });

    $input.on('input', function () {
        var filter = $(this).val().toLowerCase().trim();

        if (filter === '') {
            $items.hide().slice(0, visibleCount).show();
            $btnMore.show();
            $btnMore.contents().first()[0].textContent = 'See More ';
            $img.css('transform', 'rotate(0deg)');
            $btnMore.data('expanded', false);
        } else {
            $items.each(function () {
                var text = $(this).text().toLowerCase();
                $(this).toggle(text.indexOf(filter) !== -1);
            });
            $btnMore.hide();
        }
    });
});


// ---------------------------
// Dropdown button toggle show/hide
// ---------------------------
$(document).ready(function () {
    // Sab dropdowns hide karo
    $('.dropdown_list').hide();

    // Pehla dropdown show karo aur button active banao
    var $firstDropdown = $('.dropdown_filter').first();
    $firstDropdown.find('.dropdown_list').show();
    $firstDropdown.find('.dropdown_button').addClass('active');

    // Button click event
    $('.dropdown_button').click(function (e) {
        e.stopPropagation();

        var $button = $(this);
        var $dropdownFilter = $button.closest('.dropdown_filter');
        var $currentList = $dropdownFilter.find('.dropdown_list');

        // Agar already open hai, toh band kar do
        if ($button.hasClass('active')) {
            $currentList.stop(true, true).slideUp(200);
            $button.removeClass('active');
        } else {
            // Sab dropdowns band karo aur buttons se active hatao
            $('.dropdown_list').stop(true, true).slideUp(200);
            $('.dropdown_button').removeClass('active');

            // Ab current open karo
            $currentList.stop(true, true).slideDown(200);
            $button.addClass('active');
        }
    });

    $('.dropdown_list').click(function (e) {
        e.stopPropagation();
    });
});

// ---------------------------
// Scroll filter box horizontal scroll with buttons and active tab
// ---------------------------
$(document).ready(function () {
    const scrollBox = $('.filter-scroll');
    const leftBtn = $('.scroll-btn.left');
    const rightBtn = $('.scroll-btn.right');

    function checkScrollButtons() {
        const scrollLeft = scrollBox.scrollLeft();
        const scrollWidth = scrollBox[0].scrollWidth;
        const containerWidth = scrollBox.outerWidth();

        if (scrollLeft <= 0) {
            leftBtn.addClass('disable');
        } else {
            leftBtn.removeClass('disable');
        }

        if (scrollLeft + containerWidth >= scrollWidth - 1) {
            rightBtn.addClass('disable');
        } else {
            rightBtn.removeClass('disable');
        }
    }

    checkScrollButtons();

    leftBtn.click(function () {
        scrollBox.animate({ scrollLeft: '-=200' }, 300, checkScrollButtons);
    });

    rightBtn.click(function () {
        scrollBox.animate({ scrollLeft: '+=200' }, 300, checkScrollButtons);
    });

    scrollBox.on('scroll', checkScrollButtons);

    $('.filter-tab').on('click', function () {
        const filter = $(this).data('filter');
        $('.filter-tab').removeClass('active');
        $('.filter-tab').filter('[data-filter="${filter}"]').addClass('active');

        const $cards = $('.package-card');

        $cards.stop(true, true).removeClass('is-animated').fadeOut(300).promise().done(function () {
            if (filter === 'all') {
                $cards.addClass('is-animated').fadeIn(300);
            } else {
                $cards.each(function () {
                    const categories = $(this).data('category').split(' ');
                    if (categories.includes(filter) || categories.includes('all')) {
                        $(this).addClass('is-animated').fadeIn(300);
                    }
                });
            }
        });
    });
});

// ---------------------------
// Language Switcher Dropdown
// ---------------------------

$(document).ready(function () {
    // Language toggle
    $('.language_toggle').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('.language_dropdown').toggleClass('open');
        $(this).toggleClass('active');
    });

    // Login toggle
    $('.btn_login').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('.profile_dropdown').toggleClass('open');
    });

    // Click outside closes both dropdowns
    $(document).click(function () {
        $('.language_dropdown, .profile_dropdown').removeClass('open');
        $('.language_toggle').removeClass('active');
    });

    // Click inside doesn't close
    $('.language_dropdown, .profile_dropdown').click(function (e) {
        e.stopPropagation();
    });
});


// -------------------------------------------------------------
// Filter Dropdown with Tags Display & Clear Functionality
// -------------------------------------------------------------

jQuery(document).ready(function ($) {
    $('.dropdown_filter').each(function () {
        const $filterBox = $(this);
        const $checkboxes = $filterBox.find('.form-check-input');
        const $appliedContainer = $filterBox.siblings('.applied_filter').find('.applied');

        // Function to toggle applied container visibility
        function toggleAppliedVisibility() {
            if ($appliedContainer.find('li').length === 0) {
                $appliedContainer.hide();
            } else {
                $appliedContainer.show();
            }
        }

        // Checkbox toggle
        $checkboxes.on('change', function () {
            const $cb = $(this);
            const id = $cb.attr('id');
            const label = $cb.siblings('label').text();

            const existing = $appliedContainer.find('[data-id="${id}"]');
            if (existing.length) {
                existing.slideUp(200, function () {
                    $(this).remove();
                    toggleAppliedVisibility(); // check after remove
                });
            }

            if ($cb.is(':checked')) {
                const $item = $('<li data-id="${id}">${label}<a class="btn"><img src="assets/img/x.svg" alt=""></a></li>').hide();
                $appliedContainer.append($item);
                $item.slideDown(200, toggleAppliedVisibility); // check after add
            }
        });

        // Remove individual tag
        $appliedContainer.on('click', '.btn', function () {
            const $li = $(this).closest('li');
            const id = $li.data('id');
            $li.slideUp(200, function () {
                $(this).remove();
                toggleAppliedVisibility(); // check after remove
            });
            $filterBox.find('#' + id).prop('checked', false);
        });

        // Clear all
        $filterBox.siblings('.applied_filter').find('.btn:contains("Clear all")').on('click', function () {
            $appliedContainer.find('li').slideUp(200, function () {
                $(this).remove();
                toggleAppliedVisibility(); // check after all removed
            });
            $checkboxes.prop('checked', false);
        });

        // Initial check in case something is pre-checked
        toggleAppliedVisibility();
    });
});


// -------------------------------------------
// Fare Details: Toggle Fare Wrapper Section
// -------------------------------------------

jQuery(document).ready(function () {
    jQuery(".fare_wrapper").hide();
    jQuery(".ttp_bttm .btn").on("click", function () {
        const btn = jQuery(this);
        const wrapper = btn.siblings(".fare_wrapper");
        wrapper.slideToggle(300);
        btn.toggleClass("active");
    });
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

// ---------------------------
// Flight Remove Functionality
// ---------------------------

jQuery(document).ready(function () {
    jQuery('.flight_blank').hide();
    jQuery('.remove_modal .btn_remove').on('click', function () {
        jQuery('#removeModal').modal('hide');
        jQuery('.flight_card').hide();
        jQuery('.flight_blank').show();
    });
    jQuery('.remove_modal .btn_cancel').on('click', function () {
        jQuery('#removeModal').modal('hide');
    });
});

// ---------------------------
// Policies Modal Tabs Handler
// ---------------------------

jQuery(function ($) {
    var selectedTab = 'payment'; // default

    $('.policies_section .btn').on('click', function () {
        selectedTab = $(this).data('tab');
    });

    $('#policiesModal').on('shown.bs.modal', function () {
        if (selectedTab === 'payment') {
            $('#nav-payment-terms-tab').trigger('click');
        } else if (selectedTab === 'cancellation') {
            $('#nav-cancellation-policy-tab').trigger('click');
        } else if (selectedTab === 'terms') {
            $('#nav-terms-conditions-tab').trigger('click');
        }
    });
});

// ===============================
// Sort Filter Toggle with Backdrop
// ===============================

jQuery(document).ready(function () {
    jQuery('.sort_filter').on('click', function () {
        // Toggle class on sort_wrapper
        jQuery('.sort_wrapper').toggleClass('active');

        // Check if backdrop already exists
        if (jQuery('.custom-backdrop[data-backdrop-for="sort"]').length === 0) {
            jQuery('body').append('<div class="custom-backdrop fade" data-backdrop-for="sort"></div>');
        }

        // Show backdrop
        jQuery('.custom-backdrop[data-backdrop-for="sort"]').addClass('show').fadeIn(300);
        jQuery('body').addClass('sort-open');
    });

    // Close on btn_close click
    jQuery(document).on('click', '.btn_close', function () {
        jQuery('.sort_wrapper').removeClass('active');
        jQuery('.custom-backdrop[data-backdrop-for="sort"]').removeClass('show').fadeOut(300, function () {
            jQuery(this).remove();
        });
        jQuery('body').removeClass('sort-open');
    });

    // Close on backdrop click
    jQuery(document).on('click', '.custom-backdrop[data-backdrop-for="sort"]', function () {
        jQuery('.sort_wrapper').removeClass('active');
        jQuery(this).removeClass('show').fadeOut(300, function () {
            jQuery(this).remove();
        });
        jQuery('body').removeClass('sort-open');
    });
});


// ===============================
// Tour Agency : Tabs to Accordion
// ===============================

jQuery(document).ready(function () {
    jQuery('.tour_agency').each(function () {
        const $parent = jQuery(this);
        const $tabsWrapper = $parent.find(".agency_tabs");
        const $accordionWrapper = $parent.find(".agency_accordian");

        const $tabButtons = $tabsWrapper.find('.nav-link');
        const $tabContents = $tabsWrapper.find('.tab-pane');

        $tabButtons.each(function (index) {
            const $btn = jQuery(this);
            const targetId = $btn.attr("data-bs-target").replace("#", "");
            const title = $btn.text().trim();
            const $content = $tabContents.filter("#" + targetId);
            const isActive = $btn.hasClass("active");

            const accordionItem = `
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading${index}">
                        <button class="accordion-button ${isActive ? '' : 'collapsed'}" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${index}" aria-expanded="${isActive}" aria-controls="collapse${index}">
                            ${title}
                        </button>
                    </h2>
                    <div id="collapse${index}" class="accordion-collapse collapse ${isActive ? 'show' : ''}" aria-labelledby="heading${index}" data-bs-parent=".agency_accordian">
                        <div class="accordion-body">
                            ${$content.html()}
                        </div>
                    </div>
                </div>
            `;
            $accordionWrapper.append(accordionItem);
        });
    });
});


// ===============================
// Footer : Tabs to Accordion
// ===============================

jQuery(document).ready(function () {
    jQuery('.footer').each(function () {
        const $footer = jQuery(this);
        const $tabs = $footer.find('.nav-tabs');
        const $tabContent = $footer.find('.tab-content');
        const $accordionWrapper = $footer.find('.footer_accordian .accordion');

        const $tabButtons = $tabs.find('.nav-link');

        $tabButtons.each(function (index) {
            const $btn = jQuery(this);
            const targetId = $btn.attr('data-bs-target')?.replace('#', '');
            const title = $btn.text().trim();
            const $content = $tabContent.find('#' + targetId);

            if ($content.length) {
                const accordionItem = `
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFooter${index}">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFooter${index}" aria-expanded="false" aria-controls="collapseFooter${index}">
                            ${title}
                        </button>
                    </h2>
                    <div id="collapseFooter${index}" class="accordion-collapse collapse" aria-labelledby="headingFooter${index}" data-bs-parent="#accordionFooter">
                        <div class="accordion-body">
                            ${$content.html()}
                        </div>
                    </div>
                </div>`;
                $accordionWrapper.append(accordionItem);
            }
        });
    });
});

jQuery(document).ready(function () {
    jQuery(".filter_wrapper").each(function () {
        const $section = jQuery(this);
        const buttons = $section.find(".filters_item .btn");

        buttons.removeClass("up down");

        buttons.on("click", function () {
            const $this = jQuery(this);

            // Toggle up/down for this button
            if ($this.hasClass("up")) {
                $this.removeClass("up").addClass("down");
            } else {
                $this.removeClass("down").addClass("up");
            }

            // Remove active from siblings only in this section
            buttons.removeClass("active");
            $this.addClass("active");
        });
    });
});


jQuery(document).ready(function () {
    jQuery('.flight_card .form-check-input').on('change', function () {
        const $this = jQuery(this);
        const inputName = $this.attr('name');
        jQuery(`.flight_card .form-check-input[name="${inputName}"]`).each(function () {
            jQuery(this).closest('.flight_card').removeClass('selected');
        });
        $this.closest('.flight_card').addClass('selected');
        const isDepartureSelected = jQuery('.form-check-input[name="flightDeparture"]:checked').length > 0;
        const isReturnSelected = jQuery('.form-check-input[name="flightReturn"]:checked').length > 0;
        if (isDepartureSelected && isReturnSelected) {
            jQuery('.add_changeFlight').addClass('active');
        } else {
            jQuery('.add_changeFlight').removeClass('active');
        }
    });
});



jQuery(document).ready(function () {
    jQuery('.type_ofPayment input[type="radio"]').on('change', function () {
        jQuery('.type_ofPayment').removeClass('active');
        jQuery(this).closest('.type_ofPayment').addClass('active');
    });
});


jQuery(document).ready(function () {
    function matchH6Heights() {
        const rows = {};
        jQuery('.package_grids .col-lg-4').each(function () {
            const $h6 = jQuery(this).find('h6').css('height', 'auto');
            const top = jQuery(this).position().top;
            (rows[top] = rows[top] || []).push($h6);
        });

        Object.values(rows).forEach(group => {
            const maxH = Math.max(...group.map(el => el.outerHeight()));
            group.forEach(el => el.css('height', maxH));
        });
    }

    // Run on DOM ready and every resize
    jQuery(function () {
        matchH6Heights();
        jQuery(window).on('resize', matchH6Heights);
    });
});


jQuery(document).ready(function ($) {
    $('.btn_savedList').on('click', function (e) {
        e.stopPropagation();
        $(this).toggleClass('open');
        $(this).siblings('.list_options').slideToggle(200);
    });

    $('.list_options li').on('click', function (e) {
        e.stopPropagation();
        $(this).addClass('active').siblings().removeClass('active');
        $('.list_options').slideUp(200);
        $('.btn_savedList').removeClass('open');
    });

    // Optional: Click outside to close
    $(document).on('click', function () {
        $('.list_options').slideUp(200);
        $('.btn_savedList').removeClass('open');
    });
});

jQuery(document).ready(function ($) {
    // 1. Toggle .payer_details on checkbox
    $('#payerDetails').on('change', function () {
        if ($(this).is(':checked')) {
            $('.payer_details').slideDown(200);
        } else {
            $('.payer_details').slideUp(200);
        }
    });

    // 2. PAN number field input triggers .verified (3rd input in .payer_details)
    const $panSection = $('.section_payer');

    // Hide .verified on load
    $panSection.find('.verified').hide();

    // On input in PAN number field (3rd input)
    $panSection.find('.input_grp input[type="text"]').eq(2).on('input', function () {
        const inputVal = $(this).val().trim();
        const $verified = $panSection.find('.verified');

        if (inputVal.length > 0) {
            $verified.stop(true, true).slideDown(200);
        } else {
            $verified.stop(true, true).slideUp(200);
        }
    });

    // 3. Amount Utilized Section
    const $amountSection = $('.amount_utilized');
    const $amountInput = $amountSection.find('input[type="text"]');
    const $applyBtn = $amountSection.find('.btn_amountApply');
    const $checkedIcon = $amountSection.find('.checked');

    // Hide check icon initially
    $checkedIcon.hide();

    // Enable button when input has valid amount
    $amountInput.on('input', function () {
        const val = parseFloat($(this).val().trim());

        if (!isNaN(val) && val > 0) {
            $applyBtn.prop('disabled', false);
        } else {
            $applyBtn.prop('disabled', true);
            $checkedIcon.hide();
        }
    });

    // Show check icon on button click
    $applyBtn.on('click', function (e) {
        e.preventDefault();
        $checkedIcon.stop(true, true).fadeIn(200);
    });
});

jQuery(document).ready(function ($) {
    const $formBlock = $('.center_block .traveller_details');
    const $button = $('.bottom_block .add_traveller');

    function checkFormValidity() {
        let isValid = true;

        // Check all visible text inputs
        $formBlock.find('input[type="text"]:visible').each(function () {
            if ($(this).val().trim() === '') {
                isValid = false;
                return false; // break each loop
            }
        });

        // Check all visible selects
        if (isValid) {
            $formBlock.find('select:visible').each(function () {
                if ($(this).val() === '' || $(this).val() === null) {
                    isValid = false;
                    return false;
                }
            });
        }

        // Enable/disable button
        $button.prop('disabled', !isValid);
    }

    // Trigger validation on input/select change
    $formBlock.find('input[type="text"], select').on('input change', function () {
        checkFormValidity();
    });

    // Initial check on load (in case form is pre-filled)
    checkFormValidity();

    // On add_traveller button click
    $button.on('click', function () {
        $('.btn_addTraveller').hide();
        $('.added_traveller').show();
        $('#travellerDetailsModal').modal('hide'); // Close the modal
    });
});


jQuery(document).ready(function ($) {
    const $cardLogin = $('.card_login');
    const $guestBtn = $cardLogin.find('.btn_primary_border').first(); // Continue as Guest
    const $cancelBtn = $cardLogin.find('.btn_primary_border').last(); // Cancel (optional)
    const $formBlock = $cardLogin.find('.form_block');
    const $btnGrps = $cardLogin.find('.btn_grps').first(); // Button group with Guest/Login
    const $submitBtn = $cardLogin.find('.btn_submit');
    const $emailInput = $formBlock.find('input[type="text"]');
    const $loginWrpr = $cardLogin.find('.login_wrpr');
    const $afterLogin = $cardLogin.find('.after_login');

    // 1. Continue as Guest button click
    $guestBtn.on('click', function () {
        $btnGrps.hide();
        $formBlock.slideDown(200);
    });

    // 2. Enable Submit button only if email is entered
    $emailInput.on('input', function () {
        const emailVal = $(this).val().trim();
        $submitBtn.prop('disabled', emailVal === '');
    });

    // 3. On Submit, hide login_wrpr and show after_login
    $submitBtn.on('click', function () {
        $loginWrpr.slideUp(300, function () {
            $afterLogin.slideDown(300);
        });
    });

    // 4. Cancel click – return to Guest/Login buttons
    $cancelBtn.on('click', function () {
        $formBlock.hide();
        $btnGrps.show();
        $emailInput.val('');            // Clear input
        $submitBtn.prop('disabled', true); // Disable Submit again
    });
});

jQuery(document).ready(function ($) {
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

    // Radio button change
    $paymentSection.find('.form-check-input').on('change', function () {
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
    $paymentSection.find('.btn_verify').on('click', function () {
        const $section = $(this).closest('.payment_info');
        const $verified = $section.find('.verified');

        // Show verified name
        $verified.fadeIn();

        // Trigger validation again
        validateFields($section, 'upi');
    });

    // ✅ Handle Pay Button Click
    $paymentSection.find('.btn_pay').on('click', function () {
        if (!$(this).prop('disabled')) {
            $('.make_payment').hide();
            $('.booking_confirmation').show();
        }
    });

    // Optional: Hide booking_confirmation initially
    // $('.booking_confirmation').hide();
});

jQuery(document).ready(function ($) {
    $('.card_info .btn_qr').on('click', function () {
        const $button = $(this);
        const $bottomQr = $button.closest('.bottom_qr');
        $bottomQr.addClass('show-qr');
        $button.hide();
    });
});

jQuery(document).ready(function ($) {
    function validateContactForm() {
        let isValid = true;

        // Check all required input fields inside .contact_details
        $('.contact_details input.form-control').each(function () {
            if ($(this).val().trim() === '') {
                isValid = false;
                return false; // Break loop
            }
        });

        // Check all required selects inside .contact_details
        $('.contact_details select').each(function () {
            if (!$(this).val()) {
                isValid = false;
                return false;
            }
        });

        // Enable or disable the payment button
        $('.btn_makePayment').prop('disabled', !isValid);
    }

    // Trigger validation on input or dropdown change
    $('.contact_details input.form-control, .contact_details select').on('input change', function () {
        validateContactForm();
    });

    // On Make Payment button click: hide review_booking, show make_payment
    $('.btn_makePayment').on('click', function () {
        $('.review_booking, .package_gallery').hide();
        $('.make_payment').show();
    });

    // On Make Payment button click: hide review_booking, show make_payment
    $('.btn_backPayment').on('click', function () {
        $('.make_payment, .package_gallery').hide();
        $('.review_booking').show();
    });
});


jQuery(document).ready(function ($) {
    $('.promotionalOffers_modal').each(function () {
        const $modal = $(this);
        const $inputField = $modal.find('.top_input input.form-control');
        const $clearBtn = $modal.find('.top_input .btn');

        // 🔽 Initial hide via JS
        $clearBtn.hide();

        // Coupon Apply Button
        $modal.find('.coupon_codes').on('click', '.btn_apply', function () {
            $modal.find('.coupon_card').removeClass('selected');
            const $card = $(this).closest('.coupon_card');
            $card.addClass('selected');

            const couponCode = $card.find('.top_blck span').text().trim();
            $inputField.val(couponCode);
            toggleClearButton(couponCode);
        });

        // ❌ Clear Button
        $clearBtn.on('click', function () {
            $inputField.val('');
            $modal.find('.coupon_card').removeClass('selected');
            toggleClearButton('');
        });

        // Typing in Input Field
        $inputField.on('input', function () {
            const typedCode = $(this).val().trim().toUpperCase();
            toggleClearButton(typedCode);

            $modal.find('.coupon_card').removeClass('selected');
            $modal.find('.coupon_card').each(function () {
                const cardCode = $(this).find('.top_blck span').text().trim().toUpperCase();
                if (cardCode === typedCode) {
                    $(this).addClass('selected');
                }
            });
        });

        // 🔁 Helper: Show/Hide Clear Button
        function toggleClearButton(value) {
            if (value && value.trim() !== '') {
                $clearBtn.fadeIn(150); // smooth show
            } else {
                $clearBtn.fadeOut(150); // smooth hide
            }
        }
    });
});

$(document).ready(function () {
    function updateRooms() {
        const allRooms = $(".calculate_price .rooms_info");

        allRooms.each(function (index) {
            $(this).find(".acbr_lft p").text("Room " + (index + 1));

            // First room ka cross hide
            if (index === 0) {
                $(this).find(".btn_cross").hide();
            } else {
                $(this).find(".btn_cross").show();
            }

            // Sabke add buttons hide karo
            $(this).find(".btn_add").hide();
        });

        // Sirf last room ka add button show karo
        allRooms.last().find(".btn_add").show();
    }

    // Add Room
    $(document).on("click", ".btn_add", function () {
        const $currentRoom = $(this).closest(".rooms_info");
        const $clone = $currentRoom.clone();

        // Reset input values and disable minus buttons
        $clone.find("input").val(0);
        $clone.find(".item.minus").addClass("disabled");

        $clone.hide(); // For slide animation
        $clone.insertAfter($currentRoom).slideDown();

        updateRooms();
    });

    // Remove Room
    $(document).on("click", ".btn_cross", function () {
        const $room = $(this).closest(".rooms_info");
        $room.slideUp(300, function () {
            $(this).remove();
            updateRooms();
        });
    });

    // Stepper Input Logic (for all current and future elements)
    $(document).on("click", ".stepper_input .item", function (ev) {
        var $item = $(ev.target).closest('.item');
        var attr = $item.attr('data-attr');

        var $stepper = $item.closest('.stepper_input');
        var $input = $stepper.find('.value input');
        var $minus = $stepper.find('.minus');

        var currentValue = parseInt($input.val());

        if (attr === 'plus') {
            $input.val(currentValue + 1);
            $minus.removeClass('disabled');
        } else if (attr === 'minus' && currentValue > 0) {
            var newValue = currentValue - 1;
            $input.val(newValue);
            if (newValue === 0) {
                $minus.addClass('disabled');
            }
        }
    });

    updateRooms();
});


$(document).ready(function () {
    $('.wtc_form .form_submitted').hide();
    const $form = $('.wtc_form .form_enquiry');
    const $btn = $form.find('.btn');
    const $phoneInput = $form.find('.phone_number');
    const $emailInput = $form.find('input[type="text"]').not('.phone_number');
    const $formSubmitted = $('.form_submitted');

    function checkForm() {
        const phone = $phoneInput.val().trim();
        const email = $emailInput.val().trim();

        // Enable button only if both fields are filled
        if (phone !== '' && email !== '') {
            $btn.prop('disabled', false);
        } else {
            $btn.prop('disabled', true);
        }
    }

    // Listen to input changes
    $phoneInput.on('input', checkForm);
    $emailInput.on('input', checkForm);

    // On Get a Callback button click
    $btn.on('click', function (e) {
        e.preventDefault();
        $form.slideUp(300, function () {
            $formSubmitted.slideDown();
        });
    });

    // On close button inside form_submitted
    $formSubmitted.find('.btn').on('click', function () {
        $formSubmitted.slideUp(300, function () {
            // Reset form fields
            $phoneInput.val('');
            $emailInput.val('');
            $btn.prop('disabled', true);
            $form.slideDown();
        });
    });
});

$(document).ready(function () {
    var itemsToShow = 5;

    $(".faq_section").each(function () {
        var $section = $(this);
        var $items = $section.find(".accordion-item");
        var $btn = $section.find(".btn_loadFaq");

        // Initial setup
        $items.hide().slice(0, itemsToShow).show();
        $btn.text("Load More");

        $btn.on("click", function () {
            if ($btn.text() === "Load More") {
                $items.show();
                $btn.text("Load Less");
            } else {
                $items.hide().slice(0, itemsToShow).show();
                $btn.text("Load More");
            }
        });
    });
});

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
    $section.find('.btn_check').on('click', function () {
        $section.find('.mobile_number').hide();
        $section.find('.otp_number').show();
    });

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
    $section.find('.btn_changeNo').on('click', function () {
        $section.find('.change_number').hide();
        $section.find('.points_available').show();
    });

    // STEP 7: Apply Now clicked
    $section.find('.btn_apply').on('click', function () {
        $section.find('.points_available').hide();
        $section.find('.redeem_points').show();
    });

    // STEP 8: Reset everything on btn_remove click
    $section.find('.btn_remove').on('click', function () {
        // Hide all sections
        $section.find('.otp_number, .change_number, .points_available, .redeem_points').hide();

        // Clear input values
        $section.find('.phone_number').val('');
        $section.find('.otp_digits input').val('');

        // Disable buttons
        $section.find('.btn_check').prop('disabled', true);
        $section.find('.btn_submit').prop('disabled', true);

        // Show mobile input section again
        $section.find('.mobile_number').show();
    });

    // STEP 9: Initial state - hide all except mobile_number
    $section.find('.otp_number, .change_number, .points_available, .redeem_points').hide();

});


jQuery(document).ready(function () {
    jQuery('.calculate_price').each(function () {
        let $parent = jQuery(this);
        let lastChecked = null;
        let basePrice = 1087600;

        $parent.find('input[name="payAmount"]').on('click', function () {
            if (jQuery(this).is(lastChecked)) {
                jQuery(this).prop('checked', false);
                lastChecked = null;

                $parent.find('.total_amount').text('₹' + basePrice.toLocaleString('en-IN'));

                $parent.find('.price_offers, .price_chips').addClass('active');
                setTimeout(function () {
                    $parent.find('.price_offers, .price_chips').removeClass('active');
                }, 3000);
            } else {
                lastChecked = this;
            }
        });

        $parent.find('input[name="payAmount"]').on('change', function () {
            if (!jQuery(this).is(':checked')) return;

            let selectedAmountText = jQuery(this).closest('.end_box').find('h6').text();
            let match = selectedAmountText.match(/₹\s?([\d\s,]+)/);

            let extraAmount = 0;
            if (match && match[1]) {
                let cleaned = match[1].replace(/[, ]/g, '');
                extraAmount = parseInt(cleaned);
            }

            let finalAmount = basePrice + extraAmount;
            $parent.find('.total_amount').text('₹' + finalAmount.toLocaleString('en-IN'));

            $parent.find('.price_offers, .price_chips').addClass('active');
            setTimeout(function () {
                $parent.find('.price_offers, .price_chips').removeClass('active');
            }, 3000);
        });
    });
});

// ---------------------------
//Reusable multi-instance date picker for `.dob_input` + `.singleDate-calendar` blocks with independent logic
// ---------------------------

$(function () {
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

    $('.single-calender').each(function () {
        const $block = $(this);
        const calendarType = $block.find('.calender_input').data('calendartype'); // 'dob', 'issue', 'expiry', 'travel'
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
                return date > today; // only past
            } else if (calendarType === 'expiry' || calendarType === 'travel') {
                return date < today; // only today or future
            }
            return false;
        }

        function populateMonthYear() {
            $monthSelect.empty();
            months.forEach((m, i) => {
                $monthSelect.append(`<option value="${i}" ${i === currentMonth ? 'selected' : ''}>${m}</option>`);
            });

            const startYear = today.getFullYear() - 100;
            const endYear = today.getFullYear() + 50;
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

            // Prev month trailing days
            for (let i = start - 1; i >= 0; i--) {
                const day = prevMonthDays - i;
                const prevDate = new Date(year, month - 1, day);
                const disabled = isDateDisabled(prevDate);

                $datesContainer.append(`<span class="other-month ${disabled ? 'disabled' : ''}" data-date="${prevDate}">${day}</span>`);
            }

            // Current month days
            for (let d = 1; d <= daysInMonth; d++) {
                const thisDate = new Date(year, month, d);
                const disabled = isDateDisabled(thisDate);
                const isSelected = selectedDate.toDateString() === thisDate.toDateString();

                $datesContainer.append(`<span class="${disabled ? 'disabled' : ''} ${isSelected ? 'selected' : ''}" data-date="${thisDate}">${d}</span>`);
            }

            // Next month leading days
            const totalDisplayed = start + daysInMonth;
            const remaining = 42 - totalDisplayed;
            for (let i = 1; i <= remaining; i++) {
                const nextDate = new Date(year, month + 1, i);
                const disabled = isDateDisabled(nextDate);

                $datesContainer.append(`<span class="other-month ${disabled ? 'disabled' : ''}" data-date="${nextDate}">${i}</span>`);
            }
        }

        // Toggle calendar
        $input.on('click', function (e) {
            e.stopPropagation();
            if ($calendar.is(':visible')) {
                $calendar.slideUp(300);
            } else {
                $('.singleDate-calendar').not($calendar).slideUp(300);
                $calendar.stop(true, true).slideDown(300);
            }
        });

        // Month/year change
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
        });

        populateMonthYear();
        renderCalendar(currentMonth, currentYear);
    });

    // Hide calendar on clicking outside
    $(document).on('mousedown', function (e) {
        const $target = $(e.target);
        if (
            !$target.closest('.single-calender').length ||
            (!$target.hasClass('calender_input') && !$target.closest('.singleDate-calendar').length)
        ) {
            $('.singleDate-calendar').slideUp(300);
        }
    });
});

$(document).ready(function () {
    function isMobile() {
        return window.innerWidth < 768;
    }

    // Hide all tooltips within a specific activity block
    function hideTooltipsIn(parent) {
        parent.find('.custom_tooltip').stop(true, true).fadeOut(200).removeClass('active');
    }

    // Loop through each activity block
    $('.activity_block .card_blck').each(function () {
        const $card = $(this);

        const $tooltipBtn = $card.find('.know-moreTooltop');
        const $tooltipBox = $card.find('.custom_tooltip');
        const $tooltipWrapper = $tooltipBtn.closest('.know_more');

        // Hover for desktop
        $tooltipBtn.on('mouseenter', function () {
            if (!isMobile()) {
                hideTooltipsIn($('.activity_block')); // Close all others
                $tooltipBox.stop(true, true).fadeIn(200).addClass('active');
            }
        });

        $tooltipWrapper.on('mouseleave', function () {
            if (!isMobile()) {
                $tooltipBox.stop(true, true).fadeOut(200).removeClass('active');
            }
        });

        // Click for mobile
        $tooltipBtn.on('click', function (e) {
            if (isMobile()) {
                e.stopPropagation();
                if ($tooltipBox.hasClass('active')) {
                    $tooltipBox.stop(true, true).fadeOut(200).removeClass('active');
                } else {
                    hideTooltipsIn($('.activity_block')); // Close others
                    $tooltipBox.stop(true, true).fadeIn(200).addClass('active');
                }
            }
        });
    });

    // Hide tooltip on outside click (for mobile)
    $(document).on('click', function (e) {
        if (isMobile() && !$(e.target).closest('.know_more').length) {
            $('.activity_block .custom_tooltip').stop(true, true).fadeOut(200).removeClass('active');
        }
    });
});


$(document).ready(function () {
    // Add class on show
    $('.policies_modal .accordion .accordion-collapse').on('show.bs.collapse', function () {
        $(this).closest('.accordion-item').addClass('active');
    });

    // Remove class on hide
    $('.policies_modal .accordion .accordion-collapse').on('hide.bs.collapse', function () {
        $(this).closest('.accordion-item').removeClass('active');
    });
});


$(document).ready(function () {
    function initMobileInclusionTabs() {
        const isMobile = window.innerWidth <= 767;

        if (isMobile) {
            $('.inclusions_details .tab-details').off('click').on('click', function () {
                const $this = $(this);

                // Remove active from siblings and slide up their .tabDetails_wrapper
                $this.siblings('.tab-details').removeClass('active')
                    .find('.tabDetails_wrapper').slideUp();

                // Add active to current and slide down its .tabDetails_wrapper
                $this.addClass('active')
                    .find('.tabDetails_wrapper').slideDown();
            });
        } else {
            // On desktop, remove inline styles (slideUp/Down) and reset state
            $('.inclusions_details .tab-details').off('click').each(function () {
                $(this).find('.tabDetails_wrapper').show(); // Ensure always visible
            });
        }
    }

    initMobileInclusionTabs();

    // Reapply on window resize
    $(window).on('resize', function () {
        initMobileInclusionTabs();
    });
});
















// code written from UI team.





$(document).ready(function() {
  $('.selling_packages .filters_tab.comn_filterTab .btn').on('click', function() {
    let clickedButton = $(this);

    clickedButton.closest('.selling_packages .filters_tab.comn_filterTab').find('.btn').removeClass('active');

    clickedButton.addClass('active');

    $('.selling_packages .holidaysLPBestSellingPackagesTab').hide();

    let contentSelector = clickedButton.attr('data-target');

   // $(contentSelector).fadeIn(300);
  $(contentSelector).fadeIn(10, function () {
    const $carousel = $(this).find('.owl-carousel');

    // Re-initialize if not already
    if ($carousel.hasClass('owl-loaded')) {
      $carousel.trigger('refresh.owl.carousel');
    } else {
      initOwl(); // or your custom Owl init logic
    }

    // Animate after slight delay
    setTimeout(() => {
      animateCarouselItems($carousel);
	  starImprovment();
    }, 100);
  });
  });

  $('.selling_packages .holidaysLPBestSellingPackagesTab').hide(); // Hide all first
  $('.selling_packages .tabBestSellingTabInternational').show();   // Show default tab
  
 //  Start from holidaysLPBestOffersIndiaPackagesTab this Tab SData
 
 $('.offers_section .filters_tab .btn').on('click', function() {
    var clickedBtn = $(this);
    var targetSelector = clickedBtn.attr('data-target');
    var offersSection = clickedBtn.closest('.offers_section');

    // Remove 'active' class from all buttons in this tab group
    clickedBtn.siblings('.btn').removeClass('active');
    // Add 'active' class to clicked button
    clickedBtn.addClass('active');

    if (clickedBtn.hasClass('active')) {
      // Remove 'activeTab' class from all tab content divs inside the offers_section
      offersSection.find('.holidaysLPBestOffersInternationalPackagesTab, .holidaysLPBestOffersIndiaPackagesTab')
            .removeClass('activeTab').hide();

      // Add 'activeTab' class to the tab matching data-target selector
      offersSection.find(targetSelector).addClass('activeTab').show();
    }
  });

  // Optional: On page load, sync active buttons and tabs
  $('.offers_section .filters_tab .btn.active').each(function() {
    var btn = $(this);
    var target = btn.attr('data-target');
    btn.closest('.offers_section').find('.holidaysLPBestOffersInternationalPackagesTab, .holidaysLPBestOffersIndiaPackagesTab')
       .removeClass('activeTab').hide();
    btn.closest('.offers_section').find(target).addClass('activeTab').show();
  });
  
  // for International and Local India section 
  
  // Initial setup: Show the first tab, hide others
  $('.tabLPInternationalPackages').hide();
  $('.tabLPInternationalPackages').first().show();

  $('.tabLPInternationalPackagesEurope').show(); 

  $('.international_package .filters_tab .btn').removeClass('active').first().addClass('active');

  // Button click event
  $('.international_package .filters_tab .btn').on('click', function() {
    var target = $(this).data('target'); // e.g., ".tabLPInternationalPackagesEurope"
    
    // Show the matching tab, hide others
    $('.international_package .tabLPInternationalPackages').hide();
     // Show the selected tab
  var $targetTab = $(target).show();

    // Update active button
    $('.international_package .filters_tab .btn').removeClass('active');
    $(this).addClass('active');

  var $carousel = $targetTab.find('.owl-carousel');
  if ($carousel.length && $carousel.hasClass('owl-loaded')) {
    animateCarouselItems($carousel);
  }
  });
  
 // India Pages Sliders
 
 $('.tabLPIndiaPackages').hide();
  $('.tabLPIndiaPackages').first().show();
  $('.international_package .filters_tab .btn').removeClass('active').first().addClass('active');

  // Button click event
  $('.india_package .filters_tab .btn').on('click', function() {
    var target = $(this).data('target'); // e.g., ".tabLPInternationalPackagesEurope"
    
    // Show the matching tab, hide others
    $('.india_package .tabLPIndiaPackages').hide();
   // $(target).show();
 var $targetTab = $(target).show();
    // Update active button
    $('.india_package .filters_tab .btn').removeClass('active');
    $(this).addClass('active');
	
 var $carousel = $targetTab.find('.owl-carousel');
  if ($carousel.length && $carousel.hasClass('owl-loaded')) {
    animateCarouselItems($carousel);
  }
  });
  
  // India PACKAGES Carousel show 5 images.
  
$(".india_package .owl-carousel").trigger('destroy.owl.carousel');

// Optionally, remove inline styles/extra markup that Owl Carousel adds
$(".india_package .owl-carousel").find('.owl-stage-outer').children().unwrap();
$(".india_package .owl-carousel").removeClass("owl-center owl-loaded owl-text-select-on");

// Re-initialize with desired settings
$(".india_package .owl-carousel").owlCarousel({
            margin: 20,
           autoplay: false,
            loop: false,
            nav: true,
            dots: false,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            touchDrag: true,
            mouseDrag: true,
            navText: [
                "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
                "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
            ],
    responsive: {
      0:     { items: 1.15, loop: true},
      600:   { items: 3 },
      1000:  { items: 4 }
    },

});

// holidaysLPTourismBoardPartners js start from here
$(".holidaysLPTourismBoardPartners .owl-carousel").trigger('destroy.owl.carousel');
$(".holidaysLPTourismBoardPartners .owl-carousel").find('.owl-stage-outer').children().unwrap();
$(".holidaysLPTourismBoardPartners .owl-carousel").removeClass("owl-center owl-loaded owl-text-select-on");
$(".holidaysLPTourismBoardPartners .owl-carousel").owlCarousel({
		autoplay: true,
        loop: true,
        nav: true,
        dots: false,
        autoplayTimeout: 7000,
        smartSpeed: 800,
		  navText: [
        "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
        "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
    ],
        responsive: {
            0: {
                items: 1.15,
                margin: 8,
                dots: true,
                center: true,
            },
            1024: {
                items: 2,
                margin: 28,
				 center: true,
            },
            1200: {
                items: 1,
                margin: 16,
                stagePadding: 180,
				 center: true,
            },
            1440: {
                items: 1,
                margin: 3,
                stagePadding: 242,
				 center: true,
            }
        }
    });
	fnBlogsCarousel();
})

function fnBlogsCarousel(){
	$('.our_blogs .blogs_slide').trigger('destroy.owl.carousel');
    var $blogs_slide = $(".blogs_slide");
     
		setTimeout(function () {
			$blogs_slide.owlCarousel({
		autoplay: false,
		loop: false,
		nav: true,
		dots: false,
		autoplayTimeout: 7000,
		smartSpeed: 800,
		touchDrag: true,
		mouseDrag: true,
		navText: [
			"<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
			"<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
		],
		responsive: {
			0: {
				items: 1.12,
				margin: 16,
				autoplay: true,
				loop: true,
			},
			1024: {
				items: 3,
				margin: 24
			},
			1200: {
				items: 3,
				margin: 16
			},
			1440: {
				items: 3,
				margin: 24
			}
		}

		});
		  $blogs_slide.trigger("next.owl.carousel");
		}, 500);
}

document.querySelectorAll('.submenu-list a').forEach(link => {
  link.onclick = () => window.location.href = link.href;
});

$(window).on("load", function(){
    $('.carousel-caption-overlay').each(function() {
        var pkgId = $(this).find('.package-id').text().trim();
        if (pkgId) {
            var cleanId = pkgId.replace(/\s+/g, '');
            $(this).attr('id', cleanId);
        }
    });
	document.querySelector('video').play();
	
	$('.tabOffersTabInternational .owl-carousel, .tabOffersTabIndaAround .owl-carousel').owlCarousel({
		autoplay: false,
		loop: false,
		nav: true,
		dots: false,
		autoplayTimeout: 7000,
		smartSpeed: 800,
		touchDrag: true,
		mouseDrag: true,
		navText: [
		  "<img src='/images/tcHolidays/chevron-left.svg' alt='Previous'>",
		  "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>"
		],
		responsive: {
		  0: {
			items: 1.2,
			margin: 16,
			autoplay: true,
			loop: true
		  },
		  1024: {
			items: 2,
			margin: 24
		  },
		  1200: {
			items: 3,
			margin: 16
		  },
		  1440: {
			items: 3,
			margin: 24
		  }
		}
	  });
      
});
$(document).ready(function () {
    $(".vertical_tabs_section .srpcountry_tab h3").off("click");

    $(".vertical_tabs_section .srpcountry_tab h3, .vertical_tabs_section .srpcountry_tab h4").on("click", function (e) {
        e.preventDefault();

        var $parent = $(this).parent();
        var $content = $parent.children("span");

        if ($parent.hasClass("active")) {
            $parent.removeClass("active");
            $content.stop(false, true).slideUp(400);
        } else {
            $(".vertical_tabs_section .srpcountry_tab")
                .removeClass("active")
                .children("span")
                .stop(false, true)
                .slideUp(400);

            $parent.addClass("active");
            $content.stop(false, true).slideDown(400);
        }
    });
	$(".more_all_big").children().wrapAll('<div class="container"></div>');
	starImprovment();
});
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


$(window).on("load", function(){
	$(".vertical_tabs_section .taggingSEOData > .tagging_srp_tc > .srpcountry_tab:nth-child(1) h3").trigger("click");
	starImprovment();
	setTimeout(function(){
		starImprovment();
	}, 2000)
	$('.taggingSEOData p').each(function() {
		const $p = $(this);

		// Check if <p> contains a <script> tag
		const hasScript = $p.find('script').length > 0;

		// Check if <p> has no visible text (ignoring <script>)
		const text = $p.clone().find('script').remove().end().text().trim();
		const isEmpty = text === '';

		// Add 'd-none' if either condition is true
		if (hasScript || isEmpty) {
			$p.addClass('d-none');
		}
	});
})

function fnLoadMoreFAQs(faq){
	const $hiddenFaqs = $(faq).find(".accordion-item:hidden");
	const $visibleFaqs = $(faq).find(".accordion-item:visible");
	const $btn = $(".loadmore_faq .btn");

	// If hidden FAQs exist → show them
	if ($hiddenFaqs.length > 0) {
		$hiddenFaqs.show(); // Show all hidden FAQs
		$btn.text("Load Less");
	} 
	// If all are visible → collapse back to first few
	else {
		$(faq).find(".accordion-item").slice(5).hide(); // Hide from 6th onwards
		$btn.text("Load More");
		$("html, body").animate({ scrollTop: $(faq).offset().top - 100 }, 400);
	}
}

function starImprovment(){
	$(".text + .subtext:not([data-processed='true'])").text(function(_, oldText) {
		return oldText.replace(/🌟/g, "⭐");
	});
}


const processSubtext = el => {
  const text = el.textContent.trim();
  const parts = text.split(',').map(t => t.trim()).filter(Boolean);
  el.innerHTML = parts.map(p => `<span>${p}</span>`).join(' ');
};

const observer = new MutationObserver(() => {
  document.querySelectorAll('#holidaysLPExploreHolidaysByTheme .subtext').forEach(el => {
    if (!el.dataset.processed) {
      processSubtext(el);
      el.dataset.processed = "true";
    }
  });
});

observer.observe(document.body, { childList: true, subtree: true });

document.addEventListener("DOMContentLoaded", () => {

  // --- Function to remove unwanted <a> wrappers ---
  const removeAnchorWrappers = () => {
    document.querySelectorAll("a.nav-link").forEach(anchor => {
      if (anchor.querySelector(".nav.nav-pills, .nav.nav-tabs")) {
        // Extract the inner HTML
        const content = anchor.innerHTML;

        // Create a temporary container to unwrap cleanly
        const temp = document.createElement("div");
        temp.innerHTML = content;

        // Replace the <a> with its inner content
        anchor.replaceWith(...temp.childNodes);

        console.log("✅ Removed unwanted <a> wrapper around nav section");
      }
    });
  };

  // --- Run once immediately ---
  removeAnchorWrappers();

  // --- Observe DOM for dynamic injections (like GTM, Bootstrap, CMS) ---
  const observer = new MutationObserver(removeAnchorWrappers);
  observer.observe(document.body, { childList: true, subtree: true });

  // --- Optional fallback: run every 1s just in case ---
  setInterval(removeAnchorWrappers, 1000);
});