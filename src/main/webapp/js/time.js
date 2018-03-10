(function($) {
    $.extend({
        myTime: {
            /**
             * 当前时间戳
             * @return <int> unix时间戳(秒)  
             */
            CurTime: function(){
                return Date.parse(new Date())/1000;
            },
            /**              
             * 日期 转换为 Unix时间戳
             * @param <string> 2014-01-01 20:20:20  日期格式              
             * @return <int>        unix时间戳(秒)              
             */
            DateToUnix: function(string) {
                var f = string.split(' ', 2);
                var d = (f[0] ? f[0] : '').split('-', 3);
                var t = (f[1] ? f[1] : '').split(':', 3);
                return (new Date(
                        parseInt(d[0], 10) || null,
                        (parseInt(d[1], 10) || 1) - 1,
                        parseInt(d[2], 10) || null,
                        parseInt(t[0], 10) || null,
                        parseInt(t[1], 10) || null,
                        parseInt(t[2], 10) || null
                        )).getTime() / 1000;
            },
            /**              
             * 时间戳转换日期              
             * @param <int> unixTime    待时间戳(秒)              
             * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)              
             * @param <int>  timeZone   时区              
             */
            UnixToDate: function(unixTime, isFull, timeZone) {
                unixTime = parseInt(unixTime) + 8 * 60 * 60*1000;
                var time = new Date(unixTime);
                var ymdhis = "";
                ymdhis += time.getUTCFullYear() + "-";
                var utcMonth = (time.getUTCMonth()+1);
                var utcDate = time.getUTCDate();
                ymdhis += (utcMonth>9?utcMonth:"0"+utcMonth) + "-";
                ymdhis += utcDate>9?utcDate:"0"+utcDate;
                if (isFull === true) {
                	var utcHour = time.getUTCHours();
                	var utcMin = time.getUTCMinutes();
                	var utcSec = time.getUTCSeconds();
                    ymdhis += " " + (utcHour>9?utcHour:"0"+utcHour) + ":";
                    ymdhis += (utcMin>9?utcMin:"0"+utcMin) + ":";
                    ymdhis += utcSec>9?utcSec:"0"+utcSec;
                }
                return ymdhis;
            }
        }
    });
})(jQuery); 