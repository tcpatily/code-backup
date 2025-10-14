<div class="card_box">
    <div class="top_block">
        <div class="img_slider owl-carousel">
            <div v-for="pic in pkgData.packageDetail.tcilHolidayPhotoVideoSrp" class="img_box item">
                <img class="testtt" :src="getImages(pic)" :alt="pic.altTag" />
                <!-- baseImageURL/holidays/pic.packageId/photos/pic.path -->
            </div>
        </div>
        <div class="over_img">
            <div class="left_strip primary"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Most Booked') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/srp/thumbs-up.svg" alt="" />
                <span>Most Booked</span>
            </div>
            <div class="left_strip Most-Booked"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Recommended') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/SRP-Tags/Most-Booked.svg" alt="" />
                <span>Recommended</span>
            </div>
            <div class="left_strip Honeymoon-Special"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Honeymoon Special') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/SRP-Tags/Honeymoon-Special.svg" alt="" />
                <span>Honeymoon Special</span>
            </div>
            <div class="left_strip primary"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Online Exclusive') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/srp/stars.svg" alt="" />
                <span>Online Exclusive</span>
            </div>
            <div class="left_strip Deal-Available"
                v-if="pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != ''"
                :title="pkgData.packageDetail.offers">
                <img src="/images/tcHolidays/SRP-Tags/Deal-Available.svg" alt="" />
                <span>Deal Available</span>
            </div>
            <div class="left_strip Xmas-New-Year-Special"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Xmas & New Year Departures') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/SRP-Tags/Xmas-New-Year-Special.svg" alt="" />
                <span>Xmas & New Year Departures</span>
            </div>
            <div class="left_strip Diwali-Special"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Diwali Departures') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/SRP-Tags/Diwali-Special.svg" alt="" />
                <span>Diwali Departures</span>
            </div>
            <div class="left_strip Durga-Puja-Special"
                v-if="(pkgData.packageDetail.isTcilRecomended == 'Durga Puja Departures') && !(pkgData.packageDetail.offers != undefined && pkgData.packageDetail.offers != '')">
                <img src="/images/tcHolidays/SRP-Tags/Durga-Puja-Special.svg" alt="" />
                <span>Durga Puja Departures</span>
            </div>
            <div class="wishlist" v-if="loggedInDetails?.user != 'Staff'"
                @click="wishlistSrp(pkgData.packageDetail.isWishlist,pkgData.packageDetail.packageId)">
                <!--<img src="/images/tcHolidays/srp/heart-outline.svg" alt="">-->
                <div class="wishlist-btn">
                    <i :class="pkgData.packageDetail.isWishlist ? 'icon-svg-favorite-solid' : 'icon-svg-favorite' "></i>
                </div>
            </div>
            <div class="ratings" v-if="pkgData.packageDetail.rating && onBehalf === 'true'">
                <img src="/images/tcHolidays/srp/star.svg" alt="" />
                <span>{{pkgData.packageDetail.rating}}</span>
                <span
                    v-if="pkgData.packageDetail.noOfCustomers">({{formatNumber(pkgData.packageDetail.noOfCustomers)}})</span>
            </div>
        </div>
        <div class="compare">
            <div class="form-check">
                <input class="form-check-input addTo_Compare" type="checkbox" value="" id="addToCompare01" />
                <label class="form-check-label" for="addToCompare01">
                    Add to Compare
                </label>
            </div>
        </div>
    </div>

    <div class="cbt_blc">
        <div class="center_block">
            <div class="ctop_blc">
                <div class="ctl_blc">
                    <span>{{ pkgData.packageDetail.duration - 1 }}N/{{
                        pkgData.packageDetail.duration }}D</span>
                    <span
                        v-if="(pkgData.isCustomizedHolidaysPkg == true && pkgData.packageDetail.pkgSubtypeId.pkgSubtypeName == 'GIT') || pkgData.packageDetail.pkgSubtypeId.pkgSubtypeName != 'GIT'">Customized
                        Tour</span>
                    <span
                        v-if="pkgData.isCustomizedHolidaysPkg == false && pkgData.packageDetail.pkgSubtypeId.pkgSubtypeName == 'GIT'">Group
                        Tour</span>
                    <!-- <span v-if="onBehalf !== 'true'">{{ getTourType(selectedTourTypes[pkgData.packageDetail.packageId] !== undefined ? selectedTourTypes[pkgData.packageDetail.packageId] : pkgData.minimumPricePackageClassId) }}</span> -->
                    <span v-if="onBehalf !== 'true'">{{ getTourType(tourTypeFilterValue.length > 0 ?
                        parseInt(tourTypeFilterValue[tourTypeFilterValue.length - 1]) :
                        pkgData.minimumPricePackageClassId) }}</span>
                    <!-- <select class="tour-type-select"
                            :value="selectedTourTypes[pkgData.packageDetail.packageId] !== undefined ? selectedTourTypes[pkgData.packageDetail.packageId] : pkgData.minimumPricePackageClassId"
                            @change="changeTourType(pkgData, $event)">
                        <option v-if="pkgData.packageDetail.isPackageClassStandard == 'Y'" value="0">Standard</option>
                        <option v-if="pkgData.packageDetail.isPackageClassDelux == 'Y'" value="1">Value</option>
                        <option v-if="pkgData.packageDetail.isPackageClassPremium == 'Y'" value="2">Preminum</option>
                    </select> -->
                </div>
                <div class="ratings" v-if="pkgData.packageDetail.rating && onBehalf !== 'true'">
                    <span class="star"><img src="/images/tcHolidays/star.svg" alt="" /></span>
                    <span>{{pkgData.packageDetail.rating}}</span>
                    <span
                        v-if="pkgData.packageDetail.noOfCustomers">({{formatNumber(pkgData.packageDetail.noOfCustomers)}})</span>
                </div>
                <div class="select_wrapper" v-if="onBehalf === 'true'">
                    <select class="form-select onBehalf-select" :value="getOnBehalfSelectValue(pkgData)"
                        :class="((pkgData.packageDetail.isPackageClassStandard == 'Y' ? 1 : 0) + (pkgData.packageDetail.isPackageClassDelux == 'Y' ? 1 : 0) + (pkgData.packageDetail.isPackageClassPremium == 'Y' ? 1 : 0) === 1 ? 'single-option' : '')"
                        @change="changeTourType(pkgData, $event)" required>
                        <option v-if="pkgData.packageDetail.isPackageClassStandard == 'Y'" value="0">
                            Standard
                        </option>
                        <option v-if="pkgData.packageDetail.isPackageClassDelux == 'Y'" value="1">
                            Value
                        </option>
                        <option v-if="pkgData.packageDetail.isPackageClassPremium == 'Y'" value="2">
                            Premium
                        </option>
                    </select>
                </div>
            </div>
            <div class="ccntr_blc">
                <h6 :title="pkgData.packageDetail.pkgName">
                    {{ pkgData.packageDetail.pkgName }}
                </h6>

                <!-- Desktop View -->
                <div class="ccbtm_blc d-none d-md-flex">
                    <span v-for="(timeline, index) in pkgData.packageDetail.tcilHolidayTimelineCollection.slice(0, 2)"
                        :key="index">
                        <span>{{ timeline.noOfNights }}N {{ timeline.cityCode.cityName }}</span>
                        <span
                            v-if="index !== pkgData.packageDetail.tcilHolidayTimelineCollection.slice(0, 2).length - 1"
                            class="dot"></span>
                    </span>
                    <span v-if="pkgData.packageDetail.tcilHolidayTimelineCollection.length > 2">
                        <a data-bs-toggle="tooltip" data-bs-placement="auto"
                            :title="getTimelineTitle(pkgData.packageDetail.tcilHolidayTimelineCollection)">
                            +{{ pkgData.packageDetail.tcilHolidayTimelineCollection.length - 2 }}
                        </a>
                    </span>
                </div>

                <!-- Mobile View -->
                <div class="ccbtm_blc d-flex d-md-none">
                    <span v-for="(timeline, index) in pkgData.packageDetail.tcilHolidayTimelineCollection"
                        :key="'mobile-' + index">
                        <span>{{ timeline.noOfNights }}N {{ timeline.cityCode.cityName }}</span>
                        <span v-if="index !== pkgData.packageDetail.tcilHolidayTimelineCollection.length - 1"
                            class="dot"></span>
                    </span>
                </div>
            </div>

            <div class="cbtm_blc">
                <div class="cbtm_inr">
                    <span v-if="pkgData.packageDetail.isFlightIncluded == 'Y'"
                        :class="(pkgData.packageDetail.holidayPlusSubType == 2 || usingJDPrice(pkgData)) ? 'optional' : ''"
                        data-bs-toggle="modal" :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId"
                        data-tab="Flights">
                        <span
                            v-if="pkgData.packageDetail.holidayPlusSubType == 2 || usingJDPrice(pkgData)">Optional</span>
                        <img src="/images/tcHolidays/srp/flights.svg" alt="" />
                        Flights
                    </span>
                    <span v-if="isAccommodationIncluded(pkgData)" data-bs-toggle="modal"
                        :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId" data-tab="hotels">
                        <img src="/images/tcHolidays/srp/hotel.svg" alt="" />
                        Hotels
                    </span>
                    <span v-if="isSightseeingIncluded(pkgData)" data-bs-toggle="modal"
                        :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId" data-tab="sightseeing">
                        <img src="/images/tcHolidays/srp/camera.svg" alt="" />
                        Sightseeing
                    </span>
                    <span v-if="isVisaIncluded(pkgData)" data-bs-toggle="modal"
                        :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId" data-tab="visa2">
                        <img src="/images/tcHolidays/srp/visa.svg" alt="" />
                        Visa
                    </span>
                    <span v-if="isMealIncluded(pkgData)" data-bs-toggle="modal"
                        :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId" data-tab="meal">
                        <img src="/images/tcHolidays/srp/meal.svg" alt="" />
                        Meal
                    </span>
                    <span v-if="pkgData.packageDetail.isTourManagerIncluded == 'Y'" data-bs-toggle="modal"
                        :data-bs-target="'#optionalModal-' + pkgData.packageDetail.packageId" data-tab="tour-manager">
                        <img src="/images/tcHolidays/srp/tourist.svg" alt="" />
                        Tour Manager
                    </span>
                </div>
                <div class="brdr_dotted"></div>
            </div>
        </div>

        <div class="bottom_block">
            <div class="fair_blc">
                <div class="btf_blc">
                    <span class="price" v-if="getStrikeoutPrice(pkgData)"><span class="rupeeSign"></span>{{
                        formatCurrency(getStrikeoutPrice(pkgData)) }}</span>
                    <span class="discount" v-if="getDiscount(pkgData)">{{ getDiscount(pkgData) }}% OFF</span>
                </div>
                <h5>
                    <span class="rupeeSign"></span>{{ formatPrice(getCurrentPrice(pkgData)) }}
                    <span class="price_tag">Starting price per adult</span>
                </h5>
            </div>
            <button v-show="pkgData.packageDetail.srpAction === 'Y'"
                @click="bookPkg(pkgData.packageDetail.packageId, pkgData.minimumPricePackageClassId, pkgData.packageDetail.pkgSubtypeId.pkgTypeId, pkgData.packageDetail.pkgName, pkgData.packageDetail)"
                class="btn btn_primary">
                Book Online
            </button>

            <button v-if="pkgData.packageDetail.srpAction === 'N'"
                @click="bookPkg(pkgData.packageDetail.packageId, pkgData.minimumPricePackageClassId, pkgData.packageDetail.pkgSubtypeId.pkgTypeId, pkgData.packageDetail.pkgName, pkgData.packageDetail)"
                class="btn btn_primary">
                View Details
            </button>
        </div>
    </div>
