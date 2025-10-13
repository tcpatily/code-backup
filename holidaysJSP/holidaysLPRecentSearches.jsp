<!------Recents Searches------->
<div id="recentSearchDiv" class="recents_searches rn__section__gapTop pb-0">
    <div v-if="isRecentSearchAvailable" class="container">
        <div class="row gx-0 justify-content-center">
            <div class="col-xxxl-9 col-xxl-12">
                <div class="main_heading ">
                    <h4>Recent Searches</h4>
                    <div class="owl-nav">
                        <button class="owl-prev disabled"><img src="/images/tcHolidays/chevron-left.svg"></button>
                        <button class="owl-next"><img src="/images/tcHolidays/chevron-right.svg"></button>
                    </div>
                </div>
                <div class="inner__gapTop ">
                    <div class="recent_slider owl-carousel">

                        <div v-for="obj in recentSearchList" class="item_card">
                            <div class="top_box">
                                <div class="tp_lft">
                                    <span class="days">{{obj.duration}}</span>
                                    <div v-if="obj.status == 'RS_1'" class="top_blck">
                                        <span class="icon">
                                            <img src="/images/tcHolidays/IndiaLP/RecentSearches/clock-check.svg" alt="">
                                        </span>
                                        <span>Recently Viewed</span>
                                    </div>
                                    <div v-else-if="obj.status == 'RS_2'" class="top_blck">
                                        <span class="icon">
                                            <img src="/images/tcHolidays/IndiaLP/RecentSearches/user-01.svg" alt="">
                                        </span>
                                        <span>Enter Traveller Detail</span>
                                    </div>
                                    <div v-else-if="obj.status == 'RS_3'" class="top_blck">
                                        <span class="icon">
                                            <img src="/images/tcHolidays/IndiaLP/RecentSearches/check-circle-broken.svg"
                                                alt="">
                                        </span>
                                        <span>Confirm Your Booking</span>
                                    </div>
                                </div>
                                <h6>{{obj.packageName}}</h6>
                                <div class="btm_blck">

                                    <template v-for="(timeline, index) in obj.timelineCollection.slice(0, 2)"
                                        :key="index">
                                        <span>{{ timeline.noOfNights }}N {{ timeline.cityName }}</span>
                                        <span v-if="index < obj.timelineCollection.slice(0, 2).length - 1"
                                            class="dot"></span>
                                    </template>

                                    <button v-if="obj.timelineCollection.length > 2" class="extra-count btn"
                                        data-bs-toggle="tooltip" data-bs-placement="top"
                                        :data-bs-title="obj.timelineCollection.slice(2,obj.timelineCollection.length).map(t => t.noOfNights + 'N ' + t.cityName).join(' • ')">
                                        +{{ obj.timelineCollection.length - 2 }}
                                    </button>
                                    
                                </div>
                            </div>
                            <div class="bottom_box">
                                <div v-if="obj.status == 'RS_1'" class="lft_blck">
                                    <h6>₹{{obj.totalPrice}}</h6>
                                    <span>Per person</span>
                                </div>
                                <div v-else-if="obj.status == 'RS_2'" class="lft_blck">
                                    <h6>₹{{obj.totalPrice}}</h6>
                                    <span>Per person</span>
                                </div>
                                <div v-else-if="obj.status == 'RS_3'" class="lft_blck">
                                    <h6>₹ {{obj.totalPrice}}</h6>
                                    <span>Total Price (Inc All Taxes)</span>
                                </div>
                                <!-- v-href="obj.redirectUrl" -->
                                <a v-if="obj.status == 'RS_1'" v-bind:href="obj.redirectUrl"
                                    class="btn btn_withIcon">Know
                                    more<img src="/images/tcHolidays/arrow-up-right.svg" alt=""></a>

                                <a v-else-if="obj.status == 'RS_2'" v-bind:href="obj.redirectUrl"
                                    class="btn btn_withIcon">Continue<img src="/images/tcHolidays/arrow-up-right.svg"
                                        alt=""></a>

                                <a v-else-if="obj.status == 'RS_3'" v-bind:href="obj.redirectUrl"
                                    class="btn btn_withIcon">Pay Now<img src="/images/tcHolidays/arrow-up-right.svg"
                                        alt=""></a>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>