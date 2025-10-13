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
    <script>
        //smartech('create', 'ADGMOT35CHFLVDHBJNIG50K969LAAK8GCQ4EF7R4ANGU1503IS60' );
        //smartech('register', 'a64327585b5d41b72a58ac79d18a7ee5');
        //smartech('identify', '');
    </script> 
    <script type="application/ld+json">
        { "@context" : "http://schema.org",
        "@type" : "Organization",
        "legalName" : "Thomas Cook (India) Limited",
        "url" : "https://www.thomascook.in/",
        "logo" : "https://www.thomascook.in/images/logo.jpg",  
        "contactPoint" : [{
        "@type" : "ContactPoint",
        "telephone" : "+91 1800-2099-100",
        "contactType" : "Customer Care"
        }],
        "sameAs" : [ "https://www.facebook.com/ThomasCookIndiaLimited", 
        "https://plus.google.com/+thomascookindia", 
        "https://www.youtube.com/user/ThomasCookIndiaLtd", 
        "https://in.pinterest.com/thomascookindia/", 
        "https://www.instagram.com/thomascookofficial/",
        "https://in.linkedin.com/company/thomas-cook-india-limited"  ]
        } 
    </script>
    <%String str = request.getAttribute("reqUrl").toString();%>
    <%String qurStr = request.getAttribute("reqQueryString").toString();%>
    <%Seo seo =SeoDao.seoMethod(str,qurStr); %>
	
	
    <title>
        <% if(seo.getUserSet().equals("userSet")){%>
        Buy Online - Holidays, Forex, Visa, Flights, Hotels - Thomas Cook ROHIT
        <%}else{%>
        <%=seo.getMetaTitle()%> 
        <%}%>
    </title>
    <link rel="canonical" href="https://www.thomascook.in" />
    <meta name="description" content="
          <% if(seo.getUserSet().equals("userSet")){%>
          Book International & Domestic holiday package online with Thomas Cook, India's best tour operator. Get customized travel packages at best deals. Book now.
          <%}else{%>
          <%=seo.getMetaDescription()%>
          <%}%>
          " />
          <meta name="keywords" content="
          <% if(seo.getUserSet().equals("userSet")){%>
          holidays, vacations, tour packages, tour and travels, holiday packages, tour operators, travel agency
          <%}else{%>
          <%=seo.getMetaKeywords()%>
          <%}%>
          " />
		                                   
<cms:enable-ade/>
<cms:include file="../common/head.jsp"/>
<cms:include file="../common/gtmHead.jsp"/>
<cms:include file="../common/tcHolidays/commonCSS.jsp"/>
<link rel="stylesheet" href="/css/tcHolidays/tcHome.css">
<cms:include file="../common/tcHolidays/commonJS.jsp"/>
</head>
<body>

<div class="clearfix"></div>
<!------App Strip For Mobile Start ------->
<div class="tcHolidaysTheamData">
    <cms:include file="../common/tcHolidays/mobileAppStrip.jsp"/>
</div>
<div class="clearfix"></div>
<!------App Strip For Mobile Ends ------->

<!------Header Strip Start------->
	<div id="header" class="tcHolidaysTheamData">
        <cms:container name="tcHolidaysHeadercontainer" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------Header Strip Ends------->



<!-----Common Login & SignUp Start from here ------->
<div class="tcHolidaysTheamData">
    <cms:include file="../common/tcHolidays/commonLoginSignUp.jsp"/>
</div>
<div class="clearfix"></div>
<!-----Common Login & SignUp Ends from here ------->



<!------Main Top Banner Start from here ------->
<div class="tcHolidaysTheamData">
	<div class="hero_section">
	   <cms:container name="tcHomeMainBanner" type="full"  maxElements="1"/>
    	<cms:include file="tcHomejsp/tcHomeholidayMainBanner.jsp"/>
	</div>
</div>

<div class="clearfix"></div>
<script src="/js/tcHolidays/holidays-main-banner.js"></script>

<!------Main Top Banner Ends from here ------->



<!------Recents Searches Start from here------->
<div class="tcHolidaysTheamData">
    <cms:include file="holidaysJSP/holidaysLPRecentSearches.jsp"/>
</div>
<div class="clearfix"></div>
<!------Recents Searches Start from here------->


<!------Trending Section Start from here-------> 

