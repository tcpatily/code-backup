<div class="package_gallery" >
        <div class="container">
            <div class="row gx-0 justify-content-center">
                <div class="col-xxxl-9 col-xxl-12">
                    <div class="breadcrumbs">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Holidays</a></li>
                                <li class="breadcrumb-item"><a href="#">International tour packages</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Fusion Europe</li>
                            </ol>
                        </nav>
                    </div>

                    <div class="gallery_blc">
                        <div class="row gx-lg-3 gx-2">
                            <div class="col-lg-7 col-md-7 col-6">
                                <div class="img_blc">
                                    <img src="/images/tcHolidays/tc-PDP/gallery-img-01.png" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 col-6">
                                <div class="row gx-lg-3 gx-2 h-100">
                                    <div class="col-12">
                                        <div class="video_container" id="videoContainer">
                                            <iframe
                                                src="https://www.youtube.com/embed/k4cVuaEXI2Q?si=ujZ9hTF8gmelO-xW&rel=0&modestbranding=1&showinfo=0&controls=1"
                                                title="YouTube video player" frameborder="0"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                                referrerpolicy="strict-origin-when-cross-origin"
                                                allowfullscreen></iframe>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="img_blc">
                                            <img src="/images/tcHolidays/tc-PDP/gallery-img-02.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="img_blc">
                                            <img src="/images/tcHolidays/tc-PDP/gallery-img-03.png" alt="" />
                                            <button class="btn btn_gallery" data-bs-toggle="modal"
                                                data-bs-target="#galleryModal">+7 more</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="packageInfo_blc">
                        <div class="pib_lft">
                            <div class="pbl_top">
                                <div class="top_inr" v-if="packageDetailsResponse?.[0]?.packageDetail?.duration">
    <span class="text_xs">{{ packageDetailsResponse?.[0]?.packageDetail?.duration - 1 }}N/{{ packageDetailsResponse?.[0]?.packageDetail?.duration }}D</span>
    <span class="text_xs">{{ tourType }}</span>
</div>

                                <div class="btns_grp">
                                    <a href="" class="btn"><img src="/images/tcHolidays/tc-PDP/share.svg" alt="" /></a>
                                    <a href="" class="btn"><img src="/images/tcHolidays/tc-PDP/download.svg" alt="" /></a>
                                </div>
                            </div>
                            <div class="pbl_center">
							  <h4>{{ packageDetailsResponse?.[0]?.packageDetail?.pkgName}}</h4>
                               <!--- <h4>European Express With 3 Nights Mediterranean Cruise (Civitavecchia – Barcelona) -
                                    Summer 2025</h4>--->
                               <div class="pblc_btm" v-if="packageDetailsResponse?.[0]?.packageDetail?.tcilHolidayTimelineCollection">
  <div class="d-inline-flex align-items-center" 
  v-for="(item, index) in sortedTimeLineCollection()" :key="item.holidayTimelineId">
    <span>{{ item.noOfNights }}N {{ item.cityCode.cityName }}</span>
    <span v-if="index !== sortedTimeLineCollection().length - 1" class="dot mx-2"></span>
  </div>

</div>

                            </div>
                            <div class="pbl_btm" >
                                <span class="text_xs" v-if="getFlagByIndex(packageDetailsResponse?.[0]?.packageDetail?.isFlightIncluded,selectedPackageClassId) === 'Y'">
                                    <img src="/images/tcHolidays/tc-PDP/flights.svg" alt="" />
                                    Flights
                                </span>
                                <span class="text_xs" v-if="getFlagByIndex(packageDetailsResponse?.[0]?.packageDetail?.isHotelDetailsIncluded,selectedPackageClassId) === 'Y'" >
                                    <img src="/images/tcHolidays/tc-PDP/hotel.svg" alt="" />
                                    Hotels
                                </span>
                                <span class="text_xs" v-if="getFlagByIndex(packageDetailsResponse?.[0]?.packageDetail?.isSightseeingDetailsIncluded,selectedPackageClassId) === 'Y'">
                                    <img src="/images/tcHolidays/tc-PDP/camera.svg" alt="" />
                                    Sightseeing
                                </span>
                                <span class="text_xs" v-if="packageDetailsResponse?.[0]?.packageDetail?.isVisaIncluded === 'Y'">
                                    <img src="/images/tcHolidays/tc-PDP/visa.svg" alt="" />
                                    Visa
                                </span>
                                <span class="text_xs" v-if="getFlagByIndex(packageDetailsResponse?.[0]?.packageDetail?.isMealDetailsIncluded,selectedPackageClassId) === 'Y'">
                                    <img src="/images/tcHolidays/tc-PDP/meal-02.svg" alt="" />
                                    Meal
                                </span>
                                <span class="text_xs" v-if="packageDetailsResponse?.[0]?.packageDetail?.isTourManagerIncluded === 'Y'">
                                    <img src="/images/tcHolidays/tc-PDP/tourist.svg" alt=""  />
                                    Tour Manager
                                </span>
                            </div>
                        </div>
                        <div class="pib_rigt">
                            <button class="btn btn_wishlist"><img src="/images/tcHolidays/tc-PDP/heart-outline-01.svg" alt="" />
                                Add to Wishlist</button>
                            <div class="pibr_btm" v-if="packageDetailsResponse?.[0]?.packageDetail?.isTcilRecomended==='Most Booked'">
                                <div class="pibr_lft">
                                    <div class="pibr_top">
                                        <span><img src="/images/tcHolidays/tc-PDP/leaf-01.svg" alt="" /></span>
                                        <p>Most Booked</p>
                                        <span><img src="/images/tcHolidays/tc-PDP/leaf-02.svg" alt="" /></span>
                                    </div>
                                    <span>package of this holiday season</span>
                                </div>
                                <div class="pibr_right" v-if="packageDetailsResponse[0]?.packageDetail?.rating">
                                    <div class="pibr_top">
                                        <span>{{packageDetailsResponse[0]?.packageDetail?.rating}}</span>
                                        <div class="stars">
                                            <img src="assets/images/common-img/star.svg" alt="" />
                                            <img src="assets/images/common-img/star.svg" alt="" />
                                            <img src="assets/images/common-img/star.svg" alt="" />
                                            <img src="assets/images/common-img/star.svg" alt="" />
                                            <img src="assets/images/common-img/star.svg" alt="" />
                                        </div>
                                    </div>
                                    <div class="seperator"></div>
                                    <div class="pibr_bottom">
                                        <span> {{
      packageDetailsResponse[0]?.packageDetail?.noOfCustomers >= 1000
        ? (packageDetailsResponse[0].packageDetail.noOfCustomers / 1000).toFixed(1).replace(/\.0$/, '') + 'k'
        : packageDetailsResponse[0]?.packageDetail?.noOfCustomers
    }}</span>
                                        <!-- <span>1.5k</span> -->
                                        <span><span>Reviews</span></span>
                                    </div>
                                </div>
                            </div>

                            <div class="select_wrapper">
                                <select class="form-select select_dropdown" required>
                                    <option value="1" selected>Standard</option>
                                    <option value="2">Value</option>
                                    <option value="3">Premium</option>
                                </select>
                                <label class="select_label">Tour Type</label>
                            </div>
                        </div>
                        <div class="deals_mobile">
                            <img src="/images/tcHolidays/tc-PDP/sale-03.svg" alt="" />
                            <span>TC is offering 20% off your next visit when you join their Rewards Program!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>