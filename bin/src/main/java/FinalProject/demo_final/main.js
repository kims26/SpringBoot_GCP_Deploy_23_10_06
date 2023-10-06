// main layer (visual)
function mainVisualLayer(){
    var swiperCheck01 = new Swiper(".popup-ad .swiper_container", {
        loop: true,
        slidesPerView: 1,
        slidesPerGroup: 1,
        autoHeight: true,
        pagination: {
            el: ".popup-ad .swiper_container .swiper-pagination",
            clickable: true
        },
        autoplay: {
            delay: 1000
        }
    })
}

// main layer (notice)
const main_nt = document.querySelector('.popup-nt .popup-body .popup-content');
const main_nt_img = document.querySelector('.popup-nt .popup-body img');
const main_nt_icon = document.querySelector('.popup-nt .popup-body .popup-content .ico-scroll');
const main_open = document.querySelectorAll('.main-popup');

window.addEventListener("load", function(){
    if (main_nt_img) {
        if (main_nt_img.height > 590) {
            main_nt.classList.add('roll');
        }
    }

    // main layer open (common)
    setTimeout(function() {
        for(var j = 0; j < main_open.length; j++){
            main_open[j].style.display = 'flex';
        }

        mainVisualLayer();
    }, 100);
});

if (main_nt) {
    main_nt.onscroll = function() {
        main_nt_icon.style.display = 'none';
    }
}

// main layer close (common)
const main_closed = document.querySelectorAll('.main-popup .popup-close');
for(var j = 0; j < main_closed.length; j++){
    main_closed[j].addEventListener('click', function(){
        this.parentNode.parentNode.style.display = 'none';
    });
}


const mainSearchBtn = document.getElementById("mainSearchBtn");
if (mainSearchBtn) {
    mainSearchBtn.onclick = function(){
        let form = document.main_search_form;
        let keyword = document.main_search_form.keyword.value.replace(/(^\s*)|(\s*$)/g, "");
        if (keyword == '') {
            return;
        }
        document.main_search_form.submit();
    }
}

// Animation for visual slides
const slides = document.querySelector('.rollingSlideBox');
function animateSlides() {
	slides.classList.add('active');
	setTimeout(() => {
		slides.classList.remove('active');
	}, 15590);
}
animateSlides();
setInterval(animateSlides, 16000);

// Animation for visual circle
const circle = document.querySelector('.visual-circle');
function animateCircle() {
	circle.classList.add('circle-on');
	setTimeout(() => {
		circle.classList.remove('circle-on');
	}, 15500);
}
animateCircle();
setInterval(animateCircle, 16000);


// Animation for text color
const txtCol = document.querySelector('.change-col-txt');
function animateTextColor() {
	txtCol.classList.add('txt-on');
	setTimeout(() => {
		txtCol.classList.remove('txt-on');
	}, 15500);
}
animateTextColor();
setInterval(animateTextColor, 16000);



// sec03 tab
/*const mainTabItem = document.querySelectorAll('.tab_item')
const mainTabInner = document.querySelectorAll('.tab_inner')

mainTabItem.forEach((tab, idx)=> {
    tab.addEventListener('click', function(){
        mainTabInner.forEach((inner)=> {
            inner.classList.remove('on')
        })

        mainTabItem.forEach((item)=> {
            item.classList.remove('on')
        })

        mainTabItem[idx].classList.add('on')
        mainTabInner[idx].classList.add('on')

        let centerPos1 = mainTabItem[idx].offsetLeft
        document.documentElement.style.setProperty('--tabLeftPos', centerPos1 + 'px')
    })
})*/
// sec03 tab - NEW 230411
const mainTabItem = document.querySelectorAll('.tab_item')
const mainTabInner = document.querySelectorAll('.tab_inner')

function updateTabPosition() {
  const centerPos1 = document.querySelector('.tab_item.on').offsetLeft
  document.documentElement.style.setProperty('--tabLeftPos', centerPos1 + 'px')
}

mainTabItem.forEach((tab, idx)=> {
    tab.addEventListener('click', function(){
        mainTabInner.forEach((inner)=> {
            inner.classList.remove('on')
        })

        mainTabItem.forEach((item)=> {
            item.classList.remove('on')
        })

        mainTabItem[idx].classList.add('on')
        mainTabInner[idx].classList.add('on')

        updateTabPosition()
    })
})

window.addEventListener('resize', function () {
  updateTabPosition();
  mainVisualLayer();
})

function ex_manage_store() {
    document.testloginform.move_suburl.value = "associated_service";
    document.testloginform.submit();
    return false;
}

function ex_shop() {
    var solution_count  = select_solution.length;
    var random_number   = Math.floor(Math.random() * solution_count);
    var select_shop_url = select_solution[random_number];
    alert('�� ���θ��� ����ũ������ ���� ����� ���θ��Դϴ�.\n����ũ�� ���θ��� �������� �����帮�� �ֽ��ϴ�.');
    //location.href = select_shop_url;
    window.open(select_shop_url);
}



// MO ���� sec02 �����̵� ���
//const wid = window.innerWidth;

const main_sec02_swiper = new Swiper('.sec02_swiper', {
    slidesPerView: "auto",
    centeredSlides: true,
    spaceBetween: 17,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        type: "progressbar",
    },
    allowTouchMove: true,
    breakpoints: {
        1681: {
            centeredSlides: false,
            //spaceBetween: 0,
            allowTouchMove: false
        },
        990: {
            centeredSlides: false,
            spaceBetween:15,
            allowTouchMove: false
        },
        500: {
            centeredSlides: false,
            allowTouchMove: true
        }
    }
});

// ����,���� ���̾�.
let setCookieNtDayBtn = document.querySelectorAll(".set_cookie_nt_day_btn");
let setCookieNtWeekBtn = document.querySelectorAll(".set_cookie_nt_week_btn");
let setCookieAdDayBtn = document.querySelectorAll(".set_cookie_ad_day_btn");
let setCookieAdWeekBtn = document.querySelectorAll(".set_cookie_ad_week_btn");

if (setCookieNtDayBtn) {
    setCookieNtDayBtn.forEach((btn, idx) => {
        btn.onclick = function(){
            //this.parentNode.parentNode.parentNode.classList.add('hide');
            this.parentNode.parentNode.parentNode.style.display = 'none';
            set_cookie('nt_popup_layer','nt_popup_layer',1);
        }
    });
}
if (setCookieNtWeekBtn) {
    setCookieNtWeekBtn.forEach((btn, idx) => {
        btn.onclick = function(){
            //this.parentNode.parentNode.parentNode.classList.add('hide');
            this.parentNode.parentNode.parentNode.style.display = 'none';
            set_cookie('nt_popup_layer','nt_popup_layer',7);
        }
    });
}
if (setCookieAdDayBtn) {
    setCookieAdDayBtn.forEach((btn, idx) => {
        btn.onclick = function(){
            //this.parentNode.parentNode.parentNode.classList.add('hide');
            this.parentNode.parentNode.parentNode.style.display = 'none';
            set_cookie('ad_popup_layer','ad_popup_layer',1);
        }
    });
}
if (setCookieAdWeekBtn) {
    setCookieAdWeekBtn.forEach((btn, idx) => {
        btn.onclick = function(){
            //this.parentNode.parentNode.parentNode.classList.add('hide');
            this.parentNode.parentNode.parentNode.style.display = 'none';
            set_cookie('ad_popup_layer','ad_popup_layer',7);
        }
    });
}
function set_cookie(name, value, expirehours) {
    var todayDate = new Date();
    todayDate.setHours(todayDate.getHours() + expirehours);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
