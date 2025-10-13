<!--Calender Modal -->
    <div class="modal fade calendar_modal" id="calendarModal" tabindex="-1" aria-labelledby="calendarModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="btn btn-close btn_closeM" data-bs-dismiss="modal"><img
                            src="assets/images/common-img/arrow-left.svg" />Select date of travel</button>
                    <p>Select departure city and date of travel</p>
                    <button type="button" class="btn-close btn_closeD" data-bs-dismiss="modal" aria-label="Close">
                        <img src="/images/tcHolidays/tc-PDP/x-close.svg" alt="" />
                    </button>
                </div>
                <div class="modal-body">
                    <div class="top_blck">
                        <div class="select_wrapper" v-if="holidayPlusSubType !== 2">
                                                               
                                                                    <select id="ltSelect" v-model="ltHubCode"
                                                                        @change="modifyLtHubCity"
                                                                        class="form-select select_dropdown select_city">
                                                                        <option value="">Please Select</option>
                                                                        <template v-if="productId === 11">
                                                                            <option v-for="hub in hubCollectionHp"
                                                                                :key="hub.cityCode"
                                                                                :value="hub.cityCode">
                                                                                {{ hub.cityName }} ({{ hub.airportCode
                                                                                }})
                                                                            </option>
                                                                        </template>
                                                                        <template v-else>
                                                                            <option v-for="hub in hubCollection"
                                                                                :key="hub.hubCode" :value="hub.hubCode">
                                                                                {{ hub.hubName }}
                                                                            </option>
                                                                        </template>
                                                                    </select>
                                                                

                                                                <label class="select_label">Departure City</label>
                                                            </div>
                    </div>

                    <div class="bottom_blck">
                        <div class="title">
                            <p>Select date of travel</p>
                            <div class="title_right">
                                <span class="available"><span></span>Available</span>
                                <span class="request"><span></span>On Request</span>
                            </div>
                        </div>

                        <div class="calendar_wrapper">
                            <div class="calendar_months">
                                <span class="months active">Jan</span>
                                <span class="months">Feb</span>
                                <span class="months">Mar</span>
                                <span class="months">Apr</span>
                                <span class="months">May</span>
                                <span class="months">Jun</span>
                                <span class="months">Jul</span>
                                <span class="months">Aug</span>
                                <span class="months">Sep</span>
                                <span class="months">Oct</span>
                                <span class="months">Nov</span>
                                <span class="months">Dec</span>
                            </div>

                            <div class="calender_grid">
                                <!-- 1st Row-->
                                <div class="grid_days special_offers available">
                                    <div class="days">
                                        <span class="primary circle"></span>
                                        <span class="text_xs">Mon, 1 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                    <span class="text_xxs strip">New Year Special</span>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Tue, 2 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Wed, 3 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Thu, 4 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Fri, 5 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sat, 6 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sun, 7 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>

                                <!-- 2nd Row-->
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Mon, 8 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Tue, 9 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Wed, 10 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Thu, 11 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Fri, 12 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sat, 13 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sun, 14 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>

                                <!-- 3rd Row-->
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Mon, 15 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Tue, 16 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Wed, 17 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Thu, 18 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Fri, 19 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sat, 20 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sun, 21 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>

                                <!-- 4th Row-->
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Mon, 22 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Tue, 23 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Wed, 24 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Thu, 25 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Fri, 26 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days on_request">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sat, 27 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Sun, 28 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>

                                <!-- 5th Row-->
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Mon, 29 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm lowest_price">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Tue, 30 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                                <div class="grid_days available">
                                    <div class="days">
                                        <span class="circle"></span>
                                        <span class="text_xs">Wed, 31 Jan</span>
                                    </div>
                                    <div class="price">
                                        <span class="text_xxs">₹ 44,930</span>
                                        <span class="text_sm">₹ 18,200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>