(window.webpackJsonp=window.webpackJsonp||[]).push([[0],[,,,,,,,,,,function(t,e,r){t.exports=r(26)},,,,,function(t,e,r){},function(t,e,r){},,,,function(t,e,r){},function(t,e,r){},function(t,e,r){},function(t,e,r){},function(t,e,r){},function(t,e,r){},function(t,e,r){"use strict";r.r(e);var n=r(0),a=r.n(n),o=r(9),i=r.n(o),c=(r(15),r(1)),s=r(2),l=r(4),u=r(3),d=r(5);r(16),r(17),r(18),r(20),r(21);function p(t){var e="Character ";return t.correct?e+="correct":t.wrong&&(e+="wrong"),a.a.createElement("span",{className:e},t.char)}function m(t){for(var e=t.promptedWords,r=t.typedWords,n=t.currWord,o=[],i=!1,c=0;c!==e.length;++c){var s=e[c],l=r[c];if(l){var u=s===l,d=!0,m=!1,h=void 0;try{for(var f,g=s[Symbol.iterator]();!(d=(f=g.next()).done);d=!0){var v=f.value;o.push(a.a.createElement(p,{key:o.length,char:v,correct:u,wrong:!u}))}}catch(N){m=!0,h=N}finally{try{d||null==g.return||g.return()}finally{if(m)throw h}}o.push(a.a.createElement(p,{key:o.length,char:" "}))}else if(i){var y=!0,W=!1,E=void 0;try{for(var C,b=s[Symbol.iterator]();!(y=(C=b.next()).done);y=!0){var T=C.value;o.push(a.a.createElement(p,{key:o.length,char:T}))}}catch(N){W=!0,E=N}finally{try{y||null==b.return||b.return()}finally{if(W)throw E}}o.push(a.a.createElement(p,{key:o.length,char:" "}))}else{for(var w=0;w!==s.length;++w){var k=n[w]&&s[w]===n[w],x=n[w]&&s[w]!==n[w];o.push(a.a.createElement(p,{key:o.length,char:s[w],correct:k,wrong:x}))}o.push(a.a.createElement(p,{key:o.length,char:" "})),i=!0}}return a.a.createElement("div",{className:"PromptBox"},"Look at the following words:",a.a.createElement("div",{className:"Prompt"},o))}var h=r(6),f=r.n(h),g=(r(22),r(23),function(t){function e(t){var r;return Object(c.a)(this,e),(r=Object(l.a)(this,Object(u.a)(e).call(this,t))).state={updated:!1},r}return Object(d.a)(e,t),Object(s.a)(e,[{key:"componentDidUpdate",value:function(){this.state.updated||this.setState({updated:!0})}},{key:"render",value:function(){var t="TypedWord ";return this.state.updated&&this.props.incorrect?t+="both":this.props.incorrect?t+="incorrect":this.state.updated&&(t+="updated"),a.a.createElement("span",{className:t},this.props.word," ")}}]),e}(a.a.PureComponent)),v=function(t){function e(t){var r;return Object(c.a)(this,e),(r=Object(l.a)(this,Object(u.a)(e).call(this,t))).handleClick=function(){r.inputRef.current.focus()},r.inputRef=a.a.createRef(),r}return Object(d.a)(e,t),Object(s.a)(e,[{key:"componentDidMount",value:function(){this.inputRef.current.focus()}},{key:"render",value:function(){var t=this,e=this.props.words.map(function(e,r){return a.a.createElement(g,{key:r,word:e,incorrect:t.props.correctWords[r]!==e})});return a.a.createElement("div",{className:"Input"},"And type them below:",a.a.createElement("div",{className:"InputBox",onClick:this.handleClick},e,a.a.createElement(y,{ref:this.inputRef,active:this.props.active,onChange:this.props.onChange,onWordTyped:this.props.onWordTyped,popPrevWord:this.props.popPrevWord})))}}]),e}(n.Component),y=function(t){function e(t){var r;return Object(c.a)(this,e),(r=Object(l.a)(this,Object(u.a)(e).call(this,t))).handleKeyDown=function(t){if(8===t.keyCode&&""===t.target.innerText){t.target.innerText=r.props.popPrevWord()+" ";var e=document.createRange();e.selectNodeContents(t.target),e.collapse(!1);var n=window.getSelection();n.removeAllRanges(),n.addRange(e)}},r.handleInput=function(t){var e=t.target.innerText;if(/\s/.test(e)){for(var n=e.split(/\s/),a=0;a!==n.length-1;++a)r.props.onWordTyped(n[a]);t.target.innerText=n[n.length-1]}else r.props.onChange(e)},r.inputRef=a.a.createRef(),r}return Object(d.a)(e,t),Object(s.a)(e,[{key:"focus",value:function(){this.inputRef.current.focus()}},{key:"render",value:function(){return a.a.createElement("span",{className:"InputField",ref:this.inputRef,contentEditable:this.props.active,onInput:this.handleInput,onKeyDown:this.handleKeyDown})}}]),e}(n.Component);r(24);function W(t){return a.a.createElement("div",{className:"Indicators"},a.a.createElement(E,{text:"WPM: ".concat(t.wpm)}),a.a.createElement(E,{text:"Accuracy: ".concat(t.accuracy)}),a.a.createElement(E,{text:"Time: ".concat(t.remainingTime)}))}function E(t){return a.a.createElement("div",{className:"Indicator"},t.text)}r(25);function C(t){return a.a.createElement(a.a.Fragment,null,a.a.createElement(b,{id:"pigLatinCheckBox",text:"Enable Pig Latin",value:t.pigLatin,onChange:t.onPigLatinToggle}),a.a.createElement(b,{id:"autoCorrectCheckBox",text:"Enable Auto-Correct",value:t.autoCorrect,onChange:t.onAutoCorrectToggle}),a.a.createElement("br",null),a.a.createElement(T,{onClick:t.onRestart}))}function b(t){return a.a.createElement("div",{className:"Options custom-control custom-checkbox"},a.a.createElement("input",{type:"checkbox",className:"custom-control-input",id:t.id,checked:t.value,onChange:t.onChange}),a.a.createElement("label",{className:"custom-control-label",htmlFor:t.id},t.text))}function T(t){return a.a.createElement("div",{className:"Button"},a.a.createElement("button",{type:"button",className:"btn btn-primary",onClick:t.onClick},"Restart"))}var w=function(t){function e(t){var r;return Object(c.a)(this,e),(r=Object(l.a)(this,Object(u.a)(e).call(this,t))).initialize=function(){r.setState({typedWords:[],currWord:"",inputActive:!0,wpm:"None",accuracy:"None"}),f.a.post("/request_paragraph").done(function(t){r.state.pigLatin?f.a.post("/translate_to_pig_latin",{text:t},function(t){r.setState({promptedWords:t.split(" "),startTime:r.getCurrTime()})}):r.setState({promptedWords:t.split(" "),startTime:r.getCurrTime()})}),clearInterval(r.timer),r.timer=null},r.restart=function(){r.timer=setInterval(r.updateReadouts,100),r.setState({startTime:r.getCurrTime()})},r.updateReadouts=function(){var t=r.state.promptedWords.join(" "),e=r.state.typedWords.join(" ");f.a.post("/analyze",{promptedText:t,typedText:e,startTime:r.state.startTime,endTime:r.getCurrTime()}).done(function(t){t=JSON.parse(t),r.setState({wpm:t[0].toFixed(1),accuracy:t[1].toFixed(1)})})},r.popPrevWord=function(){if(0!==r.state.typedWords.length){var t=r.state.typedWords[r.state.typedWords.length-1];return r.setState(function(t){return{typedWords:t.typedWords.slice(0,t.typedWords.length-1)}}),t}return""},r.getCurrTime=function(){return(new Date).getTime()/1e3},r.handleWordTyped=function(t){t&&r.setState(function(e){var n=e.typedWords.length;return r.state.autoCorrect&&t!==r.state.promptedWords[t]&&f.a.post("/autocorrect",{word:t}).done(function(e){r.setState(function(r){if(r.typedWords[n]===t){var a=r.typedWords;return a[n]=e,{typedWords:a}}})}),{typedWords:e.typedWords.concat([t]),currWord:""}})},r.handleChange=function(t){r.setState({currWord:t}),r.state.typedWords.length+1===r.state.promptedWords.length&&r.state.promptedWords[r.state.promptedWords.length-1]===t?(clearInterval(r.timer),r.setState({inputActive:!1})):r.timer||r.restart()},r.handlePigLatinToggle=function(){r.initialize(),r.setState(function(t){return{autoCorrect:!1,pigLatin:!t.pigLatin}})},r.handleAutoCorrectToggle=function(){r.initialize(),r.setState(function(t){return{autoCorrect:!t.autoCorrect,pigLatin:!1}})},r.state={promptedWords:["Please wait - loading!"],typedWords:[],wpm:"None",accuracy:"None",startTime:0,pigLatin:!1,autoCorrect:!1,currWord:"",inputActive:!1},r.timer=null,r}return Object(d.a)(e,t),Object(s.a)(e,[{key:"componentDidMount",value:function(){this.initialize()}},{key:"componentWillUnmount",value:function(){this.timer&&clearInterval(this.timer)}},{key:"render",value:function(){var t=this.state.wpm,e=this.state.accuracy,r=(this.getCurrTime()-this.state.startTime).toFixed(1);return a.a.createElement("div",{className:"App container"},a.a.createElement("div",{className:"row"},a.a.createElement("div",{className:"col"},a.a.createElement("br",null),a.a.createElement("h1",{className:"display-3"},"61A Typing Test"),a.a.createElement("br",null),a.a.createElement(W,{wpm:t,accuracy:e,remainingTime:r}),a.a.createElement("br",null),a.a.createElement(m,{promptedWords:this.state.promptedWords,typedWords:this.state.typedWords,currWord:this.state.currWord}),a.a.createElement("br",null),a.a.createElement(v,{key:this.state.promptedWords[0],correctWords:this.state.promptedWords,words:this.state.typedWords,onWordTyped:this.handleWordTyped,onChange:this.handleChange,popPrevWord:this.popPrevWord,active:this.state.inputActive}),a.a.createElement("br",null),a.a.createElement(C,{pigLatin:this.state.pigLatin,onPigLatinToggle:this.handlePigLatinToggle,autoCorrect:this.state.autoCorrect,onAutoCorrectToggle:this.handleAutoCorrectToggle,onRestart:this.initialize}))))}}]),e}(n.Component);Boolean("localhost"===window.location.hostname||"[::1]"===window.location.hostname||window.location.hostname.match(/^127(?:\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/));i.a.render(a.a.createElement(w,null),document.getElementById("root")),"serviceWorker"in navigator&&navigator.serviceWorker.ready.then(function(t){t.unregister()})}],[[10,1,2]]]);
//# sourceMappingURL=main.cfa2a289.chunk.js.map