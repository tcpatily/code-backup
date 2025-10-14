function tc_read_more_dynamic($) {
  $.tc_read_more = {
    defaults: {
      slicePoint: 100,
      sliceOn: null,
      preserveWords: true,
      normalizeWhitespace: true,
      showWordCount: false,
      detailPrefix: " ",
      wordCountText: " ({{count}} words)",
      widow: 4,
      expandText: "read more",
      expandPrefix: " ",
      expandAfterSummary: false,
      wordEnd: /(&(?:[^;]+;)?|[0-9a-zA-Z\u00C0-\u0100]+|[^\u0000-\u007F]+)$/,
      summaryClass: "tc_first_summary",
      detailClass: "tc_all_details",
      moreClass: "read-more",
      lessClass: "read-less",
      moreLinkClass: "more-link",
      lessLinkClass: "less-link",
      collapseTimer: 0,
      expandEffect: "slideDown",
      expandSpeed: 250,
      collapseEffect: "slideUp",
      collapseSpeed: 200,
      userCollapse: true,
      userCollapseText: "read less",
      userCollapsePrefix: " ",
      onSlice: null, // function() {}
      beforeExpand: null, // function() {},
      afterExpand: null, // function() {},
      onCollapse: null, // function(byUser) {}
      afterCollapse: null, // function() {}
    },
  };

  $.fn.tc_read_more = function (options) {
    var meth = "init";

    if (typeof options === "string") {
      meth = options;
      options = {};
    }

    var opts = $.extend({}, $.tc_read_more.defaults, options);
    var rSelfClose =
      /^<(?:area|br|col|embed|hr|img|input|link|meta|param).*>$/i;
    var rAmpWordEnd = opts.wordEnd;
    var rOpenCloseTag = /<\/?(\w+)[^>]*>/g;
    var rOpenTag = /<(\w+)[^>]*>/g;
    var rCloseTag = /<\/(\w+)>/g;
    var rLastCloseTag = /(<\/([^>]+)>)\s*$/;
    var rTagPlus = /^(<[^>]+>)+.?/;
    var rTrim = /(?:^\s+|\s+$)/g;
    var rMultiSpace = /\s\s+/g;
    var delayedCollapse;

    var removeSpaces = function (str) {
      return opts.normalizeWhitespace
        ? (str || "").replace(rTrim, "").replace(rMultiSpace, " ")
        : str;
    };

    var methods = {
      init: function () {
        this.each(function () {
          var i,
            l,
            tmp,
            newChar,
            summTagless,
            summOpens,
            summCloses,
            lastCloseTag,
            detailText,
            detailTagless,
            html,
            expand;
          var $thisDetails, $readMore;
          var slicePointChanged;
          var openTagsForDetails = [];
          var closeTagsForsummaryText = [];
          var strayChars = "";
          var defined = {};
          var thisEl = this;
          var $this = $(this);
          var $summEl = $([]);
          var o = $.extend({}, opts, $this.data("tc_read_more") || {});
          var hasDetails = !!$this.find("." + o.detailClass).length;
          var hasBlocks = !!$this.find("*").filter(function () {
            var display = $(this).css("display");

            return /^block|table|list/.test(display);
          }).length;
          var el = hasBlocks ? "div" : "span";
          var detailSelector = el + "." + o.detailClass;
          var moreClass = o.moreClass + "";
          var lessClass = o.lessClass + "";
          var expandSpeed = o.expandSpeed || 0;
          var allHtml = removeSpaces($this.html());
          var summaryText = allHtml.slice(0, o.slicePoint);
          o.moreSelector = "span." + moreClass.split(" ").join(".");
          o.lessSelector = "span." + lessClass.split(" ").join(".");
          if ($.data(this, "tc_read_moreInit")) {
            return;
          }

          $.data(this, "tc_read_moreInit", true);
          $.data(this, "tc_read_more", o);
          $.each(
            [
              "onSlice",
              "beforeExpand",
              "afterExpand",
              "onCollapse",
              "afterCollapse",
            ],
            function (index, val) {
              defined[val] = $.isFunction(o[val]);
            }
          );
          summaryText = backup(summaryText);
          summTagless = summaryText.replace(rOpenCloseTag, "").length;
          while (summTagless < o.slicePoint) {
            newChar = allHtml.charAt(summaryText.length);

            if (newChar === "<") {
              newChar = allHtml.slice(summaryText.length).match(rTagPlus)[0];
            }
            summaryText += newChar;
            summTagless++;
          }
          if (o.sliceOn) {
            slicePointChanged = changeSlicePoint({
              sliceOn: o.sliceOn,
              slicePoint: o.slicePoint,
              allHtml: allHtml,
              summaryText: summaryText,
            });

            summaryText = slicePointChanged.summaryText;
          }

          summaryText = backup(
            summaryText,
            o.preserveWords && allHtml.slice(summaryText.length).length
          );
          summOpens = summaryText.match(rOpenTag) || [];
          summCloses = summaryText.match(rCloseTag) || [];
          tmp = [];
          $.each(summOpens, function (index, val) {
            if (!rSelfClose.test(val)) {
              tmp.push(val);
            }
          });
          summOpens = tmp;
          l = summCloses.length;

          for (i = 0; i < l; i++) {
            summCloses[i] = summCloses[i].replace(rCloseTag, "$1");
          }
          $.each(summOpens, function (index, val) {
            var thisTagName = val.replace(rOpenTag, "$1");
            var closePosition = $.inArray(thisTagName, summCloses);

            if (closePosition === -1) {
              openTagsForDetails.push(val);
              closeTagsForsummaryText.push("</" + thisTagName + ">");
            } else {
              summCloses.splice(closePosition, 1);
            }
          });
          closeTagsForsummaryText.reverse();
          if (!hasDetails) {
            detailText = allHtml.slice(summaryText.length);
            detailTagless = detailText
              .replace(rOpenCloseTag, "")
              .replace(rTrim, "");

            if (
              detailTagless === "" ||
              detailTagless.split(/\s+/).length < o.widow
            ) {
              return;
            }
            lastCloseTag = closeTagsForsummaryText.pop() || "";
            summaryText += closeTagsForsummaryText.join("");
            detailText = openTagsForDetails.join("") + detailText;
          } else {
            detailText = $this.find(detailSelector).remove().html();
            summaryText = $this.html();
            allHtml = summaryText + detailText;
            lastCloseTag = "";
          }
          o.moreLabel = $this.find(o.moreSelector).length
            ? ""
            : buildMoreLabel(o, detailText);
          if (hasBlocks) {
            detailText = allHtml;
          } else if (summaryText.charAt(summaryText.length - 1) === "&") {
            strayChars = /^[#\w\d\\]+;/.exec(detailText);
            if (strayChars) {
              detailText = detailText.slice(strayChars[0].length);
              summaryText += strayChars[0];
            }
          }
          summaryText += lastCloseTag;
          o.summary = summaryText;
          o.details = detailText;
          o.lastCloseTag = lastCloseTag;
          if (defined.onSlice) {
            tmp = o.onSlice.call(thisEl, o);
            o = tmp && tmp.details ? tmp : o;
          }
          html = buildHTML(o, hasBlocks);

          $this.empty().append(html);
          $thisDetails = $this.find(detailSelector);
          $readMore = $this.find(o.moreSelector);
          if (
            (o.collapseEffect === "slideUp" &&
              o.expandEffect !== "slideDown") ||
            $this.is(":hidden")
          ) {
            $thisDetails.css({ display: "none" });
          } else {
            $thisDetails[o.collapseEffect](0);
          }

          $summEl = $this.find("div." + o.summaryClass);

          expand = function (event) {
            event.preventDefault();
            var exSpeed = event.startExpanded ? 0 : expandSpeed;

            $readMore.hide();
            $summEl.hide();

            if (defined.beforeExpand) {
              o.beforeExpand.call(thisEl);
            }

            $thisDetails
              .stop(false, true)
              [o.expandEffect](exSpeed, function () {
                $thisDetails.css({ zoom: "" });

                if (defined.afterExpand) {
                  o.afterExpand.call(thisEl);
                }
                delayCollapse(o, $thisDetails, thisEl);
              });
          };

          $readMore
            .find("a")
            .off("click.tc_read_more")
            .on("click.tc_read_more", expand);

          if (o.userCollapse && !$this.find(o.lessSelector).length) {
            $this
              .find(detailSelector)
              .append(
                '<span class="' +
                  o.lessClass +
                  '">' +
                  o.userCollapsePrefix +
                  '<a href="#" class="' +
                  o.lessLinkClass +
                  '">' +
                  o.userCollapseText +
                  "</a></span>"
              );
          }

          $this
            .find(o.lessSelector + " a")
            .off("click.tc_read_more")
            .on("click.tc_read_more", function (event) {
              event.preventDefault();
              clearTimeout(delayedCollapse);
              var $detailsCollapsed = $(this).closest(detailSelector);

              reCollapse(o, $detailsCollapsed);

              if (defined.onCollapse) {
                o.onCollapse.call(thisEl, true);
              }
            });

          if (o.startExpanded) {
            expand({
              preventDefault: function () {
                /* empty function */
              },
              startExpanded: true,
            });
          }
        }); // this.each
      },
      destroy: function () {
        this.each(function () {
          var o, details;
          var $this = $(this);

          if (!$this.data("tc_read_moreInit")) {
            return;
          }

          o = $.extend({}, $this.data("tc_read_more") || {}, opts);
          details = $this.find("." + o.detailClass).contents();

          $this.removeData("tc_read_moreInit");
          $this.removeData("tc_read_more");

          $this.find(o.moreSelector).remove();
          $this.find("." + o.summaryClass).remove();
          $this
            .find("." + o.detailClass)
            .after(details)
            .remove();
          $this.find(o.lessSelector).remove();
        });
      },
    };

    if (methods[meth]) {
      methods[meth].call(this);
    }

    function buildHTML(o, blocks) {
      var el = "span";
      var summary = o.summary;
      var closingTagParts = rLastCloseTag.exec(summary);
      var closingTag = closingTagParts ? closingTagParts[2].toLowerCase() : "";

      if (blocks) {
        el = "div";
        if (closingTagParts && closingTag !== "a" && !o.expandAfterSummary) {
          summary = summary.replace(rLastCloseTag, o.moreLabel + "$1");
        } else {
          summary += o.moreLabel;
        }
        summary = '<div class="' + o.summaryClass + '">' + summary + "</div>";
      } else {
        summary += o.moreLabel;
      }

      return [
        summary,
        o.detailPrefix || "",
        "<",
        el + ' class="' + o.detailClass + '"',
        ">",
        o.details,
        "</" + el + ">",
      ].join("");
    }

    function buildMoreLabel(o, detailText) {
      var ret = '<span class="' + o.moreClass + '">' + o.expandPrefix;

      if (o.showWordCount) {
        o.wordCountText = o.wordCountText.replace(
          /\{\{count\}\}/,
          detailText
            .replace(rOpenCloseTag, "")
            .replace(/&(?:amp|nbsp);/g, "")
            .replace(/(?:^\s+|\s+$)/, "")
            .match(/\w+/g).length
        );
      } else {
        o.wordCountText = "";
      }
      ret +=
        '<a href="#" class="' +
        o.moreLinkClass +
        '">' +
        o.expandText +
        o.wordCountText +
        "</a></span>";

      return ret;
    }

    function backup(txt, preserveWords) {
      if (txt.lastIndexOf("<") > txt.lastIndexOf(">")) {
        txt = txt.slice(0, txt.lastIndexOf("<"));
      }

      if (preserveWords) {
        txt = txt.replace(rAmpWordEnd, "");
      }

      return txt.replace(rTrim, "");
    }

    function reCollapse(o, el) {
      el.stop(true, true)[o.collapseEffect](o.collapseSpeed, function () {
        var prevMore = el.prev("span." + o.moreClass).show();

        if (!prevMore.length) {
          el.parent()
            .children("div." + o.summaryClass)
            .show()
            .find("span." + o.moreClass)
            .show();
        }

        if (o.afterCollapse) {
          o.afterCollapse.call(el);
        }
      });
    }

    function delayCollapse(option, $collapseEl, thisEl) {
      if (option.collapseTimer) {
        delayedCollapse = setTimeout(function () {
          reCollapse(option, $collapseEl);

          if ($.isFunction(option.onCollapse)) {
            option.onCollapse.call(thisEl, false);
          }
        }, option.collapseTimer);
      }
    }

    function changeSlicePoint(info) {
      var sliceOnTemp = "ExpandMoreHere374216623";
      var summaryTextClean = info.summaryText.replace(
        info.sliceOn,
        sliceOnTemp
      );
      summaryTextClean = $("<div>" + summaryTextClean + "</div>").text();
      var sliceOnIndexClean = summaryTextClean.indexOf(sliceOnTemp);
      var sliceOnIndexHtml = info.summaryText.indexOf(info.sliceOn);
      if (sliceOnIndexClean !== -1 && sliceOnIndexClean < info.slicePoint) {
        info.summaryText = info.allHtml.slice(0, sliceOnIndexHtml);
      }

      return info;
    }

    return this;
  };

  $.fn.tc_read_more.defaults = $.tc_read_more.defaults;
}
tc_read_more_dynamic($);
$(document).ready(function () {
  $(".read_more_data").tc_read_more({
    slicePoint: 180,
    showWordCount: false,
    expandEffect: "fadeIn",
    collapseEffect: "fadeOut",
  });
  $(".more_all_big").tc_read_more({
    slicePoint: 320,
    showWordCount: false,
    expandEffect: "fadeIn",
    collapseEffect: "fadeOut",
  });
  $(".more_landipage").tc_read_more({
    slicePoint: 151,
    showWordCount: false,
    expandEffect: "fadeIn",
    collapseEffect: "fadeOut",
  });
});
//Read More common script for all kinds data types Ends from here (Manoj Upadhyay)

// ===============================
// Managers Slide
// ===============================
$(document).ready(function () {
  $(
    ".taggingSEOData > .tagging_srp_tc > .srpcountry_tab:nth-child(2) h3"
  ).trigger("click");
  $(".srpcountry_tab h3, .srpcountry_tab h4").click(function () {
    $(".srpcountry_tab").removeClass("active");
    $(this).parent().addClass("active");
    $(".tabs_content a").remove();
    $(this).parent().find("a").clone().appendTo(".tabs_content");
  });

  $('<div class="tabs_content d-none d-lg-block"></div>').appendTo(
    ".taggingSEOData > .tagging_srp_tc"
  );

  setTimeout(() => {
    $(".managers_slide.owl-carousel").owlCarousel({
      autoplay: false,
      loop: false,
      nav: true,
      dots: false,
      autoplayTimeout: 7000,
      smartSpeed: 800,
      navText: [
        "<img src='/images/tcHolidays/chevron-left.svg'>",
        "<img src='/images/tcHolidays/chevron-right.svg'>",
      ],
      responsive: {
        0: {
          items: 1.3,
          margin: 20,
          loop: true,
        },
        1024: {
          items: 3,
          margin: 24,
        },
        1300: {
          items: 3,
          margin: 24,
        },
      },
    });
  }, 400);

  var classes = ["white_bg", "mint_bg", "peach_bg"];
  $(".managers_slide .card_box").each(function (index) {
    // Remove all three classes first (safety)
    $(this).removeClass(classes.join(" "));
    // Add class according to index modulo 3
    $(this).addClass(classes[index % 3]);
  });
});

$(document).ready(function () {
  var owl = $(".customer_slide").owlCarousel({
    autoplay: false,
    center: true,
    loop: true,
    nav: true,
    dots: false,
    autoplayTimeout: 7000,
    smartSpeed: 800,
    navText: [
      "<img src='/images/tcHolidays/chevron-left.svg'>",
      "<img src='/images/tcHolidays/chevron-right.svg'>",
    ],
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
      },
    },
  });
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
        "clip-path": `inset(0px ${value}px 0px ${value}px round ${value}px)`,
      });

      var textMove = Math.min(scrollY * 0.5, 80);
      jQuery(".hero_section .bnr_text").css({
        transform: `translateY(-${textMove}px)`,
      });
    }
  }
});

