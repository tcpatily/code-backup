$(document).ready(function () {
    // Toggle chat widget
    $(".toggle-btn").on("click", function () {
        $(this).closest(".chat-widget").toggleClass("open");
    });
});

$(document).ready(function () {
  const charLimit = 34;

  $('.ccntr_blc h6').each(function () {
    const $el = $(this);
    const fullText = $el.text().trim();

    // If text is longer than charLimit → truncate & enable tooltip
    if (fullText.length > charLimit) {
      const truncated = fullText.substring(0, charLimit) + '…';
      $el.text(truncated);

      // Set tooltip attributes
      $el.attr('data-bs-toggle', 'tooltip');
      $el.attr('data-bs-placement', 'top');
      $el.attr('data-bs-title', fullText);

      // Initialize tooltip
      new bootstrap.Tooltip($el[0]);
    } else {
      // Remove tooltip attributes (no tooltip for short names)
      $el.removeAttr('data-bs-toggle data-bs-title title');
    }
  });
});

createApp({
    setup() {
		const searchType = ref('');
        const packageData = ref([]);
        const filteredPackageData = ref([]);
        const lazyLoadedPackageData = ref([]);
        const tempLazyLoadedPackageData = ref([]);
        const lazyLoadedCount = ref(11);
        const totalPackages = ref(0);
        const destination = ref("");
        const isSearchThemeOrTag = ref(false);
        const { baseImageURL } = getBaseConfig(); // from common.js


        //Filters & Sorting variables
        const totalPackagesHeader = ref(0);
        const filterData = ref({});
        const tagsCountObj = ref("");
        const monthNames = ref([]);
        const sortPackagesCode = ref("");
        const tagsFilterValue = ref("AP");
        const searchPackage = ref("");
        const flightFilterValue = ref([]);
        const tourTypeFilterValue = ref([]);
        const tourTypeStandardFilter = ref(false);
        const tourTypeValueFilter = ref(false);
        const tourTypePremiumFilter = ref(false);
        const selectedTourTypes = ref({});
        const durationFilterValue = ref([]);
        const themeFilterValue = ref([]);
        const mustIncludeFilterValue = ref([]);
        const departureCityFilterValue = ref([]);
        const budgetFilterValue = ref([]);
        const monthFilterValue = ref([]);
        const mustIncludeInputValue = ref("");
        const departCityInputValue = ref("");
        const mustIncludeCityList = ref([]);
        const tempMustIncludeCityList = ref([]);
        const departureCityList = ref([]);
        const tempdepartureCityList = ref([]);
        const totalFiltersApplied = ref(0);
        const appliedFiltersList = ref([]);
        const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        const gitLtCodes = ref([]);
        const yearCalendar = ref([]);
        const selectedMonth = ref(null);
        const isSearchByNameApplied = ref(false);
        const travelblogsData = ref([]);
        const travelBlogURL = ref('');
        // JD (Joining Direct) helpers
        const hasJDHub = (pkg) => {
            try {
                const list = pkg?.packageDetail?.tcilHolidayLtPricingCollection || [];
                return Array.isArray(list) && list.some(dc => (dc?.cityName || '').toLowerCase() === 'joining direct');
            } catch (_) { return false; }
        };
        const isJDFilterActive = () => {
            return (departureCityFilterValue.value || []).some(v => (v || '').toLowerCase() === 'joining direct');
        };
        const isWithoutFlightFilterActive = () => {
            return (flightFilterValue.value || []).includes('N');
        };
        const haulType = computed(() => {
            if (packageData.value.length > 0)
                return packageData.value[0].packageDetail.countryType;
            else
                return "";
        });
        const pkgSegmentType = computed(() => {
            if (packageData.value.length > 0)
                return packageData.value[0].packageDetail.pkgSubtypeId.pkgTypeId;
            else
                return 0;
        });
        const durationRange = ref({});
        const budgetRange = ref({});
        //Sliders Start
        const minPckgPrice = ref(0);
        const maxPckgPrice = ref(0);
        const mindurationDays = ref(0);
        const maxdurationDays = ref(0);
        const minBudgetFilterValue = ref(0);
        const maxBudgetFilterValue = ref(0);
        const minDurationFilterValue = ref(0);
        const maxDurationFilterValue = ref(0);
        //Slider End 
        const tourManagers = ref(); // TourManager
        //Lead Form START
        const name = ref("");
        const phoneNumber = ref("");
        const emailId = ref("");
        const emailError = ref('');
        const phoneNumberError = ref('');
        const nameError = ref('');
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const phoneNumberRegex = /^\d{10}$/;
        //Lead Form End
        const onBehalf = ref(localStorage.getItem('onBehalf'));
        const loggedInDetails = ref(getLoggedInDetails());

        const formatNumber = (num) => {
            if (num < 1000) {
                return num.toString();
            }
            const thousands = num / 1000;
            const decimal = thousands % 1;
            if (decimal >= 0.05) {
                return thousands.toFixed(1) + 'k';
            } else {
                return Math.floor(thousands) + 'k';
            }
        };

        const fetchPackages = async (dest) => {
            try {
                const autoSuggestResp = await doAxios({
                    method: "get",
                    url: `tcHolidayRS/autosuggest?searchAutoSuggest=` + dest
                });
                var autoData = autoSuggestResp.data;
                let isTagSearch = true;
                let searchObj;
                autoData.forEach(autoSuggestData => {
                    if (autoSuggestData.searchString.toLowerCase() === dest.toLowerCase()) {
                        isTagSearch = false;
                        searchObj = autoSuggestData;
                    }
                });

                window.globalSearchObj = searchObj;
                window.dispatchEvent(new CustomEvent('searchObjReady', { detail: searchObj }));
                if (searchObj && searchObj.searchType) {
                    searchType.value = (searchObj.searchType || '').toUpperCase();
                }

                //searchObj =  autoData.filter(item => item.searchString.toLowerCase() === dest.toLowerCase())[0];
                //START Create URL CODE
                var srpUrl;
                if (isTagSearch) {
                    srpUrl = '/tcHolidayRS/srp/packages?searchType=SEARCH-TAG&searchTag=' + dest;
                    isSearchThemeOrTag.value = true;
                } else {
                    srpUrl = '/tcHolidayRS/srp/packages?searchType=' + searchObj.searchType;
                    if (searchObj.searchType === 'CITY') {
                        srpUrl += '&destination=' + searchObj.locationCode.trim() + '&countryCode=' + searchObj.countryCode.trim() + '&stateCode=' + searchObj.stateCode.trim();
                    } else if (searchObj.searchType === 'STATE') {
                        srpUrl += '&destination=' + searchObj.stateCode.trim() + '&countryCode=' + searchObj.countryCode.trim();
                    } else if (searchObj.searchType === 'COUNTRY') {
                        srpUrl += '&destination=' + searchObj.countryCode.trim();
                    } else if (searchObj.searchType === 'CONTINENT') {
                        srpUrl += '&destination=' + searchObj.continentName.trim();
                    } else if (searchObj.searchType === 'ZONE') {
                        srpUrl += '&zone=' + searchObj.searchString.trim();
                    } else if (searchObj.searchType === 'THEME') {
                        var themeUrl = window.location.href;
                        if (themeUrl.includes("international")) {
                            srpUrl += '&theme=' + searchObj.searchString.trim() + '&pkgType=1';
                            isSearchThemeOrTag.value = true;
                        } else if (themeUrl.includes("india")) {
                            srpUrl += '&theme=' + searchObj.searchString.trim() + '&pkgType=0';
                            isSearchThemeOrTag.value = true;
                        } else {
                            srpUrl += '&theme=' + searchObj.searchString.trim();
                            isSearchThemeOrTag.value = true;
                        }
                    }
                }

                const response = await doAxios({
                    method: "get",
                    url: srpUrl
                });
                const data = response.data;
                packageData.value = data;
                filteredPackageData.value = data;
                lazyLoadedPackageData.value = filteredPackageData.value.slice(0, 9);
                tempLazyLoadedPackageData.value = lazyLoadedPackageData.value;
                getWishlistedPackages();
                if (data.length > 0) {

                    setTimeout(() => {


                        $('.package_grids .img_slider').owlCarousel({
                            autoplay: false,
                            items: 1,
                            loop: false,
                            nav: true,
                            dots: false,
                            autoplayTimeout: 7000,
                            smartSpeed: 800,
                            navText: [
                                "<img src='/images/tcHolidays/chevron-left.svg' alt=''>",
                                "<img src='/images/tcHolidays/chevron-right.svg' alt=''>"
                            ],
                        });
                    }, 400);
                    totalPackages.value = data.length;
                    const prices = packageData.value.map(pkg => pkg.minimumStartingPrice);
                    const durationList = packageData.value.map(pkg => pkg.packageDetail.duration);
                    minPckgPrice.value = Math.min(...prices);
                    maxPckgPrice.value = Math.max(...prices);
                    mindurationDays.value = Math.min(...durationList);
                    maxdurationDays.value = Math.max(...durationList);
                    minBudgetFilterValue.value = minPckgPrice.value;
                    maxBudgetFilterValue.value = maxPckgPrice.value;
                    minDurationFilterValue.value = mindurationDays.value;
                    maxDurationFilterValue.value = maxdurationDays.value;
                    totalPackagesHeader.value = data.length;
                    getFilterCountAndData(packageData.value);
                }
            } catch (error) {
                console.error("Error fetching packages:", error);
            }
        };

        function getFilterCountAndData(packageData) {
            var filterObj = {
                "flightDetails": {
                    "withFlightCount": packageData.filter(pkg => pkg.packageDetail.isFlightIncluded === "Y").length,
					"withoutFlightCount": packageData.filter(pkg => (
                        pkg.packageDetail.isFlightIncluded === "N" ||
                        hasJDHub(pkg) ||
                        (pkg.packageDetail.isFlightIncluded === "Y" && pkg.packageDetail.holidayPlusSubType == 2)
                    )).length
                    // "withoutFlightCount": packageData.filter(pkg => pkg.packageDetail.isFlightIncluded === "N").length
                },
                "duration": getDurationObjectForFilter(packageData),
                "budget": getBudgetObjectForFilter(packageData),
                "themes": getThemesForFilter(packageData),
                "tourType": {
                    "standardCount": packageData.filter(pkg => pkg.packageDetail.isPackageClassStandard === "Y").length,
                    "valueCount": packageData.filter(pkg => pkg.packageDetail.isPackageClassDelux === "Y").length,
                    "premiumCount": packageData.filter(pkg => pkg.packageDetail.isPackageClassPremium === "Y").length
                },
                // "monthOfTravel":getMonthOfTravelForFilter()
            };
            filterData.value = filterObj;
            tagsCountObj.value = {
                "GITLength": packageData.filter(pkg => pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === 'GIT').length,
                'FITLength': packageData.filter(pkg => pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === 'FIT').length,
                'MBTLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Most Booked').length,
                'RTLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Recommended').length,
                'HSTLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Honeymoon Special').length,
                'DATLength': packageData.filter(pkg => pkg.packageDetail.offers != undefined && pkg.packageDetail.offers != '').length,
                'OETLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Online Exclusive').length,
                'XMLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Xmas & New Year Departures').length,
                'DDLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Diwali Departures').length,
                'DPDLength': packageData.filter(pkg => pkg.packageDetail.isTcilRecomended.trim() === 'Durga Puja Departures').length,
            };
            getMostIncludedPlacesForFilter(packageData);
            getDepartureCitiesForFilter(packageData);
            //console.log("filterObj: ", filterObj)
        }

        function getDurationObjectForFilter(packageData) {
            let durationObject = [];
            let count = {};
            if (isSearchThemeOrTag.value || pkgSegmentType.value == 0 || haulType.value == "Short Haul") {
                durationRange.value = {
                    1: { min: 1, max: 5 },
                    2: { min: 6, max: 10 },
                    3: { min: 10, max: Infinity }
                };
                return {
                    "slot1": {
                        type: "Upto 5 Nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration <= 5).length
                    },
                    "slot2": {
                        type: "6 Nights to 10 Nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration >= 6 && pkg.packageDetail.duration <= 10).length
                    },
                    "slot3": {
                        type: "More than 10 nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration > 10).length
                    }
                };
            } else if (haulType.value == "Long Haul") {
                durationRange.value = {
                    1: { min: 1, max: 6 },
                    2: { min: 7, max: 12 },
                    3: { min: 13, max: Infinity }
                };
                return {
                    "slot1": {
                        type: "Upto 7 Nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration < 7).length
                    },
                    "slot2": {
                        type: "7 Nights to 12 Nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration >= 7 && pkg.packageDetail.duration <= 12).length
                    },
                    "slot3": {
                        type: "More than 12 Nights",
                        count: packageData.filter(pkg => pkg.packageDetail.duration > 12).length
                    }
                };
            }
        }

        function getBudgetObjectForFilter(packageData) {
            let durationObject = [];
            let count = {};
            if (isSearchThemeOrTag.value) {
                budgetRange.value = {
                    1: { min: 1, max: 49999 },
                    2: { min: 50000, max: 100000 },
                    3: { min: 100001, max: Infinity }
                };
                return {
                    "slot1": {
                        type: "Less than 50k",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) < 50000).length
                    },
                    "slot2": {
                        type: "50K to 1 Lakh",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) >= 50000 && pkg.minimumStartingPrice <= 100000).length
                    },
                    "slot3": {
                        type: "More than 1 Lakh",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) > 100000).length
                    }
                };
            } else if (pkgSegmentType.value == 0) {
                budgetRange.value = {
                    1: { min: 1, max: 29999 },
                    2: { min: 30000, max: 50000 },
                    3: { min: 50001, max: Infinity }
                };
                return {
                    "slot1": {
                        type: "Less than 30k",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) < 30000).length
                    },
                    "slot2": {
                        type: "30K to 50K",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) >= 30000 && pkg.minimumStartingPrice <= 50000).length
                    },
                    "slot3": {
                        type: "More than 50K",
                        count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) > 50000).length
                    }
                };
            } else {
                if (haulType.value == "Short Haul") {
                    budgetRange.value = {
                        1: { min: 1, max: 49999 },
                        2: { min: 50000, max: 100000 },
                        3: { min: 100001, max: Infinity }
                    };
                    return {
                        "slot1": {
                            type: "Less than 50k",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) < 50000).length
                        },
                        "slot2": {
                            type: "50K to 1 Lakh",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) >= 50000 && pkg.minimumStartingPrice <= 100000).length
                        },
                        "slot3": {
                            type: "More than 1 Lakh",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) > 100000).length
                        }
                    };
                } else { //Short Haul , Theme , Tag 
                    budgetRange.value = {
                        1: { min: 1, max: 149999 },
                        2: { min: 150000, max: 300000 },
                        3: { min: 300001, max: Infinity }
                    };
                    return {
                        "slot1": {
                            type: "Less than 150k",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) < 150000).length
                        },
                        "slot2": {
                            type: "150K to 3 Lakh",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) >= 150000 && pkg.minimumStartingPrice <= 300000).length
                        },
                        "slot3": {
                            type: "More than 3 Lakh",
                            count: packageData.filter(pkg => parseInt(pkg.minimumStartingPrice) > 300000).length
                        }
                    };
                }
            }
        }

        function getDataFilter(pkgData) {
            var filters = "";
            if (pkgData != undefined && pkgData.packageDetail != undefined && pkgData.packageDetail.isTcilRecomended != undefined) {
                if (pkgData.packageDetail.isTcilRecomended == "Most Booked")
                    filters += " most-booked ";
                if (pkgData.packageDetail.isTcilRecomended == "Online Exclusive")
                    filters += " online-exclusive ";
                if (pkgData.packageDetail.isTcilRecomended == "Recommended")
                    filters += " Recommended ";
                if (pkgData.packageDetail.isTcilRecomended == "Honeymoon Special")
                    filters += " honeymoon-special ";
                if (pkgData.packageDetail.isTcilRecomended == "Xmas & New Year Departures")
                    filters += " Xmas & New Year Departures ";
                if (pkgData.packageDetail.isTcilRecomended == "Diwali Departures")
                    filters += " Diwali Departures ";
                if (pkgData.packageDetail.isTcilRecomended == "Durga Puja Departures")
                    filters += " Durga Puja Departures ";
                if (pkgData.packageDetail.pkgSubtypeId.pkgSubtypeName == "GIT")
                    filters += " group-tours ";
                if (pkgData.packageDetail.pkgSubtypeId.pkgSubtypeName == "FIT")
                    filters += " customised-tours ";
                if (pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != "")
                    filters += " deal-available ";
            }
            return filters;
        }

        function mustIncludeInputEvent() {
            if (mustIncludeInputValue.value.length > 0) {
                var matchingCity = tempMustIncludeCityList.value.filter(city => city[0].toLowerCase().includes(mustIncludeInputValue.value.toLowerCase().trim()));

                mustIncludeCityList.value = matchingCity;
            } else {
                mustIncludeCityList.value = tempMustIncludeCityList.value;
            }
        }


        function departureCityInputEvent() {
            if (departCityInputValue.value.length > 0) {
                var matchingDepartCity = tempdepartureCityList.value.filter(city => city[0].toLowerCase().includes(departCityInputValue.value.toLowerCase().trim()));
                departureCityList.value = matchingDepartCity;
            } else {
                departureCityList.value = tempdepartureCityList.value;
            }
        }

        function searchCityByName() {
            if (searchPackage.value && searchPackage.value.trim() != "") {
                var matchingPackages = filteredPackageData.value.filter(pkg => pkg.packageDetail.pkgName.toLowerCase().includes(searchPackage.value.toLowerCase().trim()));
                lazyLoadedPackageData.value = [...matchingPackages.slice(0, lazyLoadedCount.value)];
                isSearchByNameApplied.value = true;
                totalPackagesHeader.value = matchingPackages.length;
                getFilterCountAndData(matchingPackages);
            } else {
                isSearchByNameApplied.value = false;
                lazyLoadedPackageData.value = tempLazyLoadedPackageData.value;
                totalPackagesHeader.value = filteredPackageData.value.length;
                getFilterCountAndData(filteredPackageData.value);
            }
        }

        function getMostIncludedPlacesForFilter(packageData) {
            const isContinent = (searchType.value || '').toUpperCase() === 'CONTINENT';
            const placeCounts = {};
            packageData.forEach(pkg => {
                const detail = pkg.packageDetail;
                if (detail && Array.isArray(detail.tcilHolidayTimelineCollection)) {
                    detail.tcilHolidayTimelineCollection.forEach(timeline => {
                        const city = timeline?.cityCode?.cityName?.trim();
                        const country = (timeline?.countryName || timeline?.cityCode?.countryName || '').trim();
                        const key = isContinent ? country : city;
                        if (key) {
                            placeCounts[key] = (placeCounts[key] || 0) + 1;
                        }
                    });
                }
                // Fallback if no timeline entries provide values
                if (isContinent) {
                    const pkgCountry = (detail?.countryName || '').trim();
                    if (pkgCountry) placeCounts[pkgCountry] = (placeCounts[pkgCountry] || 0) + 1;
                }
            });
            // If continent search yielded nothing, fallback to city list
            if (isContinent && Object.keys(placeCounts).length === 0) {
                packageData.forEach(pkg => {
                    const detail = pkg.packageDetail;
                    if (detail && Array.isArray(detail.tcilHolidayTimelineCollection)) {
                        detail.tcilHolidayTimelineCollection.forEach(timeline => {
                            const city = timeline?.cityCode?.cityName?.trim();
                            if (city) placeCounts[city] = (placeCounts[city] || 0) + 1;
                        });
                    }
                });
            }
            mustIncludeCityList.value = Object.entries(placeCounts)
                .filter(([name]) => name)
                .sort((a, b) => b[1] - a[1]);
            tempMustIncludeCityList.value = mustIncludeCityList.value;
        }

        function getThemesForFilter(packageData) {
            const themeNameCounts = {};
            packageData.forEach(pkg => {
                if (pkg.packageDetail && Array.isArray(pkg.packageDetail.tcilHolidayThemeCollection)) {
                    pkg.packageDetail.tcilHolidayThemeCollection.forEach(theme => {
                        if (theme.name) {
                            const themeName = theme.name;
                            if (themeNameCounts[themeName]) {
                                themeNameCounts[themeName]++;
                            } else {
                                themeNameCounts[themeName] = 1;
                            }
                        }
                    });
                }
            });
            return Object.entries(themeNameCounts)
                .sort((a, b) => b[1] - a[1]);
        }

        function getDepartureCitiesForFilter(packageData) {
            const departCityNameCounts = {};
            packageData.forEach(pkg => {
                if (pkg.packageDetail && Array.isArray(pkg.packageDetail.tcilHolidayLtPricingCollection)) {
                    pkg.packageDetail.tcilHolidayLtPricingCollection.forEach(city => {
                        if (city.cityName) {
                            const cityName = city.cityName;
                            if (departCityNameCounts[cityName]) {
                                departCityNameCounts[cityName]++;
                            } else {
                                departCityNameCounts[cityName] = 1;
                            }
                        }
                    });
                }
            });
            departureCityList.value = Object.entries(departCityNameCounts)
                .sort((a, b) => b[1] - a[1]);
            tempdepartureCityList.value = departureCityList.value;
        }

        const getDestinationFromUrl = (url) => {
            try {
                const parts = new URL(url).pathname.split('/').filter(Boolean);
                const lastPart = parts[parts.length - 1];

                if (!lastPart.toLowerCase().endsWith('-tour-packages')) return null;

                const locationSlug = lastPart.replace(/-tour-packages$/i, '');
                const locationName = locationSlug.replace(/-/g, ' ');

                return locationName;
            } catch (error) {
                console.error('Invalid URL:', error);
                return null;
            }
        };


        function getTourType(minimumPricePackageClassId) {
            switch (minimumPricePackageClassId) {
                case 0: // standard
                    return "Standard";
                case 1: // value
                    return "Value";
                case 2: // premium
                    return "Premium";
                default:
                    return "";
            }
        }

        function getMonth(monthSelected) {
            let selectedMnthYear = monthSelected.split("-");
            let mnth = months[parseInt(selectedMnthYear[0])];
            let year = selectedMnthYear[1];
            return mnth + " " + year;
        }

        const averageRating = computed(() => {
            if (!packageData.value.length)
                return 0;
            const total = packageData.value.reduce((sum, pkg) => {
                const rating = pkg.packageDetail?.rating ?? 0;
                return sum + rating;
            }, 0);
            return (total / packageData.value.length).toFixed(1);
        });

        const starCount = computed(() => {
            const rating = Number(averageRating.value);
            if (rating === 5) {
                return 5;
            }
            return Math.floor(rating);
        });

        const hasHalfStar = computed(() => {
            const rating = Number(averageRating.value);
            return rating % 1 > 0 && rating < 5;
        });

        const totalCustomers = computed(() => {
            return packageData.value.reduce((sum, pkg) => {
                const customers = pkg.packageDetail?.noOfCustomers ?? 0;
                return sum + customers;
            }, 0);
        });

        function convertToK(num) {
            if (num >= 1000) {
                return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'k';
            } else {
                return num.toString();
            }
        }

        function getTimelineTitle(tcilHolidayTimelineCollection) {
            var timeline = "";
            for (var i = 0; i <= tcilHolidayTimelineCollection.length; i++) {
                if (tcilHolidayTimelineCollection[i]) {
                    timeline += tcilHolidayTimelineCollection[i].noOfNights;
                    timeline += "N "
                    timeline += tcilHolidayTimelineCollection[i].cityCode.cityName;
                    timeline += " . "
                }
            }
            return timeline;
        }

        const isAccommodationIncluded = (packageDataItem) => {
            let result = false;
            let minimumPricePackageClassId = packageDataItem.minimumPricePackageClassId;
            if (
                packageDataItem &&
                packageDataItem.packageDetail &&
                Array.isArray(packageDataItem.packageDetail.tcilHolidayCategoryCollection)
            ) {
                result = packageDataItem.packageDetail.tcilHolidayCategoryCollection.some(
                    (item) => item.packageClassId == minimumPricePackageClassId && item.type === "Accomodation" && item.isTypeIncluded === "Y"
                );
            }
            return result;
        };

        const isSightseeingIncluded = (packageDataItem) => {
            let result = false;
            let minimumPricePackageClassId = packageDataItem.minimumPricePackageClassId;
            if (
                packageDataItem &&
                packageDataItem.packageDetail &&
                Array.isArray(packageDataItem.packageDetail.tcilHolidayCategoryCollection)
            ) {
                result = packageDataItem.packageDetail.tcilHolidayCategoryCollection.some(
                    (item) => item.packageClassId == minimumPricePackageClassId && item.type === "Sightseeing" && item.isTypeIncluded === "Y"
                );
            }
            return result;
        };

        const isVisaIncluded = (packageDataItem) => {
            let result = false;
            let minimumPricePackageClassId = packageDataItem.minimumPricePackageClassId;
            if (
                packageDataItem &&
                packageDataItem.packageDetail &&
                Array.isArray(packageDataItem.packageDetail.tcilHolidayCategoryCollection)
            ) {
                result = packageDataItem.packageDetail.tcilHolidayCategoryCollection.some(
                    (item) => item.packageClassId == minimumPricePackageClassId && item.type === "Visa" && item.isTypeIncluded === "Y"
                );
            }
            return result;
        };

        const isMealIncluded = (packageDataItem) => {
            let result = false;
            let minimumPricePackageClassId = packageDataItem.minimumPricePackageClassId;
            if (
                packageDataItem &&
                packageDataItem.packageDetail &&
                Array.isArray(packageDataItem.packageDetail.tcilHolidayCategoryCollection)
            ) {
                result = packageDataItem.packageDetail.tcilHolidayCategoryCollection.some(
                    (item) => item.packageClassId == minimumPricePackageClassId && item.type === "Meal" && item.isTypeIncluded === "Y"
                );
            }
            return result;
        };

        function getImages(pic) {
            return `${baseImageURL}/holidays/${pic.packageId}/photos/${pic.path}`;
        }

        function getSelectedType(item) {
            const pkgId = item.packageDetail.packageId;
            // 1. If user has manually selected a type for this package
            if (selectedTourTypes.value[pkgId] !== undefined) {
                return selectedTourTypes.value[pkgId];
            }
            // 2. If a filter is applied globally (Standard/Value/Premium)
            if (tourTypeFilterValue.value && tourTypeFilterValue.value.length > 0) {
                return parseInt(tourTypeFilterValue.value[tourTypeFilterValue.value.length - 1]);
            }
            // 3. Default to API minimum
            return item.minimumPricePackageClassId;
        }

        const usingJDPrice = (item) => {
            try {
                if (isJDFilterActive()) return true;
                if (isWithoutFlightFilterActive() && hasJDHub(item)) return true;
            } catch (_) { /* noop */ }
            return false;
        };

        function getCurrentPrice(item) {
            if (usingJDPrice(item)) {
                return item.joiningDirectPrice || item.minimumStartingPrice;
            }
            const selectedType = getSelectedType(item);
            switch (selectedType) {
                case 0: return item.startingPriceStandard;
                case 1: return item.startingPriceDelux;
                case 2: return item.startingPricePremium;
                default: return item.minimumStartingPrice;
            }
        }

        function getStrikeoutPrice(item) {
            if (usingJDPrice(item)) return '';
            const selectedType = getSelectedType(item);
            switch (selectedType) {
                case 0: return item.strikeoutPriceStandard;
                case 1: return item.strikeoutPriceDelux;
                case 2: return item.strikeoutPricePremium;
                default: return '';
            }
        }

        function getDiscount(item) {
            if (usingJDPrice(item)) return '';
            const selectedType = getSelectedType(item);
            switch (selectedType) {
                case 0: return item.standardDropPercentage;
                case 1: return item.deluxDropPercentage;
                case 2: return item.premiumDropPercentage;
                default: return '';
            }
        }

        function getOnBehalfSelectValue(pkgData) {
            const pkgId = pkgData.packageDetail.packageId;
            // 1. If user has manually selected a type for this package
            if (selectedTourTypes.value[pkgId] !== undefined) {
                return selectedTourTypes.value[pkgId];
            }
            // 2. If a filter is applied globally (Standard/Value/Premium)
            if (tourTypeFilterValue.value && tourTypeFilterValue.value.length > 0) {
                return parseInt(tourTypeFilterValue.value[tourTypeFilterValue.value.length - 1]);
            }
            // 3. Default to API minimum
            return pkgData.minimumPricePackageClassId;
        }

        function changeTourType(pkgData, event) {
            const value = parseInt(event.target.value);
            const pkgId = pkgData.packageDetail.packageId;
            if (isNaN(value)) return;
            // If clicked again same value, you could toggle back to default, but requirement says just set it.
            selectedTourTypes.value[pkgId] = value;
        }

        // SORTING & Filters Start =======================
        function sortPackages(selectedSortOption) {
            // sorting
            if (selectedSortOption === 'PLH') { // price low to high
                sortPackagesCode.value = selectedSortOption;
                filteredPackageData.value.sort((a, b) => a.minimumStartingPrice - b.minimumStartingPrice);
            } else if (selectedSortOption === 'PHL') { // price high to low
                sortPackagesCode.value = selectedSortOption;
                filteredPackageData.value.sort((a, b) => b.minimumStartingPrice - a.minimumStartingPrice);
            } else if (selectedSortOption === 'DLH') { // duration low to high
                sortPackagesCode.value = selectedSortOption;
                filteredPackageData.value.sort((a, b) => a.packageDetail.duration - b.packageDetail.duration);
            } else if (selectedSortOption === 'DHL') { // duration high to low
                sortPackagesCode.value = selectedSortOption;
                filteredPackageData.value.sort((a, b) => b.packageDetail.duration - a.packageDetail.duration);
            }
            lazyLoadedPackageData.value = [...filteredPackageData.value.slice(0, lazyLoadedCount.value)];
            tempLazyLoadedPackageData.value = lazyLoadedPackageData.value;
        }

        function filteredPackagesByTag(selectedSortOption, packageData) {
            if (selectedSortOption === 'AP') { // All Packages
                return packageData;
            } else if (selectedSortOption === 'GIT') { // Group Tour
                return packageData.filter(pkg => pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === 'GIT');
            } else if (selectedSortOption === 'FIT') { // Customised Tour
                return packageData.filter(pkg => pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === 'FIT');
            } else if (selectedSortOption === 'MBT') { // Most Booked Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Most Booked');
            } else if (selectedSortOption === 'RT') { // Recommended Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Recommended');
            } else if (selectedSortOption === 'HST') { // Honeymoon Special Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Honeymoon Special');
            } else if (selectedSortOption === 'OET') { // Online Exclusive Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Online Exclusive');
            } else if (selectedSortOption === 'XM') { // Xmas & New Year Departures Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Xmas & New Year Departures');
            } else if (selectedSortOption === 'DD') { // Diwali Departures Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Diwali Departures');
            } else if (selectedSortOption === 'DPD') { // Durga Puja Departures Tag
                return packageData.filter(pkg => pkg.packageDetail.isTcilRecomended === 'Durga Puja Departures');
            } else if (selectedSortOption === 'DAT') { // Deals Available Tag
                return packageData.filter(pkg => pkg.packageDetail.offers != undefined && pkg.packageDetail.offers != '');
            }
        }


        function loadMoreClick() {
            lazyLoadedCount.value = lazyLoadedCount.value + 20;
            lazyLoadedPackageData.value = [...filteredPackageData.value.slice(0, lazyLoadedCount.value)];
            tempLazyLoadedPackageData.value = lazyLoadedPackageData.value;
            setTimeout(() => {
                // Only apply to cards that are newly added
                if ($('.all_filters').hasClass('active')) {
                    $('.package-card').each(function () {
                        // Make sure to remove grid classes first
                        $(this).removeClass('col-lg-4 col-md-4').addClass('col-lg-6 col-md-4');
                    });
                }
            }, 0);
        }


        const loadMoreState = computed(() => {
            if (isSearchByNameApplied.value) {
                return totalPackagesHeader.value > lazyLoadedCount.value;
            } else {
                return filteredPackageData.value.length > lazyLoadedCount.value;
            }
        });

        function budgetSilderEvent() {
            const minDisplayPrice = $("#priceMinDisplay").text();
            const maxDisplayPrice = $("#priceMaxDisplay").text();
            minBudgetFilterValue.value = minDisplayPrice;
            maxBudgetFilterValue.value = maxDisplayPrice;
            const matchingKeys = [];
            for (const key in budgetRange.value) {
                const { min, max } = budgetRange.value[key];
                // If ranges overlap
                if (minDisplayPrice <= max && maxDisplayPrice >= min) {
                    matchingKeys.push(key);
                }
            }
            budgetFilterValue.value = matchingKeys;
            filterPackages();
            console.log("budgetFilterValue.value: ", budgetFilterValue.value);
        }

        function durationSilderEvent() {
            const minDurationValueDisplay = $("#minDurationValueDisplay").text();
            const maxDurationValueDisplay = $("#maxDurationValueDisplay").text();
            minDurationFilterValue.value = minDurationValueDisplay.replace("N", "").trim();
            maxDurationFilterValue.value = maxDurationValueDisplay.replace("N", "").trim();
            const matchingKeys = [];
            for (const key in durationRange.value) {
                const { min, max } = durationRange.value[key];
                // If ranges overlap
                if (minDurationFilterValue.value <= max && maxDurationFilterValue.value >= min) {
                    matchingKeys.push(key);
                }
            }
            console.log("matchingKeys ::", matchingKeys);
            durationFilterValue.value = matchingKeys;
            filterPackages();
            console.log("durationFilterValue.value ", durationFilterValue.value);
        }

        function toggleTourType(value) {
            console.log(tourTypeFilterValue.value.includes(value));
            if (tourTypeFilterValue.value.includes(value)) {
                tourTypeStandardFilter.value = false;
                tourTypeValueFilter.value = false;
                tourTypePremiumFilter.value = false;
                tourTypeFilterValue.value = [];
            } else {
                tourTypeFilterValue.value = [];
                if (value == "0") {
                    tourTypeFilterValue.value.push(0);
                    tourTypeStandardFilter.value = true;
                    tourTypeValueFilter.value = false;
                    tourTypePremiumFilter.value = false;
                } else if (value == "1") {
                    tourTypeFilterValue.value.push(1);
                    tourTypeStandardFilter.value = false;
                    tourTypeValueFilter.value = true;
                    tourTypePremiumFilter.value = false;
                } else if (value == "2") {
                    tourTypeFilterValue.value.push(2);
                    tourTypeStandardFilter.value = false;
                    tourTypeValueFilter.value = false;
                    tourTypePremiumFilter.value = true;
                }
            }
            console.log("tourTypeFilterValue.value: ", tourTypeFilterValue.value);
            filterPackages();
        }

        function filterPackages(tagType) {
            if (tagType != undefined && typeof (tagType) == "string") {
                tagsFilterValue.value = tagType;
            }

            const pageUrl = new URL(window.location.href);

            searchPackage.value = "";
            searchCityByName();
            let tempPackages = packageData.value;
            filteredPackageData.value = [];
            let totalFilters = 0;
            if (tagsFilterValue.value.length > 0) { // Header Tag filters
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                let tagsFilteredPackages = filteredPackagesByTag(tagsFilterValue.value, tempPackages);
                filteredPackageData.value = tagsFilteredPackages;
            }

            if (flightFilterValue.value.length > 0) { // with / without flight filter
                totalFilters += flightFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                var flightTempPackages = tempPackages.filter(pkg => {
                    const hasFlight = pkg.packageDetail.isFlightIncluded; // 'Y' or 'N'
                    // If user selected 'N' (without flight), include:
                    // - packages with isFlightIncluded === 'N'
                    // - packages with a JD hub
                    // - packages where holidayPlusSubType == 2 (optional flights)
                    if (flightFilterValue.value.includes('N')) {
                        if (hasFlight === 'N') return true;
                        if (hasJDHub(pkg)) return true;
                        if (hasFlight === 'Y' && pkg.packageDetail.holidayPlusSubType == 2) return true;
                        return false;
                    }
                    // If user selected 'Y' (with flight), standard behavior
                    if (flightFilterValue.value.includes('Y')) {
                        return hasFlight === 'Y';
                    }
                    return false;
                });
                filteredPackageData.value = flightTempPackages;
                //let paramValue = flightFilterValue.value.toString();
                //pageUrl.searchParams.set('flight', paramValue);
                let mappedValues = flightFilterValue.value.map(v =>
                    v === "Y" ? "withflight" : "withoutflight"
                );
                let paramValue = mappedValues.join(",");
                pageUrl.searchParams.set("filter_flight", paramValue);
            } else {
                pageUrl.searchParams.delete('filter_flight');
            }

            if (tourTypeFilterValue.value.length > 0) { // tour type filter
                totalFilters += tourTypeFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                let tempFiltered = tempPackages.filter(pkg => {
                    const detail = pkg.packageDetail;
                    if (parseInt(tourTypeFilterValue.value) == 0) {
                        return detail.isPackageClassStandard === "Y";
                    } else if (parseInt(tourTypeFilterValue.value) == 1) {
                        return detail.isPackageClassDelux === "Y";
                    } else if (parseInt(tourTypeFilterValue.value) == 2) {
                        return detail.isPackageClassPremium === "Y";
                    }
                    return false;
                });
                filteredPackageData.value = tempFiltered;
                // let paramValue = tourTypeFilterValue.value.toString();
                let tourTypeTexts = tourTypeFilterValue.value.map(type => {
                    if (type === 0) return "Standard";
                    if (type === 1) return "Value";
                    if (type === 2) return "Premium";
                    return "";
                });
                pageUrl.searchParams.set("filter_tourType", tourTypeTexts.join(","));
            } else {
                pageUrl.searchParams.delete('filter_tourType');
            }

            if (durationFilterValue.value.length > 0) { // duration filter
                totalFilters += durationFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                const selectedRanges = durationFilterValue.value.map((key) => durationRange.value[key]);
                let allMatchingPackages = [];
                selectedRanges.forEach(range => {
                    const minCompareAmt = range.min;
                    const maxCompareAmt = range.max;
                    var budgetPackages = tempPackages.filter(pkg => {
                        const duration = parseInt(pkg.packageDetail.duration);
                        return (duration >= minCompareAmt && duration <= maxCompareAmt);
                    });
                    allMatchingPackages = allMatchingPackages.concat(budgetPackages);
                });
                filteredPackageData.value = allMatchingPackages;
                //let paramValue = durationFilterValue.value.toString();
                //pageUrl.searchParams.set('duration', paramValue);
                let durationTexts = durationFilterValue.value.map(range => {
                    if (haulType.value === "Short Haul" || isSearchThemeOrTag.value || pkgSegmentType.value === 0) {
                        if (range == 1) return "Upto-5-Nights";
                        if (range == 2) return "6-to-10-Nights";
                        if (range == 3) return "More-than-10-Nights";
                    } else if (haulType.value === "Long Haul") {
                        if (range == 1) return "Upto-7-Nights";
                        if (range == 2) return "7-to-12-Nights";
                        if (range == 3) return "More-than-12-Nights";
                    }
                    return "";
                });
                let paramValue = durationTexts.join(",");
                pageUrl.searchParams.set("filter_duration", paramValue);
            } else {
                pageUrl.searchParams.delete('filter_duration');
            }

            if (themeFilterValue.value.length > 0) { // theme filter
                totalFilters += themeFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                var themePackages = tempPackages.filter(pkg => {
                    const themeType = pkg.packageDetail.tcilHolidayThemeCollection;
                    return themeType.some(theme => themeFilterValue.value.includes(theme.name));
                });
                filteredPackageData.value = themePackages;
                let paramValue = themeFilterValue.value.toString();
                pageUrl.searchParams.set('filter_theme', paramValue);
            } else {
                pageUrl.searchParams.delete('filter_theme');
            }

            if (mustIncludeFilterValue.value.length > 0) { // must include places filter
                totalFilters += mustIncludeFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                var mustIncludePackages = tempPackages.filter(pkg => {
                    const mustIncludeType = pkg.packageDetail.tcilHolidayTimelineCollection;
                    return mustIncludeType.some(mustInclude => mustIncludeFilterValue.value.includes(mustInclude.cityCode.cityName));
                });
                filteredPackageData.value = mustIncludePackages;
                let paramValue = mustIncludeFilterValue.value.toString();
                pageUrl.searchParams.set('filter_mustInclude', paramValue);
            } else {
                pageUrl.searchParams.delete('filter_mustInclude');
            }

            if (departureCityFilterValue.value.length > 0) { // departure city filter
                totalFilters += departureCityFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                var budgetPackages = tempPackages.filter(pkg => {
                    const departureCityType = pkg.packageDetail.tcilHolidayLtPricingCollection;
                    return departureCityType.some(departureCity => departureCityFilterValue.value.includes(departureCity.cityName));
                });
                filteredPackageData.value = budgetPackages;
                let paramValue = departureCityFilterValue.value.toString();
                pageUrl.searchParams.set('filter_departure', paramValue);
            } else {
                pageUrl.searchParams.delete('filter_departure');
            }

            if (budgetFilterValue.value.length > 0) { // budget filter
                totalFilters += budgetFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                let sortedBudgetFilterValue = budgetFilterValue.value.sort((a, b) => a - b);
                const selectedRanges = sortedBudgetFilterValue.map((key) => budgetRange.value[key]);
                let allMatchingPackages = [];
                selectedRanges.forEach(range => {
                    const minCompareAmt = range.min;
                    const maxCompareAmt = range.max;
                    var budgetPackages = tempPackages.filter(pkg => {
                        const budgetType = parseInt(pkg.minimumStartingPrice);
                        return (budgetType >= minCompareAmt && budgetType <= maxCompareAmt);
                    });
                    allMatchingPackages = allMatchingPackages.concat(budgetPackages);
                });
                filteredPackageData.value = allMatchingPackages;
                //pageUrl.searchParams.set('budget', budgetFilterValue.value.toString());
                let budgetTexts = budgetFilterValue.value.map(budget => {
                    if (isSearchThemeOrTag.value) {
                        if (budget == 1) return "Less-than-50k";
                        if (budget == 2) return "50k-to-1-Lakh";
                        if (budget == 3) return "More-than-1-Lakh";
                    } else if (pkgSegmentType.value == 0) {
                        if (budget == 1) return "Less-than-30k";
                        if (budget == 2) return "30k-to-50k";
                        if (budget == 3) return "More-than-50k";
                    } else if (haulType.value === "Short Haul") {
                        if (budget == 1) return "Less-than-50k";
                        if (budget == 2) return "50k-to-1-Lakh";
                        if (budget == 3) return "More-than-1-Lakh";
                    } else {
                        if (budget == 1) return "Less-than-150k";
                        if (budget == 2) return "150k-to-3-Lakh";
                        if (budget == 3) return "More-than-3-Lakh";
                    }
                });
                pageUrl.searchParams.set("filter_budget", budgetTexts.join(","));
            } else {
                pageUrl.searchParams.delete('filter_budget');
                minBudgetFilterValue.value = minPckgPrice.value;
                maxBudgetFilterValue.value = maxPckgPrice.value;
            }

            if (monthFilterValue.value.length > 0) { // month filter
                console.log("monthFilterValue.value: ", monthFilterValue.value);
                totalFilters += monthFilterValue.value.length;
                if (filteredPackageData.value.length > 0) {
                    tempPackages = filteredPackageData.value;
                }
                let allSelectedPackages = [];
                const monthPromises = monthFilterValue.value.map((monthVal) => {
                    let [mnth, year] = monthVal.split("-");
                    mnth = parseInt(mnth);
                    const monthName = months[mnth].trim().toUpperCase();
                    return selectMonth(`${mnth}-${year}`).then(() => {
                        // GIT Packages
                        let gitPkg = [];
                        gitLtCodes.value.forEach(ltCode => {
                            const gitPkgs = tempPackages.filter(pkg => {
                                const ifPkgGit = pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === "GIT";
                                const lrPricing = pkg.packageDetail.tcilHolidayLtPricingCollection;
                                return lrPricing.some((ltprice) => ifPkgGit && ltprice.ltItineraryCode === ltCode);
                            });
                            gitPkg = gitPkg.concat(gitPkgs);
                        });
                        // FIT Packages
                        const fitPkg = tempPackages.filter(pkg => {
                            const ifPkgFit = pkg.packageDetail.pkgSubtypeId.pkgSubtypeName === "FIT";
                            const travelMonth = pkg.packageDetail.tcilHolidayTravelmonthCollection;
                            return travelMonth.some((month) => month.monthCode.trim() == monthName && month.monthYear == year);
                        });

                        allSelectedPackages = allSelectedPackages.concat(gitPkg, fitPkg);
                    });
                });
                Promise.all(monthPromises).then(() => {
                    filteredPackageData.value = allSelectedPackages;
                    console.log("Filtered Packages by months:", filteredPackageData.value);
                    let paramValue = monthFilterValue.value.toString();
                    pageUrl.searchParams.set('filter_month', paramValue);
                    const finalUrl = pageUrl.toString().replace(/\+/g, '%20');
                    window.history.replaceState({}, '', finalUrl);
                    console.log("Updated URL:", finalUrl);
                    totalPackagesHeader.value = filteredPackageData.value.length;
                    lazyLoadedPackageData.value = filteredPackageData.value.slice(0, lazyLoadedCount.value);
                    tempLazyLoadedPackageData.value = lazyLoadedPackageData.value;
                    sortPackages(sortPackagesCode.value);
                    getFilterCountAndData(filteredPackageData.value);
                });
            } else {
                pageUrl.searchParams.delete('filter_month');
                const finalUrl = pageUrl.toString().replace(/\+/g, '%20');
                window.history.replaceState({}, '', finalUrl);
            }

            if (flightFilterValue.value.length == 0 && tourTypeFilterValue.value.length == 0 && durationFilterValue.value.length == 0 && themeFilterValue.value.length == 0 && mustIncludeFilterValue.value.length == 0 && departureCityFilterValue.value.length == 0 && budgetFilterValue.value.length == 0 && tagsFilterValue.value == 'AP' && monthFilterValue.value.length == 0) {
                filteredPackageData.value = tempPackages;
            }

            // Reapply any existing sorting after filtering
            totalFiltersApplied.value = totalFilters;
            totalPackagesHeader.value = filteredPackageData.value.length;
            sortPackages(sortPackagesCode.value);
            getFilterCountAndData(filteredPackageData.value);
            lazyLoadedPackageData.value = filteredPackageData.value.slice(0, lazyLoadedCount.value);
            tempLazyLoadedPackageData.value = lazyLoadedPackageData.value;

            // window.history.replaceState({}, '', pageUrl);
            const finalUrl = pageUrl.toString().replace(/\+/g, '%20');
            window.history.replaceState({}, '', finalUrl);
            // Reapply grid/list classes after DOM update
            // setTimeout(() => {
            //     if ($('.all_filters').hasClass('active')) {
            //         $('.package-card').each(function () {
            //             $(this).removeClass('col-lg-4 col-md-4').addClass('col-lg-6 col-md-4');
            //         });
            //     } else {
            //         $('.package-card').each(function () {
            //             $(this).removeClass('col-lg-6 col-md-4').addClass('col-lg-4 col-md-4');
            //         });
            //     }
            // }, 0);
        }

        function applyFiltersFromUrl() {
            const params = new URLSearchParams(window.location.search);

            if (params.has("filter_flight")) { // working
                const values = params.get("filter_flight").split(",");
                // Map back from withflight/withoutflight → Y/N
                flightFilterValue.value = values.map(v =>
                    v === "withflight" ? "Y" : "N"
                );
            }

            if (params.has("filter_tourType")) { //working
                const tourTypeParams = params.get("filter_tourType").split(",");
                tourTypeFilterValue.value = tourTypeParams.map(text => {
                    if (text === "Standard") return 0;
                    if (text === "Value") return 1;
                    if (text === "Premium") return 2;
                    return null;
                }).filter(v => v !== null);

                tourTypeStandardFilter.value = tourTypeFilterValue.value.includes(0);
                tourTypeValueFilter.value = tourTypeFilterValue.value.includes(1);
                tourTypePremiumFilter.value = tourTypeFilterValue.value.includes(2);
            }

            if (params.has("filter_duration")) { // working
                //durationFilterValue.value = params.get("duration").split(",").map(Number);
                const durationParams = params.get("filter_duration").split(",");
                durationFilterValue.value = durationParams.map(text => {
                    if (text === "Upto-5-Nights") return 1;
                    if (text === "6-to-10-Nights") return 2;
                    if (text === "More-than-10-Nights") return 3;
                    if (text === "Upto-7-Nights") return 1;
                    if (text === "7-to-12-Nights") return 2;
                    if (text === "More-than-12-Nights") return 3;
                    return null;
                }).filter(v => v !== null);
            }

            if (params.has("filter_theme")) { // working
                themeFilterValue.value = params.get("filter_theme").split(",");
            }

            if (params.has("filter_mustInclude")) { // working
                mustIncludeFilterValue.value = params.get("filter_mustInclude").split(",");
            }

            if (params.has("filter_departure")) { // working
                departureCityFilterValue.value = params.get("filter_departure").split(",");
            }

            if (params.has("filter_budget")) { // working
                budgetFilterValue.value = params.get("filter_budget").split(",").map(Number);
            }

            if (params.has("filter_month")) { // working
                const month = params.get("filter_month");
                monthFilterValue.value = month.split(",");
                console.log("monthFilterValue from URL:", monthFilterValue.value);
            }
            filterPackages();
        }

        function resetFilters() {
            flightFilterValue.value = [];
            tourTypeFilterValue.value = [];
            durationFilterValue.value = [];
            themeFilterValue.value = [];
            mustIncludeFilterValue.value = [];
            departureCityFilterValue.value = [];
            budgetFilterValue.value = [];
            monthFilterValue.value = [];
            tourTypeStandardFilter.value = false;
            tourTypeValueFilter.value = false;
            tourTypePremiumFilter.value = false;

            totalFiltersApplied.value = 0;
            searchPackage.value = "";
            searchCityByName();

            filteredPackageData.value = packageData.value;
            lazyLoadedPackageData.value = filteredPackageData.value.slice(0, lazyLoadedCount.value);
            totalPackagesHeader.value = filteredPackageData.value.length;

            selectedMonth.value = null;
            $(".month-checkbox").prop("checked", false);

            // Reapply any existing sorting after filtering
            sortPackages(sortPackagesCode.value);
            getFilterCountAndData(filteredPackageData.value);

            const pageUrl = new URL(window.location.href);
            pageUrl.search = '';
            window.history.replaceState({}, '', pageUrl);
        }

        const filtersApplied = computed(() => {
            const flightFilters = flightFilterValue.value.map(value => ({
                filter: value === "Y" ? "With Flight" : "Without Flight",
                type: "flightFilter"
            }));
            // let tourTypeFilters = {};
            // console.log("tourTypeFilterValue: ", tourTypeFilterValue.value);
            const tourTypeFilters = tourTypeFilterValue.value.map(value => ({
                filter: getTourType(parseInt(tourTypeFilterValue.value)),
                type: "tourType"
            }));
            const monthOfTravelFilters = monthFilterValue.value.map(value => ({
                filter: getMonth(value),
                type: "monthOfTravel"
            }));
            const durationFilters = durationFilterValue.value.map(range => {
                let filterText = "";
                if (haulType.value === "Short Haul" || isSearchThemeOrTag.value || pkgSegmentType.value === 0) {
                    if (range == 1) filterText = "Upto 5 Nights";
                    else if (range == 2) filterText = "6 Nights to 10 Nights";
                    else if (range == 3) filterText = "More than 10 Nights";
                } else if (haulType.value === "Long Haul") {
                    if (range == 1) filterText = "Upto 7 Nights";
                    else if (range == 2) filterText = "7 Nights to 12 Nights";
                    else if (range == 3) filterText = "More than 12 Nights";
                }
                return { filter: filterText, type: "duration" };
            });
            const themeFilters = themeFilterValue.value.map(theme => ({
                filter: theme,
                type: "theme"
            }));
            const mustIncludeFilters = mustIncludeFilterValue.value.map(include => ({
                filter: include,
                type: "mustIncludeCity"
            }));
            const departureCityFilters = departureCityFilterValue.value.map(city => ({
                filter: city,
                type: "departureCity"
            }));
            const budgetFilters = budgetFilterValue.value.map(budget => {
                let filterText = "";
                if (isSearchThemeOrTag.value) {
                    if (budget == 1) filterText = "Less than 50k";
                    else if (budget == 2) filterText = "50k to 1 Lakh";
                    else if (budget == 3) filterText = "More than 1 Lakh";
                } else if (pkgSegmentType.value == 0) {
                    if (budget == 1) filterText = "Less than 30k";
                    else if (budget == 2) filterText = "30k to 50k";
                    else if (budget == 3) filterText = "More than 50k";
                } else if (haulType.value === "Short Haul") {
                    if (budget == 1) filterText = "Less than 50k";
                    else if (budget == 2) filterText = "50k to 1 Lakh";
                    else if (budget == 3) filterText = "More than 1 Lakh";
                } else { // Long Haul
                    if (budget == 1) filterText = "Less than 150k";
                    else if (budget == 2) filterText = "150k to 3 Lakh";
                    else if (budget == 3) filterText = "More than 3 Lakh";
                }
                return { filter: filterText, type: "budget" };
            });

            return [
                ...flightFilters,
                ...tourTypeFilters,
                ...monthOfTravelFilters,
                ...durationFilters,
                ...themeFilters,
                ...mustIncludeFilters,
                ...departureCityFilters,
                ...budgetFilters
            ];
        });

        function deleteFilter(appliedFilter) {
            console.log("appliedFilter.type: ", appliedFilter.type);
            switch (appliedFilter.type) {
                case "flightFilter":
                    flightFilterValue.value = flightFilterValue.value.filter(v =>
                        (v === "Y" ? "With Flight" : "Without Flight") !== appliedFilter.filter
                    );
                    break;
                case "tourType":
                    tourTypeFilterValue.value = tourTypeFilterValue.value.filter(v =>
                        getTourType(parseInt(v)) !== appliedFilter.filter
                    );
                    if (appliedFilter.filter === "Standard") {
                        tourTypeStandardFilter.value = false;
                    } else if (appliedFilter.filter === "Value") {
                        tourTypeValueFilter.value = false;
                    } else if (appliedFilter.filter === "Premium") {
                        tourTypePremiumFilter.value = false;
                    }
                    break;
                case "duration":
                    durationFilterValue.value = durationFilterValue.value.filter(range => {
                        if (appliedFilter.filter.includes("Upto 5 Nights") && range == 1) return false;
                        if (appliedFilter.filter.includes("6 Nights to 10 Nights") && range == 2) return false;
                        if (appliedFilter.filter.includes("More than 10 Nights") && range == 3) return false;
                        if (appliedFilter.filter.includes("Upto 7 Nights") && range == 1) return false;
                        if (appliedFilter.filter.includes("7 Nights to 12 Nights") && range == 2) return false;
                        if (appliedFilter.filter.includes("More than 12 Nights") && range == 3) return false;
                        return true;
                    });
                    break;
                case "theme":
                    themeFilterValue.value = themeFilterValue.value.filter(v => v !== appliedFilter.filter);
                    break;
                case "mustIncludeCity":
                    mustIncludeFilterValue.value = mustIncludeFilterValue.value.filter(v => v !== appliedFilter.filter);
                    break;
                case "departureCity":
                    departureCityFilterValue.value = departureCityFilterValue.value.filter(v => v !== appliedFilter.filter);
                    break;
                case "budget":
                    budgetFilterValue.value = budgetFilterValue.value.filter(budget => {
                        const text = appliedFilter.filter;
                        if (text.includes("Less than 30k") && budget == 1) return false;
                        if (text.includes("30k to 50k") && budget == 2) return false;
                        if (text.includes("More than 50k") && budget == 3) return false;
                        if (text.includes("Less than 50k") && budget == 1) return false;
                        if (text.includes("50k to 1 Lakh") && budget == 2) return false;
                        if (text.includes("More than 1 Lakh") && budget == 3) return false;
                        if (text.includes("Less than 150k") && budget == 1) return false;
                        if (text.includes("150k to 3 Lakh") && budget == 2) return false;
                        if (text.includes("More than 3 Lakh") && budget == 3) return false;
                        return true;
                    });
                    break;
                case "monthOfTravel":
                    console.log("monthFilterValue.value: ", monthFilterValue.value)
                    monthFilterValue.value = monthFilterValue.value.filter(v => {
                        let mnth = appliedFilter.filter.split(" ")
                        let monthIndex = months.indexOf(mnth[0]);
                        let value = monthIndex + "-" + mnth[1];
                        console.log("v: ", v)
                        console.log("value: ", value)
                        if (v == value)
                            return false;
                        return true;
                    })
            }
            // Reapply filters after deletion
            filterPackages();
        }

        function generateYearCalendar() {
            const today = new Date();
            const startMonth = today.getMonth();
            const startYear = today.getFullYear();
            const calendar = [];
            for (let i = 0; i < 2; i++) {
                const blockYear = (i === 0) ? startYear : startYear + 1;
                const block = { year: blockYear, months: [] };
                for (let j = 0; j < 6; j++) {
                    let monthIndex = (i === 0) ? startMonth + j : j;
                    if (i === 0 && monthIndex >= 12)
                        continue;
                    block.months.push({
                        index: monthIndex % 12,
                        name: months[monthIndex % 12],
                    });
                }
                calendar.push(block);
            }
            yearCalendar.value = calendar;
        }

        async function selectMonth(selectMonth) {
            //            selectedMonth.value = {year, month};
            const url = "/tcHolidayRS/srp/getItinCodes/" + selectMonth;
            try {
                const ltCode = await doAxios({
                    method: "get",
                    url: url
                });
                var ltCodesData = ltCode.data;
                if (ltCodesData !== undefined && ltCodesData.proditin != undefined) {
                    gitLtCodes.value = ltCodesData.proditin;
                    return ltCodesData.proditin;
                }

            } catch (err) {
                console.error("Suggestion fetch failed:", err);
            }
        }

        function formatPrice(num) {
            let str = num.toString();
            let lastThree = str.substring(str.length - 3);
            let otherNumbers = str.substring(0, str.length - 3);
            if (otherNumbers !== '') {
                otherNumbers = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",");
                return otherNumbers + ',' + lastThree;
            } else {
                return lastThree;
            }
        }



        // TourManagerStart
        async function getTourManagers() {
            try {
                const response = await doAxios({
                    method: "get",
                    url: `/tcHolidayRS/tourManager/getTourManagers`,
                });
                tourManagers.value = response.data;
            } catch (err) {
                console.error("Suggestion fetch failed:", err);
            }
        }
        // TourManagerEnd

        var holidayObjects = {
            windowURL: window.location.href,
            searchParameter: '',
            destinationName: '',
            searchType: '',
            destination: getUrlParameter('destination')
        };
        function populateQueryParams(holidayObjects) {
            if (holidayObjects.windowURL.indexOf("/holidays/packages") === -1) {
                var urlSplit = holidayObjects.windowURL.split("/");
                holidayObjects.searchParameter = urlSplit[urlSplit.length - 1];

                if (holidayObjects.searchParameter.trim().indexOf("-tour-packages") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-tour")[0];
                } else if (holidayObjects.searchParameter.indexOf("-holidays") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-holidays")[0];
                } else if (holidayObjects.searchParameter.indexOf("-packages") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-packages")[0];
                } else if (holidayObjects.searchParameter.indexOf("-group-tours") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-group-tours")[0];
                } else if (holidayObjects.searchParameter.indexOf("-tours") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-tours")[0];
                } else if (holidayObjects.searchParameter.indexOf("-getaways") > -1) {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-getaways")[0];
                } else {
                    holidayObjects.searchParameter = holidayObjects.searchParameter.split("-")[0];
                }
                if (holidayObjects.searchParameter.indexOf("-") > -1) {
                    var j = 1;
                    for (var i = 0; i < j; i++) {
                        if (holidayObjects.searchParameter.indexOf('-') !== -1) {
                            holidayObjects.searchParameter = holidayObjects.searchParameter.replace('-', ' ');
                            j++;
                        }
                    }
                }
                holidayObjects.destinationName = holidayObjects.searchParameter;
            }
        }

        const bookPkg = (pkgId, pkgClassId, pkgType, pkgName, pkgDetail) => {
            console.log("pkgId : " + pkgId);
            console.log("pkgClassId : " + pkgClassId);
            console.log("pkgType : " + pkgType);
            console.log("pkgName : " + pkgName);
            console.log("pkgDetail : " + pkgDetail);
            populateQueryParams(holidayObjects)
            let pdpURL = '';
            let seoDest;
            const IsDynamic = pkgDetail.isDynamicPackage;
            seoDest = pkgDetail.pkgSubtypeId.pkgTypeId === 0 ? pkgDetail.stateName : pkgDetail.countryName;

            let url = "/" + repSpace(pkgName);

            if (IsDynamic === 'Y') {
                // Handle dynamic package logic similar to the KO code.
                if (holidayObjects.destinationName) {
                    url += `?pkgId=${pkgId}&packageClassId=${pkgClassId}&destination=${pkgId}_${holidayObjects.destinationName}_${holidayObjects.searchType}_${pkgType}`;
                } else if (holidayObjects.searchType === 'THEME') {
                    url += `?pkgId=${pkgId}&packageClassId=${pkgClassId}&theme=${pkgId}_${holidayObjects.theme}_${pkgType}`;
                }
                pdpURL = window.location.origin + "/holidays/packages" + url + '&destTag=' + seoDest;
            } else {
                // Handle non-dynamic package logic.
                if (holidayObjects.destinationName) {
                    url += `?pkgId=${pkgId}&packageClassId=${pkgClassId}&destination=${pkgId}_${holidayObjects.destinationName}_${holidayObjects.searchType}_${pkgType}`;
                } else if (holidayObjects.searchType === 'THEME') {
                    url += `?pkgId=${pkgId}&packageClassId=${pkgClassId}&theme=${pkgId}_${holidayObjects.theme}_${pkgType}`;
                }
                pdpURL = window.location.origin + window.location.pathname + url + '&destTag=' + seoDest;
            }

            const srpurl = window.location.href;
            if (srpurl.indexOf('utm') >= 0) {
                pdpURL += "&" + srpurl.slice(srpurl.indexOf('?') + 1);
            }

            console.log("finalPdpIURL-->" + pdpURL);
            if (localStorage.getItem('onBehalf') === 'true') {
                return window.open(pdpURL, '_blank');
            }
            return window.location.href = pdpURL;
        };

        function repSpace(ustring) {
            var k = 0;
            ustring = ustring.toLowerCase().replace(/[^a-zA-Z0-9.]/g, '-');
            var j = 1;
            for (var i = 0; i < j; i++) {
                if (ustring.indexOf('--') !== -1) {
                    ustring = ustring.replace('--', '-');
                    j++;
                }
            }
            if (k === 0) {
                if (ustring.charAt(ustring.length - 1) === "-") {
                    ustring = ustring.slice(0, -1);
                }
                k = k + 1;
            }
            return ustring;
        }

        // Wishlist Code Start 
        // const wishListUrl = "/tcHolidayRS/wishlist/";
        function wishlistSrp(isWishlist, packageId) {
            console.log("Inside click - " + isWishlist, packageId);
            var custId = isLoggedIn();
            if (strValidations(custId)) {
                console.log("is Wishlist --- ", isWishlist);
                var wishlistObj = {
                    "custId": custId,
                    "packageId": packageId,
                    "isWishListed": isWishlist ? "Y" : "N",
                    "url": window.location.href
                }
                modifyWishlist(wishlistObj);
            } else {
                var myModal = new bootstrap.Modal(document.getElementById('loginModal'));
                myModal.show();
                console.log("Log in ");
            }
        }

        // this will toggle wishlist 
        function toggleWishListPackage(packageId) {
            console.log("packageId --- ", packageId);
            var packagesList = lazyLoadedPackageData.value;
            for (var i = 0; i < packagesList.length; i++) {
                var pkg = packagesList[i];
                if (pkg.packageDetail.packageId == packageId) {
                    pkg.packageDetail.isWishlist = !pkg.packageDetail.isWishlist;
                    console.log("packageId --- " + packageId);
                    console.log("pkg.packageDetail.isWishlist--- " + pkg.packageDetail.isWishlist);
                    if (pkg?.packageDetail?.isWishlist) {
                        $(".wishList_message").addClass("added");
                        setTimeout(() => {
                            $(".wishList_message").removeClass("added");
                        }, 2000);
                    }
                }
            }
        }

        function toggleWishList(packageIdList) {
            const idSet = new Set(packageIdList);
            for (const pkg of lazyLoadedPackageData.value) {
                if (idSet.has(pkg.packageDetail.packageId)) {
                    pkg.packageDetail.isWishlist = !pkg.packageDetail.isWishlist;
                }
            }
        }

        // This will either add to wishlist or remove from wishlist 
        async function modifyWishlist(wishlistObj) {
            var endPoint = wishlistObj.isWishListed == "Y" ? "removefromwishlist" : "addtowishlist";
            try {
                const response = await doAxios({
                    method: "post",
                    data: wishlistObj,
                    headers: { "Content-Type": "application/json" },
                    url: `/tcHolidayRS/wishlist/` + endPoint,
                });

                console.log(response);
                if (strValidations(response) && strValidations(response.data) && strValidations(response.data.code) && strValidations(response.data.message)) {
                    var message = response.data.message;
                    console.log("wishlistObj.isWishlist -- " + wishlistObj.isWishListed);
                    wishlistSuccessFunction(message, wishlistObj.packageId, wishlistObj.isWishListed);
                }

            } catch (resp) {
                console.error("modifyWishlist api call failed :", resp);
            }
        }
        function wishlistSuccessFunction(message, packageId, isWishList) {
            console.log("message = " + message + " & packageId =" + packageId + " & isWishlist = " + isWishList);
            const WISHLIST_ADDED = "WISHLIST_INSERTED";
            const WISHLIST_ALREADY_EXISTS = "WISHLIST_DATA_EXISTS";
            const WISHLIST_UPDATED = "WISHLIST_UPDATED";
            const WISHLIST_NOT_UPDATED = "WISHLIST_FAILED_TO_UPDATED";
            const WISHLIST_REMOVED = "WISHLIST_REMOVED";
            const WISHLIST_NOT_REMOVED = "WISHLIST_FAILED_TO_REMOVE";
            console.log("message == WISHLIST_ADDED  -- ", message == WISHLIST_ADDED);
            console.log("message == WISHLIST_ALREADY_EXISTS || message == WISHLIST_UPDATED) " + (isWishList == "N" && (message == WISHLIST_ALREADY_EXISTS || message == WISHLIST_UPDATED)));
            console.log("message == WISHLIST_ADDED  -- ", message == WISHLIST_ADDED);
            if (
                message == WISHLIST_ADDED ||
                isWishList == "N" && (message == WISHLIST_ALREADY_EXISTS || message == WISHLIST_UPDATED) ||
                isWishList == "Y" && message == WISHLIST_NOT_REMOVED ||
                message == WISHLIST_REMOVED
            ) {
                console.log("Inside if ");
                toggleWishListPackage(packageId);
            }
        }

        // This will fetch all wishlisted packages 
        async function getWishlistedPackages() {
            try {
                var custId = isLoggedIn();
                if (strValidations(custId)) {
                    const wishlistedPackages = await doAxios({
                        method: "get",
                        url: "/tcHolidayRS/wishlist/get/" + custId
                    });
                    let resp = wishlistedPackages.data;
                    console.log(resp);
                    toggleWishList(resp.wishlistedPackages);
                } else {
                    console.log("Not logged in ");
                }
            }
            catch (err) {
                console.error("getWishlistedPackages:", err);
            }
        }


        // return custId 
        function isLoggedIn() {
            var custId = null;
            var userStr = localStorage.getItem('userDetailandFamilyTree');
            if (strValidations(userStr)) {
                var userDetails = JSON.parse(userStr);
                if (strValidations(userDetails) && strValidations(userDetails.userDetail) && strValidations(userDetails.userDetail.custId)) {
                    custId = userDetails.userDetail.custId;
                }
            }
            return custId;
        }

        function strValidations(str) {
            return str != undefined && str != null;
        }
        // Wishlist Code end 

        //TravelBlogs
        async function getTravelblogs() {
            if (!travelBlogURL.value) {
                console.warn("Travel Blog URL not set yet.");
                return;
            }
            try {
                const response = await fetch(travelBlogURL.value);
                if (!response.ok)
                    throw new Error(`HTTP error! ${response.status}`);
                const data = await response.json();
                travelblogsData.value = data;
            } catch (err) {
                console.error("Suggestion fetch failed:", err);
            }
        }

        const formatDate = (dateString) => {
            const date = new Date(dateString);
            return date.toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });
        };

        const extractFirstImageUrl = (htmlString) => {
            if (!htmlString)
                return '';

            // Use a DOM parser to safely extract the first <img> src
            const parser = new DOMParser();
            const doc = parser.parseFromString(htmlString, 'text/html');
            const img = doc.querySelector('img');
            return img ? img.src : '';
        };
        //TravelBlogsEnd

        //URL_START
        async function fetchTravelBlogURL() {
            try {
                const response = await doAxios({
                    method: 'post',
                    url: '/tcHolidayRS/travelBlogService/travelBlogUrl',
                    data: { categoryName: destination.value },
                    headers: {
                        "Content-Type": "application/json"
                    }
                });
                travelBlogURL.value = response.data.url;
                console.log("Dynamic Travel Blog URL:", travelBlogURL.value);
                getTravelblogs();
            } catch (err) {
                console.error("Failed to fetch dynamic URL:", err);
            }
        }
        //URL_END

        //letushelp start
        //function to getpkgsubtype from url
        function getPkgSubTypeFromUrl() {
            const urlPath = window.location.pathname;
            if (urlPath.includes('india-tour-packages')) {
                return '1';
            } else if (urlPath.includes('international-tour-packages')) {
                return '3';
            }
            return '';
        }
        async function leadFormSubmit() {
            console.log("leadFormSubmit srp");

            const afterSubmissionDiv = document.querySelector('.letushelp');

            if (validateForm()) {
                // Fetch values from the URL
                const pkgSubTypeFromUrl = getPkgSubTypeFromUrl();

                var leadFormData = {
                    "assistType": "Contact Centre",
                    "campaignId": getUrlParameter('hsaFor') || "",
                    "device": sessionStorage.getItem('deviceType'),
                    "firstName": name.value,
                    "email": emailId.value,
                    "mobile": phoneNumber.value,
                    "city": destination.value, // Set city from URL
                    "url": window.location.origin + '/' + window.location.pathname.split('/')[1],
                    "isHsaForParamPresent": false,
                    "pkgSubType": pkgSubTypeFromUrl, // Set pkgSubType from URL
                    "queryForAd": "",
                    "utmParameters": getGACampaignCodesnew(),
                    "utmcsr": "",
                    "utmccn": "",
                    "utmcmd": "",
                    "utmcct": "",
                    "utmctr": "",
                    "utmgclid": "",
                };

                console.log("leadFormData: ", leadFormData);

                try {
                    const response = await doAxios({
                        method: "post",
                        data: leadFormData,
                        headers: { "Content-Type": "application/json" },
                        url: `/tcHolidayRS/crm/wantUsToCall`,
                    });

                    console.log("response:", response.data);

                    if (response.status === 204) {
                        // Clear form values & errors
                        name.value = '';
                        phoneNumber.value = '';
                        emailId.value = '';

                        emailError.value = '';
                        phoneNumberError.value = '';
                        nameError.value = '';

                        // Show after submission message
                        afterSubmissionDiv.classList.add('after_submission_show');
                        setTimeout(() => {
                            afterSubmissionDiv.classList.remove('after_submission_show');
                        }, 5000);
                    } else {
                        // Hide the message if response is not 204
                        afterSubmissionDiv.classList.remove('after_submission_show');
                    }
                } catch (err) {
                    console.error("CRM CALL failed:", err);
                    afterSubmissionDiv.classList.remove('after_submission_show');
                }
            } else {
                console.log("Form validation is failed");
                afterSubmissionDiv.classList.remove('after_submission_show');
            }
        }


        // Function to validate the form
        const validateForm = () => {
            nameError.value = '';
            emailError.value = '';
            phoneNumberError.value = '';

            let isValid = true;
            const nameRegex = /^[A-Za-z\s]+$/;

            if (!name.value.trim()) {
                nameError.value = 'Name is required.';
                isValid = false;
            } else if (!nameRegex.test(name.value.trim())) {
                nameError.value = 'Name should not contain numbers or special characters.';
                isValid = false;
            }

            if (!emailId.value.trim()) {
                emailError.value = 'Email ID is required.';
                isValid = false;
            } else if (!emailRegex.test(emailId.value)) {
                emailError.value = 'Please enter a valid email ID.';
                isValid = false;
            }

            const phoneNumberAsString = String(phoneNumber.value);
            if (!phoneNumberAsString.trim()) {
                phoneNumberError.value = 'Mobile No. is required.';
                isValid = false;
            } else if (!phoneNumberRegex.test(phoneNumberAsString)) {
                console.log("!phoneNumberRegex.test(phoneNumberAsString)");
                if ($(".iti__selected-dial-code").text() == "+91") {
                    console.log("+91");
                    phoneNumberError.value = 'Please enter a valid 10-digit mobile number.';
                    isValid = false;
                }
            }

            return isValid;
        };
        //letushelp end

        onMounted(() => {
            const url = window.location.href;
            destination.value = getDestinationFromUrl(url);
            fetchPackages(destination.value).then(() => {
                applyFiltersFromUrl();
            });
            generateYearCalendar();
            getTourManagers(); //TourManager
            fetchTravelBlogURL();
        });

        return {
            packageData,
            getTourType,
            averageRating,
            starCount,
            hasHalfStar,
            totalCustomers,
            convertToK,
            totalPackages,
            totalPackagesHeader,
            destination,
            filteredPackageData,
            getTimelineTitle,
            isAccommodationIncluded,
            isSightseeingIncluded,
            isVisaIncluded,
            isMealIncluded,
            getImages,
            getCurrentPrice,
            getStrikeoutPrice,
            getDiscount,
			getOnBehalfSelectValue,
            changeTourType,
            selectedTourTypes,
            sortPackages,
            filteredPackagesByTag,
            filterData,

            filterPackages,
            searchPackage,
            flightFilterValue,
            tourTypeFilterValue,
            tourTypeStandardFilter,
            tourTypeValueFilter,
            tourTypePremiumFilter,
            toggleTourType,
            durationFilterValue,
            themeFilterValue,
            mustIncludeFilterValue,
            departureCityFilterValue,
            budgetFilterValue,
            resetFilters,
            mustIncludeCityList,
            departureCityList,
            mustIncludeInputEvent,
            departureCityInputEvent,
            mustIncludeInputValue,
            departCityInputValue,
            tagsFilterValue,
            minBudgetFilterValue,
            maxBudgetFilterValue,
            budgetSilderEvent,
            durationSilderEvent,
            getDataFilter,
            totalFiltersApplied,
            appliedFiltersList,
            filtersApplied,
            deleteFilter,
            lazyLoadedPackageData,
            loadMoreClick,
            loadMoreState,
            tagsCountObj,
            yearCalendar,
            selectedMonth,
            selectMonth,
            searchCityByName,
            monthFilterValue,
            formatPrice,
            tourManagers, //TourManager
            bookPkg,
            wishlistSrp,
            travelblogsData,
            formatDate,
            extractFirstImageUrl,
            name, //letushelp start
            emailId,
            phoneNumber,
            emailError,
            nameError,
            phoneNumberError,
            leadFormSubmit,
            minPckgPrice,
            maxPckgPrice,
            mindurationDays,
            maxdurationDays,
            minDurationFilterValue,
            maxDurationFilterValue,
            formatNumber,
            //letushelp end
            onBehalf,
            loggedInDetails,
            // JD helpers for template usage
            usingJDPrice,
            hasJDHub,
            isJDFilterActive
        };
    },
}).mount(".srp-vue");
