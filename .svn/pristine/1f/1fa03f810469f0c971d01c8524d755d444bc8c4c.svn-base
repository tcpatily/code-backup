<!-- Fix for select label overlap issue -->
<style>
    .select_wrapper {
        position: relative;
        margin-bottom: 20px;
    }

    .select_wrapper .select_label {
        position: absolute;
        left: 12px;
        transform: translateY(-50%);
        background: white;
        padding: 0 5px;
        pointer-events: none;
        transition: all 0.3s ease;
        z-index: 2;
    }

    .select_wrapper select {
        padding: 15px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 100%;
        background: white;
        font-size: 14px;
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }

    .select_wrapper select:focus {
        outline: none;
        border-color: #0095da;
        box-shadow: 0 0 0 2px rgba(0, 149, 218, 0.1);
    }

    /* Add dropdown arrow */
    .select_wrapper::after {
        content: '▼';
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
        color: #666;
        font-size: 12px;
    }
</style>
<div class="price_offers">
    <div class="tbr_top">





        <div class="select_wrapper">
            <label class="select_label" :style="{ 
                                                       top: hasValidTourType ? '0px' : '50%',
                                                       fontSize: hasValidTourType ? '12px' : '14px',
                                                       color: hasValidTourType ? '#0095da' : '#999'
                                                   }">Tour Type</label>
            <select class="form-select select_dropdown tourTypeClass" v-model="selectedPackageClassId"
                @change="modifyPkgClass" @focus="handleSelectFocus" @blur="handleSelectBlur" required>
                <template v-if="productId === 11">
                    <!-- Holiday+ product - get options from hubCollectionHp -->
                    <template v-if="ltHubCode && hubCollectionHp.length > 0">
                        <option v-for="pkgClass in getHubCollectionHpOptions(ltHubCode)" :key="pkgClass.pkgClassId"
                            :value="pkgClass.pkgClassId">
                            {{ pkgClass.pkgClassName }}
                        </option>
                    </template>
                    <!-- Holiday+ fallback - use static options based on package availability -->
                    <template v-else>
                        <option v-if="isPackageClassStandard" value="0">Standard</option>
                        <option v-if="isPackageClassDelux" value="1">Value</option>
                        <option v-if="isPackageClassPremium" value="2">Premium</option>
                    </template>
                </template>
                <template v-else>
                    <!-- Regular holiday product - get options from hubCollection -->
                    <template v-if="ltHubCode && hubCollection.length > 0">
                        <option v-for="pkgClass in getHubCollectionOptions(ltHubCode)" :key="pkgClass.pkgClassId"
                            :value="pkgClass.pkgClassId">
                            {{ pkgClass.pkgClassName }}
                        </option>
                    </template>
                    <!-- Regular fallback - use static options based on package availability -->
                    <template v-else>
                        <option v-if="isPackageClassStandard" value="0">Standard</option>
                        <option v-if="isPackageClassDelux" value="1">Value</option>
                        <option v-if="isPackageClassPremium" value="2">Premium</option>
                    </template>
                </template>
            </select>
        </div>

        <div class="sppa_blck">
            <div class="top_blck" v-if="currentStrikeoutPrice > 0">
                <h6>₹{{ Math.round(currentStrikeoutPrice).toLocaleString('en-IN') }}</h6>
                <span>{{ discountPercentage }}% OFF</span>
            </div>

            <h4>₹{{ currentStartingPrice ? Math.round(currentStartingPrice).toLocaleString('en-IN') : '0' }}</h4>
            
            <span class="price_tag">Starting price per adult</span>
        </div>

        <div class="btn_points">
            <div class="top_blck">
                <div class="img_blc"><img src="/images/tcHolidays/tc-PDP/edge.png" alt="" />
                </div>
                <div class="points_withTooltip">
                    <p>Earn <span>{{ rewardPoints }}</span> Points</p>
                    <button class="btn btn_tooltip">
                        <img src="/images/tcHolidays/tc-PDP/info-circle.svg" alt="" />
                    </button>
                    <div class="custom_tooltip">
                        <span>Above points are approximate & calculated for Silver tier
                            members, actual points will be credited basis your
                            membership, after your travel is completed</span>
                        <ul>
                            <li>Silver Member - 1%*Total value ( Net )</li>
                            <li>Gold Member - 1.5%*Total value ( Net )</li>
                        </ul>
                        <span>For more information, <a href="" class="btn">click
                                here</a></span>
                    </div>
                </div>
            </div>
            <a href="" class="btn btn_primary btn_calculate">Calculate Price</a>
        </div>
    </div>

    <div class="seperator"></div>

    <div class="tbr_center">
        <div class="offer_coupon">
            <div class="coupon_crd">
                <div class="cc_top">
                    <img src="/images/tcHolidays/tc-PDP/sale-03.svg" alt="" />
                    Deal Available
                </div>
                <span>TC is offering 20% off your next visit when you join their Rewards
                    Program!</span>
            </div>
        </div>
    </div>

    <div class="tbr_bottom want_toCall">
        <div class="form_enquiry">
            <div class="tbrb_top">
                <h6>Want us to call you?</h6>
            </div>
            <div class="contact_form">
                <div class="input_inr">
                    <input type="text" class="form-control phone_number" placeholder=" " />
                    <label class="input_label">Mobile No.</label>
                </div>
                <div class="input_inr">
                    <span class="icon">
                        <img src="assets/images/common-img/email-icon.svg" alt="" />
                    </span>

                    <input type="text" class="form-control" placeholder=" " />
                    <label class="input_label">Enter Mail ID</label>
                </div>
                <div class="input_inr">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="termsConditions" checked />
                        <label class="form-check-label" for="termsConditions">
                            I accept the <a href="">Privacy Policy</a> and authorize
                            Thomas Cook and Group of Companies to contact me with
                            details.
                        </label>
                    </div>
                </div>
                <button class="btn btn_primary" disabled>Get a Callback <img
                        src="assets/images/common-img/arrow-narrow-up-right.svg" alt="" /></button>
            </div>
        </div>
        <div class="form_submitted">
            <button class="btn"><img src="assets/images/common-img/x.svg" alt="" /></button>
            <div class="gif_blck">
                <img src="/images/tcHolidays/tc-PDP/successfully.gif" alt="" />
            </div>
            <span>Thank you for your interest in our holiday package. Our expert will
                contact you shortly</span>
        </div>
    </div>
</div>