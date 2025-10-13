
<!------Offers For You------->
<div class="offers_section rn__section__gapTop">
    <div class="container" >
        <div class="row gx-0 justify-content-center" v-if="((pageType =='international' && categorizedOffers?.internationalOffers?.length > 0) || (pageType =='india' && categorizedOffers?.domesticOffers?.length > 0) || ((pageType=='holidays') && (categorizedOffers?.internationalOffers?.length > 0 || categorizedOffers?.domesticOffers?.length > 0))) && (flagDom || flagInt)">
            <div class="col-xxxl-9 col-xxl-12">
                <div class="main_heading ">
                    <h4>Holiday Offers For You</h4>

                    <!--filters-->
                    <div class="filter_inr">
                        <div class="filters_tab comn_filterTab">
                            <div class="slider"></div>
                            <button class="btn" data-target=".tabOffersTabInternational" v-if="pageType!='india' && categorizedOffers?.internationalOffers?.length > 0 && flagInt" >International</button>
                            <button class="btn" data-target=".tabOffersTabIndaAround" v-if="pageType!='international' && categorizedOffers?.domesticOffers?.length > 0 && flagDom">India & Around</button>
                        </div>
                    </div>
                </div>

                <div class="inner__gapTop ">
                    <div class="offers_slide">
                        <div class="holidaysLPBestOffersInternationalPackagesTab tabOffersTabInternational owl-carousel"
                             v-if="categorizedOffers && categorizedOffers.internationalOffers">
                            <template v-for="(internationalOffer, index) in categorizedOffers.internationalOffers.slice(0,9)" :key="internationalOffer.id">
                                <div
                                    class="item_card international2"
                                    v-if="(internationalOffer.internalOffer === 'Y' && onBehalfValue === 'true') || internationalOffer.internalOffer === 'N'"
                                    >
                                    <div class="img_block">
                                        <img :src="baseImageURL + '/holidays/offerApi/' + internationalOffer.image"
                                             :alt="internationalOffer.imageAltTag" />
                                        <div v-if = "internationalOffer.promoCodeName" class="coupon" @click="copyPromoCode(internationalOffer.promoCodeName)">
                                            <img src="../images/tcHolidays/copy.svg" alt="Copy Icon" />
                                            <span>{{ internationalOffer.promoCodeName }}</span>
                                        </div>
                                    </div>
                                    <div class="text_box">
                                        <div class="top_blk">
                                            <div class="lft">
                                                <span>{{ internationalOffer.destinationName }}</span>
                                                <div class="brdr"></div>
                                                <span>Valid till: {{ formatDate(internationalOffer.offerToDate) }}</span>
                                            </div>
                                            <div class="right">
                                                <span>T&C’s Apply*</span>
                                            </div>
                                        </div>
                                        <div class="title">
                                            <p><a href="#">{{ internationalOffer.holidayOfferName }}</a></p>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </div>

                        <div class="holidaysLPBestOffersIndiaPackagesTab tabOffersTabIndaAround owl-carousel"
                             v-if="categorizedOffers && categorizedOffers.domesticOffers" style="display: none;">
                            <template v-for="(domesticOffer, index) in categorizedOffers.domesticOffers.slice(0,9)" :key="domesticOffer.id">
                                <div
                                    class="item_card domestic2"
                                    v-if="(domesticOffer.internalOffer === 'Y' && onBehalfValue === 'true') || domesticOffer.internalOffer === 'N'"
                                    >
                                    <div class="img_block">
                                        <img :src="baseImageURL + '/holidays/offerApi/' + domesticOffer.image"
                                             :alt="domesticOffer.imageAltTag" />
                                        <div v-if = "domesticOffer.promoCodeName" class="coupon" @click="copyPromoCode(domesticOffer.promoCodeName)">
                                            <img src="../images/tcHolidays/copy.svg" alt="Copy Icon" />
                                            <span>{{ domesticOffer.promoCodeName }}</span>
                                        </div>
                                    </div>
                                    <div class="text_box">
                                        <div class="top_blk">
                                            <div class="lft">
                                                <span>{{ domesticOffer.destinationName }}</span>
                                                <div class="brdr"></div>
                                                <span>Valid till: {{ formatDate(domesticOffer.offerToDate) }}</span>
                                            </div>
                                            <div class="right">
                                                <span>T&C’s Apply*</span>
                                            </div>
                                        </div>
                                        <div class="title">
                                            <p><a href="#">{{ domesticOffer.holidayOfferName }}</a></p>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </div>


                    </div>
                </div>

                <div class="inner__gapTop ">
                    <a href="http://172.16.177.175:28480/product-offers/holiday-offers" class="btn btn_primary m-auto">View All <img src="../images/tcHolidays/arrow-narrow-up-right.svg" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".offers_section").on("click", ".coupon", function () {
            const code = $(this).find("span").text().trim();

            // Copy to clipboard
            const tempInput = $("<input>");
            $("body").append(tempInput);
            tempInput.val(code).select();
            document.execCommand("copy");
            tempInput.remove();

            // Optional: show feedback
            if (!$(this).find(".copy-feedback").length) {
                $(this).append('<span class="copy-feedback">Copied!</span>');
            }

            const $feedback = $(this).find(".copy-feedback");
            $feedback.stop(true).fadeIn(200);

            setTimeout(() => {
                $feedback.fadeOut(300, function () {
                    $(this).remove();
                });
            }, 1000);
        });
    });
</script>