// const { createApp, ref, reactive } = Vue;

function getRecentSearchList() {
    var recentSearchList = localStorage.getItem("recentSearchList");
    return recentSearchList !== null ? JSON.parse(recentSearchList) : [];
    return rs;
}

var recentSearchList = getRecentSearchList();

var isRecentSearchAvailable = ref(recentSearchList.length > 0);
console.log("recentsearchlist --- ", recentSearchList);

var image_RS1 = "images/tcHolidays/clock-check.svg";
var message_RS1 = "Recently Viewed";

var image_RS2 = "images/tcHolidays/user-01.svg";
var message_RS2 = "Enter Traveller Detail";

var image_RS3 = "images/tcHolidays/check-circle-broken.svg"
var message_RS3 = "Confirm Your Booking";


createApp({
    setup() {

        return {
            recentSearchList,
            getRecentSearchList,
            isRecentSearchAvailable,
            image_RS1,
            image_RS2,
            image_RS3,
            message_RS1,
            message_RS2,
            message_RS3,
        }
    }
}).mount('#recentSearchDiv');