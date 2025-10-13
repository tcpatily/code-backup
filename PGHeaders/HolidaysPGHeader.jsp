<div class="top_cards holidays-header">
    <div class="card_box" v-if="holidaysHeaderData">
        <div class="tcb_top">
            <div class="tcb_chips">
                <span>{{holidaysHeaderData.tdpDetails.duration - 1}}N/{{holidaysHeaderData.tdpDetails.duration}}D</span>
                <span v-if="holidaysHeaderData.tdpDetails.packageClassId == 0">Standard</span>
                <span v-if="holidaysHeaderData.tdpDetails.packageClassId == 1">Value</span>
                <span v-if="holidaysHeaderData.tdpDetails.packageClassId == 2">Premium</span>
                <span
                    v-if="holidaysHeaderData.tdpDetails.pkgSubtypeId == '1' || holidaysHeaderData.tdpDetails.pkgSubtypeId == '3' || holidaysHeaderData.tdpDetails.pkgSubtypeId == '5'">GIT</span>
                <span v-else>Customized Tour</span>
            </div>

            <h4>{{holidaysHeaderData.tdpDetails.pkgName}}</h4>
        </div>

        <div class="pointers">
            <span v-for="stop in holidaysHeaderData.tdpDetails.timelineCityList" :key="id">{{stop}}</span>
        </div>

        <div class="user_info tcb_comn">
            <div class="info_lft">
                <span>From <b>Mumbai</b></span>
                <span><b>({{formatDate(holidaysHeaderData.tdpDetails.departureDate)}} -
                        {{formatDate(holidaysHeaderData.tdpDetails.returnDate)}})</b></span>
            </div>
            <div class="divider"></div>
            <span><b>{{getRoomDetails(holidaysHeaderData.tdpDetails.roomDetails)}}</b></span>
        </div>

        <div class="brdr"></div>

        <div class="optional tcb_comn">
            <div class="text_item">
                <span>Optional Activity:</span>
                <div class="item_wrpr">
                    <span v-if="holidaysHeaderData.tdpDetails.optionalDetails.length > 0"><b>{{holidaysHeaderData.tdpDetails.optionalDetails.length}}
                            Activity</b></span>
                    <span v-else><b>No Activity</b></span>
                </div>
            </div>
            <div class="divider"></div>
            <div class="text_item">
                <span>Onward Flight:</span>
                <div class="item_wrpr">
                    <span v-if="holidaysHeaderData.tdpDetails.airlineDetails.length > 0"
                        v-for="flight in holidaysHeaderData.tdpDetails.airlineDetails">
                        <b v-if="flight.segment == 1">{{flight.airlineName}}</b>
                    </span>
                    <span v-else><b>No Airlines</b></span>
                </div>
            </div>
            <div class="divider"></div>
            <div class="text_item">
                <span>Return Flight:</span>
                <div class="item_wrpr">
                    <span v-if="holidaysHeaderData.tdpDetails.airlineDetails.length > 0"
                        v-for="flight in holidaysHeaderData.tdpDetails.airlineDetails">
                        <b v-if="flight.segment == 2">{{flight.airlineName}}</b>
                    </span>
                    <span v-else><b>No Airlines</b></span>
                </div>
            </div>
        </div>
    </div>
</div>
