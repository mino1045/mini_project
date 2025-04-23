<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 콜백</title>
</head>
<body>
    <script>
        // URL에서 파라미터 추출 함수
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
        
        // URL에서 code와 state 파라미터 추출
        var code = getParameterByName('code');
        var state = getParameterByName('state');
        var storedState = localStorage.getItem("naver_oauth_state");
        
        // 상태 토큰 검증 (보안)
        if (state !== storedState) {
            alert("보안 위험: 상태 토큰이 일치하지 않습니다.");
            window.close();
        } else {
            // 서버에 인증 코드 전달
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "./naver_login_process.do", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        try {
                            var result = JSON.parse(xhr.responseText);
                            if (result.success) {
                                // 로그인 성공
                                // 부모 창의 폼에 정보 설정
                                opener.document.getElementById("frm").login_channel.value = "3"; // 3: 네이버 로그인
                                opener.document.getElementById("frm").kakao_id.value = result.id; // 네이버 ID 저장
                                opener.document.getElementById("frm").kakao_nicknm.value = result.nickname || result.name; // 닉네임 저장
                                
                                // 부모 창의 폼 제출
                                opener.document.getElementById("frm").submit();
                                
                                // 팝업 창 닫기
                                window.close();
                            } else {
                                alert("로그인 처리에 실패했습니다: " + result.message);
                                window.close();
                            }
                        } catch (e) {
                            // 임시 처리 - 서버 처리 없이 테스트 용도
                            // 부모 창의 폼에 임시 정보 설정
                            opener.document.getElementById("frm").login_channel.value = "3"; // 3: 네이버 로그인
                            opener.document.getElementById("frm").kakao_id.value = "naver_temp_id"; // 임시 ID
                            opener.document.getElementById("frm").kakao_nicknm.value = "네이버사용자"; // 임시 닉네임
                            
                            // 부모 창의 폼 제출
                            opener.document.getElementById("frm").submit();
                            
                            // 팝업 창 닫기
                            window.close();
                        }
                    } else {
                        // 서버 오류
                        alert("서버 오류가 발생했습니다.");
                        window.close();
                    }
                }
            };
            xhr.send("code=" + code + "&state=" + state);
            
            // 또는 임시 테스트 용도 (서버 API를 사용할 수 없는 경우)
            /*
            // 부모 창의 폼에 임시 정보 설정
            opener.document.getElementById("frm").login_channel.value = "3"; // 3: 네이버 로그인
            opener.document.getElementById("frm").kakao_id.value = "naver_" + new Date().getTime(); // 임시 ID
            opener.document.getElementById("frm").kakao_nicknm.value = "네이버사용자"; // 임시 닉네임
            
            // 부모 창의 폼 제출
            opener.document.getElementById("frm").submit();
            
            // 팝업 창 닫기
            window.close();
            */
        }
    </script>
</body>
</html>