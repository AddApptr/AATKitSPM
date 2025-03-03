/*
 *    Copyright 2013 APPNEXUS INC
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
(function () {

    if ((typeof window.sdkjs) !== "undefined") {
        return;
    }

    // constants
    var DEBUG = false;
    var NATIVE_CALL_PREFIX = "anjam://";
    var ANJAM_PROTOCOL = "anjam:";
    var SDKJS_PROTOCOL = "sdkjs:";
    var CALL_INIT = "init";
    var CALL_MAYDEEPLINK = "MayDeepLink";
    var CALL_DEEPLINK = "DeepLink";
    var CALL_EXTERNALBROWSER = "ExternalBrowser";
    var CALL_INTERNALBROWSER = "InternalBrowser";
    var CALL_RECORDEVENT = "RecordEvent";
    var CALL_DISPATCHAPPEVENT = "DispatchAppEvent";
    var CALL_GETDEVICEID = "GetDeviceID";
    var CALL_GETCUSTOMKEYWORDS = "GetCustomKeywords";
    var CALL_SETMRAIDREFRESHFREQUENCY = "SetMRAIDRefreshFrequency";
    var CALL_READY = "ready";
    var CALL_RESULT = "result";
    var CALL_MRAID = "mraid";
    var CALL_PING = "Ping";

    // public window variable to be invoked by mraid.js
    var sdkjs = window.sdkjs = {};
    sdkjs.client = {};

    // internal SDKJS variables
    var anjamFrames = [];
    var nativeCallQueue = [];

    sdkjs.anlog = function (message) {
        if (DEBUG) {
            console.log(message);
        }
    }

    // window event listener to receive messages from SDKJS
    sdkjs.listener = function (event) {
        
        // accept all event.origin values, filter based on protocol
        const url = new URL(event.data);

        if (url.protocol === ANJAM_PROTOCOL) {
            // use pathname because host doesn't work
            var path = url.pathname;

            // parameters
            var search = url.search.substr(1); // drop the '?' at the front
            var query = search.split("&");
            var queryParameters = {};
            for (var i = 0; i < query.length; i++) {
                var values = query[i].split("=");
                queryParameters[values[0]] = values[1];
            }

            // commands handler
            sdkjs.anlog("SDKJS received: call(" + path + ") params:(" +
                JSON.stringify(queryParameters) + ")");

            if (path === CALL_INIT) {
                sdkjs.callInit(queryParameters);
            } else if (path === CALL_MAYDEEPLINK) {
                sdkjs.callMayDeepLink(queryParameters);
            } else if (path === CALL_DEEPLINK) {
                sdkjs.callDeepLink(queryParameters);
            } else if (path === CALL_EXTERNALBROWSER) {
                sdkjs.callExternalBrowser(queryParameters);
            } else if (path === CALL_INTERNALBROWSER) {
                sdkjs.callInternalBrowser(queryParameters);
            } else if (path === CALL_RECORDEVENT) {
                sdkjs.callRecordEvent(queryParameters);
            } else if (path === CALL_DISPATCHAPPEVENT) {
                sdkjs.callDispatchAppEvent(queryParameters);
            } else if (path === CALL_GETDEVICEID) {
                sdkjs.callGetDeviceID(queryParameters);
            } else if (path === CALL_GETCUSTOMKEYWORDS) {
                sdkjs.callGetCustomKeywords(queryParameters);
            } else if (path === CALL_MRAID) {
                sdkjs.callMraid(queryParameters);
            } else if (path === CALL_SETMRAIDREFRESHFREQUENCY) {
                sdkjs.callSetMraidRefreshFrequency(queryParameters);
            } else if (path === CALL_PING) {
                /* An iframe can send a post message directly to the top window
                 * in order to be sure to be inside the AppNexus SDK context (without injecting anjam.js):
                 *
                 * window.top.postMessage('anjam:Ping?cb=toto', '*');
                 *
                 * The SDK will anwser a message like 'sdkjs:result?caller=Ping&answer=1&cb=toto'
                 * The iframe needs a listener:
                 * window.addEventListener("message", function(_e) { if(_e.data === 'sdkjs:result?caller=Ping&answer=1&cb=toto') { console.log('Ping received'); } else { console.log('other event: ' + _e.data); } } );
                 */
                var queryStringParameters = 'caller=' + CALL_PING + '&answer=1&cb=' + queryParameters.cb;
                sdkjs.sendPingAnswer(queryStringParameters, event);
            }
        }
    }

    sdkjs.setup = function () {
        if (window.addEventListener) {
            window.addEventListener("message", sdkjs.listener, false);
        } else {
            window.attachEvent("onmessage", sdkjs.listener);
        }
    }

    sdkjs.setup();

    sdkjs.postMessageToFrames = function (message) {
        for (var i = 0; i < anjamFrames.length; i++) {
            try {
                anjam.anlog("Dispatching message to window name " + anjamFrames[i].name);
            } catch(e) {
                // In Cross Domain communication, the window's name is not available
                anjam.anlog("Dispatching message to a cross domain window");
            }
            anjamFrames[i].postMessage(message, "*");
        }
    }

    sdkjs.fireMessage = function (call, params) {
        params = params || "";
        sdkjs.postMessageToFrames(SDKJS_PROTOCOL + call + "?" + params);
    }

    sdkjs.callInit = function (queryParameters) {
        var name = queryParameters.name;
        var w = window.open("", name, null, false);
        anjamFrames.push(w);
        sdkjs.fireMessage(CALL_READY);
    }

    // It sends a ping answer to the window which sends the ping initially
    sdkjs.sendPingAnswer = function (queryStringParameters, event) {
        try{
            event.source.postMessage( SDKJS_PROTOCOL + CALL_RESULT + "?" + queryStringParameters, "*");
        } catch(_e) {
            sdkjs.anlog("SDKJS can't send properly ping answer to sub window: " + _e);
        }
    }

    sdkjs.dequeue = function () {
        window.location = nativeCallQueue.shift();
        if (nativeCallQueue.length > 0) {
            setTimeout(sdkjs.dequeue, 0);
        }
    }

    sdkjs.makeNativeCall = function (uri) {
        sdkjs.makeNativeCallWithPrefix(NATIVE_CALL_PREFIX, uri);
    }

    sdkjs.makeNativeCallWithPrefix = function (prefix, uri) {
        nativeCallQueue.push(prefix + uri);
        if (nativeCallQueue.length == 1) {
            setTimeout(sdkjs.dequeue, 0);
        }
    }

    sdkjs.callMayDeepLink = function (queryParameters) {
        var cb = queryParameters.cb;
        var url = queryParameters.url;

        sdkjs.makeNativeCall("MayDeepLink?cb=" + cb + "&url=" + url);
    }

    sdkjs.callDeepLink = function (queryParameters) {
        var cb = queryParameters.cb;
        var url = queryParameters.url;

        sdkjs.makeNativeCall("DeepLink?cb=" + cb + "&url=" + url);
    }

    sdkjs.callExternalBrowser = function (queryParameters) {
        var url = queryParameters.url;

        sdkjs.makeNativeCall("ExternalBrowser?url=" + url);
    }

    sdkjs.callInternalBrowser = function (queryParameters) {
        var url = queryParameters.url;

        sdkjs.makeNativeCall("InternalBrowser?url=" + url);
    }

    sdkjs.callRecordEvent = function (queryParameters) {
        var url = queryParameters.url;

        sdkjs.makeNativeCall("RecordEvent?url=" + url);
    }

    sdkjs.callDispatchAppEvent = function (queryParameters) {
        var event = queryParameters.event;
        var data = queryParameters.data;

        sdkjs.makeNativeCall("DispatchAppEvent?event=" + event + "&data=" +
            data);
    }

    sdkjs.callGetDeviceID = function (queryParameters) {
        var cb = queryParameters.cb;

        sdkjs.makeNativeCall("GetDeviceID?cb=" + cb);
    }
 
    sdkjs.callGetCustomKeywords = function (queryParameters) {
        var cb = queryParameters.cb;

        sdkjs.makeNativeCall("GetCustomKeywords?cb=" + cb);
    }

    sdkjs.callSetMraidRefreshFrequency = function (queryParameters) {
        var ms = queryParameters.ms;

        sdkjs.makeNativeCall("SetMRAIDRefreshFrequency?ms=" + ms);
    }

    sdkjs.callMraid = function (queryParameters) {
        var key = "p0";
        var count = 0;
        var args = [];

        while ((typeof queryParameters[key]) !== "undefined") {
            args.push(JSON.parse(decodeURIComponent(queryParameters[key])));
            count++;
            key = "p" + count;
        }

        if ((typeof mraid) !== "undefined") {
            mraid[queryParameters.method].apply(mraid, args);
        }
    }

    sdkjs.client.result = function (params) {
        sdkjs.fireMessage(CALL_RESULT, params);
    }

    sdkjs.mraidEventHandler = function (eventName) {
        // mraid events have at most three parameters(exposureChange has 3) in the callback
        // pass undefined if not present; anjam should handle
        this.call = function (p0, p1, p2) {
            sdkjs.fireMessage(CALL_MRAID, "event=" + eventName + "&p0=" +
                p0 + "&p1=" + p1+ "&p2=" + p2);
        };
    }

    sdkjs.mraidReadyEventHandler = new sdkjs.mraidEventHandler("ready");
    sdkjs.mraidErrorEventHandler = new sdkjs.mraidEventHandler("error");
    sdkjs.mraidStateChangeEventHandler = new sdkjs.mraidEventHandler(
        "stateChange");
    sdkjs.mraidViewableChangeEventHandler = new sdkjs.mraidEventHandler(
        "viewableChange");
    sdkjs.mraidExposureChangeEventHandler = new sdkjs.mraidEventHandler(
        "exposureChange");
    sdkjs.mraidSizeChangeEventHandler = new sdkjs.mraidEventHandler(
        "sizeChange");
    sdkjs.mraidAudioVolumeChangeEventHandler = new sdkjs.mraidEventHandler(
          "audioVolumeChange");

    if ((typeof mraid) !== "undefined") {
        // add mraid event listeners to pass to anjam
        mraid.addEventListener("ready", sdkjs.mraidReadyEventHandler.call);
        mraid.addEventListener("error", sdkjs.mraidErrorEventHandler.call);
        mraid.addEventListener("stateChange", sdkjs.mraidStateChangeEventHandler
            .call);
        mraid.addEventListener("viewableChange",
            sdkjs.mraidViewableChangeEventHandler.call);
        mraid.addEventListener("exposureChange",
            sdkjs.mraidExposureChangeEventHandler.call);
        mraid.addEventListener("sizeChange", sdkjs.mraidSizeChangeEventHandler
            .call);
        mraid.addEventListener("audioVolumeChange",
            sdkjs.mraidAudioVolumeChangeEventHandler.call);
    }

    sdkjs.mraidUpdateProperty = function (propertyName, value) {
        sdkjs.fireMessage(CALL_MRAID, "method=updateProperty&propertyName=" +
            propertyName + "&value=" + encodeURIComponent(JSON.stringify(
                value)));
    }

    sdkjs.mraidUpdateSupports = function (feature, value) {
        sdkjs.fireMessage(CALL_MRAID, "method=updateSupports&feature=" +
            feature + "&value=" + value);
    }

}());
