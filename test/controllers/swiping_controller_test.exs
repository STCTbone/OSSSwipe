defmodule OssSwipe.SwipingControllerTest do
    use OssSwipe.ConnCase
    test "GET /", %{conn: conn}  do
       conn = get conn, "/swipe" 
       assert html_response(conn, 200) =~ "Swipe right for issues you like!"
    end
end