</div>

<!-- Optional Modal -->
<div class="modal fade optional_modal" :id="'optionalModal-' + pkgData.packageDetail.packageId" tabindex="-1"
    :aria-labelledby="'optionalModalLabel-' + pkgData.packageDetail.packageId" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <ul class="nav nav-tabs" :id="'myTab-' + pkgData.packageDetail.packageId" role="tablist">
                    <li class="nav-item" role="presentation" v-if="pkgData.packageDetail.isFlightIncluded == 'Y'">
                        <button class="nav-link active" :id="'flights-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#flights-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'flights-' + pkgData.packageDetail.packageId"
                            aria-selected="true">
                            <span class="optional">
                                <span class="text">Optional</span>
                                <img src="/images/tcHolidays/srp/flights.svg" alt="" />
                            </span>
                            Flights
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" v-if="isAccommodationIncluded(pkgData)">
                        <button class="nav-link" :id="'hotels-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#hotels-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'hotels-' + pkgData.packageDetail.packageId"
                            aria-selected="false">
                            <span><img src="/images/tcHolidays/srp/hotel.svg" alt="" /></span>
                            Hotels
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" v-if="isSightseeingIncluded(pkgData)">
                        <button class="nav-link" :id="'sightseeing-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#sightseeing-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'sightseeing-' + pkgData.packageDetail.packageId"
                            aria-selected="false">
                            <span><img src="/images/tcHolidays/srp/camera.svg" alt="" /></span>
                            Sightseeing
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" v-if="isVisaIncluded(pkgData)">
                        <button class="nav-link" :id="'visa2-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#visa2-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'visa2-' + pkgData.packageDetail.packageId"
                            aria-selected="false">
                            <span><img src="/images/tcHolidays/srp/visa.svg" alt="" /></span>
                            Visa
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" v-if="isMealIncluded(pkgData)">
                        <button class="nav-link" :id="'meal-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#meal-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'meal-' + pkgData.packageDetail.packageId"
                            aria-selected="false">
                            <span><img src="/images/tcHolidays/srp/meal.svg" alt="" /></span>
                            Meal
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" v-if="pkgData.packageDetail.isTourManagerIncluded == 'Y'">
                        <button class="nav-link" :id="'tour-manager-tab-' + pkgData.packageDetail.packageId"
                            data-bs-toggle="tab" :data-bs-target="'#tour-manager-' + pkgData.packageDetail.packageId"
                            type="button" role="tab" :aria-controls="'tour-manager-' + pkgData.packageDetail.packageId"
                            aria-selected="false">
                            <span><img src="/images/tcHolidays/srp/tourist.svg" alt="" /></span>
                            Tour Manager
                        </button>
                    </li>
                </ul>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <img src="/images/tcHolidays/srp/x.svg" alt="" />
                </button>
            </div>
            <div class="modal-body">
                <div class="hotels_inclusive_flights_content show" id="hotels_inclusive_flights_contentPKG009706">
                    <div class="tabs_header">
                        <span class="tc-accomodation" aria-hidden="true"></span>
                        <h4>Hotels</h4>
                    </div>

                    <ul class="hotels_list">
                        <li class="tour_inclusive_content_li">
                            <div class="col-place col-lg-2 text-capitalize">Jaipur</div>

                            <div class="hotel_middle_data col-lg-7 text-capitalize">
                                Crestmont Ashapurna Jaipur / Similar
                                <div class="start_data_mobile_tc col-xs-12 visible-xs" aria-label="3 out of 5 stars">
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-blank-star"></span>
                                    <span class="tc-blank-star"></span>
                                </div>
                            </div>

                            <div class="col-rating col-lg-2 hidden-xs" aria-label="3 out of 5 stars">
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-blank-star"></span>
                                <span class="tc-blank-star"></span>
                            </div>

                            <div class="col-nights col-lg-1 text-right">2 nights</div>
                        </li>

                        <li class="tour_inclusive_content_li">
                            <div class="col-place col-lg-2 text-capitalize">Jodhpur</div>

                            <div class="hotel_middle_data col-lg-7 text-capitalize">
                                Lords Inn / Similar

                                <div class="start_data_mobile_tc col-xs-12 visible-xs" aria-label="4 out of 5 stars">
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-blank-star"></span>
                                </div>

                                <div class="hotel_new_text_tc">
                                    <p>
                                        Lords Inn Jodhpur is located at PWD Circle, the hotel is a good option for
                                        business &amp;
                                        leisure travelers to the region. Pick from a host of well appointed Rooms,
                                        Suites, Business
                                        centre, Conference Hall, Restaurant, Roof top Swimming Pool, Gym &amp; Spa and
                                        other facilities
                                        to take full advantage of your stay.
                                    </p>
                                </div>
                            </div>

                            <div class="col-rating col-lg-2 hidden-xs" aria-label="4 out of 5 stars">
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-blank-star"></span>
                            </div>

                            <div class="col-nights col-lg-1 text-right">1 night</div>
                        </li>

                        <li class="tour_inclusive_content_li">
                            <div class="col-place col-lg-2 text-capitalize">Osian</div>

                            <div class="hotel_middle_data col-lg-7 text-capitalize">
                                Safari Camp Osian / Similar
                                <div class="start_data_mobile_tc col-xs-12 visible-xs"></div>
                            </div>

                            <div class="col-rating col-lg-2 hidden-xs"></div>
                            <div class="col-nights col-lg-1 text-right">1 night</div>
                        </li>

                        <li class="tour_inclusive_content_li">
                            <div class="col-place col-lg-2 text-capitalize">Udaipur</div>

                            <div class="hotel_middle_data col-lg-7 text-capitalize">
                                Pride Hotel / Similar

                                <div class="start_data_mobile_tc col-xs-12 visible-xs" aria-label="4 out of 5 stars">
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-full-star"></span>
                                    <span class="tc-blank-star"></span>
                                </div>
                            </div>

                            <div class="col-rating col-lg-2 hidden-xs" aria-label="4 out of 5 stars">
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-full-star"></span>
                                <span class="tc-blank-star"></span>
                            </div>

                            <div class="col-nights col-lg-1 text-right">2 nights</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>