<div class="clearfix"></div>

    <!------Trending Section------->
    <div class="trending_section rn__section__gapTop">
        <div class="container">
            <div class="row gx-0 justify-content-center">
                <div class="col-xxxl-9 col-xxl-12">
                    <div class="main_heading ">
                        <h4>Trending Destinations</h4>

                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-international-tab" data-bs-toggle="pill" data-bs-target="#pills-international" type="button" role="tab" aria-controls="pills-international" aria-selected="true">International</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-india-tab" data-bs-toggle="pill" data-bs-target="#pills-india" type="button" role="tab" aria-controls="pills-india" aria-selected="false">India & Around</button>
                            </li>
                        </ul>
                    </div>

                    <div class="inner__gapTop ">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-international" role="tabpanel" aria-labelledby="pills-international-tab">
                                <div class="CMSTemplates tcHolidaysTheamData holidaysLPTrendingInternationalSection">
                                    <cms:container name="holidaysLPTrendingInternationalSection" type="full"  maxElements="1"/>
                                </div>
                                <div class="inner__gapTop ">
                                    <a href="international.html" class="btn btn_primary m-auto">View All <img src="../images/tcHolidays/arrow-narrow-up-right.svg" alt=""></a>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-india" role="tabpanel" aria-labelledby="pills-india-tab">
                                <div class="CMSTemplates tcHolidaysTheamData holidaysLPTrendingIndiaSection">
                                    <cms:container name="holidaysLPTrendingIndiaSection" type="full"  maxElements="1"/>
                                </div>
                                <div class="inner__gapTop ">
                                    <a href="domestic.html" class="btn btn_primary m-auto">View All <img src="../images/tcHolidays/arrow-narrow-up-right.svg" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!------Trending Section Ends from here-------> 

<!------TCFOREXSECTION  start from here ------->

	<div id="tcHomeForexSection" class="tcHolidaysTheamData tcHomeForexSection">
        <cms:container name="tcHomeForexSection" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>

<!------TCFOREXSECTION Ends from here------->



<!------Offers For You Start from here------->
<div class="tcHolidaysTheamData holidaysLPOffersForYou">
    <cms:include file="tcHomejsp/holidaysLPOffersForYou.jsp"/>
</div>
<!------Offers For You Ends from here------->




<!------Tourism Board Partners Start from here coming from Folder Gallery----->
 <div class="main_heading holidaysLPTourismBoardPartners">
                        <h4>Tourism Board Partners</h4>
                    </div>
	<div id="holidaysLPTourismBoardPartners" class="CMSTemplates tcHolidaysTheamData holidaysLPTourismBoardPartners d-none d-md-block">
        <cms:container name="holidaysLPTourismBoardPartners" type="full"  maxElements="1"/>
    </div>
	<div id="holidaysLPTourismBoardPartnersMsite" class="CMSTemplates tcHolidaysTheamData holidaysLPTourismBoardPartners d-md-none">
        <cms:container name="holidaysLPTourismBoardPartners-Msite" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------Tourism Board Partners Ends from here----->



<!------Thomas Cook Specials Start from here------->

<div class="tcHolidaysTheamDataContainer">
 <div class="tc_specials rn__section__gapTop">
        <div class="container">
            <div class="row gx-0 justify-content-center">
                <div class="col-xxxl-9 col-xxl-12">
                    <div class="main_heading">
                        <h4>Thomas Cook Specials</h4>
                    </div>
                    <div class="inner__gapTop">
                        <div class="top_section">
                            <div class="festival_blck d-none d-md-block holidaysLPThomasCookSpecialsCharDham">                                
                                    <cms:container name="holidaysLPThomasCookSpecialsCharDham" type="full"  maxElements="1"/>                                
                            </div>
                             <div class="wildlife_slideData holidaysLPThomasCookSpecialsSlider d-none d-md-block">
                                    <cms:container name="holidaysLPThomasCookSpecialsSlider" type="full"  maxElements="1"/> 
                            </div>  
                           
                        </div>  
                        <div class="bottom_section ">
                            <div class="video_container holidaysLPThomasCookSpecialsVideo" id="videoContainer">
                                  <cms:container name="holidaysLPThomasCookSpecialsVideo" type="full"  maxElements="1"/> 
                            </div>
                            <div class="card_box holidaysLPThomasCookSpecialsPathFinders">
                                <cms:container name="holidaysLPThomasCookSpecialsPathFinders" type="full"  maxElements="1"/> 
                            </div>
                            <div class="card_box holidaysLPThomasCookSpecialsScenicJapan">
                                <cms:container name="holidaysLPThomasCookSpecialsScenicJapan " type="full"  maxElements="1"/> 
                            </div>
                        </div>
						 <div class="d-none d-md-block"> 
						 <div class="section_tcEnd ">
						
						        <div>  <cms:container name="holidaysLPThomasCookSpecialsHoneymoon " type="full"  maxElements="1"/> </div>  
								  <div>  <cms:container name="holidaysLPThomasCookSpecialsBeachEscapes " type="full"  maxElements="1"/> </div> 
								    <div>  <cms:container name="holidaysLPThomasCookSpecialsLongWeekendGetaways " type="full"  maxElements="1"/> </div> 
									</div>
						 </div>
						 <div id="holidaysLPTourismBoardPartnersMsite" class="CMSTemplates tcHolidaysTheamData  d-md-none">
                       <cms:container name="holidaysLPThomasCookSpecials-Msite" type="full"  maxElements="1"/>
					   <a href="" class="btn btn-white-bg">View More<img src="/images/tcHolidays/arrow-up-right-dark.svg" alt=""></a>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
	<div class="tcHolidaysTheamData">
        <cms:container name="holidaysLPThomasCookSpecials" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------Thomas Cook Specials Ends from here------->

