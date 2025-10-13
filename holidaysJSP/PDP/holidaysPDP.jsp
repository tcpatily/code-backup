<%@page import="com.thomascook.in.astra.cmssecurity.seo.Seo"%>
<%@page import="com.thomascook.in.astra.cmssecurity.seo.SeoDao"%>
<%@page import="com.thomascook.in.astra.cmssecurity.seo.HolidaysSrpSeo"%> 
<%@page import="com.thomascook.in.astra.cmssecurity.seo.FaqSection"%>
<%@ page import="java.util.List"%>

<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %><%--
--%><%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %><%--
--%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%--
--%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%>
<fmt:setLocale value="${cms.locale}" /> 
<c:set var="uri" value="${cms.requestContext.uri}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <meta name="facebook-domain-verification" content="u5uydpn303fkqwpfqj5diof71jn0uo" />
    <title></title>
	
    <link rel="canonical" href="https://www.thomascook.in" />
    <meta name="description" content="" />
		  
		  

		                                   
<cms:enable-ade/>

<link rel="stylesheet" href="/css/tcHolidays/holidaysPDP.css">
<cms:include file="../common/tcHolidays/commonCSS.jsp"/>
<cms:include file="../common/tcHolidays/commonJS.jsp"/>

<style>
.tabLPInternationalPackages {
    margin-bottom: 150px;
}
</style>
</head>
<body >

<div id="header-revamp">
    <div class="clearfix"></div>
    <!------App Strip For Mobile Start ------->
    <div class="tcHolidaysTheamData">
        <cms:include file="../common/tcHolidays/mobileAppStrip.jsp" />
    </div>
    <div class="clearfix"></div>
    <!------App Strip For Mobile Ends ------->

    <!------Header Strip Start------->
    <div id="header" class="tcHolidaysTheamData">
        <cms:container name="tcHolidaysHeadercontainer" type="full" maxElements="1" />
    </div>
    <div class="clearfix"></div>
    <!------Header Strip Ends------->



    <!-----Common Login & SignUp Start from here ------->
    <div class="tcHolidaysTheamData">
        <cms:include file="../common/tcHolidays/commonLoginSignUp.jsp" />
    </div>
    <div class="clearfix"></div>
    <!-----Common Login & SignUp Ends from here ------->
</div>

<div class="clearfix"></div>

   <main >
    <!--Package Gallery Start -->
	<span class="holiday-pdp-page">
    <cms:include file="../tcHolidays/tcPdp/banner.jsp" />
	
	
    <!--Package Gallery End -->
    <!--Package Details Start-->
  
    <div class="packageInfo_tabs  "  >
        <div class="package_tablist">
            <div class="container">
                <div class="row gx-0 justify-content-center">
                    <div class="col-xxxl-9 col-xxl-12">
                        <div class="top_blc">
                            <div class="left_blc">
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-itinerary-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-itinerary" type="button" role="tab"
                                            aria-controls="nav-itinerary" aria-selected="true">
                                            Itinerary
                                        </button>
                                        <button class="nav-link" id="nav-inclusions-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-inclusions" type="button" role="tab"
                                            aria-controls="nav-inclusions" aria-selected="false">
                                            Inclusions
                                        </button>
                                        <button class="nav-link" id="nav-summary-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-summary" type="button" role="tab"
                                            aria-controls="nav-summary" aria-selected="false">Summary</button>
                                        <button class="nav-link" id="nav-highlights-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-highlights" type="button" role="tab"
                                            aria-controls="nav-highlights" aria-selected="false">
                                            Highlights
                                        </button>
                                    </div>
                                </nav>
                            </div>
                            <div class="btns_grp">
                                <a href="" class="btn"><img src="/images/tcHolidays/tc-PDP/share.svg" alt="" />Share</a>
                                <span class="brdr"></span>
                                <a href="" class="btn"><img src="/images/tcHolidays/tc-PDP/download.svg" alt="" />Download</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="packageInfo_inr">
            <div class="container">
                <div class="row gx-0 justify-content-center">
                    <div class="col-xxxl-9 col-xxl-12">
                        <div class="row holiday-pdp-page">
                            <div class="col-lg-9 col-md-9 ">
							   <div class="holiday-pdp-page">
                                <cms:include file="../tcHolidays/tcPdp/Package-Details-Left.jsp" />
								</div>
                            </div>
                            <div class="col-lg-3 col-md-3 d-none d-md-block">
							 <div class="holiday-pdp-page">
                                <cms:include file="../tcHolidays/tcPdp/Package-Details-Right.jsp" />
								</div>
                            </div>
                        </div>
                        <div class="calculation_mobile">
                            <div class="earn_points">
                                <div class="left_blc">
                                    <img src="/images/tcHolidays/tc-PDP/edge.png" alt="" />
                                    <p>Earn <b>2104</b> Points</p>
                                </div>
                                <div class="right_tooltip">
                                    <button class="btn btn_tooltip">
                                        <img src="/images/tcHolidays/tc-PDP/info-circle.svg" alt="">
                                    </button>
                                    <div class="custom_tooltip">
                                        <span>Above points are approximate &amp; calculated for Silver tier
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
                            <div class="calculate_priceWrpr">
                                <div class="price_left">
                                    <div class="top_blck">
                                        <p>₹3 20 100</p>
                                        <span>20% OFF</span>
                                    </div>
                                    <h5>₹2 71 900</h5>
                                    <span class="price_tag">Starting price per adult</span>
                                </div>
                                <button class="btn btn_primary btn_calculate">Calculate Price</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="calculation_mobile">
            <div class="earn_points">
                <div class="left_blc">
                    <img src="/images/tcHolidays/tc-PDP/edge.png" alt="" />
                    <p>Earn <b>2104</b> Points</p>
                </div>
                <div class="right_tooltip">
                    <button class="btn btn_tooltip">
                        <img src="/images/tcHolidays/tc-PDP/info-circle.svg" alt="">
                    </button>
                    <div class="custom_tooltip">
                        <span>Above points are approximate &amp; calculated for Silver tier
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
            <div class="calculate_priceWrpr">
                <div class="price_left">
                    <div class="top_blck">
                        <p>₹3 20 100</p>
                        <span>20% OFF</span>
                    </div>
                    <h5>₹2 71 900</h5>
                    <span class="price_tag">Starting price per adult</span>
                </div>
                <button class="btn btn_primary btn_calculate">Calculate Price</button>
            </div>
        </div>
    </div>
