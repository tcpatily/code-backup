<div class="bnr_text">
    <div class="search_container">
        <div class="search_box">
            <span class="search_icon d-md-none"><img src="/images/tcHolidays/search-md.svg" alt=""></span>
            <input type="text" class="form-control search searchInput" data-type="default" placeholder="Search “Dubai”">
            <button class="btn btn_search"><img src="/images/tcHolidays/search.svg" alt=""></button>
            <button class="btn btn_cross" type="reset"><img src="/images/tcHolidays/x.svg" alt=""></button>
        </div>
        <div class="voice_assistance" style="display:none;">
            <button class="btn"><img src="/images/tcHolidays/microphone.png" alt=""></button>
        </div>
    </div>
</div>

<div class="search_popup fade" style="display: none;">
    <div class="search_card" style="height: auto;">
        <div class="for_mobile d-block d-md-none">
            <div class="nav_heading">
                <a href="#" class="btn btn_back"><img src="/images/tcHolidays/arrow-left.svg" alt=""></a>
                <span>Enter your favorite destination</span>
            </div>
            <div class="search_form">
                <input type="text" v-model="destination" @input="handleInput" class="form-control searchInput" data-type="default" placeholder="Search “Dubaii”">
                <button class="btn btn_search"><img src="/images/tcHolidays/search.svg" alt=""></button>
                <button class="btn btn_cross" type="reset"><img src="/images/tcHolidays/x.svg" alt=""></button>
            </div>
        </div>

        <div class="search-form-wrapper">
            <div class="search_form d-none d-md-block">
                <span><img src="/images/tcHolidays/search-primary.svg" alt=""></span>
                <input type="text" v-model="destination" @input="handleInput" class="form-control searchInput"
                    data-type="default" placeholder="Search “Dubai”">
                <button class="btn btn_cross" type="reset"><img src="/images/tcHolidays/x.svg" alt=""></button>
            </div>
            <div class="result_box" v-if="suggestions.length > 0">
                <div class="search_result" v-for="(section, index) in suggestions" :key="index">
                    <div class="top">
                        <span>{{ section.title }}</span>
                        <span v-if="section.title !== 'Destination'">
                            <a href="javascript:;" @click="viewAllClick(index)">
                                View All
                            </a>
                        </span>
                    </div>
                    <ul v-if="Array.isArray(section.items)">
                        <li v-for="(item, idx) in section.items" :key="idx">
                            <a href="javascript:;" v-bind="item.attrs" @click="selectSuggestion(item)">
                                {{ item.text}}
                                <img src="/images/tcHolidays/arrow-up-right-gray.svg" alt="">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="no-results" v-if="destination.length >= 3 && suggestions.length === 0">No results found
            </div>
        </div>
        <div class="top_item">
            <div class="search_item" v-if="internationalDestinations != ''">
                <div class="top">
                    <span>Most Searched International Destinations</span>
                </div>
                <div class="thd_section">
                    <div class="row">
                        <div class="col-md-6 col-6" v-for="dest in internationalDestinations" :key="dest.id">
                            <div class="card_box">
                                <div class="img_box">
                                    <img :src="fullImagePath(dest.imagePath)"
                                        :alt="dest.altTag || dest.destinationName">
                                </div>
                                <div class="text_box">
                                    <span>{{ dest.destinationName }}</span>
                                    <a href="javascript:;" @click="navigateToDestination(dest)">View Packages</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search_item" v-if="domesticDestinations != ''">
                <div class="top">
                    <span>Most Searched Domestic Destinations</span>
                </div>
                <div class="thd_section">
                    <div class="row">
                        <div class="col-md-6 col-6" v-for="dest in domesticDestinations" :key="dest.id">
                            <div class="card_box">
                                <div class="img_box">
                                    <img :src="fullImagePath(dest.imagePath)"
                                        :alt="dest.altTag || dest.destinationName">
                                </div>
                                <div class="text_box">
                                    <span>{{ dest.destinationName }}</span>
                                    <a href="javascript:;" @click="navigateToDestination(dest)">View Packages</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