<!-------Top Flight Routes-------->
<div class="clearfix"></div>
	<div class="tcHolidaysTheamData">
        <cms:container name="tcHomeTopFlightRoutes" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!-------Top Flight Routes ends-------->

<!-------Trending Cities------->
<div class="clearfix"></div>
	<div class="trending_cities rn__section__gapTop">
	<div class="container">
	<div class="main_heading mb-4">
                        <h4>Trending Cities</h4>
                    </div>
        <cms:container name="tchomeTrendingCities" type="full"  maxElements="1"/>
		</div>
    </div>
<div class="clearfix"></div>
<!-------Trending Cities ends------->




<!-------Travel Legacy------->
<div class="clearfix"></div>
	<div class="tcHolidaysTheamData">
        <cms:container name="tchometravel_legacy" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!-------Travel Legacy ends------->


<!------Why Thomas Cook ??? start from here ------->

	<div id="holidaysLPWhyThomasCook" class="CMSTemplates tcHolidaysTheamData holidaysLPWhyThomasCook">
        <cms:container name="holidaysLPWhyThomasCook" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>

<!------Why Thomas Cook ??? Ends from here------->




<!------Download TC App Start from here------->

	<div id="holidaysLPDownloadTCApp" class="CMSTemplates tcHolidaysTheamData holidaysLPDownloadTCApp">
        <cms:container name="holidaysLPDownloadTCApp" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>

<!------Download TC App Ends from here------->



<!------Our Travel Blogs Start from here------->

<div class="blog-section container">
  <div id="blog-carousel" class="owl-carousel owl-theme"></div>
</div>
<div class="tcHolidaysTheamData travelBlogs">
    <cms:include file="holidaysJSP/holidaysLPOurTravelBlogs.jsp"/>
</div>
<div class="clearfix"></div>
	<div id="holidaysLPOurTravelBlogs" class="CMSTemplates tcHolidaysTheamData holidaysLPOurTravelBlogs">
        <cms:container name="holidaysLPOurTravelBlogs" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>

<!------Our Travel Blogs Ends from here------->


<!------Why Customers Love Thomas Cook start from here------->

	<div id="holidaysLPWhyCustomersLoveThomasCook" class="CMSTemplates tcHolidaysTheamData holidaysLPWhyCustomersLoveThomasCook">
        <cms:container name="holidaysLPWhyCustomersLoveThomasCook" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>

<!------Why Customers Love Thomas Cook Ends from here------->




<!------Explore Holidays By Theme start from here------->
	<div class="holiday_theme rn__section__gapTop pb-0" id="holidaysLPExploreHolidaysByTheme">
	<div class=" tcHolidaysTheamData holidaysLPExploreHolidaysByTheme">
        <cms:container name="holidaysLPExploreHolidaysByTheme" type="full"  maxElements="1"/>
    </div>
	</div>
    <div class="clearfix"></div>

<!------Explore Holidays By Theme Ends from here------->


<!------Your Daily Dose of Wanderlust Start from here------->
<div class="tcHolidaysTheamData">
    <cms:include file="holidaysJSP/holidaysLPYourDailyDoseofWanderlust.jsp"/>
</div>
<div class="clearfix"></div>
	<div id="holidaysLPYourDailyDoseofWanderlust" class="CMSTemplates tcHolidaysTheamData holidaysLPYourDailyDoseofWanderlust">
        <cms:container name="holidaysLPYourDailyDoseofWanderlust" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------Your Daily Dose of Wanderlust Ends from here------->











