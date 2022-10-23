
function populars(array_list, container) {
    let linkto = "";
    if (array_list[1] == "{{ session['id_user'] }}") {
        linkto = "/account";
    } else {
        linkto = "/profile/" + array_list[1];
    }

    $(container).append(` 
                <section onclick="location.href='/post/`+ array_list[8] + `';">

                    <p>` + array_list[2] + `</p>
                    <div>
                        <i class="fa fa-heart"> `+ array_list[4] + `</i>
                        <i class="fa fa-message"> `+ array_list[5] + `</i>
                        <i class="fa fa-eye"> `+ array_list[6] + `</i>
                    </div>
                    <em>`+ array_list[7] + `</em>
                    <a href="`+ linkto + `">@` + array_list[3] + `</a>
                </section>`);
}



function show_popular_posts() {

    $.post("/randomUsers", { request: '1' }, function (data) {
        data.forEach(function (arr) { randomUsers(arr, '#carousel #content') });
    })

    //POPULAR POSTS
    $.post("/popular_posts", { request: '1' }, function (data) {
        //MOST RECENT POSTS
        $('.newest').html(`<h1 onclick="$(this).parent().children('section').toggle();$(this).children('i').toggleClass('fa-xmark fa-plus');">Recent posts: <i class="fa fa-xmark"></i></h1>`);
        data.recent.forEach(function (arr) { populars(arr, '.newest') });
        //MOST VISITED POSTS
        $('.visited').html(`<h1 onclick="$(this).parent().children('section').toggle();$(this).children('i').toggleClass('fa-plus fa-xmark');">Most visited posts: <i class="fa fa-plus"></i></h1>`);
        data.visits.forEach(function (arr) { populars(arr, '.visited') });
        //MOST COMMENTED POSTS
        $('.commented').html(`<h1 onclick="$(this).parent().children('section').toggle();$(this).children('i').toggleClass('fa-plus fa-xmark');">Most commented posts: <i class="fa fa-plus"></i></h1>`);
        data.comments.forEach(function (arr) { populars(arr, '.commented') });
        //MOST LIKED POSTS
        $('.liked').html(`<h1 onclick="$(this).parent().children('section').toggle();$(this).children('i').toggleClass('fa-plus fa-xmark');">Most liked posts: <i class="fa fa-plus"></i></h1>`);
        data.likes.forEach(function (arr) { populars(arr, '.liked') });

        $('.visited h1, .commented h1, .liked h1').parent().children('section').toggle()


    });
}

$('.visited h1, .commented h1, .liked h1').click(function () {
    setTimeout(function () {
        // console.log($('.newest h1').text())
        $(this).parent().children('section').toggle();
        $(this).children('i').toggleClass('fa-plus fa-xmark');
    }, 2000)

})

function randomColor() {
    //meke each tag's background different
    const colors = ['red', 'pink', 'blue', 'yellow', 'purple', 'brown', 'orange', 'lime', 'fucsia', 'green', 'lemon', 'grey', 'white', 'black'];

    const tags = $('.cont-tags strong');
    for (let i = 0; i < tags.length; i++) {
        $(tags[i]).css({ 'background': colors[(Math.floor(Math.random() * tags.length))] });
    }
}

function randomUsers(user, container) {

    $(container).append(` 
                    <figure class="item">
                        <div onclick="location.href='/profile/`+ user[0] + `'">
                            <div class="user-foto">`+ user[3] + `</div>
                            <figcaption>`+ user[1] + `</figcaption>
                            <blockquote>`+ user[2] + `</blockquote>								
                            <strong>`+ user[5] + ` </strong> <span>Following</span>
                            <strong class='xx'>`+ user[6] + ` </strong> <span>Followers</span>
                        </div>
                        <div class="btn">
                            <button class="`+ user[4] + `" onclick="follow_unfollow(` + user[0] + `,$(this), $(this).parents().siblings('div').children('strong.xx'))">` + user[4] + `</button>
                        </div>
                    </figure>`);
}

$(function(){
    const gap = 10,
carousel = document.getElementById("carousel"),
content = document.getElementById("content"),
next = document.getElementById("next"),
prev = document.getElementById("prev");

next.addEventListener("click", e => {
    carousel.scrollBy(width + gap, 0);
    if (carousel.scrollWidth !== 0) {
        prev.style.display = "flex";
    }
    if (content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
        next.style.display = "none";
    }
});
prev.addEventListener("click", e => {
    carousel.scrollBy(-(width + gap), 0);
    if (carousel.scrollLeft - width - gap <= 0) {
        prev.style.display = "none";
    }
    if (!content.scrollWidth - width - gap <= carousel.scrollLeft + width) {
        next.style.display = "flex";
    }
});

let width = carousel.offsetWidth;
window.addEventListener("resize", e => (width = carousel.offsetWidth));

})