// ---------------------------
// Typing Effect in Search Placeholder
// ---------------------------
$(document).ready(function () {
  const dataLists = {
    default: ["Dubai", "USA", "India", "Japan", "France", "Canada"],
    domestic: [
      "Delhi",
      "Mumbai",
      "Bangalore",
      "Hyderabad",
      "Chennai",
      "Kolkata",
    ],
    international: [
      "USA",
      "UK",
      "Australia",
      "Japan",
      "France",
      "Germany",
      "Canada",
    ],
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
        input.placeholder =
          "Search “" + currentText.substring(0, charIndex - 1) + "”";
      } else {
        input.placeholder =
          "Search “" + currentText.substring(0, charIndex + 1) + "”";
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

// ===============================
// Custom Search Modal: Show, Hide, Filter Search Results, and Clear Input
// ===============================
$(document).ready(function () {
  let ignoreOutsideClick = false;

  const $body = $("body"),
    $searchInput = $(".searchInput"),
    $searchPopup = $(".search_popup"),
    $searchCard = $(".search_card"),
    $topItem = $(".top_item"),
    $resultBox = $(".result_box"),
    $btnCross = $(".btn_cross"),
    $btnBack = $(".btn_back");

  const $noResultsMessage = $('<div class="no-results"></div>').hide();
  $searchCard.append($noResultsMessage);

  function showSearchModal() {
    ignoreOutsideClick = true; // ✅ temporarily ignore click
    setTimeout(() => (ignoreOutsideClick = false), 300); // ✅ after 300ms allow again

    if ($(".custom-backdrop").length === 0) {
      $body.append(
        '<div class="custom-backdrop fade" data-backdrop-for="search"></div>'
      );
    }

    const $backdrop = $('.custom-backdrop[data-backdrop-for="search"]');
    $backdrop.addClass("show").fadeIn(300);

    if (!$body.hasClass("modal-open")) {
      $body.attr("data-search-open", "true").css({
        overflow: "hidden",
        paddingRight: window.innerWidth > 768 ? "15px" : "",
      });
    }

    $searchPopup.show();
    setTimeout(() => $searchPopup.addClass("show"), 10);
  }

  function hideSearchModal() {
    const $backdrop = $('.custom-backdrop[data-backdrop-for="search"]');
    $backdrop.removeClass("show").fadeOut(300, function () {
      $(this).remove();

      // Animation complete hone ke baad hi body ki styling remove karen
      if (
        $body.attr("data-search-open") === "true" &&
        !$body.hasClass("modal-open")
      ) {
        $body.removeAttr("style");
        $body.removeAttr("data-search-open");
      }
    });

    $searchPopup.removeClass("show");
    setTimeout(() => $searchPopup.hide(), 300);
  }

  // 🔍 Input focus triggers popup
  $searchInput.on("focus", function () {
    showSearchModal();
    if (!this.value.trim()) {
      $topItem.show();
      $resultBox.hide();
    }
  });

  // ⌨️ Input typing logic
  $searchInput.on("input", function () {
    const query = this.value.toLowerCase().trim();
    $btnCross.toggle(query.length > 0);
    $topItem.toggle(!query.length);
    $resultBox.toggle(!!query.length);

    let hasResults = false;
    $resultBox.each(function () {
      const $items = $(this).find("ul li");
      const matches = $items.filter((_, li) =>
        $(li).text().toLowerCase().includes(query)
      );

      $items.hide().filter(matches).show();
      $(this).toggle(matches.length > 0);
      if (matches.length > 0) hasResults = true;
    });

    $noResultsMessage.toggle(!hasResults && query.length > 0);
  });

  // ❌ Clear input
  $btnCross.on("click", function () {
    $searchInput.val("").trigger("input").focus();
  });

  // 📄 Click outside to close (but ignore right after open)
  $(document).on("click", function (e) {
    if (ignoreOutsideClick) return;
    if (
      !$(e.target).closest(".search_popup").length &&
      $('.custom-backdrop[data-backdrop-for="search"]').length
    ) {
      hideSearchModal();
    }
  });

  // 🟤 Click on backdrop also closes
  $(document).on(
    "click",
    '.custom-backdrop[data-backdrop-for="search"]',
    hideSearchModal
  );

  // 🔙 Back button
  $btnBack.on("click", function (e) {
    e.preventDefault();
    hideSearchModal();
  });
});

// ---------------------------
// Scroll filter box horizontal scroll with buttons and active tab
// ---------------------------
$(document).ready(function () {
  const scrollBox = $(".filter-scroll");
  const leftBtn = $(".scroll-btn.left");
  const rightBtn = $(".scroll-btn.right");

  function checkScrollButtons() {
    const scrollLeft = scrollBox.scrollLeft();
    const scrollWidth = scrollBox[0].scrollWidth;
    const containerWidth = scrollBox.outerWidth();

    if (scrollLeft <= 0) {
      leftBtn.addClass("disable");
    } else {
      leftBtn.removeClass("disable");
    }

    if (scrollLeft + containerWidth >= scrollWidth - 1) {
      rightBtn.addClass("disable");
    } else {
      rightBtn.removeClass("disable");
    }
  }

  checkScrollButtons();

  leftBtn.click(function () {
    scrollBox.animate({ scrollLeft: "-=200" }, 300, checkScrollButtons);
  });

  rightBtn.click(function () {
    scrollBox.animate({ scrollLeft: "+=200" }, 300, checkScrollButtons);
  });

  scrollBox.on("scroll", checkScrollButtons);

  $(".filter-tab").on("click", function () {
    const filter = $(this).data("filter");
    $(".filter-tab").removeClass("active");
    $(".filter-tab").filter(`[data-filter="${filter}"]`).addClass("active");

    const $cards = $(".package-card");

    $cards
      .stop(true, true)
      .removeClass("is-animated")
      .fadeOut(300)
      .promise()
      .done(function () {
        if (filter === "all") {
          $cards.addClass("is-animated").fadeIn(300);
        } else {
          $cards.each(function () {
            const categories = $(this).data("category").split(" ");
            if (categories.includes(filter) || categories.includes("all")) {
              $(this).addClass("is-animated").fadeIn(300);
            }
          });
        }
      });
  });
});

//$(document).on('click', '.filter-tab', function () {
//    const filter = $(this).data('filter');
//
//    $('.filter-tab').removeClass('active');
//    $(this).addClass('active');
//
//    const $cards = $('.package-card');
//
//    $cards.stop(true, true).removeClass('is-animated').fadeOut(300).promise().done(function () {
//        if (filter === 'all') {
//            $cards.addClass('is-animated').fadeIn(300);
//        } else {
//            $cards.each(function () {
//                const categories = $(this).data('category').split(' ');
//                if (categories.includes(filter) || categories.includes('all')) {
//                    $(this).addClass('is-animated').fadeIn(300);
//                }
//            });
//        }
//    });
//});

$(document).on("click", ".monthOfTravelSideFilter", function () {
  generateYearCalendar("yearCalendar");
});

// ---------------------------
// Checkbox Toggles & Sticky Header
// ---------------------------
$(document).ready(function () {
  const tooltipTriggerList = document.querySelectorAll(
    '[data-bs-toggle="tooltip"]'
  );
  const tooltipList = [...tooltipTriggerList].map(
    (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl)
  );

  // ---------------------------
  // Add to Compare Checkbox Logic
  // ---------------------------
  $(".addTo_Compare").on("change", function () {
    const isAnyChecked = $(".addTo_Compare:checked").length > 0;

    if (isAnyChecked) {
      $(".addtoCompare_blc").addClass("active");
    } else {
      $(".addtoCompare_blc").removeClass("active");
    }
  });

  // ---------------------------
  // Compare Check Toggle (Only controlled by checkbox)
  // ---------------------------
  jQuery(".compareCheck").on("change", function () {
    var isChecked = jQuery(this).is(":checked");
    jQuery(".compareCheck").prop("checked", isChecked);

    if (isChecked) {
      jQuery(".compare").addClass("active");
    } else {
      jQuery(".compare").removeClass("active");
    }
  });

  // ---------------------------
  // Block Outside Click from affecting `.compare`
  // ---------------------------
  $(document).off("click.compareClose");

  // If someone added outside-click logic, override it
  $(document).on("click.compareClose", function (e) {
    if ($(e.target).closest(".compare, #compareCheck").length === 0) {
    }
  });

  $(window).on("scroll", function () {
    var scrollTop = $(window).scrollTop();
    var $filterCards = $(".filter_andCards");
    var triggerOffsetTop = $filterCards.offset().top;
    var triggerOffsetBottom = triggerOffsetTop + $filterCards.outerHeight();

    var $filter = $(".onScroll_filter");
    var $allFilters = $(".all_filters");

    if (scrollTop >= triggerOffsetTop && scrollTop < triggerOffsetBottom) {
      // Scroll is within filter_andCards section
      $filter.addClass("is-sticky");
      $allFilters.addClass("is-sticky");
    } else {
      // Scroll is before or after filter_andCards section
      $filter.removeClass("is-sticky");
      $allFilters.removeClass("is-sticky");
    }
  });
});

// ===============================
// Packages Image Slider (OwlCarousel)
// ===============================

// ---------------------------
// Grid / List View Toggle & Filter Button
// ---------------------------
$(document).ready(function () {
  $(".tour_packages").each(function () {
    const $section = $(this);
    const $gridBtns = $section.find(".gridlist_buttons .btn:first-child");
    const $listBtns = $section.find(".gridlist_buttons .btn:last-child");
    const $filterBtn = $section.find(".filter_btn");
    const $packageGrids = $section.find(".package_grids");
    const $filterBlock = $section.find(".filter_block");
    const $filterCards = $section.find(".filter_andCards");
    const $allFilter = $section.find(".all_filters");
    const $owl = $section.find(".package_grids .owl-carousel");

    function refreshOwl() {
      if ($owl.hasClass("owl-loaded")) {
        $owl.trigger("refresh.owl.carousel");
      }
    }

    function activateGrid() {
      $gridBtns.addClass("active");
      $listBtns.removeClass("active");
      $filterBtn?.removeClass("active list").addClass("grid");

      $packageGrids.removeClass("list").addClass("grid");
      $packageGrids
        .find(".col-12, .col-lg-6")
        .removeClass("col-12 col-lg-6")
        .addClass("col-lg-4 col-md-4");

      if (window.innerWidth <= 767) {
        $allFilter.removeClass("active");
      } else {
        $allFilter.removeClass("active").hide();
      }

      $filterBlock.removeClass("grid-with-filter").addClass("grid-reset");
      $filterCards.removeClass("grid-with-filter").addClass("grid-default");

      refreshOwl();
    }

    function activateList() {
      $listBtns.addClass("active");
      $gridBtns.removeClass("active");
      $filterBtn?.removeClass("grid").addClass("list active");

      $packageGrids.removeClass("grid").addClass("list");

      // Remove all grid classes and force full width for list
      // $packageGrids.find('.col-lg-4, .col-md-4, .col-lg-6').removeClass('col-lg-4 col-md-4 col-lg-6').addClass('col-12');

      // Remove any leftover grid-specific classes from individual package cards
      //$('.package-card').removeClass('col-lg-4 col-md-4 col-lg-6').addClass('col-12');

      if (window.innerWidth <= 767) {
        $allFilter.addClass("active");
      } else {
        $allFilter.addClass("active").show();
      }

      // Do NOT add col-lg-6 col-md-4 here for list view
      // Remove this old block:
      // if ($('.all_filters').hasClass('active')) {
      //     $('.package-card').removeClass('col-lg-4 col-md-4').addClass('col-lg-6 col-md-4');
      // }

      $filterBlock.removeClass("grid-reset").addClass("grid-with-filter");
      $filterCards.removeClass("grid-default").addClass("grid-with-filter");

      refreshOwl();
    }

    function closeFilter() {
      $filterBtn.removeClass("active");
      if (window.innerWidth <= 767) {
        $allFilter.removeClass("active");

        // Remove inline styles to prevent display:none/block
        setTimeout(() => {
          $allFilter.removeAttr("style");
        }, 400); // Match your CSS transition time
      } else {
        $allFilter.removeClass("active").hide();
      }

      $filterBlock.removeClass("grid-with-filter").addClass("grid-reset");
      $filterCards.removeClass("grid-with-filter").addClass("grid-default");

      activateGrid();

      const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
      $backdrop.removeClass("show").fadeOut(300, function () {
        $(this).remove();
      });

      $("body").removeClass("filter-open");
    }

    // Grid button clicked
    $gridBtns.on("click", function () {
      activateGrid();
    });

    // List button clicked
    $listBtns.on("click", function () {
      activateList();
      $(".package-card").removeClass("col-lg-4 col-md-4 col-lg-6").addClass("col-12");
    });

    $gridBtns.on("click", function () {
      $(".package-card").removeClass("col-12").addClass("col-lg-4 col-md-4");
    });

    // Filter toggle button
    $filterBtn?.on("click", function () {
      const isFilterActive = $(this).hasClass("active");
      const delay = 400; // 👈 Adjust this to match your transition time

      if (!isFilterActive) {
        // Delay filter open animation
        setTimeout(() => {
          $filterBtn.addClass("active");

          if (window.innerWidth <= 767) {
            $allFilter.addClass("active");
          } else {
            $allFilter.addClass("active").show();
          }

          $filterBlock.removeClass("grid-reset").addClass("grid-with-filter");
          $filterCards.removeClass("grid-default").addClass("grid-with-filter");

          if ($listBtns.hasClass("active")) {
            $packageGrids
              .find('[class*="col-"]')
              .removeClass("col-lg-3 col-lg-4 col-lg-6 col-12")
              .addClass("col-12");
            $filterBtn.removeClass("grid").addClass("list");
          } else {
            $packageGrids
              .find('[class*="col-"]')
              .removeClass("col-lg-3 col-lg-4 col-lg-6 col-12")
              .addClass("col-lg-6");
            $filterBtn.removeClass("list").addClass("grid");
          }

          // Handle mobile backdrop
          if (window.innerWidth <= 767) {
            if (
              $('.custom-backdrop[data-backdrop-for="filter"]').length === 0
            ) {
              $("body").append(
                '<div class="custom-backdrop fade" data-backdrop-for="filter"></div>'
              );
            }

            const $backdrop = $('.custom-backdrop[data-backdrop-for="filter"]');
            $backdrop.addClass("show").fadeIn(300);
            $("body").addClass("filter-open");
          }

          refreshOwl(); // Reinit after opening filter
        }, delay); // 👈 delayed filter opening
      } else {
        // Delay closing logic for smooth transition
        setTimeout(() => {
          closeFilter();
          refreshOwl(); // Reinit after closing filter
        }, delay);
      }
    });

    // btn_close click
    $section.on("click", ".btn_close", function () {
      closeFilter();
    });

    // backdrop click
    $(document).on(
      "click",
      '.custom-backdrop[data-backdrop-for="filter"]',
      function () {
        closeFilter();
      }
    );

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

// ===============================
// Sort Dropdown Toggle and Selection Handling
// ===============================
$(document).ready(function () {
  jQuery(".sort_selected").on("click", function () {
    jQuery(".sort_dropdown").toggleClass("active");
    jQuery(".sort_options").slideToggle(200);
  });

  jQuery(".sort_options li").on("click", function () {
    var selectedText = jQuery(this).text();
    jQuery(".selected_option").text(selectedText);

    jQuery(".sort_options li").removeClass("active");
    jQuery(this).addClass("active");

    jQuery(".sort_options").slideUp(200);
    jQuery(".sort_dropdown").removeClass("active");
  });

  jQuery(document).on("click", function (e) {
    if (!jQuery(e.target).closest(".sort_dropdown").length) {
      jQuery(".sort_options").slideUp(200);
      jQuery(".sort_dropdown").removeClass("active");
    }
  });

  jQuery(".short_filter .btn").on("click", function () {
    $(this).siblings(".sort_option").slideToggle(300);
  });

  // Optional: close dropdown if clicked outside
  jQuery(document).on("click", function (e) {
    if (!$(e.target).closest(".short_filter").length) {
      $(".sort_option").slideUp(300);
    }
  });
});

// -------------------------------------------------------------
// Filter Dropdown with Tags Display & Clear Functionality
// -------------------------------------------------------------
/*
jQuery(document).ready(function ($) {
    $('.dropdown_filter').each(function () {
        const $filterBox = $(this);
        const $checkboxes = $filterBox.find('.form-check-input');
        const $appliedContainer = $filterBox.siblings('.applied_filter').find('.appliedNo');

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

            const existing = $appliedContainer.find(`[data-id="${id}"]`);
            if (existing.length) {
                existing.slideUp(200, function () {
                    $(this).remove();
                    toggleAppliedVisibility(); // check after remove
                });
            }

            if ($cb.is(':checked')) {
                const $item = $(`
                    <li data-id="${id}">
                        ${label}
                        <a class="btn"><img src="assets/images/common-img/x-close.svg" alt=""></a>
                    </li>
                `).hide();
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
*/
// ---------------------------
//  Search filter
// ---------------------------
$(".all_filters .dropdown_filter").each(function () {
  var $dropdown = $(this);
  var $input = $dropdown.find(".search_box input");
  var $items = $dropdown.find("> .dropdown_list > ul.dropdown_items > li");

  // Ensure all items are visible by default
  $items.show();

  $input.off("input").on("input", function () {
    var filter = $(this).val().toLowerCase().trim();

    if (filter === "") {
      $items.show();
    } else {
      $items.each(function () {
        var text = $(this).text().toLowerCase();
        $(this).toggle(text.indexOf(filter) !== -1);
      });
    }
  });
});

// ---------------------------
// Dropdown filter See More / See Less
// ---------------------------
$(".all_filters .dropdown_filter.themes_filter").each(function () {
  var $dropdown = $(this);
  var $items = $dropdown.find("> .dropdown_list > ul.dropdown_items > li");
  var $btnMore = $dropdown.find(".seemore_btn");
  var $img = $btnMore.find("img");
  var visibleCount = 5;

  // Initialize state
  $items.hide().slice(0, visibleCount).show();
  $btnMore.data("expanded", false);

  $btnMore.off("click").on("click", function () {
    var isExpanded = $btnMore.data("expanded");

    if (!isExpanded) {
      $items.slice(visibleCount).slideDown();
      $btnMore.contents().first()[0].textContent = "See Less ";
      $img.css("transform", "rotate(180deg)");
      $btnMore.data("expanded", true);
    } else {
      $items.slice(visibleCount).slideUp();
      $btnMore.contents().first()[0].textContent = "See More ";
      $img.css("transform", "rotate(0deg)");
      $btnMore.data("expanded", false);
    }
  });
});

// ---------------------------
// Dropdown button toggle show/hide
// ---------------------------
$(document).ready(function () {
  // Sab dropdowns hide karo
  $(".dropdown_list").hide();

  // Pehla dropdown show karo aur button active banao
  var $firstDropdown = $(".dropdown_filter").first();
  $firstDropdown.find(".dropdown_list").show();
  $firstDropdown.find(".dropdown_button").addClass("active");

  // Button click event
  $(".dropdown_button").click(function (e) {
    e.stopPropagation();

    var $button = $(this);
    var $dropdownFilter = $button.closest(".dropdown_filter");
    var $currentList = $dropdownFilter.find(".dropdown_list");

    // Agar already open hai, toh band kar do
    if ($button.hasClass("active")) {
      $currentList.stop(true, true).slideUp(200);
      $button.removeClass("active");
    } else {
      // Sab dropdowns band karo aur buttons se active hatao
      $(".dropdown_list").stop(true, true).slideUp(200);
      $(".dropdown_button").removeClass("active");

      // Ab current open karo
      $currentList.stop(true, true).slideDown(200);
      $button.addClass("active");
    }
  });

  $(".dropdown_list").click(function (e) {
    e.stopPropagation();
  });
});

// ===============================
// Sort Filter Toggle with Backdrop
// ===============================
jQuery(document).ready(function () {
  jQuery(".sort_filter").on("click", function () {
    // Toggle class on sort_wrapper
    jQuery(".sort_wrapper").toggleClass("active");

    // Check if backdrop already exists
    if (jQuery('.custom-backdrop[data-backdrop-for="sort"]').length === 0) {
      jQuery("body").append(
        '<div class="custom-backdrop fade" data-backdrop-for="sort"></div>'
      );
    }

    // Show backdrop
    jQuery('.custom-backdrop[data-backdrop-for="sort"]')
      .addClass("show")
      .fadeIn(300);
    jQuery("body").addClass("sort-open");
  });

  // Close on btn_close click
  jQuery(document).on("click", ".btn_close", function () {
    jQuery(".sort_wrapper").removeClass("active");
    jQuery('.custom-backdrop[data-backdrop-for="sort"]')
      .removeClass("show")
      .fadeOut(300, function () {
        jQuery(this).remove();
      });
    jQuery("body").removeClass("sort-open");
  });

  // Close on backdrop click
  jQuery(document).on(
    "click",
    '.custom-backdrop[data-backdrop-for="sort"]',
    function () {
      jQuery(".sort_wrapper").removeClass("active");
      jQuery(this)
        .removeClass("show")
        .fadeOut(300, function () {
          jQuery(this).remove();
        });
      jQuery("body").removeClass("sort-open");
    }
  );
});

// ---------------------------
// Yearly calendar functionality
// ---------------------------
//function generateYearCalendar(containerId) {
//    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
//        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
//
//    const today = new Date();
//    const startMonth = today.getMonth(); // 0 = Jan
//    const startYear = today.getFullYear();
//
//    const $container = $('#' + containerId);
//    $container.empty();
//
//    for (let i = 0; i < 2; i++) {
//        const $block = $('<div class="year_block"></div>');
//        const blockYear = (i === 0) ? startYear : startYear + 1;
//
//        const $yearTitle = $(`
//            <div class="top_block">
//                <p class="calendar-year">${blockYear}</p>
//            </div>
//        `);
//        const $monthsGrid = $('<div class="months-grid"></div>');
//
//        for (let j = 0; j < 6; j++) {
//            let monthIndex = (i === 0) ? startMonth + j : j;
//            if (i === 0 && monthIndex >= 12) continue;
//
//            const displayMonth = months[monthIndex % 12];
//
//            const $month = $(`
//                <div class="month" @click="monthClick" data-month="${monthIndex % 12}" data-year="${blockYear}">
//                    ${displayMonth}
//                </div>
//            `);
//
//            $month.on('click', function () {
//                // Remove .selected from all months
//                $('.month').removeClass('selected');
//
//                // Add .selected to this one
//                $(this).addClass('selected');
//
//                // Optional: handle the selected month value
//                const month = $(this).data('month');
//                const year = $(this).data('year');
//                console.log(`Selected: ${months[month]} ${year}`);
//            });
//
//            $monthsGrid.append($month);
//        }
//
//        $block.append($yearTitle).append($monthsGrid);
//        $container.append($block);
//    }
//}
//
//$(document).ready(function () {
//    generateYearCalendar('yearCalendar');
//});

// ---------------------------
// Price and N Value Sliders with Fill and Display Update
// ---------------------------
$(document).ready(function () {
  function fillSlider(
    from,
    to,
    sliderColor,
    rangeStartColor,
    rangeEndColor,
    controlSlider
  ) {
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
    return value;
    //return 'â‚¹' + value.toLocaleString('en-IN');
  }

  // Price Slider setup and update
  const priceMinSlider = document.querySelector("#priceMinSlider");
  const priceMaxSlider = document.querySelector("#priceMaxSlider");
  const priceMinDisplay = document.querySelector("#priceMinDisplay");
  const priceMaxDisplay = document.querySelector("#priceMaxDisplay");

  //    priceMinSlider.min = 0;
  //    priceMaxSlider.min = 0;
  //    priceMinSlider.max = 125000;
  //    priceMaxSlider.max = 125000;

  //    priceMinSlider.value = 40000;
  //    priceMaxSlider.value = 125000;

  function updatePriceDisplays() {
    let fromVal = parseInt(priceMinSlider.value);
    let toVal = parseInt(priceMaxSlider.value);

    priceMinDisplay.textContent = formatINR(fromVal);
    priceMaxDisplay.textContent = formatINR(toVal);

    fillSlider(
      priceMinSlider,
      priceMaxSlider,
      "#d7dae0",
      "#2E90FA",
      "#175CD3",
      priceMaxSlider
    );
  }

  priceMinSlider.addEventListener("input", () => {
    if (parseInt(priceMinSlider.value) > parseInt(priceMaxSlider.value)) {
      priceMinSlider.value = priceMaxSlider.value;
    }
    updatePriceDisplays();
  });

  priceMaxSlider.addEventListener("input", () => {
    if (parseInt(priceMaxSlider.value) < parseInt(priceMinSlider.value)) {
      priceMaxSlider.value = priceMinSlider.value;
    }
    updatePriceDisplays();
  });

  updatePriceDisplays();

  // N Value Slider setup and update
  const fromSlider = document.querySelector("#fromSlider");
  const toSlider = document.querySelector("#toSlider");
  const minDurationValueDisplay = document.querySelector(
    "#minDurationValueDisplay"
  );
  const maxDurationValueDisplay = document.querySelector(
    "#maxDurationValueDisplay"
  );

  //    fromSlider.min = 0;
  //    toSlider.min = 0;
  //    fromSlider.max = 8;
  //    toSlider.max = 8;
  //
  //    fromSlider.value = 4;
  //    toSlider.value = 8;

  function updateValueDisplays() {
    const fromVal = parseInt(fromSlider.value);
    const toVal = parseInt(toSlider.value);

    minDurationValueDisplay.textContent = formatINR(fromVal) + "N";
    maxDurationValueDisplay.textContent = formatINR(toVal) + "N";

    //        if (fromVal >= 4) {
    //            minDurationValueDisplay.classList.add('activeValue');
    //        } else {
    //            maxDurationValueDisplay.classList.remove('activeValue');
    //        }

    fillSlider(fromSlider, toSlider, "#d7dae0", "#2E90FA", "#175CD3", toSlider);
  }

  fromSlider.addEventListener("input", () => {
    //        let fromVal = parseInt(fromSlider.value);
    //        let toVal = parseInt(toSlider.value);
    //
    //        if (fromVal < 0) fromVal = 0;
    //        if (fromVal > toVal) fromVal = toVal;
    //
    //        fromSlider.value = fromVal;
    updateValueDisplays();
  });

  toSlider.addEventListener("input", () => {
    //        let fromVal = parseInt(fromSlider.value);
    //        let toVal = parseInt(toSlider.value);
    //
    //        if (toVal > 8) toVal = 8;
    //        if (toVal < fromVal) toVal = fromVal;
    //
    //        toSlider.value = toVal;
    updateValueDisplays();
  });

  updateValueDisplays();
});

// ===============================
// Flight Hour Range Slider Logic
// ===============================
jQuery(document).ready(function () {
  const fromSlider = document.getElementById("fromSlider");
  const toSlider = document.getElementById("toSlider");
  const minValueDisplay = document.getElementById("minValueDisplay");
  const maxValueDisplay = document.getElementById("maxValueDisplay");

  // Slider background fill function
  function fillSlider(from, to, sliderColor, rangeColor, controlSlider) {
    const rangeDistance = to.max - to.min;
    const fromPosition = from.value - to.min;
    const toPosition = to.value - to.min;

    controlSlider.style.background = `linear-gradient(
        to right,
        ${sliderColor} 0%,
        ${sliderColor} ${(fromPosition / rangeDistance) * 100}%,
        ${rangeColor} ${(fromPosition / rangeDistance) * 100}%,
        ${rangeColor} ${(toPosition / rangeDistance) * 100}%,
        ${sliderColor} ${(toPosition / rangeDistance) * 100}%,
        ${sliderColor} 100%)`;
  }

  // Display update
  function updateHourDisplays() {
    const fromVal = parseInt(fromSlider.value);
    const toVal = parseInt(toSlider.value);

    minValueDisplay.textContent = `${fromVal} Hr.`;
    maxValueDisplay.textContent = `${toVal} Hr.`;

    if (fromVal >= 1) {
      minValueDisplay.classList.add("activeValue");
    } else {
      minValueDisplay.classList.remove("activeValue");
    }

    fillSlider(fromSlider, toSlider, "#EDEEF1", "#0f4ca4", toSlider);
  }

  // Set limits on fromSlider
  fromSlider.addEventListener("input", () => {
    let fromVal = parseInt(fromSlider.value);
    let toVal = parseInt(toSlider.value);

    if (fromVal < 1) fromVal = 1;
    if (fromVal > toVal) fromVal = toVal;

    fromSlider.value = fromVal;
    updateHourDisplays();
  });

  // Set limits on toSlider
  toSlider.addEventListener("input", () => {
    let fromVal = parseInt(fromSlider.value);
    let toVal = parseInt(toSlider.value);

    if (toVal > 24) toVal = 24;
    if (toVal < fromVal) toVal = fromVal;

    toSlider.value = toVal;
    updateHourDisplays();
  });

  // Initial update
  updateHourDisplays();
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

  //    $(".btn_loadMore").click(function () {
  //        currentVisible += itemsToShow;
  //        items.slice(0, currentVisible).slideDown();
  //        if (currentVisible >= totalItems) {
  //            $(this).fadeOut();
  //        }
  //    });
});

// ===============================
// Customer Slide Owl Carousel: Centered and Responsive
// ===============================

// ===============================
// Blogs Slide
// ===============================
window.onload = function () {
  $(".blogs_slide").owlCarousel({
    autoplay: false,
    loop: false,
    nav: true,
    dots: false,
    autoplayTimeout: 7000,
    smartSpeed: 800,
    touchDrag: true,
    mouseDrag: true,
    navText: [
      "<img src='/images/tcHolidays/chevron-left.svg'>",
      "<img src='/images/tcHolidays/chevron-right.svg' alt='Next'>",
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
        margin: 24,
      },
      1200: {
        items: 3,
        margin: 16,
      },
      1440: {
        items: 3,
        margin: 24,
      },
    },
  });
};

// ---------------------------
// Desktop: initialize Bootstrap tooltip to Mobile
// ---------------------------
$(document).ready(function () {
  var $tooltipEl = $(".tooltip_toggle a");
  var fullText = $tooltipEl.attr("data-bs-title");

  if ($(window).width() >= 768) {
    // Desktop: initialize Bootstrap tooltip
    $tooltipEl.tooltip();
  } else {
    // Mobile: replace <a> with plain text
    $tooltipEl.parent().text(fullText);
  }
});

// ---------------------------
// Read More / Read Less Toggle
// ---------------------------
$(document).ready(function () {
  $(".read-more").click(function () {
    $(".read_moreText").slideToggle();
    let span = $(this).find("span");
    let img = $(this).find(".arrow_icon");

    if (span.text() === "Read More") {
      span.text("Read Less");
      img.css("transform", "rotate(180deg)");
    } else {
      span.text("Read More");
      img.css("transform", "rotate(0deg)");
    }
  });
});

$(document).on("change", ".month-checkbox", function () {
  if (this.checked) {
    $(".month-checkbox").not(this).prop("checked", false);
  }
});
$(function () {
  $("#phone").intlTelInput({
    initialCountry: "in",
    separateDialCode: true,
    //utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
  });
});
// ===============================
// FAQ Accordion: Toggle active class based on clicked accordion button
// ===============================
$(document).ready(function () {
  jQuery(".faq_section .accordion-button").on("click", function () {
    jQuery(".faq_section .accordion-item").removeClass("active");
    let parentItem = jQuery(this).closest(".accordion-item");
    if (!jQuery(this).hasClass("collapsed")) {
      parentItem.addClass("active");
    }
  });
});

$(document).on("change", ".tour-type-filter .form-check-input", function () {
  $(".tour-type-filter .form-check-input").not(this).prop("checked", false);
});
//$(document).on("click", ".wishlist-btn", function() {
// const icon = $(this).find("i");

// if (icon.hasClass("icon-svg-favorite")) {
//  icon.removeClass("icon-svg-favorite").addClass("icon-svg-favorite-solid");
// } else {
//    icon.removeClass("icon-svg-favorite-solid").addClass("icon-svg-favorite");
//}
//});

// SEARCH RESULT FOCUS
var $searchInput = $(".searchInput");

function getResultLinks() {
  // Get all <a> inside <li> inside any .search_result
  return $(".search_result ul li a");
}

function setActiveLink($links, index) {
  $links.removeClass("active");
  if (index >= 0 && index < $links.length) {
    $links.eq(index).addClass("active").focus();
  }
}

function moveFocus($links, currentIndex, direction) {
  var length = $links.length;
  if (length === 0) return;

  var nextIndex;
  if (direction === "down") {
    nextIndex = (currentIndex + 1) % length;
  } else if (direction === "up") {
    nextIndex = (currentIndex - 1 + length) % length;
  }

  setActiveLink($links, nextIndex);
}

// Arrow key navigation from search input
$searchInput.on("keydown", function (e) {
  var $links = getResultLinks();
  var direction = null;

  if (e.keyCode === 40) direction = "down"; // Arrow Down
  if (e.keyCode === 38) direction = "up"; // Arrow Up

  if (direction) {
    //e.preventDefault();
    // From input, treat as starting before first (down) or at end (up)
    var index = direction === "down" ? -1 : $links.length;
    moveFocus($links, index, direction);
  }
});

// Arrow + Enter navigation on result links
$(document).on("keydown", ".search_result ul li a", function (e) {
  var $links = getResultLinks();
  var currentIndex = $links.index(this);

  if (e.keyCode === 40) {
    // Arrow down
    e.preventDefault();
    moveFocus($links, currentIndex, "down");
  } else if (e.keyCode === 38) {
    // Arrow up
    e.preventDefault();
    moveFocus($links, currentIndex, "up");
  } else if (e.keyCode === 13) {
    // Enter
    //e.preventDefault();
    $(this).trigger("click");
  }
});

// Mouse click handling
$(document).on("click", ".search_result ul li a", function (e) {
  var $links = getResultLinks();
  var index = $links.index(this);
  setActiveLink($links, index);
});

// Optional: Remove active class on blur
$(document).on("blur", ".search_result ul li a", function () {
  $(this).removeClass("active");
});

$(".search_box .searchInput").focus(function () {
  setTimeout(function () {
    $(".search_popup .searchInput").val("");
    $(".search_popup .searchInput").focus();
  }, 200);
});

$(document).ready(function () {
  // Language toggle
  $(".language_toggle").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $(".language_dropdown").toggleClass("open");
    $(this).toggleClass("active");
  });

  // Login toggle
  $(".btn_login").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $(".profile_dropdown").toggleClass("open");
  });

  // Click outside closes both dropdowns
  $(document).click(function () {
    $(".language_dropdown, .profile_dropdown").removeClass("open");
    $(".language_toggle").removeClass("active");
  });

  // Click inside doesn't close
  $(".language_dropdown, .profile_dropdown").click(function (e) {
    e.stopPropagation();
  });
});
jQuery(document).ready(function () {
  jQuery(".footer").each(function () {
    const $footer = jQuery(this);
    const $tabs = $footer.find(".nav-tabs");
    const $tabContent = $footer.find(".tab-content");
    const $accordionWrapper = $footer.find(".footer_accordian .accordion");

    const $tabButtons = $tabs.find(".nav-link");

    $tabButtons.each(function (index) {
      const $btn = jQuery(this);
      const targetId = $btn.attr("data-bs-target")?.replace("#", "");
      const title = $btn.text().trim();
      const $content = $tabContent.find("#" + targetId);

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

$(".customer_email2").on("keyup", function () {
  const inputValue = $(this).val();
  const sanitizedValue = inputValue.replace(/[^0-9]/g, "");

  const truncatedValue = sanitizedValue.substring(0, 10);
  $(this).val(truncatedValue);

  if (truncatedValue.length === 10) {
    $("#sendOtp").removeAttr("disabled");
  } else {
    $("#sendOtp").attr("disabled", "disabled");
  }
});

function vertical_tabs_section() {
  $(".vertical_tabs_section .srpcountry_tab").removeClass("active");
}

$(window).on("load", function () {
  $(
    ".taggingSEOData > .tagging_srp_tc > .srpcountry_tab:nth-child(2) h3"
  ).trigger("click");
});