<!------Frequently Asked Questions start from here------->


<!------Frequently Asked Questions-------> 

<%
    // Declare faqList only once at the top or before this section
    List<FaqSection> faqList = seo.getFaqs(); 
%>

<!-- ===== Frequently Asked Questions Section ===== -->
<div class="faq_section rn__section__gapTop">
    <div class="container">
        <div class="row gx-0 justify-content-center">
            <div class="col-xxxl-8 col-xxl-10">
                <div class="main_heading">
                    <h4>Frequently Asked Questions</h4>
                </div>

                <div class="inner__gapTop">
                    <div class="accordion" id="faqAccordian">
                        <%
                            if (faqList != null && !faqList.isEmpty()) {
                                int index = 1;
                                for (FaqSection faq : faqList) {
                                    String collapseId = "collapse" + index;
                                    String headingId = "heading" + index;
                                    boolean isFirst = index == 1;
                        %>
                        <div class="accordion-item <%= isFirst ? "active" : "" %>">
                            <h2 class="accordion-header" id="<%= headingId %>">
                                <button class="accordion-button <%= isFirst ? "" : "collapsed" %>" type="button"
                                        data-bs-toggle="collapse" data-bs-target="#<%= collapseId %>"
                                        aria-expanded="<%= isFirst %>" aria-controls="<%= collapseId %>">
                                    <%= faq.getQuestion() %>
                                </button>
                            </h2>
                            <div id="<%= collapseId %>" class="accordion-collapse collapse <%= isFirst ? "show" : "" %>"
                                 aria-labelledby="<%= headingId %>" data-bs-parent="#faqAccordian">
                                <div class="accordion-body">
                                    <p><%= faq.getAnswer() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                                    index++;
                                }
                            } else {
                        %>
                        <p>No FAQs available.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<div class="clearfix"></div>
<!------Frequently Asked Questions Ends from here------->



<!------Tours and Travel Agency – Thomas Cook India Start from here------->
<div class="tcHolidaysTheamData vertical_tabs_section">	      
	<div class="container">
						
         <% if ("userSet".equals(seo.getUserSet())) { %>
    <h2><%= seo.getDestinationFromUrl().replace("-", " ").replace("tours", "") %> Holiday Packages </h2>
<% } else { %>
    <%= seo.getH2Tag() != null 
        ? seo.getH2Tag().replace("&gt;", ">").replace("&lt;", "<") 
        : "" %>

<% } %>



	</div>
</div>
<div class="clearfix"></div>
	<div id="holidaysLPToursAndTravelAgencyThomasCookIndia" class="CMSTemplates tcHolidaysTheamData holidaysLPToursAndTravelAgencyThomasCookIndia">
        <div class="container">
		<cms:container name="holidaysLPToursAndTravelAgencyThomasCookIndia" type="full"  maxElements="1"/>
		</div>
    </div>
<div class="clearfix"></div>
<!------Tours and Travel Agency – Thomas Cook India Ends from here------->




<!------CTA Section Start from here------->
<div class="tcHolidaysTheamData">
    <cms:include file="holidaysJSP/holidaysFixedButton.jsp"/>
</div>
<div class="clearfix"></div>
	<div id="holidaysFixedButton" class="tcHolidaysTheamData holidaysFixedButton">
        <cms:container name="holidaysFixedButton" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------CTA Section Ends from here------->

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

<!------Footer Section Start from here------->
	<div id="footer" class="tcHolidaysTheamData">
        <cms:container name="tcHolidaysFootercontainer" type="full"  maxElements="1"/>
    </div>
<div class="clearfix"></div>
<!------Footer Section Ends from here------->



<!------Vendors Script CTA Section Start from here------->
<div class="tcHolidaysTheamData">
    <cms:include file="holidaysJSP/vendorScript.jsp"/>
</div>
<!------Vendors Script CTA Section Ends from here------->



</body>

<script src="/js/commonLibrary/custom.js"></script>
<script src="/js/tcHolidays/recentsearch.js"></script>

<script src="/js/tcHolidays/Offers.js"></script>
<script src="/js/tcHolidays/tcholidayhome.js"></script>

<script>
	$(".vertical_tabs_section h3").click(function(){
		$(this).parent().addClass("active");
		$(this).parent().siblings(".srpcountry_tab").removeClass("active");
	})
	$(".vertical_tabs_section .srpcountry_tab:first-child h3").click();
</script>

</html>