/*은아*/
	/* 비밀번호 만료 알림창 */
	// 쿠키 가져오기 
           function getCookie(name) {
            var nameOfCookie = name + "=";
            var x = 0;
            while (x <= document.cookie.length) {
                var y = (x + nameOfCookie.length);

                if (document.cookie.substring(x, y) == nameOfCookie) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                        endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }

                x = document.cookie.indexOf(" ", x) + 1;

                if (x == 0) break;
            }

            return "";
        } // 24시간 기준 쿠키 설정하기 

        // expiredays 후의 클릭한 시간까지 쿠키 설정 
        function setCookie24(name, value, expiredays) {
            var todayDate = new Date();

            todayDate.setDate(todayDate.getDate() + expiredays);

            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }

        // 00:00 시 기준 쿠키 설정하기 // expiredays 의 새벽 00:00:00 까지 쿠키 설정 
        function setCookie00(name, value, expiredays) {
            var todayDate = new Date(); todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);

            if (todayDate > new Date()) {
                expiredays = expiredays - 1;
            }

            todayDate.setDate(todayDate.getDate() + expiredays);

            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }

        // 팝업출력
        function popUpAction(name) {
            // name으로 해당 팝업창 열기 
            $("div[name=" + name + "]").fadeIn();
        }