</span>
    <!--Package Details End-->
    <!--Calculate Price Start-->
    <cms:include file="../tcHolidays/tcPdp/Calculate-Price.jsp" />
    <!--Calculate Price End-->
    <!--Review Booking Start-->
    <cms:include file="../tcHolidays/tcPdp/Review-Booking.jsp" />
    <!--Review Booking End-->
    <!--Make Payment Start-->
    <cms:include file="../tcHolidays/tcPdp/Make-Payment.jsp" />
    <!--Make Payment End-->
    <!--Booking Confirmation Start-->
    <cms:include file="../tcHolidays/tcPdp/Booking-Confirmation.jsp" />
    <!--Booking Confirmation End-->
    <!-- modal Popup Start -->
    <!-- ==============Login Popup================== -->
    <cms:include file="../tcHolidays/tcPdp/popup/Login-Modal.jsp" />

    <!--Gallery Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Gallery-Modal.jsp" />

    <!--Calender Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Calender-Modal.jsp" />

    <!--Remove Modal -->
    <cms:include file="../tcHolidays/tcPdp/popup/Remove-Modal.jsp" />

    <!--Policy Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Policy-Modal.jsp" />

    <!--Change Flight Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Change-Flight-Modal.jsp" />

    <!--Flight Details Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Flight-Details-Modal.jsp" />

    <!--Traveller Details Modal -->
   <cms:include file="../tcHolidays/tcPdp/popup/Traveller-Details-Modal.jsp" />

    <!--Applied Promotional Offers Modal -->
    <cms:include file="../tcHolidays/tcPdp/popup/Applied-Promotional-Offers-Modal.jsp" />
    <!--======================= modal Popup End======================== -->
      <!-- TCX Gallery Viewer -->
    <div id="tcx-gallery-viewer" class="tcx-gallery">
        <div class="gallery-header">
            <button class="btn btn-back"><img src="/images/tcHolidays/tc-PDP/arrow-narrow-left-white.svg" alt="" /> Go
                Back</button>
        </div>
        <div class="gallery-container">
            <button class="btn btn-prev"><img src="/images/tcHolidays/chevron-left.svg" alt="" /></button>
            <div class="img-wrap">
                <img class="object-image" src="" alt="" />
            </div>
            <div class="caption">
                <p></p>
            </div>
            <button class="btn btn-next"><img src="/images/tcHolidays/chevron-right.svg" alt="" /></button>
        </div>
        <div class="image-counter"></div>
    </div>

    <!------Added to Wishlist------>
    <div class="wishList_message">
        <img src="/images/tcHolidays/tc-PDP/check.gif" alt="">
        <p>Added to Wishlist</p>
    </div>
</main>

       
<!------Newsletter Section Start from here------->
    <div class="newsletter_section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xxxl-11">
                    <div class="newsletter_card">
                        <h3>Stay in the Loop!</h3>
                        <p>Be the first to know about exclusive travel deals, exciting destinations, and special
                            offers!
                        </p>
                        <div class="input_form">
                            <input id="newsLetterEmail" type="text" class="form-control" placeholder="Enter your email" @input="resetsubscribeEmail">
                            <span><button class="btn" @click="subscribeEmail" >Subscribe</button></span>
                        </div>
						<p class="response_msg" style="display: none;"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!------Newsletter Section Ends from here------->
	
	
   <!------Vendors Script CTA Section Start from here------->
    <div class="tcHolidaysTheamData">
        <cms:include file="holidaysJSP/vendorScript.jsp" />
    </div>
    <!------Vendors Script CTA Section Ends from here------->
    <!------Footer Section Start from here------->
    <div id="footer" class="tcHolidaysTheamData">
        <cms:container name="tcHolidaysFootercontainer" type="full" maxElements="1" />
    </div>
    <div class="clearfix"></div>
    <!------Footer Section Ends from here------->



 <section class="holiday_Consolidation">
<cms:include file="../holidays/common-components/Consolidation-HolidayAssist.jsp"/>
</section>

<!------------ Page Wise JS files ------------->

<script src="/js/tcHolidays/holidays-pdp.js"></script>
<script src="/js/tcHolidays/holidayPdp.js"></script>
<script src="/js/tcHolidays/calculatePrice.js" ></script>


<script src="/js/tcHolidays/owlcarousel2-filter.min.js" type="module"></script>
</body>
</html>
