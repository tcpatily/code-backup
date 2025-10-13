<!------Our Travel Blogs------->
    <div class="our_blogs rn__section__gapTop travelBlogs">
        <div class="container">
            <div v-if="travelblogsData.length > 0" class="row gx-0 justify-content-center">
                <div class="col-xxxl-9 col-xxl-12">
                    <div class="main_heading ">
                        <h4>Our Travel Blogs</h4>

                    </div>
                    <div class="inner__gapTop ">
					
                        <div class="blogs_slide owl-carousel">
							
    <div class="item_card" v-for="(blog, index) in travelblogsData" :key="blog.id">
        <div class="img_box">
            <a :href="blog.link" target="_blank" rel="noopener">
                <img
                    :src="extractFirstImageUrl(blog.content?.rendered) || '../images/tcHolidays/holidaysLP/OurTravelBlogs/blog-01.jpg'"
                    :alt="blog.title.rendered"
                >
            </a>
        </div>
        <div class="text_box">
            <div class="title">
                <p>
                    <a :href="blog.link" v-html="blog.title.rendered" target="_blank" rel="noopener"></a>
                </p>
            </div>
            <div class="btm_blk">
                <span>{{ formatDate(blog.date) }}</span>
                <a :href="blog.link" class="btn btn_withIcon" target="_blank" rel="noopener">
                    <span>Read More</span>
                    <img src="../images/tcHolidays/common-img/arrow-up-right-02.svg" alt="">
                </a>
            </div>
        </div>
</div>

                        </div>
                    </div>
                </div>
                                        <a href="" class="btn btn_primary m-auto mt-3">View All<img
                                src="../images/tcHolidays/arrow-narrow-up-right.svg" alt=""></a>
            </div>
        </div>
    </div>