D, [2017-12-07T22:04:18.572993 #27789] DEBUG -- :   [1m[36mActiveRecord::SchemaMigration Load (0.1ms)[0m  [1mSELECT "schema_migrations".* FROM "schema_migrations"[0m
Run options: include {:focus=>true}

All examples were filtered out; ignoring {:focus=>true}

Helpers
  Helpers#current_user
    returns the current user
  Helpers#is_logged_in?
    returns true or false

ApplicationController
  GET '/'
    returns a 200 status code
    contains a form for a user to log in
  POST '/login'
    returns a 302 redirect status code
    sets session[:user_id] equal to id of the user
    displays the correct username based on session[:user_id]
    displays the correct balance based on session[:user_id]
    displays a 'Log Out' link
    shows the error page if username and ID do not match available users
  GET '/account'
    shows the error page if user goes directly to /account
    displays the account information if a user is logged in (FAILED - 1)
  GET '/logout'
    clears the session
    redirects to '/'

Failures:

  1) ApplicationController GET '/account' displays the account information if a user is logged in
     Failure/Error: expect(last_response.body).to include("<h1>Welcome skittles123</h1>")

       expected "<!DOCTYPE html>\n<html>\n<head>\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\n  <title>NoMethodError at &#x2F;account</title>\n\n  <script type=\"text/javascript\">\n  //<!--\n  function toggle(id) {\n    var pre  = document.getElementById(\"pre-\" + id);\n    var post = document.getElementById(\"post-\" + id);\n    var context = document.getElementById(\"context-\" + id);\n\n    if (pre.style.display == 'block') {\n      pre.style.display = 'none';\n      post.style.display = 'none';\n      context.style.background = \"none\";\n    } else {\n      pre.style.display = 'block';\n      post.style.display = 'block';\n      context.style.background = \"#fffed9\";\n    }\n  }\n\n  function toggleBacktrace(){\n    var bt = document.getElementById(\"backtrace\");\n    var toggler = document.getElementById(\"expando\");\n\n    if (bt.className == 'condensed') {\n      bt.className = 'expanded';\n      toggler.innerHTML = \"(condense)\";\n    } else {\n      bt.className = 'condensed';\n      toggler.innerHTML = \"(expand)\";\n    }\n  }\n  //-->\n  </script>\n\n<style type=\"text/css\" media=\"screen\">\n  *                   {margin: 0; padding: 0; border: 0; outline: 0;}\n  div.clear           {clear: both;}\n  body                {background: #EEEEEE; margin: 0; padding: 0;\n                       font-family: 'Lucida Grande', 'Lucida Sans Unicode',\n                       'Garuda';}\n  code                {font-family: 'Lucida Console', monospace;\n                       font-size: 12px;}\n  li                  {height: 18px;}\n  ul                  {list-style: none; margin: 0; padding: 0;}\n  ol:hover            {cursor: pointer;}\n  ol li               {white-space: pre;}\n  #explanation        {font-size: 12px; color: #666666;\n                       margin: 20px 0 0 100px;}\n/* WRAP */\n  #wrap               {width: 1000px; background: #FFFFFF; margin: 0 auto;\n                       padding: 30px 50px 20px 50px;\n                       border-left: 1px solid #DDDDDD;\n                       border-right: 1px solid #DDDDDD;}\n/* HEADER */\n  #header             {margin: 0 auto 25px auto;}\n  #header img         {float: left;}\n  #header #summary    {float: left; margin: 12px 0 0 20px; width:660px;\n                       font-family: 'Lucida Grande', 'Lucida Sans Unicode';}\n  h1                  {margin: 0; font-size: 36px; color: #981919;}\n  h2                  {margin: 0; font-size: 22px; color: #333333;}\n  #header ul          {margin: 0; font-size: 12px; color: #666666;}\n  #header ul li strong{color: #444444;}\n  #header ul li       {display: inline; padding: 0 10px;}\n  #header ul li.first {padding-left: 0;}\n  #header ul li.last  {border: 0; padding-right: 0;}\n/* BODY */\n  #backtrace,\n  #get,\n  #post,\n  #cookies,\n  #rack               {width: 980px; margin: 0 auto 10px auto;}\n  p#nav               {float: right; font-size: 14px;}\n/* BACKTRACE */\n  a#expando           {float: left; padding-left: 5px; color: #666666;\n                      font-size: 14px; text-decoration: none; cursor: pointer;}\n  a#expando:hover     {text-decoration: underline;}\n  h3                  {float: left; width: 100px; margin-bottom: 10px;\n                       color: #981919; font-size: 14px; font-weight: bold;}\n  #nav a              {color: #666666; text-decoration: none; padding: 0 5px;}\n  #backtrace li.frame-info {background: #f7f7f7; padding-left: 10px;\n                           font-size: 12px; color: #333333;}\n  #backtrace ul       {list-style-position: outside; border: 1px solid #E9E9E9;\n                       border-bottom: 0;}\n  #backtrace ol       {width: 920px; margin-left: 50px;\n                       font: 10px 'Lucida Console', monospace; color: #666666;}\n  #backtrace ol li    {border: 0; border-left: 1px solid #E9E9E9;\n                       padding: 2px 0;}\n  #backtrace ol code  {font-size: 10px; color: #555555; padding-left: 5px;}\n  #backtrace-ul li    {border-bottom: 1px solid #E9E9E9; height: auto;\n                       padding: 3px 0;}\n  #backtrace-ul .code {padding: 6px 0 4px 0;}\n  #backtrace.condensed .system,\n  #backtrace.condensed .framework {display:none;}\n/* REQUEST DATA */\n  p.no-data           {padding-top: 2px; font-size: 12px; color: #666666;}\n  table.req           {width: 980px; text-align: left; font-size: 12px;\n                       color: #666666; padding: 0; border-spacing: 0;\n                       border: 1px solid #EEEEEE; border-bottom: 0;\n                       border-left: 0;\n                       clear:both}\n  table.req tr th     {padding: 2px 10px; font-weight: bold;\n                       background: #F7F7F7; border-bottom: 1px solid #EEEEEE;\n                       border-left: 1px solid #EEEEEE;}\n  table.req tr td     {padding: 2px 20px 2px 10px;\n                       border-bottom: 1px solid #EEEEEE;\n                       border-left: 1px solid #EEEEEE;}\n/* HIDE PRE/POST CODE AT START */\n  .pre-context,\n  .post-context       {display: none;}\n\n  table td.code       {width:750px}\n  table td.code div   {width:750px;overflow:hidden}\n</style>\n</head>\n<body>\n  <div id=\"wrap\">\n    <div id=\"header\">\n      <img src=\"/__sinatra__/500.png\" alt=\"application error\" height=\"161\" width=\"313\" />\n      <div id=\"summary\">\n        <h1><strong>NoMethodError</strong> at <strong>&#x2F;account\n          </strong></h1>\n        <h2>undefined method `name&#x27; for #&lt;User:0x00000006cea238&gt;</h2>\n        <ul>\n          <li class=\"first\"><strong>file:</strong> <code>\n            attribute_methods.rb</code></li>\n          <li><strong>location:</strong> <code>method_missing\n            </code></li>\n          <li class=\"last\"><strong>line:\n            </strong> 433</li>\n        </ul>\n      </div>\n      <div class=\"clear\"></div>\n    </div>\n\n    <div id=\"backtrace\" class='condensed'>\n      <h3>BACKTRACE</h3>\n      <p><a href=\"#\" id=\"expando\"\n            onclick=\"toggleBacktrace(); return false\">(expand)</a></p>\n      <p id=\"nav\"><strong>JUMP TO:</strong>\n         <a href=\"#get-info\">GET</a>\n         <a href=\"#post-info\">POST</a>\n         <a href=\"#cookie-info\">COOKIES</a>\n         <a href=\"#env-info\">ENV</a>\n      </p>\n      <div class=\"clear\"></div>\n\n      <ul id=\"backtrace-ul\">\n\n      \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;activemodel-4.2.5&#x2F;lib&#x2F;active_model&#x2F;attribute_methods.rb</code> in\n                <code><strong>method_missing</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"426\"\n                  class=\"pre-context\" id=\"pre-1\"\n                  onclick=\"toggle(1);\">\n                \n                <li class=\"pre-context-line\"><code>    # class belonging to the +clients+ table with a +master_id+ foreign key\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # can instantiate master through &lt;tt&gt;Client#master&lt;&#x2F;tt&gt;.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def method_missing(method, *args, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if respond_to_without_attributes?(method, true)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        super\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      else\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        match = match_attribute_method?(method.to_s)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"433\" class=\"context\" id=\"1\"\n                  onclick=\"toggle(1);\">\n                <li class=\"context-line\" id=\"context-1\"><code>        match ? attribute_missing(match, *args, &amp;block) : super</code></li>\n              </ol>\n\n              \n              <ol start=\"434\" class=\"post-context\"\n                  id=\"post-1\" onclick=\"toggle(1);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # +attribute_missing+ is like +method_missing+, but for attributes. When\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # +method_missing+ is called we check to see if there is a matching\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # attribute method. If so, we tell +attribute_missing+ to dispatch the\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # attribute. This method can be overloaded to customize the behavior.\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info app\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;account.erb</code> in\n                <code><strong>block in singleton class</strong></code>\n            </li>\n\n            <li class=\"code app\">\n              \n              <ol start=\"2\"\n                  class=\"pre-context\" id=\"pre-2\"\n                  onclick=\"toggle(2);\">\n                \n                <li class=\"pre-context-line\"><code>&lt;html&gt;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  &lt;head&gt;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    &lt;meta charset=&quot;UTF-8&quot;&gt;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    &lt;title&gt;title&lt;&#x2F;title&gt;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    &lt;link rel=&quot;stylesheet&quot; href=&quot;stylesheets&#x2F;bootstrap.css&quot; type=&quot;text&#x2F;css&quot;&gt;  \n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  &lt;&#x2F;head&gt;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  &lt;body id=&quot;page-top&quot;&gt;\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"9\" class=\"context\" id=\"2\"\n                  onclick=\"toggle(2);\">\n                <li class=\"context-line\" id=\"context-2\"><code>    &lt;h1&gt;Welcome &lt;%=@user.name%&gt;&lt;&#x2F;h1&gt;</code></li>\n              </ol>\n\n              \n              <ol start=\"10\" class=\"post-context\"\n                  id=\"post-2\" onclick=\"toggle(2);\">\n                \n                <li class=\"post-context-line\"><code>    &lt;h3&gt;Your Balance: &lt;%=@user.balance%&gt;&lt;&#x2F;h3&gt;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  &lt;&#x2F;body&gt;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>&lt;&#x2F;html&gt;</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"148\"\n                  class=\"pre-context\" id=\"pre-3\"\n                  onclick=\"toggle(3);\">\n                \n                <li class=\"pre-context-line\"><code>    # evaluation is guaranteed to be performed in the scope object with the\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # locals specified and with support for yielding to the block.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # This method is only used by source generating templates. Subclasses that\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # override render() may not support all features.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def evaluate(scope, locals, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      method = compiled_method(locals.keys)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"155\" class=\"context\" id=\"3\"\n                  onclick=\"toggle(3);\">\n                <li class=\"context-line\" id=\"context-3\"><code>      method.bind(scope).call(locals, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"156\" class=\"post-context\"\n                  id=\"post-3\" onclick=\"toggle(3);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # Generates all template source by combining the preamble, template, and\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # postamble and returns a two-tuple of the form: [source, offset], where\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # source is the string containing (Ruby) source code for the template and\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # offset is the integer line offset where line reporting should begin.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    #\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in\n                <code><strong>evaluate</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"148\"\n                  class=\"pre-context\" id=\"pre-4\"\n                  onclick=\"toggle(4);\">\n                \n                <li class=\"pre-context-line\"><code>    # evaluation is guaranteed to be performed in the scope object with the\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # locals specified and with support for yielding to the block.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # This method is only used by source generating templates. Subclasses that\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # override render() may not support all features.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def evaluate(scope, locals, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      method = compiled_method(locals.keys)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"155\" class=\"context\" id=\"4\"\n                  onclick=\"toggle(4);\">\n                <li class=\"context-line\" id=\"context-4\"><code>      method.bind(scope).call(locals, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"156\" class=\"post-context\"\n                  id=\"post-4\" onclick=\"toggle(4);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # Generates all template source by combining the preamble, template, and\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # postamble and returns a two-tuple of the form: [source, offset], where\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # source is the string containing (Ruby) source code for the template and\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # offset is the integer line offset where line reporting should begin.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    #\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in\n                <code><strong>render</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"89\"\n                  class=\"pre-context\" id=\"pre-5\"\n                  onclick=\"toggle(5);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Render the template in the given scope with the locals specified. If a\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # block is given, it is typically available within the template via\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # +yield+.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def render(scope=Object.new, locals={}, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      current_template = Thread.current[:tilt_current_template]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Thread.current[:tilt_current_template] = self\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"96\" class=\"context\" id=\"5\"\n                  onclick=\"toggle(5);\">\n                <li class=\"context-line\" id=\"context-5\"><code>      evaluate(scope, locals || {}, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"97\" class=\"post-context\"\n                  id=\"post-5\" onclick=\"toggle(5);\">\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      Thread.current[:tilt_current_template] = current_template\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # The basename of the template file.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def basename(suffix=&#x27;&#x27;)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      File.basename(file, suffix) if file\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>render</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"815\"\n                  class=\"pre-context\" id=\"pre-6\"\n                  onclick=\"toggle(6);\">\n                \n                <li class=\"pre-context-line\"><code>      options[:default_encoding] ||= settings.default_encoding\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # compile and render template\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        layout_was      = @default_layout\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        @default_layout = false\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        template        = compile_template(engine, data, options, views)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"822\" class=\"context\" id=\"6\"\n                  onclick=\"toggle(6);\">\n                <li class=\"context-line\" id=\"context-6\"><code>        output          = template.render(scope, locals, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"823\" class=\"post-context\"\n                  id=\"post-6\" onclick=\"toggle(6);\">\n                \n                <li class=\"post-context-line\"><code>      ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        @default_layout = layout_was\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # render layout\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if layout\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        options = options.merge(:views =&gt; views, :layout =&gt; false, :eat_errors =&gt; eat_errors, :scope =&gt; scope).\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>erb</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"659\"\n                  class=\"pre-context\" id=\"pre-7\"\n                  onclick=\"toggle(7);\">\n                \n                <li class=\"pre-context-line\"><code>    def initialize\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      super\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @default_layout = :layout\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @preferred_extension = nil\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def erb(template, options = {}, locals = {}, &amp;block)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"666\" class=\"context\" id=\"7\"\n                  onclick=\"toggle(7);\">\n                <li class=\"context-line\" id=\"context-7\"><code>      render(:erb, template, options, locals, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"667\" class=\"post-context\"\n                  id=\"post-7\" onclick=\"toggle(7);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def erubis(template, options = {}, locals = {})\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      warn &quot;Sinatra::Templates#erubis is deprecated and will be removed, use #erb instead.\\n&quot; \\\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        &quot;If you have Erubis installed, it will be used automatically.&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      render :erubis, template, options, locals\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info app\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;application_controller.rb</code> in\n                <code><strong>block in &lt;class:ApplicationController&gt;</strong></code>\n            </li>\n\n            <li class=\"code app\">\n              \n              <ol start=\"20\"\n                  class=\"pre-context\" id=\"pre-8\"\n                  onclick=\"toggle(8);\">\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  get &#x27;&#x2F;account&#x27; do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # binding.pry\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    if Helpers.is_logged_in?(session)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @user = Helpers.current_user(session)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"27\" class=\"context\" id=\"8\"\n                  onclick=\"toggle(8);\">\n                <li class=\"context-line\" id=\"context-8\"><code>      erb :&#x27;account&#x27;</code></li>\n              </ol>\n\n              \n              <ol start=\"28\" class=\"post-context\"\n                  id=\"post-8\" onclick=\"toggle(8);\">\n                \n                <li class=\"post-context-line\"><code>    else \n</code></li>\n                \n                <li class=\"post-context-line\"><code>      erb :error\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  get &#x27;&#x2F;logout&#x27; do\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    session.clear\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1603\"\n                  class=\"pre-context\" id=\"pre-9\"\n                  onclick=\"toggle(9);\">\n                \n                <li class=\"pre-context-line\"><code>        method_name             = &quot;\#{verb} \#{path}&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unbound_method          = generate_method(method_name, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        pattern, keys           = compile path\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        conditions, @conditions = @conditions, []\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        wrapper                 = block.arity != 0 ?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          proc { |a,p| unbound_method.bind(a).call(*p) } :\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1610\" class=\"context\" id=\"9\"\n                  onclick=\"toggle(9);\">\n                <li class=\"context-line\" id=\"context-9\"><code>          proc { |a,p| unbound_method.bind(a).call }</code></li>\n              </ol>\n\n              \n              <ol start=\"1611\" class=\"post-context\"\n                  id=\"post-9\" onclick=\"toggle(9);\">\n                \n                <li class=\"post-context-line\"><code>        wrapper.instance_variable_set(:@route_name, method_name)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        [ pattern, keys, conditions, wrapper ]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def compile(path)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if path.respond_to? :to_str\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in compile!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1603\"\n                  class=\"pre-context\" id=\"pre-10\"\n                  onclick=\"toggle(10);\">\n                \n                <li class=\"pre-context-line\"><code>        method_name             = &quot;\#{verb} \#{path}&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unbound_method          = generate_method(method_name, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        pattern, keys           = compile path\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        conditions, @conditions = @conditions, []\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        wrapper                 = block.arity != 0 ?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          proc { |a,p| unbound_method.bind(a).call(*p) } :\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1610\" class=\"context\" id=\"10\"\n                  onclick=\"toggle(10);\">\n                <li class=\"context-line\" id=\"context-10\"><code>          proc { |a,p| unbound_method.bind(a).call }</code></li>\n              </ol>\n\n              \n              <ol start=\"1611\" class=\"post-context\"\n                  id=\"post-10\" onclick=\"toggle(10);\">\n                \n                <li class=\"post-context-line\"><code>        wrapper.instance_variable_set(:@route_name, method_name)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        [ pattern, keys, conditions, wrapper ]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def compile(path)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if path.respond_to? :to_str\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block (3 levels) in route!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"967\"\n                  class=\"pre-context\" id=\"pre-11\"\n                  onclick=\"toggle(11);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run routes defined on the class and all superclasses.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route!(base = settings, pass_block = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if routes = base.routes[@request.request_method]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        routes.each do |pattern, keys, conditions, block|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"974\" class=\"context\" id=\"11\"\n                  onclick=\"toggle(11);\">\n                <li class=\"context-line\" id=\"context-11\"><code>            route_eval { block[*args] }</code></li>\n              </ol>\n\n              \n              <ol start=\"975\" class=\"post-context\"\n                  id=\"post-11\" onclick=\"toggle(11);\">\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # don&#x27;t wipe out pass_block in superclass\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          pass_block = returned_pass_block if returned_pass_block\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>route_eval</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"986\"\n                  class=\"pre-context\" id=\"pre-12\"\n                  onclick=\"toggle(12);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      route_eval(&amp;pass_block) if pass_block\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      route_missing\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run a route block and throw :halt with the result.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route_eval\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"993\" class=\"context\" id=\"12\"\n                  onclick=\"toggle(12);\">\n                <li class=\"context-line\" id=\"context-12\"><code>      throw :halt, yield</code></li>\n              </ol>\n\n              \n              <ol start=\"994\" class=\"post-context\"\n                  id=\"post-12\" onclick=\"toggle(12);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # If the current request matches pattern and conditions, fill params\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # with keys and call the given block.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # Revert params afterwards.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # Returns pass block.\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block (2 levels) in route!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"967\"\n                  class=\"pre-context\" id=\"pre-13\"\n                  onclick=\"toggle(13);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run routes defined on the class and all superclasses.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route!(base = settings, pass_block = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if routes = base.routes[@request.request_method]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        routes.each do |pattern, keys, conditions, block|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"974\" class=\"context\" id=\"13\"\n                  onclick=\"toggle(13);\">\n                <li class=\"context-line\" id=\"context-13\"><code>            route_eval { block[*args] }</code></li>\n              </ol>\n\n              \n              <ol start=\"975\" class=\"post-context\"\n                  id=\"post-13\" onclick=\"toggle(13);\">\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # don&#x27;t wipe out pass_block in superclass\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          pass_block = returned_pass_block if returned_pass_block\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in process_route</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1007\"\n                  class=\"pre-context\" id=\"pre-14\"\n                  onclick=\"toggle(14);\">\n                \n                <li class=\"pre-context-line\"><code>      if values.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      catch(:pass) do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1014\" class=\"context\" id=\"14\"\n                  onclick=\"toggle(14);\">\n                <li class=\"context-line\" id=\"context-14\"><code>        block ? block[self, values] : yield(self, values)</code></li>\n              </ol>\n\n              \n              <ol start=\"1015\" class=\"post-context\"\n                  id=\"post-14\" onclick=\"toggle(14);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @params = original if original\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # No matching route was found or all routes passed. The default\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # implementation is to forward the request downstream when running\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>catch</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1005\"\n                  class=\"pre-context\" id=\"pre-15\"\n                  onclick=\"toggle(15);\">\n                \n                <li class=\"pre-context-line\"><code>      values += match.captures.map! { |v| force_encoding URI_INSTANCE.unescape(v) if v }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if values.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1012\" class=\"context\" id=\"15\"\n                  onclick=\"toggle(15);\">\n                <li class=\"context-line\" id=\"context-15\"><code>      catch(:pass) do</code></li>\n              </ol>\n\n              \n              <ol start=\"1013\" class=\"post-context\"\n                  id=\"post-15\" onclick=\"toggle(15);\">\n                \n                <li class=\"post-context-line\"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        block ? block[self, values] : yield(self, values)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @params = original if original\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>process_route</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1005\"\n                  class=\"pre-context\" id=\"pre-16\"\n                  onclick=\"toggle(16);\">\n                \n                <li class=\"pre-context-line\"><code>      values += match.captures.map! { |v| force_encoding URI_INSTANCE.unescape(v) if v }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if values.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1012\" class=\"context\" id=\"16\"\n                  onclick=\"toggle(16);\">\n                <li class=\"context-line\" id=\"context-16\"><code>      catch(:pass) do</code></li>\n              </ol>\n\n              \n              <ol start=\"1013\" class=\"post-context\"\n                  id=\"post-16\" onclick=\"toggle(16);\">\n                \n                <li class=\"post-context-line\"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        block ? block[self, values] : yield(self, values)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @params = original if original\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in route!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"965\"\n                  class=\"pre-context\" id=\"pre-17\"\n                  onclick=\"toggle(17);\">\n                \n                <li class=\"pre-context-line\"><code>      base.filters[type].each { |args| process_route(*args) }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run routes defined on the class and all superclasses.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route!(base = settings, pass_block = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if routes = base.routes[@request.request_method]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        routes.each do |pattern, keys, conditions, block|\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"972\" class=\"context\" id=\"17\"\n                  onclick=\"toggle(17);\">\n                <li class=\"context-line\" id=\"context-17\"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|</code></li>\n              </ol>\n\n              \n              <ol start=\"973\" class=\"post-context\"\n                  id=\"post-17\" onclick=\"toggle(17);\">\n                \n                <li class=\"post-context-line\"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            route_eval { block[*args] }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # don&#x27;t wipe out pass_block in superclass\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          pass_block = returned_pass_block if returned_pass_block\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>each</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"964\"\n                  class=\"pre-context\" id=\"pre-18\"\n                  onclick=\"toggle(18);\">\n                \n                <li class=\"pre-context-line\"><code>      filter! type, base.superclass if base.superclass.respond_to?(:filters)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      base.filters[type].each { |args| process_route(*args) }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run routes defined on the class and all superclasses.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route!(base = settings, pass_block = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if routes = base.routes[@request.request_method]\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"971\" class=\"context\" id=\"18\"\n                  onclick=\"toggle(18);\">\n                <li class=\"context-line\" id=\"context-18\"><code>        routes.each do |pattern, keys, conditions, block|</code></li>\n              </ol>\n\n              \n              <ol start=\"972\" class=\"post-context\"\n                  id=\"post-18\" onclick=\"toggle(18);\">\n                \n                <li class=\"post-context-line\"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            route_eval { block[*args] }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # don&#x27;t wipe out pass_block in superclass\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          pass_block = returned_pass_block if returned_pass_block\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>route!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"964\"\n                  class=\"pre-context\" id=\"pre-19\"\n                  onclick=\"toggle(19);\">\n                \n                <li class=\"pre-context-line\"><code>      filter! type, base.superclass if base.superclass.respond_to?(:filters)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      base.filters[type].each { |args| process_route(*args) }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run routes defined on the class and all superclasses.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def route!(base = settings, pass_block = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      if routes = base.routes[@request.request_method]\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"971\" class=\"context\" id=\"19\"\n                  onclick=\"toggle(19);\">\n                <li class=\"context-line\" id=\"context-19\"><code>        routes.each do |pattern, keys, conditions, block|</code></li>\n              </ol>\n\n              \n              <ol start=\"972\" class=\"post-context\"\n                  id=\"post-19\" onclick=\"toggle(19);\">\n                \n                <li class=\"post-context-line\"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            route_eval { block[*args] }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # don&#x27;t wipe out pass_block in superclass\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          pass_block = returned_pass_block if returned_pass_block\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in dispatch!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1077\"\n                  class=\"pre-context\" id=\"pre-20\"\n                  onclick=\"toggle(20);\">\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Dispatch a request with error handling.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def dispatch!\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      invoke do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        static! if settings.static? &amp;&amp; (request.get? || request.head?)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        filter! :before\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1084\" class=\"context\" id=\"20\"\n                  onclick=\"toggle(20);\">\n                <li class=\"context-line\" id=\"context-20\"><code>        route!</code></li>\n              </ol>\n\n              \n              <ol start=\"1085\" class=\"post-context\"\n                  id=\"post-20\" onclick=\"toggle(20);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    rescue ::Exception =&gt; boom\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      invoke { handle_exception!(boom) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      begin\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        filter! :after unless env[&#x27;sinatra.static_file&#x27;]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      rescue ::Exception =&gt; boom\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in invoke</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-21\"\n                  onclick=\"toggle(21);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"21\"\n                  onclick=\"toggle(21);\">\n                <li class=\"context-line\" id=\"context-21\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-21\" onclick=\"toggle(21);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>catch</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-22\"\n                  onclick=\"toggle(22);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"22\"\n                  onclick=\"toggle(22);\">\n                <li class=\"context-line\" id=\"context-22\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-22\" onclick=\"toggle(22);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>invoke</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-23\"\n                  onclick=\"toggle(23);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"23\"\n                  onclick=\"toggle(23);\">\n                <li class=\"context-line\" id=\"context-23\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-23\" onclick=\"toggle(23);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>dispatch!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1074\"\n                  class=\"pre-context\" id=\"pre-24\"\n                  onclick=\"toggle(24);\">\n                \n                <li class=\"pre-context-line\"><code>        body res\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      nil # avoid double setting the same response tuple twice\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Dispatch a request with error handling.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def dispatch!\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1081\" class=\"context\" id=\"24\"\n                  onclick=\"toggle(24);\">\n                <li class=\"context-line\" id=\"context-24\"><code>      invoke do</code></li>\n              </ol>\n\n              \n              <ol start=\"1082\" class=\"post-context\"\n                  id=\"post-24\" onclick=\"toggle(24);\">\n                \n                <li class=\"post-context-line\"><code>        static! if settings.static? &amp;&amp; (request.get? || request.head?)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        filter! :before\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        route!\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    rescue ::Exception =&gt; boom\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      invoke { handle_exception!(boom) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    ensure\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in call!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"899\"\n                  class=\"pre-context\" id=\"pre-25\"\n                  onclick=\"toggle(25);\">\n                \n                <li class=\"pre-context-line\"><code>      @request  = Request.new(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @response = Response.new\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @params   = indifferent_params(@request.params)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      template_cache.clear if settings.reload_templates\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      force_encoding(@params)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @response[&#x27;Content-Type&#x27;] = nil\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"906\" class=\"context\" id=\"25\"\n                  onclick=\"toggle(25);\">\n                <li class=\"context-line\" id=\"context-25\"><code>      invoke { dispatch! }</code></li>\n              </ol>\n\n              \n              <ol start=\"907\" class=\"post-context\"\n                  id=\"post-25\" onclick=\"toggle(25);\">\n                \n                <li class=\"post-context-line\"><code>      invoke { error_block!(response.status) } unless @env[&#x27;sinatra.error&#x27;]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      unless @response[&#x27;Content-Type&#x27;]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if Array === body and body[0].respond_to? :content_type\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          content_type body[0].content_type\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        else\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          content_type :html\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in invoke</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-26\"\n                  onclick=\"toggle(26);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"26\"\n                  onclick=\"toggle(26);\">\n                <li class=\"context-line\" id=\"context-26\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-26\" onclick=\"toggle(26);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>catch</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-27\"\n                  onclick=\"toggle(27);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"27\"\n                  onclick=\"toggle(27);\">\n                <li class=\"context-line\" id=\"context-27\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-27\" onclick=\"toggle(27);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>invoke</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1059\"\n                  class=\"pre-context\" id=\"pre-28\"\n                  onclick=\"toggle(28);\">\n                \n                <li class=\"pre-context-line\"><code>    # Creates a Hash with indifferent access.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def indifferent_hash\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def invoke\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1066\" class=\"context\" id=\"28\"\n                  onclick=\"toggle(28);\">\n                <li class=\"context-line\" id=\"context-28\"><code>      res = catch(:halt) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"1067\" class=\"post-context\"\n                  id=\"post-28\" onclick=\"toggle(28);\">\n                \n                <li class=\"post-context-line\"><code>      res = [res] if Fixnum === res or String === res\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if Array === res and Fixnum === res.first\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        res = res.dup\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status(res.shift)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        body(res.pop)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers(*res)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      elsif res.respond_to? :each\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call!</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"899\"\n                  class=\"pre-context\" id=\"pre-29\"\n                  onclick=\"toggle(29);\">\n                \n                <li class=\"pre-context-line\"><code>      @request  = Request.new(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @response = Response.new\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @params   = indifferent_params(@request.params)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      template_cache.clear if settings.reload_templates\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      force_encoding(@params)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @response[&#x27;Content-Type&#x27;] = nil\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"906\" class=\"context\" id=\"29\"\n                  onclick=\"toggle(29);\">\n                <li class=\"context-line\" id=\"context-29\"><code>      invoke { dispatch! }</code></li>\n              </ol>\n\n              \n              <ol start=\"907\" class=\"post-context\"\n                  id=\"post-29\" onclick=\"toggle(29);\">\n                \n                <li class=\"post-context-line\"><code>      invoke { error_block!(response.status) } unless @env[&#x27;sinatra.error&#x27;]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      unless @response[&#x27;Content-Type&#x27;]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if Array === body and body[0].respond_to? :content_type\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          content_type body[0].content_type\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        else\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          content_type :html\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"887\"\n                  class=\"pre-context\" id=\"pre-30\"\n                  onclick=\"toggle(30);\">\n                \n                <li class=\"pre-context-line\"><code>      @app = app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @template_cache = Tilt::Cache.new\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      yield self if block_given?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Rack call interface.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"894\" class=\"context\" id=\"30\"\n                  onclick=\"toggle(30);\">\n                <li class=\"context-line\" id=\"context-30\"><code>      dup.call!(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"895\" class=\"post-context\"\n                  id=\"post-30\" onclick=\"toggle(30);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def call!(env) # :nodoc:\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @env      = env\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @request  = Request.new(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @response = Response.new\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @params   = indifferent_params(@request.params)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;xss_header.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"11\"\n                  class=\"pre-context\" id=\"pre-31\"\n                  onclick=\"toggle(31);\">\n                \n                <li class=\"pre-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Options:\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # xss_mode:: How the browser should prevent the attack (default: :block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    class XSSHeader &lt; Base\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      default_options :xss_mode =&gt; :block, :nosniff =&gt; true\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"18\" class=\"context\" id=\"31\"\n                  onclick=\"toggle(31);\">\n                <li class=\"context-line\" id=\"context-31\"><code>        status, headers, body = @app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"19\" class=\"post-context\"\n                  id=\"post-31\" onclick=\"toggle(31);\">\n                \n                <li class=\"post-context-line\"><code>        headers[&#x27;X-XSS-Protection&#x27;]       ||= &quot;1; mode=\#{options[:xss_mode]}&quot; if html? headers\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        headers[&#x27;X-Content-Type-Options&#x27;] ||= &#x27;nosniff&#x27;                       if options[:nosniff]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        [status, headers, body]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"42\"\n                  class=\"pre-context\" id=\"pre-32\"\n                  onclick=\"toggle(32);\">\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unless accepts? env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          instrument env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result = react env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"49\" class=\"context\" id=\"32\"\n                  onclick=\"toggle(32);\">\n                <li class=\"context-line\" id=\"context-32\"><code>        result or app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"50\" class=\"post-context\"\n                  id=\"post-32\" onclick=\"toggle(32);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def react(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result = send(options[:reaction], env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result if Array === result and result.size == 3\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"42\"\n                  class=\"pre-context\" id=\"pre-33\"\n                  onclick=\"toggle(33);\">\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unless accepts? env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          instrument env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result = react env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"49\" class=\"context\" id=\"33\"\n                  onclick=\"toggle(33);\">\n                <li class=\"context-line\" id=\"context-33\"><code>        result or app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"50\" class=\"post-context\"\n                  id=\"post-33\" onclick=\"toggle(33);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def react(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result = send(options[:reaction], env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result if Array === result and result.size == 3\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;path_traversal.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"9\"\n                  class=\"pre-context\" id=\"pre-34\"\n                  onclick=\"toggle(34);\">\n                \n                <li class=\"pre-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Unescapes &#x27;&#x2F;&#x27; and &#x27;.&#x27;, expands +path_info+.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # Thus &lt;tt&gt;GET &#x2F;foo&#x2F;%2e%2e%2fbar&lt;&#x2F;tt&gt; becomes &lt;tt&gt;GET &#x2F;bar&lt;&#x2F;tt&gt;.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    class PathTraversal &lt; Base\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        path_was         = env[&quot;PATH_INFO&quot;]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        env[&quot;PATH_INFO&quot;] = cleanup path_was if path_was &amp;&amp; !path_was.empty?\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"16\" class=\"context\" id=\"34\"\n                  onclick=\"toggle(34);\">\n                <li class=\"context-line\" id=\"context-34\"><code>        app.call env</code></li>\n              </ol>\n\n              \n              <ol start=\"17\" class=\"post-context\"\n                  id=\"post-34\" onclick=\"toggle(34);\">\n                \n                <li class=\"post-context-line\"><code>      ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        env[&quot;PATH_INFO&quot;] = path_was\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def cleanup(path)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if path.respond_to?(:encoding)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          # Ruby 1.9+ M17N\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;json_csrf.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"11\"\n                  class=\"pre-context\" id=\"pre-35\"\n                  onclick=\"toggle(35);\">\n                \n                <li class=\"pre-context-line\"><code>    # Array prototype has been patched to track data. Checks the referrer\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    # even on GET requests if the content type is JSON.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    class JsonCsrf &lt; Base\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      alias react deny\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        request               = Request.new(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"18\" class=\"context\" id=\"35\"\n                  onclick=\"toggle(35);\">\n                <li class=\"context-line\" id=\"context-35\"><code>        status, headers, body = app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"19\" class=\"post-context\"\n                  id=\"post-35\" onclick=\"toggle(35);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if has_vector? request, headers\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          warn env, &quot;attack prevented by \#{self.class}&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          react(env) or [status, headers, body]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        else\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          [status, headers, body]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"42\"\n                  class=\"pre-context\" id=\"pre-36\"\n                  onclick=\"toggle(36);\">\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unless accepts? env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          instrument env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result = react env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"49\" class=\"context\" id=\"36\"\n                  onclick=\"toggle(36);\">\n                <li class=\"context-line\" id=\"context-36\"><code>        result or app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"50\" class=\"post-context\"\n                  id=\"post-36\" onclick=\"toggle(36);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def react(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result = send(options[:reaction], env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result if Array === result and result.size == 3\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"42\"\n                  class=\"pre-context\" id=\"pre-37\"\n                  onclick=\"toggle(37);\">\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        unless accepts? env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          instrument env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result = react env\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"49\" class=\"context\" id=\"37\"\n                  onclick=\"toggle(37);\">\n                <li class=\"context-line\" id=\"context-37\"><code>        result or app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"50\" class=\"post-context\"\n                  id=\"post-37\" onclick=\"toggle(37);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def react(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result = send(options[:reaction], env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        result if Array === result and result.size == 3\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;frame_options.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"24\"\n                  class=\"pre-context\" id=\"pre-38\"\n                  onclick=\"toggle(38);\">\n                \n                <li class=\"pre-context-line\"><code>          frame_options = options[:frame_options]\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          frame_options = options[:frame_options].to_s.upcase unless frame_options.respond_to? :to_str\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          frame_options.to_str\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"31\" class=\"context\" id=\"38\"\n                  onclick=\"toggle(38);\">\n                <li class=\"context-line\" id=\"context-38\"><code>        status, headers, body        = @app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"32\" class=\"post-context\"\n                  id=\"post-38\" onclick=\"toggle(38);\">\n                \n                <li class=\"post-context-line\"><code>        headers[&#x27;X-Frame-Options&#x27;] ||= frame_options if html? headers\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        [status, headers, body]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;session&#x2F;abstract&#x2F;id.rb</code> in\n                <code><strong>context</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"218\"\n                  class=\"pre-context\" id=\"pre-39\"\n                  onclick=\"toggle(39);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          context(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        def context(env, app=@app)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          prepare_session(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"225\" class=\"context\" id=\"39\"\n                  onclick=\"toggle(39);\">\n                <li class=\"context-line\" id=\"context-39\"><code>          status, headers, body = app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"226\" class=\"post-context\"\n                  id=\"post-39\" onclick=\"toggle(39);\">\n                \n                <li class=\"post-context-line\"><code>          commit_session(env, status, headers, body)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        def initialize_sid\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          @sidbits = @default_options[:sidbits]\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;session&#x2F;abstract&#x2F;id.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"213\"\n                  class=\"pre-context\" id=\"pre-40\"\n                  onclick=\"toggle(40);\">\n                \n                <li class=\"pre-context-line\"><code>          @default_options = self.class::DEFAULT_OPTIONS.merge(options)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @key = @default_options.delete(:key)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @cookie_only = @default_options.delete(:cookie_only)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          initialize_sid\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"220\" class=\"context\" id=\"40\"\n                  onclick=\"toggle(40);\">\n                <li class=\"context-line\" id=\"context-40\"><code>          context(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"221\" class=\"post-context\"\n                  id=\"post-40\" onclick=\"toggle(40);\">\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        def context(env, app=@app)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          prepare_session(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          status, headers, body = app.call(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          commit_session(env, status, headers, body)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;nulllogger.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"2\"\n                  class=\"pre-context\" id=\"pre-41\"\n                  onclick=\"toggle(41);\">\n                \n                <li class=\"pre-context-line\"><code>  class NullLogger\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def initialize(app)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @app = app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def call(env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      env[&#x27;rack.logger&#x27;] = self\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"9\" class=\"context\" id=\"41\"\n                  onclick=\"toggle(41);\">\n                <li class=\"context-line\" id=\"context-41\"><code>      @app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"10\" class=\"post-context\"\n                  id=\"post-41\" onclick=\"toggle(41);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def info(progname = nil, &amp;block); end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def debug(progname = nil, &amp;block); end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def warn(progname = nil, &amp;block); end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def error(progname = nil, &amp;block); end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def fatal(progname = nil, &amp;block); end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;head.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"6\"\n                  class=\"pre-context\" id=\"pre-42\"\n                  onclick=\"toggle(42);\">\n                \n                <li class=\"pre-context-line\"><code>  # Rack::Head returns an empty body for all HEAD requests. It leaves\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  # all other requests unchanged.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  def initialize(app)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    @app = app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"13\" class=\"context\" id=\"42\"\n                  onclick=\"toggle(42);\">\n                <li class=\"context-line\" id=\"context-42\"><code>    status, headers, body = @app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"14\" class=\"post-context\"\n                  id=\"post-42\" onclick=\"toggle(42);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    if env[REQUEST_METHOD] == HEAD\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      [\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        status, headers, Rack::BodyProxy.new([]) do\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          body.close if body.respond_to? :close\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      ]\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;show_exceptions.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"14\"\n                  class=\"pre-context\" id=\"pre-43\"\n                  onclick=\"toggle(43);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def initialize(app)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @app      = app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @template = ERB.new(TEMPLATE)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"21\" class=\"context\" id=\"43\"\n                  onclick=\"toggle(43);\">\n                <li class=\"context-line\" id=\"context-43\"><code>      @app.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"22\" class=\"post-context\"\n                  id=\"post-43\" onclick=\"toggle(43);\">\n                \n                <li class=\"post-context-line\"><code>    rescue Exception =&gt; e\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      errors, env[&quot;rack.errors&quot;] = env[&quot;rack.errors&quot;], @@eats_errors\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      if prefers_plain_text?(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        content_type = &quot;text&#x2F;plain&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        exception_string = dump_exception(e)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      else\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"174\"\n                  class=\"pre-context\" id=\"pre-44\"\n                  onclick=\"toggle(44);\">\n                \n                <li class=\"pre-context-line\"><code>  # Some Rack handlers (Thin, Rainbows!) implement an extended body object protocol, however,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  # some middleware (namely Rack::Lint) will break it by not mirroring the methods in question.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  # This middleware will detect an extended body object and will make sure it reaches the\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  # handler directly. We do this here, so our middleware and middleware set up by the app will\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  # still be able to run.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  class ExtendedRack &lt; Struct.new(:app)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"181\" class=\"context\" id=\"44\"\n                  onclick=\"toggle(44);\">\n                <li class=\"context-line\" id=\"context-44\"><code>      result, callback = app.call(env), env[&#x27;async.callback&#x27;]</code></li>\n              </ol>\n\n              \n              <ol start=\"182\" class=\"post-context\"\n                  id=\"post-44\" onclick=\"toggle(44);\">\n                \n                <li class=\"post-context-line\"><code>      return result unless callback and async?(*result)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      after_response { callback.call result }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      setup_close(env, *result)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      throw :async\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"2014\"\n                  class=\"pre-context\" id=\"pre-45\"\n                  onclick=\"toggle(45);\">\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def helpers\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @instance\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"2021\" class=\"context\" id=\"45\"\n                  onclick=\"toggle(45);\">\n                <li class=\"context-line\" id=\"context-45\"><code>      @stack.call(env)</code></li>\n              </ol>\n\n              \n              <ol start=\"2022\" class=\"post-context\"\n                  id=\"post-45\" onclick=\"toggle(45);\">\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def inspect\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      &quot;#&lt;\#{@instance.class} app_file=\#{settings.app_file.inspect}&gt;&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>block in call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1479\"\n                  class=\"pre-context\" id=\"pre-46\"\n                  onclick=\"toggle(46);\">\n                \n                <li class=\"pre-context-line\"><code>        setup_default_middleware builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        setup_middleware builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        builder.run app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1486\" class=\"context\" id=\"46\"\n                  onclick=\"toggle(46);\">\n                <li class=\"context-line\" id=\"context-46\"><code>        synchronize { prototype.call(env) }</code></li>\n              </ol>\n\n              \n              <ol start=\"1487\" class=\"post-context\"\n                  id=\"post-46\" onclick=\"toggle(46);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Like Kernel#caller but excluding certain magic entries and without\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # line &#x2F; method information; the resulting array contains filenames only.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def caller_files\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        cleaned_caller(1).flatten\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>synchronize</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1788\"\n                  class=\"pre-context\" id=\"pre-47\"\n                  onclick=\"toggle(47);\">\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @@mutex = Mutex.new\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def synchronize(&amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        if lock?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @@mutex.synchronize(&amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        else\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1795\" class=\"context\" id=\"47\"\n                  onclick=\"toggle(47);\">\n                <li class=\"context-line\" id=\"context-47\"><code>          yield</code></li>\n              </ol>\n\n              \n              <ol start=\"1796\" class=\"post-context\"\n                  id=\"post-47\" onclick=\"toggle(47);\">\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # used for deprecation warnings\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def warn(message)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        super message + &quot;\\n\\tfrom \#{cleaned_caller.first.join(&#x27;:&#x27;)}&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info framework\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in\n                <code><strong>call</strong></code>\n            </li>\n\n            <li class=\"code framework\">\n              \n              <ol start=\"1479\"\n                  class=\"pre-context\" id=\"pre-48\"\n                  onclick=\"toggle(48);\">\n                \n                <li class=\"pre-context-line\"><code>        setup_default_middleware builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        setup_middleware builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        builder.run app\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        builder\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def call(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1486\" class=\"context\" id=\"48\"\n                  onclick=\"toggle(48);\">\n                <li class=\"context-line\" id=\"context-48\"><code>        synchronize { prototype.call(env) }</code></li>\n              </ol>\n\n              \n              <ol start=\"1487\" class=\"post-context\"\n                  id=\"post-48\" onclick=\"toggle(48);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Like Kernel#caller but excluding certain magic entries and without\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # line &#x2F; method information; the resulting array contains filenames only.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def caller_files\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        cleaned_caller(1).flatten\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;mock_session.rb</code> in\n                <code><strong>request</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"23\"\n                  class=\"pre-context\" id=\"pre-49\"\n                  onclick=\"toggle(49);\">\n                \n                <li class=\"pre-context-line\"><code>    def set_cookie(cookie, uri = nil)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      cookie_jar.merge(cookie, uri)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def request(uri, env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      env[&quot;HTTP_COOKIE&quot;] ||= cookie_jar.for(uri)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      @last_request = Rack::Request.new(env)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"30\" class=\"context\" id=\"49\"\n                  onclick=\"toggle(49);\">\n                <li class=\"context-line\" id=\"context-49\"><code>      status, headers, body = @app.call(@last_request.env)</code></li>\n              </ol>\n\n              \n              <ol start=\"31\" class=\"post-context\"\n                  id=\"post-49\" onclick=\"toggle(49);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @last_response = MockResponse.new(status, headers, body, env[&quot;rack.errors&quot;].flush)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      body.close if body.respond_to?(:close)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      cookie_jar.merge(last_response.headers[&quot;Set-Cookie&quot;], uri)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      @after_request.each { |hook| hook.call }\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;test.rb</code> in\n                <code><strong>process_request</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"237\"\n                  class=\"pre-context\" id=\"pre-50\"\n                  onclick=\"toggle(50);\">\n                \n                <li class=\"pre-context-line\"><code>        Rack::MockRequest.env_for(uri.to_s, env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def process_request(uri, env)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        uri = URI.parse(uri)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        uri.host ||= @default_host\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"244\" class=\"context\" id=\"50\"\n                  onclick=\"toggle(50);\">\n                <li class=\"context-line\" id=\"context-50\"><code>        @rack_mock_session.request(uri, env)</code></li>\n              </ol>\n\n              \n              <ol start=\"245\" class=\"post-context\"\n                  id=\"post-50\" onclick=\"toggle(50);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        if retry_with_digest_auth?(env)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          auth_env = env.merge({\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            &quot;HTTP_AUTHORIZATION&quot;          =&gt; digest_auth_header,\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            &quot;rack-test.digest_auth_retry&quot; =&gt; true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          })\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          auth_env.delete(&#x27;rack.request&#x27;)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;test.rb</code> in\n                <code><strong>get</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"51\"\n                  class=\"pre-context\" id=\"pre-51\"\n                  onclick=\"toggle(51);\">\n                \n                <li class=\"pre-context-line\"><code>      # the app&#x27;s response in #last_response. Yield #last_response to a block\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # if given.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # Example:\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   get &quot;&#x2F;&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def get(uri, params = {}, env = {}, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        env = env_for(uri, env.merge(:method =&gt; &quot;GET&quot;, :params =&gt; params))\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"58\" class=\"context\" id=\"51\"\n                  onclick=\"toggle(51);\">\n                <li class=\"context-line\" id=\"context-51\"><code>        process_request(uri, env, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"59\" class=\"post-context\"\n                  id=\"post-51\" onclick=\"toggle(51);\">\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Issue a POST request for the given URI. See #get\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Example:\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      #   post &quot;&#x2F;signup&quot;, &quot;name&quot; =&gt; &quot;Bryan&quot;\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def post(uri, params = {}, env = {}, &amp;block)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info app\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;rubies&#x2F;ruby-2.3.3&#x2F;lib&#x2F;ruby&#x2F;2.3.0&#x2F;forwardable.rb</code> in\n                <code><strong>get</strong></code>\n            </li>\n\n            <li class=\"code app\">\n              \n              <ol start=\"182\"\n                  class=\"pre-context\" id=\"pre-52\"\n                  onclick=\"toggle(52);\">\n                \n                <li class=\"pre-context-line\"><code>    if method_defined?(accessor) || private_method_defined?(accessor)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      accessor = &quot;\#{accessor}()&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    line_no = __LINE__; str = %{\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def \#{ali}(*args, &amp;block)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"189\" class=\"context\" id=\"52\"\n                  onclick=\"toggle(52);\">\n                <li class=\"context-line\" id=\"context-52\"><code>          \#{accessor}.__send__(:\#{method}, *args, &amp;block)</code></li>\n              </ol>\n\n              \n              <ol start=\"190\" class=\"post-context\"\n                  id=\"post-52\" onclick=\"toggle(52);\">\n                \n                <li class=\"post-context-line\"><code>        rescue ::Exception\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          $@.delete_if{|s| ::Forwardable::FILE_REGEXP =~ s} unless ::Forwardable::debug\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          ::Kernel::raise\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # If it&#x27;s not a class or module, it&#x27;s an instance\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info app\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;spec&#x2F;sinatra_logging_in_and_out_spec.rb</code> in\n                <code><strong>block (3 levels) in &lt;top (required)&gt;</strong></code>\n            </li>\n\n            <li class=\"code app\">\n              \n              <ol start=\"77\"\n                  class=\"pre-context\" id=\"pre-53\"\n                  onclick=\"toggle(53);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    it &#x27;displays the account information if a user is logged in&#x27; do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      user1 = User.create(:username =&gt; &quot;skittles123&quot;, :password =&gt; &quot;iluvskittles&quot;, :balance =&gt; 1000)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      params = {\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        &quot;username&quot;=&gt; &quot;skittles123&quot;, &quot;password&quot; =&gt; &quot;iluvskittles&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      post &#x27;&#x2F;login&#x27;, params\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"84\" class=\"context\" id=\"53\"\n                  onclick=\"toggle(53);\">\n                <li class=\"context-line\" id=\"context-53\"><code>      get &#x27;&#x2F;account&#x27;</code></li>\n              </ol>\n\n              \n              <ol start=\"85\" class=\"post-context\"\n                  id=\"post-53\" onclick=\"toggle(53);\">\n                \n                <li class=\"post-context-line\"><code>      expect(last_response.body).to include(&quot;&lt;h1&gt;Welcome skittles123&lt;&#x2F;h1&gt;&quot;)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      expect(last_response.body).to include(&quot;&lt;h3&gt;Your Balance: 1000.0&lt;&#x2F;h3&gt;&quot;)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>  describe &quot;GET &#x27;&#x2F;logout&#x27;&quot; do\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    it &quot;clears the session&quot; do\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>instance_exec</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"229\"\n                  class=\"pre-context\" id=\"pre-54\"\n                  onclick=\"toggle(54);\">\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          if skipped?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            Pending.mark_pending! self, skip\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          elsif !RSpec.configuration.dry_run?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            with_around_and_singleton_context_hooks do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>              begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>                run_before_example\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"236\" class=\"context\" id=\"54\"\n                  onclick=\"toggle(54);\">\n                <li class=\"context-line\" id=\"context-54\"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)</code></li>\n              </ol>\n\n              \n              <ol start=\"237\" class=\"post-context\"\n                  id=\"post-54\" onclick=\"toggle(54);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                if pending?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                  Pending.mark_fixed! self\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                  raise Pending::PendingExampleFixedError,\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                        &#x27;Expected example to fail since it is pending, but it passed.&#x27;,\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                        [location]\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>block in run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"229\"\n                  class=\"pre-context\" id=\"pre-55\"\n                  onclick=\"toggle(55);\">\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          if skipped?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            Pending.mark_pending! self, skip\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          elsif !RSpec.configuration.dry_run?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            with_around_and_singleton_context_hooks do\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>              begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>                run_before_example\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"236\" class=\"context\" id=\"55\"\n                  onclick=\"toggle(55);\">\n                <li class=\"context-line\" id=\"context-55\"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)</code></li>\n              </ol>\n\n              \n              <ol start=\"237\" class=\"post-context\"\n                  id=\"post-55\" onclick=\"toggle(55);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                if pending?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                  Pending.mark_fixed! self\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                  raise Pending::PendingExampleFixedError,\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                        &#x27;Expected example to fail since it is pending, but it passed.&#x27;,\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                        [location]\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>block in with_around_and_singleton_context_hooks</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"470\"\n                  class=\"pre-context\" id=\"pre-56\"\n                  onclick=\"toggle(56);\">\n                \n                <li class=\"pre-context-line\"><code>        @example_group_instance.setup_mocks_for_rspec\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        hooks.run(:before, :example, self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def with_around_and_singleton_context_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        singleton_context_hooks_host = example_group_instance.singleton_class\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        singleton_context_hooks_host.run_before_context_hooks(example_group_instance)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"477\" class=\"context\" id=\"56\"\n                  onclick=\"toggle(56);\">\n                <li class=\"context-line\" id=\"context-56\"><code>        with_around_example_hooks { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"478\" class=\"post-context\"\n                  id=\"post-56\" onclick=\"toggle(56);\">\n                \n                <li class=\"post-context-line\"><code>      ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        singleton_context_hooks_host.run_after_context_hooks(example_group_instance)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def run_after_example\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        assign_generated_description if defined?(::RSpec::Matchers)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        hooks.run(:after, :example, self)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>block in with_around_example_hooks</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"427\"\n                  class=\"pre-context\" id=\"pre-57\"\n                  onclick=\"toggle(57);\">\n                \n                <li class=\"pre-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        example_group_instance.singleton_class.hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def with_around_example_hooks\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"434\" class=\"context\" id=\"57\"\n                  onclick=\"toggle(57);\">\n                <li class=\"context-line\" id=\"context-57\"><code>        hooks.run(:around, :example, self) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"435\" class=\"post-context\"\n                  id=\"post-57\" onclick=\"toggle(57);\">\n                \n                <li class=\"post-context-line\"><code>      rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; e\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        set_exception(e)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def start(reporter)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        reporter.example_started(self)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        execution_result.started_at = clock.now\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in\n                <code><strong>block in run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"471\"\n                  class=\"pre-context\" id=\"pre-58\"\n                  onclick=\"toggle(58);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          if scope == :context\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            run_owned_hooks_for(position, :context, example_or_group)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          else\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            case position\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            when :before then run_example_hooks_for(example_or_group, :before, :reverse_each)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            when :after  then run_example_hooks_for(example_or_group, :after,  :each)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"478\" class=\"context\" id=\"58\"\n                  onclick=\"toggle(58);\">\n                <li class=\"context-line\" id=\"context-58\"><code>            when :around then run_around_example_hooks_for(example_or_group) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"479\" class=\"post-context\"\n                  id=\"post-58\" onclick=\"toggle(58);\">\n                \n                <li class=\"post-context-line\"><code>            end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        SCOPES = [:example, :context]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        SCOPE_ALIASES = { :each =&gt; :example, :all =&gt; :context }\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in\n                <code><strong>run_around_example_hooks_for</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"609\"\n                  class=\"pre-context\" id=\"pre-59\"\n                  onclick=\"toggle(59);\">\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        def run_around_example_hooks_for(example)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          hooks = FlatMap.flat_map(owner_parent_groups) do |group|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            group.hooks.matching_hooks_for(:around, :example, example)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"616\" class=\"context\" id=\"59\"\n                  onclick=\"toggle(59);\">\n                <li class=\"context-line\" id=\"context-59\"><code>          return yield if hooks.empty? # exit early to avoid the extra allocation cost of `Example::Procsy`</code></li>\n              </ol>\n\n              \n              <ol start=\"617\" class=\"post-context\"\n                  id=\"post-59\" onclick=\"toggle(59);\">\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          initial_procsy = Example::Procsy.new(example) { yield }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          hooks.inject(initial_procsy) do |procsy, around_hook|\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            procsy.wrap { around_hook.execute_with(example, procsy) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end.call\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"471\"\n                  class=\"pre-context\" id=\"pre-60\"\n                  onclick=\"toggle(60);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          if scope == :context\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            run_owned_hooks_for(position, :context, example_or_group)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          else\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            case position\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            when :before then run_example_hooks_for(example_or_group, :before, :reverse_each)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            when :after  then run_example_hooks_for(example_or_group, :after,  :each)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"478\" class=\"context\" id=\"60\"\n                  onclick=\"toggle(60);\">\n                <li class=\"context-line\" id=\"context-60\"><code>            when :around then run_around_example_hooks_for(example_or_group) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"479\" class=\"post-context\"\n                  id=\"post-60\" onclick=\"toggle(60);\">\n                \n                <li class=\"post-context-line\"><code>            end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        SCOPES = [:example, :context]\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        SCOPE_ALIASES = { :each =&gt; :example, :all =&gt; :context }\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>with_around_example_hooks</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"427\"\n                  class=\"pre-context\" id=\"pre-61\"\n                  onclick=\"toggle(61);\">\n                \n                <li class=\"pre-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        example_group_instance.singleton_class.hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def with_around_example_hooks\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"434\" class=\"context\" id=\"61\"\n                  onclick=\"toggle(61);\">\n                <li class=\"context-line\" id=\"context-61\"><code>        hooks.run(:around, :example, self) { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"435\" class=\"post-context\"\n                  id=\"post-61\" onclick=\"toggle(61);\">\n                \n                <li class=\"post-context-line\"><code>      rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; e\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        set_exception(e)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def start(reporter)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        reporter.example_started(self)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        execution_result.started_at = clock.now\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>with_around_and_singleton_context_hooks</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"470\"\n                  class=\"pre-context\" id=\"pre-62\"\n                  onclick=\"toggle(62);\">\n                \n                <li class=\"pre-context-line\"><code>        @example_group_instance.setup_mocks_for_rspec\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        hooks.run(:before, :example, self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def with_around_and_singleton_context_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        singleton_context_hooks_host = example_group_instance.singleton_class\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        singleton_context_hooks_host.run_before_context_hooks(example_group_instance)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"477\" class=\"context\" id=\"62\"\n                  onclick=\"toggle(62);\">\n                <li class=\"context-line\" id=\"context-62\"><code>        with_around_example_hooks { yield }</code></li>\n              </ol>\n\n              \n              <ol start=\"478\" class=\"post-context\"\n                  id=\"post-62\" onclick=\"toggle(62);\">\n                \n                <li class=\"post-context-line\"><code>      ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        singleton_context_hooks_host.run_after_context_hooks(example_group_instance)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def run_after_example\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        assign_generated_description if defined?(::RSpec::Matchers)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        hooks.run(:after, :example, self)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"226\"\n                  class=\"pre-context\" id=\"pre-63\"\n                  onclick=\"toggle(63);\">\n                \n                <li class=\"pre-context-line\"><code>        start(reporter)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        Pending.mark_pending!(self, pending) if pending?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          if skipped?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            Pending.mark_pending! self, skip\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          elsif !RSpec.configuration.dry_run?\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"233\" class=\"context\" id=\"63\"\n                  onclick=\"toggle(63);\">\n                <li class=\"context-line\" id=\"context-63\"><code>            with_around_and_singleton_context_hooks do</code></li>\n              </ol>\n\n              \n              <ol start=\"234\" class=\"post-context\"\n                  id=\"post-63\" onclick=\"toggle(63);\">\n                \n                <li class=\"post-context-line\"><code>              begin\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                run_before_example\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                if pending?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>                  Pending.mark_fixed! self\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>block in run_examples</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"574\"\n                  class=\"pre-context\" id=\"pre-64\"\n                  onclick=\"toggle(64);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def self.run_examples(reporter)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        ordering_strategy.order(filtered_examples).map do |example|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          next if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          instance = new(example.inspect_output)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          set_ivars(instance, before_context_ivars)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"581\" class=\"context\" id=\"64\"\n                  onclick=\"toggle(64);\">\n                <li class=\"context-line\" id=\"context-64\"><code>          succeeded = example.run(instance, reporter)</code></li>\n              </ol>\n\n              \n              <ol start=\"582\" class=\"post-context\"\n                  id=\"post-64\" onclick=\"toggle(64);\">\n                \n                <li class=\"post-context-line\"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            RSpec.world.wants_to_quit = true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          succeeded\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end.all?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>map</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"570\"\n                  class=\"pre-context\" id=\"pre-65\"\n                  onclick=\"toggle(65);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          registry.fetch(:global)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def self.run_examples(reporter)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"577\" class=\"context\" id=\"65\"\n                  onclick=\"toggle(65);\">\n                <li class=\"context-line\" id=\"context-65\"><code>        ordering_strategy.order(filtered_examples).map do |example|</code></li>\n              </ol>\n\n              \n              <ol start=\"578\" class=\"post-context\"\n                  id=\"post-65\" onclick=\"toggle(65);\">\n                \n                <li class=\"post-context-line\"><code>          next if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          instance = new(example.inspect_output)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          set_ivars(instance, before_context_ivars)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          succeeded = example.run(instance, reporter)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            RSpec.world.wants_to_quit = true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>run_examples</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"570\"\n                  class=\"pre-context\" id=\"pre-66\"\n                  onclick=\"toggle(66);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          registry.fetch(:global)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def self.run_examples(reporter)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"577\" class=\"context\" id=\"66\"\n                  onclick=\"toggle(66);\">\n                <li class=\"context-line\" id=\"context-66\"><code>        ordering_strategy.order(filtered_examples).map do |example|</code></li>\n              </ol>\n\n              \n              <ol start=\"578\" class=\"post-context\"\n                  id=\"post-66\" onclick=\"toggle(66);\">\n                \n                <li class=\"post-context-line\"><code>          next if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          instance = new(example.inspect_output)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          set_ivars(instance, before_context_ivars)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          succeeded = example.run(instance, reporter)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            RSpec.world.wants_to_quit = true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"536\"\n                  class=\"pre-context\" id=\"pre-67\"\n                  onclick=\"toggle(67);\">\n                \n                <li class=\"pre-context-line\"><code>      def self.run(reporter=RSpec::Core::NullReporter)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        return if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        reporter.example_group_started(self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        should_run_context_hooks = descendant_filtered_examples.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"543\" class=\"context\" id=\"67\"\n                  onclick=\"toggle(67);\">\n                <li class=\"context-line\" id=\"context-67\"><code>          result_for_this_group = run_examples(reporter)</code></li>\n              </ol>\n\n              \n              <ol start=\"544\" class=\"post-context\"\n                  id=\"post-67\" onclick=\"toggle(67);\">\n                \n                <li class=\"post-context-line\"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          result_for_this_group &amp;&amp; results_for_descendants\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>block in run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"537\"\n                  class=\"pre-context\" id=\"pre-68\"\n                  onclick=\"toggle(68);\">\n                \n                <li class=\"pre-context-line\"><code>        return if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        reporter.example_group_started(self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        should_run_context_hooks = descendant_filtered_examples.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result_for_this_group = run_examples(reporter)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"544\" class=\"context\" id=\"68\"\n                  onclick=\"toggle(68);\">\n                <li class=\"context-line\" id=\"context-68\"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>\n              </ol>\n\n              \n              <ol start=\"545\" class=\"post-context\"\n                  id=\"post-68\" onclick=\"toggle(68);\">\n                \n                <li class=\"post-context-line\"><code>          result_for_this_group &amp;&amp; results_for_descendants\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>map</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"537\"\n                  class=\"pre-context\" id=\"pre-69\"\n                  onclick=\"toggle(69);\">\n                \n                <li class=\"pre-context-line\"><code>        return if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        reporter.example_group_started(self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        should_run_context_hooks = descendant_filtered_examples.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result_for_this_group = run_examples(reporter)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"544\" class=\"context\" id=\"69\"\n                  onclick=\"toggle(69);\">\n                <li class=\"context-line\" id=\"context-69\"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>\n              </ol>\n\n              \n              <ol start=\"545\" class=\"post-context\"\n                  id=\"post-69\" onclick=\"toggle(69);\">\n                \n                <li class=\"post-context-line\"><code>          result_for_this_group &amp;&amp; results_for_descendants\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"537\"\n                  class=\"pre-context\" id=\"pre-70\"\n                  onclick=\"toggle(70);\">\n                \n                <li class=\"pre-context-line\"><code>        return if RSpec.world.wants_to_quit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        reporter.example_group_started(self)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        should_run_context_hooks = descendant_filtered_examples.any?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          result_for_this_group = run_examples(reporter)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"544\" class=\"context\" id=\"70\"\n                  onclick=\"toggle(70);\">\n                <li class=\"context-line\" id=\"context-70\"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>\n              </ol>\n\n              \n              <ol start=\"545\" class=\"post-context\"\n                  id=\"post-70\" onclick=\"toggle(70);\">\n                \n                <li class=\"post-context-line\"><code>          result_for_this_group &amp;&amp; results_for_descendants\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          true\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>block (3 levels) in run_specs</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"108\"\n                  class=\"pre-context\" id=\"pre-71\"\n                  onclick=\"toggle(71);\">\n                \n                <li class=\"pre-context-line\"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   or the configured failure exit code (1 by default) if specs\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   failed.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run_specs(example_groups)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @configuration.with_suite_hooks do\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"115\" class=\"context\" id=\"71\"\n                  onclick=\"toggle(71);\">\n                <li class=\"context-line\" id=\"context-71\"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>\n              </ol>\n\n              \n              <ol start=\"116\" class=\"post-context\"\n                  id=\"post-71\" onclick=\"toggle(71);\">\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def persist_example_statuses\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>map</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"108\"\n                  class=\"pre-context\" id=\"pre-72\"\n                  onclick=\"toggle(72);\">\n                \n                <li class=\"pre-context-line\"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   or the configured failure exit code (1 by default) if specs\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   failed.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run_specs(example_groups)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @configuration.with_suite_hooks do\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"115\" class=\"context\" id=\"72\"\n                  onclick=\"toggle(72);\">\n                <li class=\"context-line\" id=\"context-72\"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>\n              </ol>\n\n              \n              <ol start=\"116\" class=\"post-context\"\n                  id=\"post-72\" onclick=\"toggle(72);\">\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def persist_example_statuses\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>block (2 levels) in run_specs</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"108\"\n                  class=\"pre-context\" id=\"pre-73\"\n                  onclick=\"toggle(73);\">\n                \n                <li class=\"pre-context-line\"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   or the configured failure exit code (1 by default) if specs\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   failed.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run_specs(example_groups)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          @configuration.with_suite_hooks do\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"115\" class=\"context\" id=\"73\"\n                  onclick=\"toggle(73);\">\n                <li class=\"context-line\" id=\"context-73\"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>\n              </ol>\n\n              \n              <ol start=\"116\" class=\"post-context\"\n                  id=\"post-73\" onclick=\"toggle(73);\">\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def persist_example_statuses\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;configuration.rb</code> in\n                <code><strong>with_suite_hooks</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"1673\"\n                  class=\"pre-context\" id=\"pre-74\"\n                  onclick=\"toggle(74);\">\n                \n                <li class=\"pre-context-line\"><code>      # @private\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def with_suite_hooks\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        return yield if dry_run?\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        hook_context = SuiteHookContext.new\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          run_hooks_with(@before_suite_hooks, hook_context)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"1680\" class=\"context\" id=\"74\"\n                  onclick=\"toggle(74);\">\n                <li class=\"context-line\" id=\"context-74\"><code>          yield</code></li>\n              </ol>\n\n              \n              <ol start=\"1681\" class=\"post-context\"\n                  id=\"post-74\" onclick=\"toggle(74);\">\n                \n                <li class=\"post-context-line\"><code>        ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          run_hooks_with(@after_suite_hooks, hook_context)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # @private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Holds the various registered hooks. Here we use a FilterableItemRepository\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>block in run_specs</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"107\"\n                  class=\"pre-context\" id=\"pre-75\"\n                  onclick=\"toggle(75);\">\n                \n                <li class=\"pre-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   or the configured failure exit code (1 by default) if specs\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   failed.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run_specs(example_groups)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"114\" class=\"context\" id=\"75\"\n                  onclick=\"toggle(75);\">\n                <li class=\"context-line\" id=\"context-75\"><code>          @configuration.with_suite_hooks do</code></li>\n              </ol>\n\n              \n              <ol start=\"115\" class=\"post-context\"\n                  id=\"post-75\" onclick=\"toggle(75);\">\n                \n                <li class=\"post-context-line\"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;reporter.rb</code> in\n                <code><strong>report</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"70\"\n                  class=\"pre-context\" id=\"pre-76\"\n                  onclick=\"toggle(76);\">\n                \n                <li class=\"pre-context-line\"><code>    #     reporter.report(group.examples.size) do |r|\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    #       example_groups.map {|g| g.run(r) }\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    #     end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    def report(expected_example_count)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      start(expected_example_count)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      begin\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"77\" class=\"context\" id=\"76\"\n                  onclick=\"toggle(76);\">\n                <li class=\"context-line\" id=\"context-76\"><code>        yield self</code></li>\n              </ol>\n\n              \n              <ol start=\"78\" class=\"post-context\"\n                  id=\"post-76\" onclick=\"toggle(76);\">\n                \n                <li class=\"post-context-line\"><code>      ensure\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        finish\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    # @private\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    def start(expected_example_count, time=RSpec::Core::Time.now)\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>run_specs</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"106\"\n                  class=\"pre-context\" id=\"pre-77\"\n                  onclick=\"toggle(77);\">\n                \n                <li class=\"pre-context-line\"><code>      # Runs the provided example groups.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   or the configured failure exit code (1 by default) if specs\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #   failed.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run_specs(example_groups)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"113\" class=\"context\" id=\"77\"\n                  onclick=\"toggle(77);\">\n                <li class=\"context-line\" id=\"context-77\"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|</code></li>\n              </ol>\n\n              \n              <ol start=\"114\" class=\"post-context\"\n                  id=\"post-77\" onclick=\"toggle(77);\">\n                \n                <li class=\"post-context-line\"><code>          @configuration.with_suite_hooks do\n</code></li>\n                \n                <li class=\"post-context-line\"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code\n</code></li>\n                \n                <li class=\"post-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>    private\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"82\"\n                  class=\"pre-context\" id=\"pre-78\"\n                  onclick=\"toggle(78);\">\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # Configures and runs a spec suite.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @param err [IO] error stream\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # @param out [IO] output stream\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def run(err, out)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        setup(err, out)\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"89\" class=\"context\" id=\"78\"\n                  onclick=\"toggle(78);\">\n                <li class=\"context-line\" id=\"context-78\"><code>        run_specs(@world.ordered_example_groups).tap do</code></li>\n              </ol>\n\n              \n              <ol start=\"90\" class=\"post-context\"\n                  id=\"post-78\" onclick=\"toggle(78);\">\n                \n                <li class=\"post-context-line\"><code>          persist_example_statuses\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Wires together the various configuration objects and state holders.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # @param err [IO] error stream\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>run</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"66\"\n                  class=\"pre-context\" id=\"pre-79\"\n                  onclick=\"toggle(79);\">\n                \n                <li class=\"pre-context-line\"><code>          begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            DRbRunner.new(options).run(err, out)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          rescue DRb::DRbConnError\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            err.puts &quot;No DRb server is running. Running in local process instead ...&quot;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>            new(options).run(err, out)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>          end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        else\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"73\" class=\"context\" id=\"79\"\n                  onclick=\"toggle(79);\">\n                <li class=\"context-line\" id=\"context-79\"><code>          new(options).run(err, out)</code></li>\n              </ol>\n\n              \n              <ol start=\"74\" class=\"post-context\"\n                  id=\"post-79\" onclick=\"toggle(79);\">\n                \n                <li class=\"post-context-line\"><code>        end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      def initialize(options, configuration=RSpec.configuration, world=RSpec.world)\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        @options       = options\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        @configuration = configuration\n</code></li>\n                \n                <li class=\"post-context-line\"><code>        @world         = world\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in\n                <code><strong>invoke</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"34\"\n                  class=\"pre-context\" id=\"pre-80\"\n                  onclick=\"toggle(80);\">\n                \n                <li class=\"pre-context-line\"><code>        invoke\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # Runs the suite of specs and exits the process with an appropriate exit\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      # code.\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>      def self.invoke\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>        disable_autorun!\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"41\" class=\"context\" id=\"80\"\n                  onclick=\"toggle(80);\">\n                <li class=\"context-line\" id=\"context-80\"><code>        status = run(ARGV, $stderr, $stdout).to_i</code></li>\n              </ol>\n\n              \n              <ol start=\"42\" class=\"post-context\"\n                  id=\"post-80\" onclick=\"toggle(80);\">\n                \n                <li class=\"post-context-line\"><code>        exit(status) if status != 0\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      end\n</code></li>\n                \n                <li class=\"post-context-line\"><code>\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # Run a suite of RSpec examples. Does not exit.\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      #\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # This is used internally by RSpec to run a suite, but is available\n</code></li>\n                \n                <li class=\"post-context-line\"><code>      # for use by any other automation tool.\n</code></li>\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;exe&#x2F;rspec</code> in\n                <code><strong>&lt;top (required)&gt;</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"1\"\n                  class=\"pre-context\" id=\"pre-81\"\n                  onclick=\"toggle(81);\">\n                \n                <li class=\"pre-context-line\"><code>#!&#x2F;usr&#x2F;bin&#x2F;env ruby\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>require &#x27;rspec&#x2F;core&#x27;\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"4\" class=\"context\" id=\"81\"\n                  onclick=\"toggle(81);\">\n                <li class=\"context-line\" id=\"context-81\"><code>RSpec::Core::Runner.invoke</code></li>\n              </ol>\n\n              \n              <ol start=\"5\" class=\"post-context\"\n                  id=\"post-81\" onclick=\"toggle(81);\">\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;rspec</code> in\n                <code><strong>load</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"15\"\n                  class=\"pre-context\" id=\"pre-82\"\n                  onclick=\"toggle(82);\">\n                \n                <li class=\"pre-context-line\"><code>  str = str.dup.force_encoding(&quot;BINARY&quot;) if str.respond_to? :force_encoding\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  if str =~ &#x2F;\\A_(.*)_\\z&#x2F; and Gem::Version.correct?($1) then\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    version = $1\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    ARGV.shift\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"22\" class=\"context\" id=\"82\"\n                  onclick=\"toggle(82);\">\n                <li class=\"context-line\" id=\"context-82\"><code>load Gem.activate_bin_path(&#x27;rspec-core&#x27;, &#x27;rspec&#x27;, version)</code></li>\n              </ol>\n\n              \n              <ol start=\"23\" class=\"post-context\"\n                  id=\"post-82\" onclick=\"toggle(82);\">\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;rspec</code> in\n                <code><strong>&lt;main&gt;</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"15\"\n                  class=\"pre-context\" id=\"pre-83\"\n                  onclick=\"toggle(83);\">\n                \n                <li class=\"pre-context-line\"><code>  str = str.dup.force_encoding(&quot;BINARY&quot;) if str.respond_to? :force_encoding\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  if str =~ &#x2F;\\A_(.*)_\\z&#x2F; and Gem::Version.correct?($1) then\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    version = $1\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>    ARGV.shift\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"22\" class=\"context\" id=\"83\"\n                  onclick=\"toggle(83);\">\n                <li class=\"context-line\" id=\"context-83\"><code>load Gem.activate_bin_path(&#x27;rspec-core&#x27;, &#x27;rspec&#x27;, version)</code></li>\n              </ol>\n\n              \n              <ol start=\"23\" class=\"post-context\"\n                  id=\"post-83\" onclick=\"toggle(83);\">\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;ruby_executable_hooks</code> in\n                <code><strong>eval</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"8\"\n                  class=\"pre-context\" id=\"pre-84\"\n                  onclick=\"toggle(84);\">\n                \n                <li class=\"pre-context-line\"><code>begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  require &#x27;executable-hooks&#x2F;hooks&#x27;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  Gem::ExecutableHooks.run($0)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>rescue LoadError\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  warn &quot;unable to load executable-hooks&#x2F;hooks&quot; if ENV.key?(&#x27;ExecutableHooks_DEBUG&#x27;)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"15\" class=\"context\" id=\"84\"\n                  onclick=\"toggle(84);\">\n                <li class=\"context-line\" id=\"context-84\"><code>eval File.read($0), binding, $0</code></li>\n              </ol>\n\n              \n              <ol start=\"16\" class=\"post-context\"\n                  id=\"post-84\" onclick=\"toggle(84);\">\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n          \n\n            <li class=\"frame-info system\">\n              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;ruby_executable_hooks</code> in\n                <code><strong>&lt;main&gt;</strong></code>\n            </li>\n\n            <li class=\"code system\">\n              \n              <ol start=\"8\"\n                  class=\"pre-context\" id=\"pre-85\"\n                  onclick=\"toggle(85);\">\n                \n                <li class=\"pre-context-line\"><code>begin\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  require &#x27;executable-hooks&#x2F;hooks&#x27;\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  Gem::ExecutableHooks.run($0)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>rescue LoadError\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>  warn &quot;unable to load executable-hooks&#x2F;hooks&quot; if ENV.key?(&#x27;ExecutableHooks_DEBUG&#x27;)\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>end\n</code></li>\n                \n                <li class=\"pre-context-line\"><code>\n</code></li>\n                \n              </ol>\n              \n\n              <ol start=\"15\" class=\"context\" id=\"85\"\n                  onclick=\"toggle(85);\">\n                <li class=\"context-line\" id=\"context-85\"><code>eval File.read($0), binding, $0</code></li>\n              </ol>\n\n              \n              <ol start=\"16\" class=\"post-context\"\n                  id=\"post-85\" onclick=\"toggle(85);\">\n                \n              </ol>\n              \n              <div class=\"clear\"></div>\n            </li>\n\n          \n\n        \n      \n\n      </ul>\n    </div> <!-- /BACKTRACE -->\n\n    <div id=\"get\">\n      <h3 id=\"get-info\">GET</h3>\n      \n        <p class=\"no-data\">No GET data.</p>\n      \n      <div class=\"clear\"></div>\n    </div> <!-- /GET -->\n\n    <div id=\"post\">\n      <h3 id=\"post-info\">POST</h3>\n      \n        <p class=\"no-data\">No POST data.</p>\n      \n      <div class=\"clear\"></div>\n    </div> <!-- /POST -->\n\n    <div id=\"cookies\">\n      <h3 id=\"cookie-info\">COOKIES</h3>\n      \n        <table class=\"req\">\n          <tr>\n            <th>Variable</th>\n            <th>Value</th>\n          </tr>\n          \n            <tr>\n              <td>rack.session</td>\n              <td class=\"code\"><div>&quot;BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh\\nNDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG\\nOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1\\nMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7\\nAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5\\nBjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2\\nYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7\\nAEZpBg==\\n--59caaaeccd4a49346c8fbf1ca0891695c674aced&quot;</div></td>\n            </tr>\n          \n        </table>\n      \n      <div class=\"clear\"></div>\n    </div> <!-- /COOKIES -->\n\n    <div id=\"rack\">\n      <h3 id=\"env-info\">Rack ENV</h3>\n      <table class=\"req\">\n        <tr>\n          <th>Variable</th>\n          <th>Value</th>\n        </tr>\n         \n         <tr>\n           <td>CONTENT_LENGTH</td>\n           <td class=\"code\"><div>0</div></td>\n         </tr>\n         \n         <tr>\n           <td>HTTPS</td>\n           <td class=\"code\"><div>off</div></td>\n         </tr>\n         \n         <tr>\n           <td>HTTP_COOKIE</td>\n           <td class=\"code\"><div>rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh%0ANDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG%0AOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1%0AMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2%0AYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7%0AAEZpBg%3D%3D%0A--59caaaeccd4a49346c8fbf1ca0891695c674aced</div></td>\n         </tr>\n         \n         <tr>\n           <td>HTTP_HOST</td>\n           <td class=\"code\"><div>example.org</div></td>\n         </tr>\n         \n         <tr>\n           <td>PATH_INFO</td>\n           <td class=\"code\"><div>&#x2F;account</div></td>\n         </tr>\n         \n         <tr>\n           <td>QUERY_STRING</td>\n           <td class=\"code\"><div></div></td>\n         </tr>\n         \n         <tr>\n           <td>REMOTE_ADDR</td>\n           <td class=\"code\"><div>127.0.0.1</div></td>\n         </tr>\n         \n         <tr>\n           <td>REQUEST_METHOD</td>\n           <td class=\"code\"><div>GET</div></td>\n         </tr>\n         \n         <tr>\n           <td>SCRIPT_NAME</td>\n           <td class=\"code\"><div></div></td>\n         </tr>\n         \n         <tr>\n           <td>SERVER_NAME</td>\n           <td class=\"code\"><div>example.org</div></td>\n         </tr>\n         \n         <tr>\n           <td>SERVER_PORT</td>\n           <td class=\"code\"><div>80</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.errors</td>\n           <td class=\"code\"><div>#&lt;Object:0x000000027859e0&gt;</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.input</td>\n           <td class=\"code\"><div>#&lt;StringIO:0x00000006cde0c8&gt;</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.logger</td>\n           <td class=\"code\"><div>#&lt;Rack::NullLogger:0x00000003997048 @app=#&lt;Rack::Session::Cookie:0x00000003997318 @secrets=[&quot;secret&quot;], @coder=#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;, @app=#&lt;Rack::Protection::FrameOptions:0x00000003997c00 @app=#&lt;Rack::Protection::HttpOrigin:0x00000003997e08 @app=#&lt;Rack::Protection::IPSpoofing:0x00000004b34008 @app=#&lt;Rack::Protection::JsonCsrf:0x00000004b340a8 @app=#&lt;Rack::Protection::PathTraversal:0x00000004b34170 @app=#&lt;Rack::Protection::RemoteToken:0x00000004b342b0 @app=#&lt;Rack::Protection::SessionHijacking:0x00000004b34508 @app=#&lt;Rack::Protection::XSSHeader:0x00000004b34620 @app=#&lt;ApplicationController:0x00000004c356f0 @default_layout=:layout, @preferred_extension=nil, @app=nil, @template_cache=#&lt;Tilt::Cache:0x00000004c356a0 @cache={[:erb, :account, {:outvar=&gt;&quot;@_out_buf&quot;, :default_encoding=&gt;&quot;utf-8&quot;}, &quot;&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;&quot;]=&gt;#&lt;Tilt::ERBTemplate:0x00000006ce9d38 @options={:outvar=&gt;&quot;@_out_buf&quot;, :trim=&gt;&quot;&lt;&gt;&quot;}, @line=1, @file=&quot;&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;account.erb&quot;, @compiled_method={[]=&gt;#&lt;UnboundMethod: BasicObject#__tilt_17256660&gt;}, @default_encoding=&quot;utf-8&quot;, @reader=#&lt;Proc:0x00000006ce9bf8@&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb:76 (lambda)&gt;, @data=&quot;&lt;!DOCTYPE html&gt;\\n&lt;html&gt;\\n  &lt;head&gt;\\n    &lt;meta charset=\\&quot;UTF-8\\&quot;&gt;\\n    &lt;title&gt;title&lt;&#x2F;title&gt;\\n    &lt;link rel=\\&quot;stylesheet\\&quot; href=\\&quot;stylesheets&#x2F;bootstrap.css\\&quot; type=\\&quot;text&#x2F;css\\&quot;&gt;  \\n  &lt;&#x2F;head&gt;\\n  &lt;body id=\\&quot;page-top\\&quot;&gt;\\n    &lt;h1&gt;Welcome &lt;%=@user.name%&gt;&lt;&#x2F;h1&gt;\\n    &lt;h3&gt;Your Balance: &lt;%=@user.balance%&gt;&lt;&#x2F;h3&gt;\\n\\n  &lt;&#x2F;body&gt;\\n&lt;&#x2F;html&gt;&quot;, @outvar=&quot;@_out_buf&quot;, @engine=#&lt;ERB:0x00000006ce9b30 @safe_level=nil, @src=&quot;#coding:UTF-8\\n@_out_buf = &#x27;&#x27;; @_out_buf.concat \\&quot;&lt;!DOCTYPE html&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;&lt;html&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;  &lt;head&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;    &lt;meta charset=\\\\\\&quot;UTF-8\\\\\\&quot;&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;    &lt;title&gt;title&lt;&#x2F;title&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;    &lt;link rel=\\\\\\&quot;stylesheet\\\\\\&quot; href=\\\\\\&quot;stylesheets&#x2F;bootstrap.css\\\\\\&quot; type=\\\\\\&quot;text&#x2F;css\\\\\\&quot;&gt;  \\\\n\\&quot;\\n; @_out_buf.concat \\&quot;  &lt;&#x2F;head&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;  &lt;body id=\\\\\\&quot;page-top\\\\\\&quot;&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;    &lt;h1&gt;Welcome \\&quot;; @_out_buf.concat((@user.name).to_s); @_out_buf.concat \\&quot;&lt;&#x2F;h1&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;    &lt;h3&gt;Your Balance: \\&quot;; @_out_buf.concat((@user.balance).to_s); @_out_buf.concat \\&quot;&lt;&#x2F;h3&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;  &lt;&#x2F;body&gt;\\\\n\\&quot;\\n; @_out_buf.concat \\&quot;&lt;&#x2F;html&gt;\\&quot;; @_out_buf.force_encoding(__ENCODING__)&quot;, @encoding=#&lt;Encoding:UTF-8&gt;, @filename=nil, @lineno=0&gt;&gt;}&gt;&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :xss_mode=&gt;:block, :nosniff=&gt;true, :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :tracking_key=&gt;:tracking, :encrypt_tracking=&gt;true, :track=&gt;[&quot;HTTP_USER_AGENT&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :authenticity_param=&gt;&quot;authenticity_token&quot;, :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :frame_options=&gt;:sameorigin, :except=&gt;[]}, @frame_options=&quot;SAMEORIGIN&quot;&gt;, @default_options={:path=&gt;&quot;&#x2F;&quot;, :domain=&gt;nil, :expire_after=&gt;nil, :secure=&gt;false, :httponly=&gt;true, :defer=&gt;false, :renew=&gt;false, :sidbits=&gt;128, :secure_random=&gt;SecureRandom, :secret=&gt;&quot;secret&quot;, :coder=&gt;#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;}, @key=&quot;rack.session&quot;, @cookie_only=true, @sidbits=128, @sid_secure=SecureRandom, @sid_length=32&gt;&gt;</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.multiprocess</td>\n           <td class=\"code\"><div>true</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.multithread</td>\n           <td class=\"code\"><div>true</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.request.cookie_hash</td>\n           <td class=\"code\"><div>{&quot;rack.session&quot;=&gt;&quot;BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh\\nNDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG\\nOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1\\nMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7\\nAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5\\nBjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2\\nYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7\\nAEZpBg==\\n--59caaaeccd4a49346c8fbf1ca0891695c674aced&quot;}</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.request.cookie_string</td>\n           <td class=\"code\"><div>rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh%0ANDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG%0AOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1%0AMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2%0AYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7%0AAEZpBg%3D%3D%0A--59caaaeccd4a49346c8fbf1ca0891695c674aced</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.request.query_hash</td>\n           <td class=\"code\"><div>{}</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.request.query_string</td>\n           <td class=\"code\"><div></div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.run_once</td>\n           <td class=\"code\"><div>false</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.session</td>\n           <td class=\"code\"><div>{&quot;session_id&quot;=&gt;&quot;5c1ec1e00bc4fb46668a4616406d71173456b60f34a028bb8de4d3fd86e8a8a7&quot;, &quot;csrf&quot;=&gt;&quot;038b4688e7b68984461b5de12b3531aa&quot;, &quot;tracking&quot;=&gt;{&quot;HTTP_USER_AGENT&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;}, &quot;user_id&quot;=&gt;1}</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.session.options</td>\n           <td class=\"code\"><div>{:path=&gt;&quot;&#x2F;&quot;, :domain=&gt;nil, :expire_after=&gt;nil, :secure=&gt;false, :httponly=&gt;true, :defer=&gt;false, :renew=&gt;false, :sidbits=&gt;128, :secure_random=&gt;SecureRandom, :secret=&gt;&quot;secret&quot;, :coder=&gt;#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;}</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.session.unpacked_cookie_data</td>\n           <td class=\"code\"><div>{&quot;session_id&quot;=&gt;&quot;5c1ec1e00bc4fb46668a4616406d71173456b60f34a028bb8de4d3fd86e8a8a7&quot;, &quot;csrf&quot;=&gt;&quot;038b4688e7b68984461b5de12b3531aa&quot;, &quot;tracking&quot;=&gt;{&quot;HTTP_USER_AGENT&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;}, &quot;user_id&quot;=&gt;1}</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.test</td>\n           <td class=\"code\"><div>true</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.url_scheme</td>\n           <td class=\"code\"><div>http</div></td>\n         </tr>\n         \n         <tr>\n           <td>rack.version</td>\n           <td class=\"code\"><div>[1, 3]</div></td>\n         </tr>\n         \n         <tr>\n           <td>sinatra.accept</td>\n           <td class=\"code\"><div>[#&lt;Sinatra::Request::AcceptEntry:0x00000006d225e8 @entry=&quot;*&#x2F;*&quot;, @type=&quot;*&#x2F;*&quot;, @params={}, @q=1.0&gt;]</div></td>\n         </tr>\n         \n         <tr>\n           <td>sinatra.error</td>\n           <td class=\"code\"><div>#&lt;NoMethodError: undefined method `name&#x27; for #&lt;User:0x00000006cea238&gt;&gt;</div></td>\n         </tr>\n         \n         <tr>\n           <td>sinatra.route</td>\n           <td class=\"code\"><div>GET &#x2F;account</div></td>\n         </tr>\n         \n      </table>\n      <div class=\"clear\"></div>\n    </div> <!-- /RACK ENV -->\n\n    <p id=\"explanation\">You're seeing this error because you have\nenabled the <code>show_exceptions</code> setting.</p>\n  </div> <!-- /WRAP -->\n  </body>\n</html>\n" to include "<h1>Welcome skittles123</h1>"
       Diff:
       @@ -1,2 +1,6692 @@
       -<h1>Welcome skittles123</h1>
       +<!DOCTYPE html>
       +<html>
       +<head>
       +  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       +  <title>NoMethodError at &#x2F;account</title>
       +
       +  <script type="text/javascript">
       +  //<!--
       +  function toggle(id) {
       +    var pre  = document.getElementById("pre-" + id);
       +    var post = document.getElementById("post-" + id);
       +    var context = document.getElementById("context-" + id);
       +
       +    if (pre.style.display == 'block') {
       +      pre.style.display = 'none';
       +      post.style.display = 'none';
       +      context.style.background = "none";
       +    } else {
       +      pre.style.display = 'block';
       +      post.style.display = 'block';
       +      context.style.background = "#fffed9";
       +    }
       +  }
       +
       +  function toggleBacktrace(){
       +    var bt = document.getElementById("backtrace");
       +    var toggler = document.getElementById("expando");
       +
       +    if (bt.className == 'condensed') {
       +      bt.className = 'expanded';
       +      toggler.innerHTML = "(condense)";
       +    } else {
       +      bt.className = 'condensed';
       +      toggler.innerHTML = "(expand)";
       +    }
       +  }
       +  //-->
       +  </script>
       +
       +<style type="text/css" media="screen">
       +  *                   {margin: 0; padding: 0; border: 0; outline: 0;}
       +  div.clear           {clear: both;}
       +  body                {background: #EEEEEE; margin: 0; padding: 0;
       +                       font-family: 'Lucida Grande', 'Lucida Sans Unicode',
       +                       'Garuda';}
       +  code                {font-family: 'Lucida Console', monospace;
       +                       font-size: 12px;}
       +  li                  {height: 18px;}
       +  ul                  {list-style: none; margin: 0; padding: 0;}
       +  ol:hover            {cursor: pointer;}
       +  ol li               {white-space: pre;}
       +  #explanation        {font-size: 12px; color: #666666;
       +                       margin: 20px 0 0 100px;}
       +/* WRAP */
       +  #wrap               {width: 1000px; background: #FFFFFF; margin: 0 auto;
       +                       padding: 30px 50px 20px 50px;
       +                       border-left: 1px solid #DDDDDD;
       +                       border-right: 1px solid #DDDDDD;}
       +/* HEADER */
       +  #header             {margin: 0 auto 25px auto;}
       +  #header img         {float: left;}
       +  #header #summary    {float: left; margin: 12px 0 0 20px; width:660px;
       +                       font-family: 'Lucida Grande', 'Lucida Sans Unicode';}
       +  h1                  {margin: 0; font-size: 36px; color: #981919;}
       +  h2                  {margin: 0; font-size: 22px; color: #333333;}
       +  #header ul          {margin: 0; font-size: 12px; color: #666666;}
       +  #header ul li strong{color: #444444;}
       +  #header ul li       {display: inline; padding: 0 10px;}
       +  #header ul li.first {padding-left: 0;}
       +  #header ul li.last  {border: 0; padding-right: 0;}
       +/* BODY */
       +  #backtrace,
       +  #get,
       +  #post,
       +  #cookies,
       +  #rack               {width: 980px; margin: 0 auto 10px auto;}
       +  p#nav               {float: right; font-size: 14px;}
       +/* BACKTRACE */
       +  a#expando           {float: left; padding-left: 5px; color: #666666;
       +                      font-size: 14px; text-decoration: none; cursor: pointer;}
       +  a#expando:hover     {text-decoration: underline;}
       +  h3                  {float: left; width: 100px; margin-bottom: 10px;
       +                       color: #981919; font-size: 14px; font-weight: bold;}
       +  #nav a              {color: #666666; text-decoration: none; padding: 0 5px;}
       +  #backtrace li.frame-info {background: #f7f7f7; padding-left: 10px;
       +                           font-size: 12px; color: #333333;}
       +  #backtrace ul       {list-style-position: outside; border: 1px solid #E9E9E9;
       +                       border-bottom: 0;}
       +  #backtrace ol       {width: 920px; margin-left: 50px;
       +                       font: 10px 'Lucida Console', monospace; color: #666666;}
       +  #backtrace ol li    {border: 0; border-left: 1px solid #E9E9E9;
       +                       padding: 2px 0;}
       +  #backtrace ol code  {font-size: 10px; color: #555555; padding-left: 5px;}
       +  #backtrace-ul li    {border-bottom: 1px solid #E9E9E9; height: auto;
       +                       padding: 3px 0;}
       +  #backtrace-ul .code {padding: 6px 0 4px 0;}
       +  #backtrace.condensed .system,
       +  #backtrace.condensed .framework {display:none;}
       +/* REQUEST DATA */
       +  p.no-data           {padding-top: 2px; font-size: 12px; color: #666666;}
       +  table.req           {width: 980px; text-align: left; font-size: 12px;
       +                       color: #666666; padding: 0; border-spacing: 0;
       +                       border: 1px solid #EEEEEE; border-bottom: 0;
       +                       border-left: 0;
       +                       clear:both}
       +  table.req tr th     {padding: 2px 10px; font-weight: bold;
       +                       background: #F7F7F7; border-bottom: 1px solid #EEEEEE;
       +                       border-left: 1px solid #EEEEEE;}
       +  table.req tr td     {padding: 2px 20px 2px 10px;
       +                       border-bottom: 1px solid #EEEEEE;
       +                       border-left: 1px solid #EEEEEE;}
       +/* HIDE PRE/POST CODE AT START */
       +  .pre-context,
       +  .post-context       {display: none;}
       +
       +  table td.code       {width:750px}
       +  table td.code div   {width:750px;overflow:hidden}
       +</style>
       +</head>
       +<body>
       +  <div id="wrap">
       +    <div id="header">
       +      <img src="/__sinatra__/500.png" alt="application error" height="161" width="313" />
       +      <div id="summary">
       +        <h1><strong>NoMethodError</strong> at <strong>&#x2F;account
       +          </strong></h1>
       +        <h2>undefined method `name&#x27; for #&lt;User:0x00000006cea238&gt;</h2>
       +        <ul>
       +          <li class="first"><strong>file:</strong> <code>
       +            attribute_methods.rb</code></li>
       +          <li><strong>location:</strong> <code>method_missing
       +            </code></li>
       +          <li class="last"><strong>line:
       +            </strong> 433</li>
       +        </ul>
       +      </div>
       +      <div class="clear"></div>
       +    </div>
       +
       +    <div id="backtrace" class='condensed'>
       +      <h3>BACKTRACE</h3>
       +      <p><a href="#" id="expando"
       +            onclick="toggleBacktrace(); return false">(expand)</a></p>
       +      <p id="nav"><strong>JUMP TO:</strong>
       +         <a href="#get-info">GET</a>
       +         <a href="#post-info">POST</a>
       +         <a href="#cookie-info">COOKIES</a>
       +         <a href="#env-info">ENV</a>
       +      </p>
       +      <div class="clear"></div>
       +
       +      <ul id="backtrace-ul">
       +
       +      
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;activemodel-4.2.5&#x2F;lib&#x2F;active_model&#x2F;attribute_methods.rb</code> in
       +                <code><strong>method_missing</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="426"
       +                  class="pre-context" id="pre-1"
       +                  onclick="toggle(1);">
       +                
       +                <li class="pre-context-line"><code>    # class belonging to the +clients+ table with a +master_id+ foreign key
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # can instantiate master through &lt;tt&gt;Client#master&lt;&#x2F;tt&gt;.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def method_missing(method, *args, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if respond_to_without_attributes?(method, true)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        super
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      else
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        match = match_attribute_method?(method.to_s)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="433" class="context" id="1"
       +                  onclick="toggle(1);">
       +                <li class="context-line" id="context-1"><code>        match ? attribute_missing(match, *args, &amp;block) : super</code></li>
       +              </ol>
       +
       +              
       +              <ol start="434" class="post-context"
       +                  id="post-1" onclick="toggle(1);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # +attribute_missing+ is like +method_missing+, but for attributes. When
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # +method_missing+ is called we check to see if there is a matching
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # attribute method. If so, we tell +attribute_missing+ to dispatch the
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # attribute. This method can be overloaded to customize the behavior.
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info app">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;account.erb</code> in
       +                <code><strong>block in singleton class</strong></code>
       +            </li>
       +
       +            <li class="code app">
       +              
       +              <ol start="2"
       +                  class="pre-context" id="pre-2"
       +                  onclick="toggle(2);">
       +                
       +                <li class="pre-context-line"><code>&lt;html&gt;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  &lt;head&gt;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    &lt;meta charset=&quot;UTF-8&quot;&gt;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    &lt;title&gt;title&lt;&#x2F;title&gt;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    &lt;link rel=&quot;stylesheet&quot; href=&quot;stylesheets&#x2F;bootstrap.css&quot; type=&quot;text&#x2F;css&quot;&gt;  
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  &lt;&#x2F;head&gt;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  &lt;body id=&quot;page-top&quot;&gt;
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="9" class="context" id="2"
       +                  onclick="toggle(2);">
       +                <li class="context-line" id="context-2"><code>    &lt;h1&gt;Welcome &lt;%=@user.name%&gt;&lt;&#x2F;h1&gt;</code></li>
       +              </ol>
       +
       +              
       +              <ol start="10" class="post-context"
       +                  id="post-2" onclick="toggle(2);">
       +                
       +                <li class="post-context-line"><code>    &lt;h3&gt;Your Balance: &lt;%=@user.balance%&gt;&lt;&#x2F;h3&gt;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  &lt;&#x2F;body&gt;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>&lt;&#x2F;html&gt;</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="148"
       +                  class="pre-context" id="pre-3"
       +                  onclick="toggle(3);">
       +                
       +                <li class="pre-context-line"><code>    # evaluation is guaranteed to be performed in the scope object with the
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # locals specified and with support for yielding to the block.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # This method is only used by source generating templates. Subclasses that
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # override render() may not support all features.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def evaluate(scope, locals, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      method = compiled_method(locals.keys)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="155" class="context" id="3"
       +                  onclick="toggle(3);">
       +                <li class="context-line" id="context-3"><code>      method.bind(scope).call(locals, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="156" class="post-context"
       +                  id="post-3" onclick="toggle(3);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # Generates all template source by combining the preamble, template, and
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # postamble and returns a two-tuple of the form: [source, offset], where
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # source is the string containing (Ruby) source code for the template and
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # offset is the integer line offset where line reporting should begin.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    #
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in
       +                <code><strong>evaluate</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="148"
       +                  class="pre-context" id="pre-4"
       +                  onclick="toggle(4);">
       +                
       +                <li class="pre-context-line"><code>    # evaluation is guaranteed to be performed in the scope object with the
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # locals specified and with support for yielding to the block.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # This method is only used by source generating templates. Subclasses that
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # override render() may not support all features.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def evaluate(scope, locals, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      method = compiled_method(locals.keys)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="155" class="context" id="4"
       +                  onclick="toggle(4);">
       +                <li class="context-line" id="context-4"><code>      method.bind(scope).call(locals, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="156" class="post-context"
       +                  id="post-4" onclick="toggle(4);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # Generates all template source by combining the preamble, template, and
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # postamble and returns a two-tuple of the form: [source, offset], where
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # source is the string containing (Ruby) source code for the template and
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # offset is the integer line offset where line reporting should begin.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    #
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb</code> in
       +                <code><strong>render</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="89"
       +                  class="pre-context" id="pre-5"
       +                  onclick="toggle(5);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Render the template in the given scope with the locals specified. If a
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # block is given, it is typically available within the template via
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # +yield+.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def render(scope=Object.new, locals={}, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      current_template = Thread.current[:tilt_current_template]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Thread.current[:tilt_current_template] = self
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="96" class="context" id="5"
       +                  onclick="toggle(5);">
       +                <li class="context-line" id="context-5"><code>      evaluate(scope, locals || {}, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="97" class="post-context"
       +                  id="post-5" onclick="toggle(5);">
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      Thread.current[:tilt_current_template] = current_template
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # The basename of the template file.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def basename(suffix=&#x27;&#x27;)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      File.basename(file, suffix) if file
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>render</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="815"
       +                  class="pre-context" id="pre-6"
       +                  onclick="toggle(6);">
       +                
       +                <li class="pre-context-line"><code>      options[:default_encoding] ||= settings.default_encoding
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # compile and render template
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        layout_was      = @default_layout
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        @default_layout = false
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        template        = compile_template(engine, data, options, views)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="822" class="context" id="6"
       +                  onclick="toggle(6);">
       +                <li class="context-line" id="context-6"><code>        output          = template.render(scope, locals, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="823" class="post-context"
       +                  id="post-6" onclick="toggle(6);">
       +                
       +                <li class="post-context-line"><code>      ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        @default_layout = layout_was
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # render layout
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if layout
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        options = options.merge(:views =&gt; views, :layout =&gt; false, :eat_errors =&gt; eat_errors, :scope =&gt; scope).
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>erb</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="659"
       +                  class="pre-context" id="pre-7"
       +                  onclick="toggle(7);">
       +                
       +                <li class="pre-context-line"><code>    def initialize
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      super
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @default_layout = :layout
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @preferred_extension = nil
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def erb(template, options = {}, locals = {}, &amp;block)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="666" class="context" id="7"
       +                  onclick="toggle(7);">
       +                <li class="context-line" id="context-7"><code>      render(:erb, template, options, locals, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="667" class="post-context"
       +                  id="post-7" onclick="toggle(7);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def erubis(template, options = {}, locals = {})
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      warn &quot;Sinatra::Templates#erubis is deprecated and will be removed, use #erb instead.\n&quot; \
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        &quot;If you have Erubis installed, it will be used automatically.&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      render :erubis, template, options, locals
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info app">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;application_controller.rb</code> in
       +                <code><strong>block in &lt;class:ApplicationController&gt;</strong></code>
       +            </li>
       +
       +            <li class="code app">
       +              
       +              <ol start="20"
       +                  class="pre-context" id="pre-8"
       +                  onclick="toggle(8);">
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  get &#x27;&#x2F;account&#x27; do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # binding.pry
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    if Helpers.is_logged_in?(session)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @user = Helpers.current_user(session)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="27" class="context" id="8"
       +                  onclick="toggle(8);">
       +                <li class="context-line" id="context-8"><code>      erb :&#x27;account&#x27;</code></li>
       +              </ol>
       +
       +              
       +              <ol start="28" class="post-context"
       +                  id="post-8" onclick="toggle(8);">
       +                
       +                <li class="post-context-line"><code>    else 
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      erb :error
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  get &#x27;&#x2F;logout&#x27; do
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    session.clear
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1603"
       +                  class="pre-context" id="pre-9"
       +                  onclick="toggle(9);">
       +                
       +                <li class="pre-context-line"><code>        method_name             = &quot;#{verb} #{path}&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unbound_method          = generate_method(method_name, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        pattern, keys           = compile path
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        conditions, @conditions = @conditions, []
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        wrapper                 = block.arity != 0 ?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          proc { |a,p| unbound_method.bind(a).call(*p) } :
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1610" class="context" id="9"
       +                  onclick="toggle(9);">
       +                <li class="context-line" id="context-9"><code>          proc { |a,p| unbound_method.bind(a).call }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1611" class="post-context"
       +                  id="post-9" onclick="toggle(9);">
       +                
       +                <li class="post-context-line"><code>        wrapper.instance_variable_set(:@route_name, method_name)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        [ pattern, keys, conditions, wrapper ]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def compile(path)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if path.respond_to? :to_str
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in compile!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1603"
       +                  class="pre-context" id="pre-10"
       +                  onclick="toggle(10);">
       +                
       +                <li class="pre-context-line"><code>        method_name             = &quot;#{verb} #{path}&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unbound_method          = generate_method(method_name, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        pattern, keys           = compile path
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        conditions, @conditions = @conditions, []
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        wrapper                 = block.arity != 0 ?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          proc { |a,p| unbound_method.bind(a).call(*p) } :
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1610" class="context" id="10"
       +                  onclick="toggle(10);">
       +                <li class="context-line" id="context-10"><code>          proc { |a,p| unbound_method.bind(a).call }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1611" class="post-context"
       +                  id="post-10" onclick="toggle(10);">
       +                
       +                <li class="post-context-line"><code>        wrapper.instance_variable_set(:@route_name, method_name)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        [ pattern, keys, conditions, wrapper ]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def compile(path)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if path.respond_to? :to_str
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block (3 levels) in route!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="967"
       +                  class="pre-context" id="pre-11"
       +                  onclick="toggle(11);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run routes defined on the class and all superclasses.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route!(base = settings, pass_block = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if routes = base.routes[@request.request_method]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        routes.each do |pattern, keys, conditions, block|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="974" class="context" id="11"
       +                  onclick="toggle(11);">
       +                <li class="context-line" id="context-11"><code>            route_eval { block[*args] }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="975" class="post-context"
       +                  id="post-11" onclick="toggle(11);">
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # don&#x27;t wipe out pass_block in superclass
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          pass_block = returned_pass_block if returned_pass_block
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>route_eval</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="986"
       +                  class="pre-context" id="pre-12"
       +                  onclick="toggle(12);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      route_eval(&amp;pass_block) if pass_block
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      route_missing
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run a route block and throw :halt with the result.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route_eval
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="993" class="context" id="12"
       +                  onclick="toggle(12);">
       +                <li class="context-line" id="context-12"><code>      throw :halt, yield</code></li>
       +              </ol>
       +
       +              
       +              <ol start="994" class="post-context"
       +                  id="post-12" onclick="toggle(12);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # If the current request matches pattern and conditions, fill params
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # with keys and call the given block.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # Revert params afterwards.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # Returns pass block.
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block (2 levels) in route!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="967"
       +                  class="pre-context" id="pre-13"
       +                  onclick="toggle(13);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run routes defined on the class and all superclasses.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route!(base = settings, pass_block = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if routes = base.routes[@request.request_method]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        routes.each do |pattern, keys, conditions, block|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="974" class="context" id="13"
       +                  onclick="toggle(13);">
       +                <li class="context-line" id="context-13"><code>            route_eval { block[*args] }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="975" class="post-context"
       +                  id="post-13" onclick="toggle(13);">
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # don&#x27;t wipe out pass_block in superclass
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          pass_block = returned_pass_block if returned_pass_block
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in process_route</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1007"
       +                  class="pre-context" id="pre-14"
       +                  onclick="toggle(14);">
       +                
       +                <li class="pre-context-line"><code>      if values.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      catch(:pass) do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1014" class="context" id="14"
       +                  onclick="toggle(14);">
       +                <li class="context-line" id="context-14"><code>        block ? block[self, values] : yield(self, values)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1015" class="post-context"
       +                  id="post-14" onclick="toggle(14);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @params = original if original
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # No matching route was found or all routes passed. The default
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # implementation is to forward the request downstream when running
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>catch</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1005"
       +                  class="pre-context" id="pre-15"
       +                  onclick="toggle(15);">
       +                
       +                <li class="pre-context-line"><code>      values += match.captures.map! { |v| force_encoding URI_INSTANCE.unescape(v) if v }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if values.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1012" class="context" id="15"
       +                  onclick="toggle(15);">
       +                <li class="context-line" id="context-15"><code>      catch(:pass) do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1013" class="post-context"
       +                  id="post-15" onclick="toggle(15);">
       +                
       +                <li class="post-context-line"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        block ? block[self, values] : yield(self, values)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @params = original if original
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>process_route</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1005"
       +                  class="pre-context" id="pre-16"
       +                  onclick="toggle(16);">
       +                
       +                <li class="pre-context-line"><code>      values += match.captures.map! { |v| force_encoding URI_INSTANCE.unescape(v) if v }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if values.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        original, @params = params, params.merge(&#x27;splat&#x27; =&gt; [], &#x27;captures&#x27; =&gt; values)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        keys.zip(values) { |k,v| Array === @params[k] ? @params[k] &lt;&lt; v : @params[k] = v if v }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1012" class="context" id="16"
       +                  onclick="toggle(16);">
       +                <li class="context-line" id="context-16"><code>      catch(:pass) do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1013" class="post-context"
       +                  id="post-16" onclick="toggle(16);">
       +                
       +                <li class="post-context-line"><code>        conditions.each { |c| throw :pass if c.bind(self).call == false }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        block ? block[self, values] : yield(self, values)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @params = original if original
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in route!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="965"
       +                  class="pre-context" id="pre-17"
       +                  onclick="toggle(17);">
       +                
       +                <li class="pre-context-line"><code>      base.filters[type].each { |args| process_route(*args) }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run routes defined on the class and all superclasses.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route!(base = settings, pass_block = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if routes = base.routes[@request.request_method]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        routes.each do |pattern, keys, conditions, block|
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="972" class="context" id="17"
       +                  onclick="toggle(17);">
       +                <li class="context-line" id="context-17"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="973" class="post-context"
       +                  id="post-17" onclick="toggle(17);">
       +                
       +                <li class="post-context-line"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            route_eval { block[*args] }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # don&#x27;t wipe out pass_block in superclass
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          pass_block = returned_pass_block if returned_pass_block
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>each</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="964"
       +                  class="pre-context" id="pre-18"
       +                  onclick="toggle(18);">
       +                
       +                <li class="pre-context-line"><code>      filter! type, base.superclass if base.superclass.respond_to?(:filters)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      base.filters[type].each { |args| process_route(*args) }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run routes defined on the class and all superclasses.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route!(base = settings, pass_block = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if routes = base.routes[@request.request_method]
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="971" class="context" id="18"
       +                  onclick="toggle(18);">
       +                <li class="context-line" id="context-18"><code>        routes.each do |pattern, keys, conditions, block|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="972" class="post-context"
       +                  id="post-18" onclick="toggle(18);">
       +                
       +                <li class="post-context-line"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            route_eval { block[*args] }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # don&#x27;t wipe out pass_block in superclass
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          pass_block = returned_pass_block if returned_pass_block
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>route!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="964"
       +                  class="pre-context" id="pre-19"
       +                  onclick="toggle(19);">
       +                
       +                <li class="pre-context-line"><code>      filter! type, base.superclass if base.superclass.respond_to?(:filters)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      base.filters[type].each { |args| process_route(*args) }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run routes defined on the class and all superclasses.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def route!(base = settings, pass_block = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      if routes = base.routes[@request.request_method]
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="971" class="context" id="19"
       +                  onclick="toggle(19);">
       +                <li class="context-line" id="context-19"><code>        routes.each do |pattern, keys, conditions, block|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="972" class="post-context"
       +                  id="post-19" onclick="toggle(19);">
       +                
       +                <li class="post-context-line"><code>          returned_pass_block = process_route(pattern, keys, conditions) do |*args|
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            env[&#x27;sinatra.route&#x27;] = block.instance_variable_get(:@route_name)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            route_eval { block[*args] }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # don&#x27;t wipe out pass_block in superclass
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          pass_block = returned_pass_block if returned_pass_block
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in dispatch!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1077"
       +                  class="pre-context" id="pre-20"
       +                  onclick="toggle(20);">
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Dispatch a request with error handling.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def dispatch!
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      invoke do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        static! if settings.static? &amp;&amp; (request.get? || request.head?)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        filter! :before
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1084" class="context" id="20"
       +                  onclick="toggle(20);">
       +                <li class="context-line" id="context-20"><code>        route!</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1085" class="post-context"
       +                  id="post-20" onclick="toggle(20);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    rescue ::Exception =&gt; boom
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      invoke { handle_exception!(boom) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      begin
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        filter! :after unless env[&#x27;sinatra.static_file&#x27;]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      rescue ::Exception =&gt; boom
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in invoke</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-21"
       +                  onclick="toggle(21);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="21"
       +                  onclick="toggle(21);">
       +                <li class="context-line" id="context-21"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-21" onclick="toggle(21);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>catch</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-22"
       +                  onclick="toggle(22);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="22"
       +                  onclick="toggle(22);">
       +                <li class="context-line" id="context-22"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-22" onclick="toggle(22);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>invoke</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-23"
       +                  onclick="toggle(23);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="23"
       +                  onclick="toggle(23);">
       +                <li class="context-line" id="context-23"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-23" onclick="toggle(23);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>dispatch!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1074"
       +                  class="pre-context" id="pre-24"
       +                  onclick="toggle(24);">
       +                
       +                <li class="pre-context-line"><code>        body res
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      nil # avoid double setting the same response tuple twice
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Dispatch a request with error handling.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def dispatch!
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1081" class="context" id="24"
       +                  onclick="toggle(24);">
       +                <li class="context-line" id="context-24"><code>      invoke do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1082" class="post-context"
       +                  id="post-24" onclick="toggle(24);">
       +                
       +                <li class="post-context-line"><code>        static! if settings.static? &amp;&amp; (request.get? || request.head?)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        filter! :before
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        route!
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    rescue ::Exception =&gt; boom
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      invoke { handle_exception!(boom) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    ensure
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in call!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="899"
       +                  class="pre-context" id="pre-25"
       +                  onclick="toggle(25);">
       +                
       +                <li class="pre-context-line"><code>      @request  = Request.new(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @response = Response.new
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @params   = indifferent_params(@request.params)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      template_cache.clear if settings.reload_templates
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      force_encoding(@params)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @response[&#x27;Content-Type&#x27;] = nil
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="906" class="context" id="25"
       +                  onclick="toggle(25);">
       +                <li class="context-line" id="context-25"><code>      invoke { dispatch! }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="907" class="post-context"
       +                  id="post-25" onclick="toggle(25);">
       +                
       +                <li class="post-context-line"><code>      invoke { error_block!(response.status) } unless @env[&#x27;sinatra.error&#x27;]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      unless @response[&#x27;Content-Type&#x27;]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if Array === body and body[0].respond_to? :content_type
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          content_type body[0].content_type
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        else
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          content_type :html
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in invoke</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-26"
       +                  onclick="toggle(26);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="26"
       +                  onclick="toggle(26);">
       +                <li class="context-line" id="context-26"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-26" onclick="toggle(26);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>catch</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-27"
       +                  onclick="toggle(27);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="27"
       +                  onclick="toggle(27);">
       +                <li class="context-line" id="context-27"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-27" onclick="toggle(27);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>invoke</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1059"
       +                  class="pre-context" id="pre-28"
       +                  onclick="toggle(28);">
       +                
       +                <li class="pre-context-line"><code>    # Creates a Hash with indifferent access.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def indifferent_hash
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Run the block with &#x27;throw :halt&#x27; support and apply result to the response.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def invoke
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1066" class="context" id="28"
       +                  onclick="toggle(28);">
       +                <li class="context-line" id="context-28"><code>      res = catch(:halt) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1067" class="post-context"
       +                  id="post-28" onclick="toggle(28);">
       +                
       +                <li class="post-context-line"><code>      res = [res] if Fixnum === res or String === res
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if Array === res and Fixnum === res.first
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        res = res.dup
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status(res.shift)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        body(res.pop)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers(*res)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      elsif res.respond_to? :each
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call!</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="899"
       +                  class="pre-context" id="pre-29"
       +                  onclick="toggle(29);">
       +                
       +                <li class="pre-context-line"><code>      @request  = Request.new(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @response = Response.new
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @params   = indifferent_params(@request.params)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      template_cache.clear if settings.reload_templates
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      force_encoding(@params)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @response[&#x27;Content-Type&#x27;] = nil
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="906" class="context" id="29"
       +                  onclick="toggle(29);">
       +                <li class="context-line" id="context-29"><code>      invoke { dispatch! }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="907" class="post-context"
       +                  id="post-29" onclick="toggle(29);">
       +                
       +                <li class="post-context-line"><code>      invoke { error_block!(response.status) } unless @env[&#x27;sinatra.error&#x27;]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      unless @response[&#x27;Content-Type&#x27;]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if Array === body and body[0].respond_to? :content_type
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          content_type body[0].content_type
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        else
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          content_type :html
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="887"
       +                  class="pre-context" id="pre-30"
       +                  onclick="toggle(30);">
       +                
       +                <li class="pre-context-line"><code>      @app = app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @template_cache = Tilt::Cache.new
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      yield self if block_given?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Rack call interface.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="894" class="context" id="30"
       +                  onclick="toggle(30);">
       +                <li class="context-line" id="context-30"><code>      dup.call!(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="895" class="post-context"
       +                  id="post-30" onclick="toggle(30);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def call!(env) # :nodoc:
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @env      = env
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @request  = Request.new(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @response = Response.new
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @params   = indifferent_params(@request.params)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;xss_header.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="11"
       +                  class="pre-context" id="pre-31"
       +                  onclick="toggle(31);">
       +                
       +                <li class="pre-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Options:
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # xss_mode:: How the browser should prevent the attack (default: :block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    class XSSHeader &lt; Base
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      default_options :xss_mode =&gt; :block, :nosniff =&gt; true
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="18" class="context" id="31"
       +                  onclick="toggle(31);">
       +                <li class="context-line" id="context-31"><code>        status, headers, body = @app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="19" class="post-context"
       +                  id="post-31" onclick="toggle(31);">
       +                
       +                <li class="post-context-line"><code>        headers[&#x27;X-XSS-Protection&#x27;]       ||= &quot;1; mode=#{options[:xss_mode]}&quot; if html? headers
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        headers[&#x27;X-Content-Type-Options&#x27;] ||= &#x27;nosniff&#x27;                       if options[:nosniff]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        [status, headers, body]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="42"
       +                  class="pre-context" id="pre-32"
       +                  onclick="toggle(32);">
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unless accepts? env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          instrument env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result = react env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="49" class="context" id="32"
       +                  onclick="toggle(32);">
       +                <li class="context-line" id="context-32"><code>        result or app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="50" class="post-context"
       +                  id="post-32" onclick="toggle(32);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def react(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result = send(options[:reaction], env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result if Array === result and result.size == 3
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="42"
       +                  class="pre-context" id="pre-33"
       +                  onclick="toggle(33);">
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unless accepts? env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          instrument env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result = react env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="49" class="context" id="33"
       +                  onclick="toggle(33);">
       +                <li class="context-line" id="context-33"><code>        result or app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="50" class="post-context"
       +                  id="post-33" onclick="toggle(33);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def react(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result = send(options[:reaction], env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result if Array === result and result.size == 3
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;path_traversal.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="9"
       +                  class="pre-context" id="pre-34"
       +                  onclick="toggle(34);">
       +                
       +                <li class="pre-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Unescapes &#x27;&#x2F;&#x27; and &#x27;.&#x27;, expands +path_info+.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # Thus &lt;tt&gt;GET &#x2F;foo&#x2F;%2e%2e%2fbar&lt;&#x2F;tt&gt; becomes &lt;tt&gt;GET &#x2F;bar&lt;&#x2F;tt&gt;.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    class PathTraversal &lt; Base
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        path_was         = env[&quot;PATH_INFO&quot;]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        env[&quot;PATH_INFO&quot;] = cleanup path_was if path_was &amp;&amp; !path_was.empty?
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="16" class="context" id="34"
       +                  onclick="toggle(34);">
       +                <li class="context-line" id="context-34"><code>        app.call env</code></li>
       +              </ol>
       +
       +              
       +              <ol start="17" class="post-context"
       +                  id="post-34" onclick="toggle(34);">
       +                
       +                <li class="post-context-line"><code>      ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        env[&quot;PATH_INFO&quot;] = path_was
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def cleanup(path)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if path.respond_to?(:encoding)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          # Ruby 1.9+ M17N
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;json_csrf.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="11"
       +                  class="pre-context" id="pre-35"
       +                  onclick="toggle(35);">
       +                
       +                <li class="pre-context-line"><code>    # Array prototype has been patched to track data. Checks the referrer
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    # even on GET requests if the content type is JSON.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    class JsonCsrf &lt; Base
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      alias react deny
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        request               = Request.new(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="18" class="context" id="35"
       +                  onclick="toggle(35);">
       +                <li class="context-line" id="context-35"><code>        status, headers, body = app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="19" class="post-context"
       +                  id="post-35" onclick="toggle(35);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if has_vector? request, headers
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          warn env, &quot;attack prevented by #{self.class}&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          react(env) or [status, headers, body]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        else
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          [status, headers, body]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="42"
       +                  class="pre-context" id="pre-36"
       +                  onclick="toggle(36);">
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unless accepts? env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          instrument env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result = react env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="49" class="context" id="36"
       +                  onclick="toggle(36);">
       +                <li class="context-line" id="context-36"><code>        result or app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="50" class="post-context"
       +                  id="post-36" onclick="toggle(36);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def react(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result = send(options[:reaction], env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result if Array === result and result.size == 3
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="42"
       +                  class="pre-context" id="pre-37"
       +                  onclick="toggle(37);">
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        unless accepts? env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          instrument env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result = react env
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="49" class="context" id="37"
       +                  onclick="toggle(37);">
       +                <li class="context-line" id="context-37"><code>        result or app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="50" class="post-context"
       +                  id="post-37" onclick="toggle(37);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def react(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result = send(options[:reaction], env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        result if Array === result and result.size == 3
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-protection-1.5.3&#x2F;lib&#x2F;rack&#x2F;protection&#x2F;frame_options.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="24"
       +                  class="pre-context" id="pre-38"
       +                  onclick="toggle(38);">
       +                
       +                <li class="pre-context-line"><code>          frame_options = options[:frame_options]
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          frame_options = options[:frame_options].to_s.upcase unless frame_options.respond_to? :to_str
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          frame_options.to_str
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="31" class="context" id="38"
       +                  onclick="toggle(38);">
       +                <li class="context-line" id="context-38"><code>        status, headers, body        = @app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="32" class="post-context"
       +                  id="post-38" onclick="toggle(38);">
       +                
       +                <li class="post-context-line"><code>        headers[&#x27;X-Frame-Options&#x27;] ||= frame_options if html? headers
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        [status, headers, body]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;session&#x2F;abstract&#x2F;id.rb</code> in
       +                <code><strong>context</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="218"
       +                  class="pre-context" id="pre-39"
       +                  onclick="toggle(39);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          context(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        def context(env, app=@app)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          prepare_session(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="225" class="context" id="39"
       +                  onclick="toggle(39);">
       +                <li class="context-line" id="context-39"><code>          status, headers, body = app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="226" class="post-context"
       +                  id="post-39" onclick="toggle(39);">
       +                
       +                <li class="post-context-line"><code>          commit_session(env, status, headers, body)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        def initialize_sid
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          @sidbits = @default_options[:sidbits]
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;session&#x2F;abstract&#x2F;id.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="213"
       +                  class="pre-context" id="pre-40"
       +                  onclick="toggle(40);">
       +                
       +                <li class="pre-context-line"><code>          @default_options = self.class::DEFAULT_OPTIONS.merge(options)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @key = @default_options.delete(:key)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @cookie_only = @default_options.delete(:cookie_only)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          initialize_sid
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="220" class="context" id="40"
       +                  onclick="toggle(40);">
       +                <li class="context-line" id="context-40"><code>          context(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="221" class="post-context"
       +                  id="post-40" onclick="toggle(40);">
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        def context(env, app=@app)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          prepare_session(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          status, headers, body = app.call(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          commit_session(env, status, headers, body)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;nulllogger.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="2"
       +                  class="pre-context" id="pre-41"
       +                  onclick="toggle(41);">
       +                
       +                <li class="pre-context-line"><code>  class NullLogger
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def initialize(app)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @app = app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def call(env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      env[&#x27;rack.logger&#x27;] = self
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="9" class="context" id="41"
       +                  onclick="toggle(41);">
       +                <li class="context-line" id="context-41"><code>      @app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="10" class="post-context"
       +                  id="post-41" onclick="toggle(41);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def info(progname = nil, &amp;block); end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def debug(progname = nil, &amp;block); end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def warn(progname = nil, &amp;block); end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def error(progname = nil, &amp;block); end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def fatal(progname = nil, &amp;block); end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-1.6.4&#x2F;lib&#x2F;rack&#x2F;head.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="6"
       +                  class="pre-context" id="pre-42"
       +                  onclick="toggle(42);">
       +                
       +                <li class="pre-context-line"><code>  # Rack::Head returns an empty body for all HEAD requests. It leaves
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  # all other requests unchanged.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  def initialize(app)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    @app = app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="13" class="context" id="42"
       +                  onclick="toggle(42);">
       +                <li class="context-line" id="context-42"><code>    status, headers, body = @app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="14" class="post-context"
       +                  id="post-42" onclick="toggle(42);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    if env[REQUEST_METHOD] == HEAD
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      [
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        status, headers, Rack::BodyProxy.new([]) do
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          body.close if body.respond_to? :close
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      ]
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;show_exceptions.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="14"
       +                  class="pre-context" id="pre-43"
       +                  onclick="toggle(43);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def initialize(app)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @app      = app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @template = ERB.new(TEMPLATE)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="21" class="context" id="43"
       +                  onclick="toggle(43);">
       +                <li class="context-line" id="context-43"><code>      @app.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="22" class="post-context"
       +                  id="post-43" onclick="toggle(43);">
       +                
       +                <li class="post-context-line"><code>    rescue Exception =&gt; e
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      errors, env[&quot;rack.errors&quot;] = env[&quot;rack.errors&quot;], @@eats_errors
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      if prefers_plain_text?(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        content_type = &quot;text&#x2F;plain&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        exception_string = dump_exception(e)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      else
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="174"
       +                  class="pre-context" id="pre-44"
       +                  onclick="toggle(44);">
       +                
       +                <li class="pre-context-line"><code>  # Some Rack handlers (Thin, Rainbows!) implement an extended body object protocol, however,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  # some middleware (namely Rack::Lint) will break it by not mirroring the methods in question.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  # This middleware will detect an extended body object and will make sure it reaches the
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  # handler directly. We do this here, so our middleware and middleware set up by the app will
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  # still be able to run.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  class ExtendedRack &lt; Struct.new(:app)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="181" class="context" id="44"
       +                  onclick="toggle(44);">
       +                <li class="context-line" id="context-44"><code>      result, callback = app.call(env), env[&#x27;async.callback&#x27;]</code></li>
       +              </ol>
       +
       +              
       +              <ol start="182" class="post-context"
       +                  id="post-44" onclick="toggle(44);">
       +                
       +                <li class="post-context-line"><code>      return result unless callback and async?(*result)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      after_response { callback.call result }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      setup_close(env, *result)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      throw :async
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="2014"
       +                  class="pre-context" id="pre-45"
       +                  onclick="toggle(45);">
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def helpers
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @instance
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="2021" class="context" id="45"
       +                  onclick="toggle(45);">
       +                <li class="context-line" id="context-45"><code>      @stack.call(env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="2022" class="post-context"
       +                  id="post-45" onclick="toggle(45);">
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def inspect
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      &quot;#&lt;#{@instance.class} app_file=#{settings.app_file.inspect}&gt;&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>block in call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1479"
       +                  class="pre-context" id="pre-46"
       +                  onclick="toggle(46);">
       +                
       +                <li class="pre-context-line"><code>        setup_default_middleware builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        setup_middleware builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        builder.run app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1486" class="context" id="46"
       +                  onclick="toggle(46);">
       +                <li class="context-line" id="context-46"><code>        synchronize { prototype.call(env) }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1487" class="post-context"
       +                  id="post-46" onclick="toggle(46);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Like Kernel#caller but excluding certain magic entries and without
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # line &#x2F; method information; the resulting array contains filenames only.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def caller_files
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        cleaned_caller(1).flatten
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>synchronize</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1788"
       +                  class="pre-context" id="pre-47"
       +                  onclick="toggle(47);">
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @@mutex = Mutex.new
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def synchronize(&amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        if lock?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @@mutex.synchronize(&amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        else
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1795" class="context" id="47"
       +                  onclick="toggle(47);">
       +                <li class="context-line" id="context-47"><code>          yield</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1796" class="post-context"
       +                  id="post-47" onclick="toggle(47);">
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # used for deprecation warnings
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def warn(message)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        super message + &quot;\n\tfrom #{cleaned_caller.first.join(&#x27;:&#x27;)}&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info framework">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;sinatra-1.4.6&#x2F;lib&#x2F;sinatra&#x2F;base.rb</code> in
       +                <code><strong>call</strong></code>
       +            </li>
       +
       +            <li class="code framework">
       +              
       +              <ol start="1479"
       +                  class="pre-context" id="pre-48"
       +                  onclick="toggle(48);">
       +                
       +                <li class="pre-context-line"><code>        setup_default_middleware builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        setup_middleware builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        builder.run app
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        builder
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def call(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1486" class="context" id="48"
       +                  onclick="toggle(48);">
       +                <li class="context-line" id="context-48"><code>        synchronize { prototype.call(env) }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1487" class="post-context"
       +                  id="post-48" onclick="toggle(48);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Like Kernel#caller but excluding certain magic entries and without
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # line &#x2F; method information; the resulting array contains filenames only.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def caller_files
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        cleaned_caller(1).flatten
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;mock_session.rb</code> in
       +                <code><strong>request</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="23"
       +                  class="pre-context" id="pre-49"
       +                  onclick="toggle(49);">
       +                
       +                <li class="pre-context-line"><code>    def set_cookie(cookie, uri = nil)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      cookie_jar.merge(cookie, uri)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def request(uri, env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      env[&quot;HTTP_COOKIE&quot;] ||= cookie_jar.for(uri)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      @last_request = Rack::Request.new(env)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="30" class="context" id="49"
       +                  onclick="toggle(49);">
       +                <li class="context-line" id="context-49"><code>      status, headers, body = @app.call(@last_request.env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="31" class="post-context"
       +                  id="post-49" onclick="toggle(49);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @last_response = MockResponse.new(status, headers, body, env[&quot;rack.errors&quot;].flush)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      body.close if body.respond_to?(:close)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      cookie_jar.merge(last_response.headers[&quot;Set-Cookie&quot;], uri)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      @after_request.each { |hook| hook.call }
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;test.rb</code> in
       +                <code><strong>process_request</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="237"
       +                  class="pre-context" id="pre-50"
       +                  onclick="toggle(50);">
       +                
       +                <li class="pre-context-line"><code>        Rack::MockRequest.env_for(uri.to_s, env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def process_request(uri, env)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        uri = URI.parse(uri)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        uri.host ||= @default_host
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="244" class="context" id="50"
       +                  onclick="toggle(50);">
       +                <li class="context-line" id="context-50"><code>        @rack_mock_session.request(uri, env)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="245" class="post-context"
       +                  id="post-50" onclick="toggle(50);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        if retry_with_digest_auth?(env)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          auth_env = env.merge({
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            &quot;HTTP_AUTHORIZATION&quot;          =&gt; digest_auth_header,
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            &quot;rack-test.digest_auth_retry&quot; =&gt; true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          })
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          auth_env.delete(&#x27;rack.request&#x27;)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rack-test-0.6.3&#x2F;lib&#x2F;rack&#x2F;test.rb</code> in
       +                <code><strong>get</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="51"
       +                  class="pre-context" id="pre-51"
       +                  onclick="toggle(51);">
       +                
       +                <li class="pre-context-line"><code>      # the app&#x27;s response in #last_response. Yield #last_response to a block
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # if given.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # Example:
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   get &quot;&#x2F;&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def get(uri, params = {}, env = {}, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        env = env_for(uri, env.merge(:method =&gt; &quot;GET&quot;, :params =&gt; params))
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="58" class="context" id="51"
       +                  onclick="toggle(51);">
       +                <li class="context-line" id="context-51"><code>        process_request(uri, env, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="59" class="post-context"
       +                  id="post-51" onclick="toggle(51);">
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Issue a POST request for the given URI. See #get
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Example:
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      #   post &quot;&#x2F;signup&quot;, &quot;name&quot; =&gt; &quot;Bryan&quot;
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def post(uri, params = {}, env = {}, &amp;block)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info app">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;rubies&#x2F;ruby-2.3.3&#x2F;lib&#x2F;ruby&#x2F;2.3.0&#x2F;forwardable.rb</code> in
       +                <code><strong>get</strong></code>
       +            </li>
       +
       +            <li class="code app">
       +              
       +              <ol start="182"
       +                  class="pre-context" id="pre-52"
       +                  onclick="toggle(52);">
       +                
       +                <li class="pre-context-line"><code>    if method_defined?(accessor) || private_method_defined?(accessor)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      accessor = &quot;#{accessor}()&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    line_no = __LINE__; str = %{
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def #{ali}(*args, &amp;block)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="189" class="context" id="52"
       +                  onclick="toggle(52);">
       +                <li class="context-line" id="context-52"><code>          #{accessor}.__send__(:#{method}, *args, &amp;block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="190" class="post-context"
       +                  id="post-52" onclick="toggle(52);">
       +                
       +                <li class="post-context-line"><code>        rescue ::Exception
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          $@.delete_if{|s| ::Forwardable::FILE_REGEXP =~ s} unless ::Forwardable::debug
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          ::Kernel::raise
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # If it&#x27;s not a class or module, it&#x27;s an instance
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info app">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;spec&#x2F;sinatra_logging_in_and_out_spec.rb</code> in
       +                <code><strong>block (3 levels) in &lt;top (required)&gt;</strong></code>
       +            </li>
       +
       +            <li class="code app">
       +              
       +              <ol start="77"
       +                  class="pre-context" id="pre-53"
       +                  onclick="toggle(53);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    it &#x27;displays the account information if a user is logged in&#x27; do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      user1 = User.create(:username =&gt; &quot;skittles123&quot;, :password =&gt; &quot;iluvskittles&quot;, :balance =&gt; 1000)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      params = {
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        &quot;username&quot;=&gt; &quot;skittles123&quot;, &quot;password&quot; =&gt; &quot;iluvskittles&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      post &#x27;&#x2F;login&#x27;, params
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="84" class="context" id="53"
       +                  onclick="toggle(53);">
       +                <li class="context-line" id="context-53"><code>      get &#x27;&#x2F;account&#x27;</code></li>
       +              </ol>
       +
       +              
       +              <ol start="85" class="post-context"
       +                  id="post-53" onclick="toggle(53);">
       +                
       +                <li class="post-context-line"><code>      expect(last_response.body).to include(&quot;&lt;h1&gt;Welcome skittles123&lt;&#x2F;h1&gt;&quot;)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      expect(last_response.body).to include(&quot;&lt;h3&gt;Your Balance: 1000.0&lt;&#x2F;h3&gt;&quot;)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>  describe &quot;GET &#x27;&#x2F;logout&#x27;&quot; do
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    it &quot;clears the session&quot; do
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>instance_exec</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="229"
       +                  class="pre-context" id="pre-54"
       +                  onclick="toggle(54);">
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          if skipped?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            Pending.mark_pending! self, skip
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          elsif !RSpec.configuration.dry_run?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            with_around_and_singleton_context_hooks do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>              begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>                run_before_example
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="236" class="context" id="54"
       +                  onclick="toggle(54);">
       +                <li class="context-line" id="context-54"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="237" class="post-context"
       +                  id="post-54" onclick="toggle(54);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                if pending?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                  Pending.mark_fixed! self
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                  raise Pending::PendingExampleFixedError,
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                        &#x27;Expected example to fail since it is pending, but it passed.&#x27;,
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                        [location]
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>block in run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="229"
       +                  class="pre-context" id="pre-55"
       +                  onclick="toggle(55);">
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          if skipped?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            Pending.mark_pending! self, skip
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          elsif !RSpec.configuration.dry_run?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            with_around_and_singleton_context_hooks do
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>              begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>                run_before_example
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="236" class="context" id="55"
       +                  onclick="toggle(55);">
       +                <li class="context-line" id="context-55"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="237" class="post-context"
       +                  id="post-55" onclick="toggle(55);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                if pending?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                  Pending.mark_fixed! self
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                  raise Pending::PendingExampleFixedError,
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                        &#x27;Expected example to fail since it is pending, but it passed.&#x27;,
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                        [location]
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>block in with_around_and_singleton_context_hooks</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="470"
       +                  class="pre-context" id="pre-56"
       +                  onclick="toggle(56);">
       +                
       +                <li class="pre-context-line"><code>        @example_group_instance.setup_mocks_for_rspec
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        hooks.run(:before, :example, self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def with_around_and_singleton_context_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        singleton_context_hooks_host = example_group_instance.singleton_class
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        singleton_context_hooks_host.run_before_context_hooks(example_group_instance)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="477" class="context" id="56"
       +                  onclick="toggle(56);">
       +                <li class="context-line" id="context-56"><code>        with_around_example_hooks { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="478" class="post-context"
       +                  id="post-56" onclick="toggle(56);">
       +                
       +                <li class="post-context-line"><code>      ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        singleton_context_hooks_host.run_after_context_hooks(example_group_instance)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def run_after_example
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        assign_generated_description if defined?(::RSpec::Matchers)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        hooks.run(:after, :example, self)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>block in with_around_example_hooks</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="427"
       +                  class="pre-context" id="pre-57"
       +                  onclick="toggle(57);">
       +                
       +                <li class="pre-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        example_group_instance.singleton_class.hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def with_around_example_hooks
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="434" class="context" id="57"
       +                  onclick="toggle(57);">
       +                <li class="context-line" id="context-57"><code>        hooks.run(:around, :example, self) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="435" class="post-context"
       +                  id="post-57" onclick="toggle(57);">
       +                
       +                <li class="post-context-line"><code>      rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; e
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        set_exception(e)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def start(reporter)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        reporter.example_started(self)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        execution_result.started_at = clock.now
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in
       +                <code><strong>block in run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="471"
       +                  class="pre-context" id="pre-58"
       +                  onclick="toggle(58);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          if scope == :context
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            run_owned_hooks_for(position, :context, example_or_group)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          else
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            case position
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            when :before then run_example_hooks_for(example_or_group, :before, :reverse_each)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            when :after  then run_example_hooks_for(example_or_group, :after,  :each)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="478" class="context" id="58"
       +                  onclick="toggle(58);">
       +                <li class="context-line" id="context-58"><code>            when :around then run_around_example_hooks_for(example_or_group) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="479" class="post-context"
       +                  id="post-58" onclick="toggle(58);">
       +                
       +                <li class="post-context-line"><code>            end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        SCOPES = [:example, :context]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        SCOPE_ALIASES = { :each =&gt; :example, :all =&gt; :context }
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in
       +                <code><strong>run_around_example_hooks_for</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="609"
       +                  class="pre-context" id="pre-59"
       +                  onclick="toggle(59);">
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        def run_around_example_hooks_for(example)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          hooks = FlatMap.flat_map(owner_parent_groups) do |group|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            group.hooks.matching_hooks_for(:around, :example, example)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="616" class="context" id="59"
       +                  onclick="toggle(59);">
       +                <li class="context-line" id="context-59"><code>          return yield if hooks.empty? # exit early to avoid the extra allocation cost of `Example::Procsy`</code></li>
       +              </ol>
       +
       +              
       +              <ol start="617" class="post-context"
       +                  id="post-59" onclick="toggle(59);">
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          initial_procsy = Example::Procsy.new(example) { yield }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          hooks.inject(initial_procsy) do |procsy, around_hook|
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            procsy.wrap { around_hook.execute_with(example, procsy) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end.call
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;hooks.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="471"
       +                  class="pre-context" id="pre-60"
       +                  onclick="toggle(60);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          if scope == :context
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            run_owned_hooks_for(position, :context, example_or_group)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          else
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            case position
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            when :before then run_example_hooks_for(example_or_group, :before, :reverse_each)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            when :after  then run_example_hooks_for(example_or_group, :after,  :each)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="478" class="context" id="60"
       +                  onclick="toggle(60);">
       +                <li class="context-line" id="context-60"><code>            when :around then run_around_example_hooks_for(example_or_group) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="479" class="post-context"
       +                  id="post-60" onclick="toggle(60);">
       +                
       +                <li class="post-context-line"><code>            end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        SCOPES = [:example, :context]
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        SCOPE_ALIASES = { :each =&gt; :example, :all =&gt; :context }
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>with_around_example_hooks</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="427"
       +                  class="pre-context" id="pre-61"
       +                  onclick="toggle(61);">
       +                
       +                <li class="pre-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        example_group_instance.singleton_class.hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def with_around_example_hooks
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="434" class="context" id="61"
       +                  onclick="toggle(61);">
       +                <li class="context-line" id="context-61"><code>        hooks.run(:around, :example, self) { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="435" class="post-context"
       +                  id="post-61" onclick="toggle(61);">
       +                
       +                <li class="post-context-line"><code>      rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; e
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        set_exception(e)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def start(reporter)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        reporter.example_started(self)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        execution_result.started_at = clock.now
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>with_around_and_singleton_context_hooks</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="470"
       +                  class="pre-context" id="pre-62"
       +                  onclick="toggle(62);">
       +                
       +                <li class="pre-context-line"><code>        @example_group_instance.setup_mocks_for_rspec
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        hooks.run(:before, :example, self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def with_around_and_singleton_context_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        singleton_context_hooks_host = example_group_instance.singleton_class
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        singleton_context_hooks_host.run_before_context_hooks(example_group_instance)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="477" class="context" id="62"
       +                  onclick="toggle(62);">
       +                <li class="context-line" id="context-62"><code>        with_around_example_hooks { yield }</code></li>
       +              </ol>
       +
       +              
       +              <ol start="478" class="post-context"
       +                  id="post-62" onclick="toggle(62);">
       +                
       +                <li class="post-context-line"><code>      ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        singleton_context_hooks_host.run_after_context_hooks(example_group_instance)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def run_after_example
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        assign_generated_description if defined?(::RSpec::Matchers)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        hooks.run(:after, :example, self)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="226"
       +                  class="pre-context" id="pre-63"
       +                  onclick="toggle(63);">
       +                
       +                <li class="pre-context-line"><code>        start(reporter)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        Pending.mark_pending!(self, pending) if pending?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          if skipped?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            Pending.mark_pending! self, skip
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          elsif !RSpec.configuration.dry_run?
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="233" class="context" id="63"
       +                  onclick="toggle(63);">
       +                <li class="context-line" id="context-63"><code>            with_around_and_singleton_context_hooks do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="234" class="post-context"
       +                  id="post-63" onclick="toggle(63);">
       +                
       +                <li class="post-context-line"><code>              begin
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                run_before_example
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                @example_group_instance.instance_exec(self, &amp;@example_block)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                if pending?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>                  Pending.mark_fixed! self
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>block in run_examples</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="574"
       +                  class="pre-context" id="pre-64"
       +                  onclick="toggle(64);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def self.run_examples(reporter)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        ordering_strategy.order(filtered_examples).map do |example|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          next if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          instance = new(example.inspect_output)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          set_ivars(instance, before_context_ivars)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="581" class="context" id="64"
       +                  onclick="toggle(64);">
       +                <li class="context-line" id="context-64"><code>          succeeded = example.run(instance, reporter)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="582" class="post-context"
       +                  id="post-64" onclick="toggle(64);">
       +                
       +                <li class="post-context-line"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            RSpec.world.wants_to_quit = true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          succeeded
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end.all?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>map</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="570"
       +                  class="pre-context" id="pre-65"
       +                  onclick="toggle(65);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          registry.fetch(:global)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def self.run_examples(reporter)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="577" class="context" id="65"
       +                  onclick="toggle(65);">
       +                <li class="context-line" id="context-65"><code>        ordering_strategy.order(filtered_examples).map do |example|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="578" class="post-context"
       +                  id="post-65" onclick="toggle(65);">
       +                
       +                <li class="post-context-line"><code>          next if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          instance = new(example.inspect_output)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          set_ivars(instance, before_context_ivars)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          succeeded = example.run(instance, reporter)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            RSpec.world.wants_to_quit = true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>run_examples</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="570"
       +                  class="pre-context" id="pre-66"
       +                  onclick="toggle(66);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          registry.fetch(:global)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def self.run_examples(reporter)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="577" class="context" id="66"
       +                  onclick="toggle(66);">
       +                <li class="context-line" id="context-66"><code>        ordering_strategy.order(filtered_examples).map do |example|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="578" class="post-context"
       +                  id="post-66" onclick="toggle(66);">
       +                
       +                <li class="post-context-line"><code>          next if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          instance = new(example.inspect_output)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          set_ivars(instance, before_context_ivars)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          succeeded = example.run(instance, reporter)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          if !succeeded &amp;&amp; reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            RSpec.world.wants_to_quit = true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="536"
       +                  class="pre-context" id="pre-67"
       +                  onclick="toggle(67);">
       +                
       +                <li class="pre-context-line"><code>      def self.run(reporter=RSpec::Core::NullReporter)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        return if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        reporter.example_group_started(self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        should_run_context_hooks = descendant_filtered_examples.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="543" class="context" id="67"
       +                  onclick="toggle(67);">
       +                <li class="context-line" id="context-67"><code>          result_for_this_group = run_examples(reporter)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="544" class="post-context"
       +                  id="post-67" onclick="toggle(67);">
       +                
       +                <li class="post-context-line"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          result_for_this_group &amp;&amp; results_for_descendants
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>block in run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="537"
       +                  class="pre-context" id="pre-68"
       +                  onclick="toggle(68);">
       +                
       +                <li class="pre-context-line"><code>        return if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        reporter.example_group_started(self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        should_run_context_hooks = descendant_filtered_examples.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result_for_this_group = run_examples(reporter)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="544" class="context" id="68"
       +                  onclick="toggle(68);">
       +                <li class="context-line" id="context-68"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>
       +              </ol>
       +
       +              
       +              <ol start="545" class="post-context"
       +                  id="post-68" onclick="toggle(68);">
       +                
       +                <li class="post-context-line"><code>          result_for_this_group &amp;&amp; results_for_descendants
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>map</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="537"
       +                  class="pre-context" id="pre-69"
       +                  onclick="toggle(69);">
       +                
       +                <li class="pre-context-line"><code>        return if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        reporter.example_group_started(self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        should_run_context_hooks = descendant_filtered_examples.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result_for_this_group = run_examples(reporter)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="544" class="context" id="69"
       +                  onclick="toggle(69);">
       +                <li class="context-line" id="context-69"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>
       +              </ol>
       +
       +              
       +              <ol start="545" class="post-context"
       +                  id="post-69" onclick="toggle(69);">
       +                
       +                <li class="post-context-line"><code>          result_for_this_group &amp;&amp; results_for_descendants
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;example_group.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="537"
       +                  class="pre-context" id="pre-70"
       +                  onclick="toggle(70);">
       +                
       +                <li class="pre-context-line"><code>        return if RSpec.world.wants_to_quit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        reporter.example_group_started(self)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        should_run_context_hooks = descendant_filtered_examples.any?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          run_before_context_hooks(new(&#x27;before(:context) hook&#x27;)) if should_run_context_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          result_for_this_group = run_examples(reporter)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="544" class="context" id="70"
       +                  onclick="toggle(70);">
       +                <li class="context-line" id="context-70"><code>          results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?</code></li>
       +              </ol>
       +
       +              
       +              <ol start="545" class="post-context"
       +                  id="post-70" onclick="toggle(70);">
       +                
       +                <li class="post-context-line"><code>          result_for_this_group &amp;&amp; results_for_descendants
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Pending::SkipDeclaredInExample =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          true
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        rescue Support::AllExceptionsExceptOnesWeMustNotRescue =&gt; ex
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          RSpec.world.wants_to_quit = true if reporter.fail_fast_limit_met?
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>block (3 levels) in run_specs</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="108"
       +                  class="pre-context" id="pre-71"
       +                  onclick="toggle(71);">
       +                
       +                <li class="pre-context-line"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   or the configured failure exit code (1 by default) if specs
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   failed.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run_specs(example_groups)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @configuration.with_suite_hooks do
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="115" class="context" id="71"
       +                  onclick="toggle(71);">
       +                <li class="context-line" id="context-71"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>
       +              </ol>
       +
       +              
       +              <ol start="116" class="post-context"
       +                  id="post-71" onclick="toggle(71);">
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def persist_example_statuses
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>map</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="108"
       +                  class="pre-context" id="pre-72"
       +                  onclick="toggle(72);">
       +                
       +                <li class="pre-context-line"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   or the configured failure exit code (1 by default) if specs
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   failed.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run_specs(example_groups)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @configuration.with_suite_hooks do
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="115" class="context" id="72"
       +                  onclick="toggle(72);">
       +                <li class="context-line" id="context-72"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>
       +              </ol>
       +
       +              
       +              <ol start="116" class="post-context"
       +                  id="post-72" onclick="toggle(72);">
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def persist_example_statuses
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>block (2 levels) in run_specs</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="108"
       +                  class="pre-context" id="pre-73"
       +                  onclick="toggle(73);">
       +                
       +                <li class="pre-context-line"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   or the configured failure exit code (1 by default) if specs
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   failed.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run_specs(example_groups)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          @configuration.with_suite_hooks do
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="115" class="context" id="73"
       +                  onclick="toggle(73);">
       +                <li class="context-line" id="context-73"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code</code></li>
       +              </ol>
       +
       +              
       +              <ol start="116" class="post-context"
       +                  id="post-73" onclick="toggle(73);">
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def persist_example_statuses
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;configuration.rb</code> in
       +                <code><strong>with_suite_hooks</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="1673"
       +                  class="pre-context" id="pre-74"
       +                  onclick="toggle(74);">
       +                
       +                <li class="pre-context-line"><code>      # @private
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def with_suite_hooks
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        return yield if dry_run?
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        hook_context = SuiteHookContext.new
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          run_hooks_with(@before_suite_hooks, hook_context)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="1680" class="context" id="74"
       +                  onclick="toggle(74);">
       +                <li class="context-line" id="context-74"><code>          yield</code></li>
       +              </ol>
       +
       +              
       +              <ol start="1681" class="post-context"
       +                  id="post-74" onclick="toggle(74);">
       +                
       +                <li class="post-context-line"><code>        ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          run_hooks_with(@after_suite_hooks, hook_context)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # @private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Holds the various registered hooks. Here we use a FilterableItemRepository
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>block in run_specs</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="107"
       +                  class="pre-context" id="pre-75"
       +                  onclick="toggle(75);">
       +                
       +                <li class="pre-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   or the configured failure exit code (1 by default) if specs
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   failed.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run_specs(example_groups)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="114" class="context" id="75"
       +                  onclick="toggle(75);">
       +                <li class="context-line" id="context-75"><code>          @configuration.with_suite_hooks do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="115" class="post-context"
       +                  id="post-75" onclick="toggle(75);">
       +                
       +                <li class="post-context-line"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;reporter.rb</code> in
       +                <code><strong>report</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="70"
       +                  class="pre-context" id="pre-76"
       +                  onclick="toggle(76);">
       +                
       +                <li class="pre-context-line"><code>    #     reporter.report(group.examples.size) do |r|
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    #       example_groups.map {|g| g.run(r) }
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    #     end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    def report(expected_example_count)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      start(expected_example_count)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      begin
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="77" class="context" id="76"
       +                  onclick="toggle(76);">
       +                <li class="context-line" id="context-76"><code>        yield self</code></li>
       +              </ol>
       +
       +              
       +              <ol start="78" class="post-context"
       +                  id="post-76" onclick="toggle(76);">
       +                
       +                <li class="post-context-line"><code>      ensure
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        finish
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    # @private
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    def start(expected_example_count, time=RSpec::Core::Time.now)
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>run_specs</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="106"
       +                  class="pre-context" id="pre-77"
       +                  onclick="toggle(77);">
       +                
       +                <li class="pre-context-line"><code>      # Runs the provided example groups.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @param example_groups [Array&lt;RSpec::Core::ExampleGroup&gt;] groups to run
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @return [Fixnum] exit status code. 0 if all specs passed,
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   or the configured failure exit code (1 by default) if specs
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #   failed.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run_specs(example_groups)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="113" class="context" id="77"
       +                  onclick="toggle(77);">
       +                <li class="context-line" id="context-77"><code>        @configuration.reporter.report(@world.example_count(example_groups)) do |reporter|</code></li>
       +              </ol>
       +
       +              
       +              <ol start="114" class="post-context"
       +                  id="post-77" onclick="toggle(77);">
       +                
       +                <li class="post-context-line"><code>          @configuration.with_suite_hooks do
       +</code></li>
       +                
       +                <li class="post-context-line"><code>            example_groups.map { |g| g.run(reporter) }.all? ? 0 : @configuration.failure_exit_code
       +</code></li>
       +                
       +                <li class="post-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>    private
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="82"
       +                  class="pre-context" id="pre-78"
       +                  onclick="toggle(78);">
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # Configures and runs a spec suite.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @param err [IO] error stream
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # @param out [IO] output stream
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def run(err, out)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        setup(err, out)
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="89" class="context" id="78"
       +                  onclick="toggle(78);">
       +                <li class="context-line" id="context-78"><code>        run_specs(@world.ordered_example_groups).tap do</code></li>
       +              </ol>
       +
       +              
       +              <ol start="90" class="post-context"
       +                  id="post-78" onclick="toggle(78);">
       +                
       +                <li class="post-context-line"><code>          persist_example_statuses
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Wires together the various configuration objects and state holders.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # @param err [IO] error stream
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>run</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="66"
       +                  class="pre-context" id="pre-79"
       +                  onclick="toggle(79);">
       +                
       +                <li class="pre-context-line"><code>          begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            DRbRunner.new(options).run(err, out)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          rescue DRb::DRbConnError
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            err.puts &quot;No DRb server is running. Running in local process instead ...&quot;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>            new(options).run(err, out)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>          end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        else
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="73" class="context" id="79"
       +                  onclick="toggle(79);">
       +                <li class="context-line" id="context-79"><code>          new(options).run(err, out)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="74" class="post-context"
       +                  id="post-79" onclick="toggle(79);">
       +                
       +                <li class="post-context-line"><code>        end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      def initialize(options, configuration=RSpec.configuration, world=RSpec.world)
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        @options       = options
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        @configuration = configuration
       +</code></li>
       +                
       +                <li class="post-context-line"><code>        @world         = world
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;lib&#x2F;rspec&#x2F;core&#x2F;runner.rb</code> in
       +                <code><strong>invoke</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="34"
       +                  class="pre-context" id="pre-80"
       +                  onclick="toggle(80);">
       +                
       +                <li class="pre-context-line"><code>        invoke
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # Runs the suite of specs and exits the process with an appropriate exit
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      # code.
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>      def self.invoke
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>        disable_autorun!
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="41" class="context" id="80"
       +                  onclick="toggle(80);">
       +                <li class="context-line" id="context-80"><code>        status = run(ARGV, $stderr, $stdout).to_i</code></li>
       +              </ol>
       +
       +              
       +              <ol start="42" class="post-context"
       +                  id="post-80" onclick="toggle(80);">
       +                
       +                <li class="post-context-line"><code>        exit(status) if status != 0
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      end
       +</code></li>
       +                
       +                <li class="post-context-line"><code>
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # Run a suite of RSpec examples. Does not exit.
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      #
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # This is used internally by RSpec to run a suite, but is available
       +</code></li>
       +                
       +                <li class="post-context-line"><code>      # for use by any other automation tool.
       +</code></li>
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;rspec-core-3.4.0&#x2F;exe&#x2F;rspec</code> in
       +                <code><strong>&lt;top (required)&gt;</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="1"
       +                  class="pre-context" id="pre-81"
       +                  onclick="toggle(81);">
       +                
       +                <li class="pre-context-line"><code>#!&#x2F;usr&#x2F;bin&#x2F;env ruby
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>require &#x27;rspec&#x2F;core&#x27;
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="4" class="context" id="81"
       +                  onclick="toggle(81);">
       +                <li class="context-line" id="context-81"><code>RSpec::Core::Runner.invoke</code></li>
       +              </ol>
       +
       +              
       +              <ol start="5" class="post-context"
       +                  id="post-81" onclick="toggle(81);">
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;rspec</code> in
       +                <code><strong>load</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="15"
       +                  class="pre-context" id="pre-82"
       +                  onclick="toggle(82);">
       +                
       +                <li class="pre-context-line"><code>  str = str.dup.force_encoding(&quot;BINARY&quot;) if str.respond_to? :force_encoding
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  if str =~ &#x2F;\A_(.*)_\z&#x2F; and Gem::Version.correct?($1) then
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    version = $1
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    ARGV.shift
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="22" class="context" id="82"
       +                  onclick="toggle(82);">
       +                <li class="context-line" id="context-82"><code>load Gem.activate_bin_path(&#x27;rspec-core&#x27;, &#x27;rspec&#x27;, version)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="23" class="post-context"
       +                  id="post-82" onclick="toggle(82);">
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;rspec</code> in
       +                <code><strong>&lt;main&gt;</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="15"
       +                  class="pre-context" id="pre-83"
       +                  onclick="toggle(83);">
       +                
       +                <li class="pre-context-line"><code>  str = str.dup.force_encoding(&quot;BINARY&quot;) if str.respond_to? :force_encoding
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  if str =~ &#x2F;\A_(.*)_\z&#x2F; and Gem::Version.correct?($1) then
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    version = $1
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>    ARGV.shift
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="22" class="context" id="83"
       +                  onclick="toggle(83);">
       +                <li class="context-line" id="context-83"><code>load Gem.activate_bin_path(&#x27;rspec-core&#x27;, &#x27;rspec&#x27;, version)</code></li>
       +              </ol>
       +
       +              
       +              <ol start="23" class="post-context"
       +                  id="post-83" onclick="toggle(83);">
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;ruby_executable_hooks</code> in
       +                <code><strong>eval</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="8"
       +                  class="pre-context" id="pre-84"
       +                  onclick="toggle(84);">
       +                
       +                <li class="pre-context-line"><code>begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  require &#x27;executable-hooks&#x2F;hooks&#x27;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  Gem::ExecutableHooks.run($0)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>rescue LoadError
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  warn &quot;unable to load executable-hooks&#x2F;hooks&quot; if ENV.key?(&#x27;ExecutableHooks_DEBUG&#x27;)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="15" class="context" id="84"
       +                  onclick="toggle(84);">
       +                <li class="context-line" id="context-84"><code>eval File.read($0), binding, $0</code></li>
       +              </ol>
       +
       +              
       +              <ol start="16" class="post-context"
       +                  id="post-84" onclick="toggle(84);">
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +          
       +
       +            <li class="frame-info system">
       +              <code>&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;bin&#x2F;ruby_executable_hooks</code> in
       +                <code><strong>&lt;main&gt;</strong></code>
       +            </li>
       +
       +            <li class="code system">
       +              
       +              <ol start="8"
       +                  class="pre-context" id="pre-85"
       +                  onclick="toggle(85);">
       +                
       +                <li class="pre-context-line"><code>begin
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  require &#x27;executable-hooks&#x2F;hooks&#x27;
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  Gem::ExecutableHooks.run($0)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>rescue LoadError
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>  warn &quot;unable to load executable-hooks&#x2F;hooks&quot; if ENV.key?(&#x27;ExecutableHooks_DEBUG&#x27;)
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>end
       +</code></li>
       +                
       +                <li class="pre-context-line"><code>
       +</code></li>
       +                
       +              </ol>
       +              
       +
       +              <ol start="15" class="context" id="85"
       +                  onclick="toggle(85);">
       +                <li class="context-line" id="context-85"><code>eval File.read($0), binding, $0</code></li>
       +              </ol>
       +
       +              
       +              <ol start="16" class="post-context"
       +                  id="post-85" onclick="toggle(85);">
       +                
       +              </ol>
       +              
       +              <div class="clear"></div>
       +            </li>
       +
       +          
       +
       +        
       +      
       +
       +      </ul>
       +    </div> <!-- /BACKTRACE -->
       +
       +    <div id="get">
       +      <h3 id="get-info">GET</h3>
       +      
       +        <p class="no-data">No GET data.</p>
       +      
       +      <div class="clear"></div>
       +    </div> <!-- /GET -->
       +
       +    <div id="post">
       +      <h3 id="post-info">POST</h3>
       +      
       +        <p class="no-data">No POST data.</p>
       +      
       +      <div class="clear"></div>
       +    </div> <!-- /POST -->
       +
       +    <div id="cookies">
       +      <h3 id="cookie-info">COOKIES</h3>
       +      
       +        <table class="req">
       +          <tr>
       +            <th>Variable</th>
       +            <th>Value</th>
       +          </tr>
       +          
       +            <tr>
       +              <td>rack.session</td>
       +              <td class="code"><div>&quot;BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh\nNDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG\nOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1\nMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7\nAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5\nBjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2\nYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7\nAEZpBg==\n--59caaaeccd4a49346c8fbf1ca0891695c674aced&quot;</div></td>
       +            </tr>
       +          
       +        </table>
       +      
       +      <div class="clear"></div>
       +    </div> <!-- /COOKIES -->
       +
       +    <div id="rack">
       +      <h3 id="env-info">Rack ENV</h3>
       +      <table class="req">
       +        <tr>
       +          <th>Variable</th>
       +          <th>Value</th>
       +        </tr>
       +         
       +         <tr>
       +           <td>CONTENT_LENGTH</td>
       +           <td class="code"><div>0</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>HTTPS</td>
       +           <td class="code"><div>off</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>HTTP_COOKIE</td>
       +           <td class="code"><div>rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh%0ANDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG%0AOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1%0AMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2%0AYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7%0AAEZpBg%3D%3D%0A--59caaaeccd4a49346c8fbf1ca0891695c674aced</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>HTTP_HOST</td>
       +           <td class="code"><div>example.org</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>PATH_INFO</td>
       +           <td class="code"><div>&#x2F;account</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>QUERY_STRING</td>
       +           <td class="code"><div></div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>REMOTE_ADDR</td>
       +           <td class="code"><div>127.0.0.1</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>REQUEST_METHOD</td>
       +           <td class="code"><div>GET</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>SCRIPT_NAME</td>
       +           <td class="code"><div></div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>SERVER_NAME</td>
       +           <td class="code"><div>example.org</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>SERVER_PORT</td>
       +           <td class="code"><div>80</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.errors</td>
       +           <td class="code"><div>#&lt;Object:0x000000027859e0&gt;</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.input</td>
       +           <td class="code"><div>#&lt;StringIO:0x00000006cde0c8&gt;</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.logger</td>
       +           <td class="code"><div>#&lt;Rack::NullLogger:0x00000003997048 @app=#&lt;Rack::Session::Cookie:0x00000003997318 @secrets=[&quot;secret&quot;], @coder=#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;, @app=#&lt;Rack::Protection::FrameOptions:0x00000003997c00 @app=#&lt;Rack::Protection::HttpOrigin:0x00000003997e08 @app=#&lt;Rack::Protection::IPSpoofing:0x00000004b34008 @app=#&lt;Rack::Protection::JsonCsrf:0x00000004b340a8 @app=#&lt;Rack::Protection::PathTraversal:0x00000004b34170 @app=#&lt;Rack::Protection::RemoteToken:0x00000004b342b0 @app=#&lt;Rack::Protection::SessionHijacking:0x00000004b34508 @app=#&lt;Rack::Protection::XSSHeader:0x00000004b34620 @app=#&lt;ApplicationController:0x00000004c356f0 @default_layout=:layout, @preferred_extension=nil, @app=nil, @template_cache=#&lt;Tilt::Cache:0x00000004c356a0 @cache={[:erb, :account, {:outvar=&gt;&quot;@_out_buf&quot;, :default_encoding=&gt;&quot;utf-8&quot;}, &quot;&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;&quot;]=&gt;#&lt;Tilt::ERBTemplate:0x00000006ce9d38 @options={:outvar=&gt;&quot;@_out_buf&quot;, :trim=&gt;&quot;&lt;&gt;&quot;}, @line=1, @file=&quot;&#x2F;home&#x2F;bretburau&#x2F;dev&#x2F;sinatra-logging-in-and-out-v-000&#x2F;app&#x2F;controllers&#x2F;..&#x2F;views&#x2F;account.erb&quot;, @compiled_method={[]=&gt;#&lt;UnboundMethod: BasicObject#__tilt_17256660&gt;}, @default_encoding=&quot;utf-8&quot;, @reader=#&lt;Proc:0x00000006ce9bf8@&#x2F;home&#x2F;bretburau&#x2F;.rvm&#x2F;gems&#x2F;ruby-2.3.3&#x2F;gems&#x2F;tilt-2.0.1&#x2F;lib&#x2F;tilt&#x2F;template.rb:76 (lambda)&gt;, @data=&quot;&lt;!DOCTYPE html&gt;\n&lt;html&gt;\n  &lt;head&gt;\n    &lt;meta charset=\&quot;UTF-8\&quot;&gt;\n    &lt;title&gt;title&lt;&#x2F;title&gt;\n    &lt;link rel=\&quot;stylesheet\&quot; href=\&quot;stylesheets&#x2F;bootstrap.css\&quot; type=\&quot;text&#x2F;css\&quot;&gt;  \n  &lt;&#x2F;head&gt;\n  &lt;body id=\&quot;page-top\&quot;&gt;\n    &lt;h1&gt;Welcome &lt;%=@user.name%&gt;&lt;&#x2F;h1&gt;\n    &lt;h3&gt;Your Balance: &lt;%=@user.balance%&gt;&lt;&#x2F;h3&gt;\n\n  &lt;&#x2F;body&gt;\n&lt;&#x2F;html&gt;&quot;, @outvar=&quot;@_out_buf&quot;, @engine=#&lt;ERB:0x00000006ce9b30 @safe_level=nil, @src=&quot;#coding:UTF-8\n@_out_buf = &#x27;&#x27;; @_out_buf.concat \&quot;&lt;!DOCTYPE html&gt;\\n\&quot;\n; @_out_buf.concat \&quot;&lt;html&gt;\\n\&quot;\n; @_out_buf.concat \&quot;  &lt;head&gt;\\n\&quot;\n; @_out_buf.concat \&quot;    &lt;meta charset=\\\&quot;UTF-8\\\&quot;&gt;\\n\&quot;\n; @_out_buf.concat \&quot;    &lt;title&gt;title&lt;&#x2F;title&gt;\\n\&quot;\n; @_out_buf.concat \&quot;    &lt;link rel=\\\&quot;stylesheet\\\&quot; href=\\\&quot;stylesheets&#x2F;bootstrap.css\\\&quot; type=\\\&quot;text&#x2F;css\\\&quot;&gt;  \\n\&quot;\n; @_out_buf.concat \&quot;  &lt;&#x2F;head&gt;\\n\&quot;\n; @_out_buf.concat \&quot;  &lt;body id=\\\&quot;page-top\\\&quot;&gt;\\n\&quot;\n; @_out_buf.concat \&quot;    &lt;h1&gt;Welcome \&quot;; @_out_buf.concat((@user.name).to_s); @_out_buf.concat \&quot;&lt;&#x2F;h1&gt;\\n\&quot;\n; @_out_buf.concat \&quot;    &lt;h3&gt;Your Balance: \&quot;; @_out_buf.concat((@user.balance).to_s); @_out_buf.concat \&quot;&lt;&#x2F;h3&gt;\\n\&quot;\n; @_out_buf.concat \&quot;\\n\&quot;\n; @_out_buf.concat \&quot;  &lt;&#x2F;body&gt;\\n\&quot;\n; @_out_buf.concat \&quot;&lt;&#x2F;html&gt;\&quot;; @_out_buf.force_encoding(__ENCODING__)&quot;, @encoding=#&lt;Encoding:UTF-8&gt;, @filename=nil, @lineno=0&gt;&gt;}&gt;&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :xss_mode=&gt;:block, :nosniff=&gt;true, :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :tracking_key=&gt;:tracking, :encrypt_tracking=&gt;true, :track=&gt;[&quot;HTTP_USER_AGENT&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :authenticity_param=&gt;&quot;authenticity_token&quot;, :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :except=&gt;[]}&gt;, @options={:reaction=&gt;:drop_session, :logging=&gt;true, :message=&gt;&quot;Forbidden&quot;, :encryptor=&gt;Digest::SHA1, :session_key=&gt;&quot;rack.session&quot;, :status=&gt;403, :allow_empty_referrer=&gt;true, :report_key=&gt;&quot;protection.failed&quot;, :html_types=&gt;[&quot;text&#x2F;html&quot;, &quot;application&#x2F;xhtml&quot;], :frame_options=&gt;:sameorigin, :except=&gt;[]}, @frame_options=&quot;SAMEORIGIN&quot;&gt;, @default_options={:path=&gt;&quot;&#x2F;&quot;, :domain=&gt;nil, :expire_after=&gt;nil, :secure=&gt;false, :httponly=&gt;true, :defer=&gt;false, :renew=&gt;false, :sidbits=&gt;128, :secure_random=&gt;SecureRandom, :secret=&gt;&quot;secret&quot;, :coder=&gt;#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;}, @key=&quot;rack.session&quot;, @cookie_only=true, @sidbits=128, @sid_secure=SecureRandom, @sid_length=32&gt;&gt;</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.multiprocess</td>
       +           <td class="code"><div>true</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.multithread</td>
       +           <td class="code"><div>true</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.request.cookie_hash</td>
       +           <td class="code"><div>{&quot;rack.session&quot;=&gt;&quot;BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh\nNDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG\nOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1\nMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7\nAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5\nBjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2\nYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7\nAEZpBg==\n--59caaaeccd4a49346c8fbf1ca0891695c674aced&quot;}</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.request.cookie_string</td>
       +           <td class="code"><div>rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTVjMWVjMWUwMGJjNGZiNDY2Njhh%0ANDYxNjQwNmQ3MTE3MzQ1NmI2MGYzNGEwMjhiYjhkZTRkM2ZkODZlOGE4YTcG%0AOwBGSSIJY3NyZgY7AEZJIiUwMzhiNDY4OGU3YjY4OTg0NDYxYjVkZTEyYjM1%0AMzFhYQY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi1kYTM5YTNlZTVlNmI0YjBkMzI1NWJmZWY5NTYwMTg5MGFmZDgwNzA5%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLWRhMzlhM2VlNWU2%0AYjRiMGQzMjU1YmZlZjk1NjAxODkwYWZkODA3MDkGOwBGSSIMdXNlcl9pZAY7%0AAEZpBg%3D%3D%0A--59caaaeccd4a49346c8fbf1ca0891695c674aced</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.request.query_hash</td>
       +           <td class="code"><div>{}</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.request.query_string</td>
       +           <td class="code"><div></div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.run_once</td>
       +           <td class="code"><div>false</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.session</td>
       +           <td class="code"><div>{&quot;session_id&quot;=&gt;&quot;5c1ec1e00bc4fb46668a4616406d71173456b60f34a028bb8de4d3fd86e8a8a7&quot;, &quot;csrf&quot;=&gt;&quot;038b4688e7b68984461b5de12b3531aa&quot;, &quot;tracking&quot;=&gt;{&quot;HTTP_USER_AGENT&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;}, &quot;user_id&quot;=&gt;1}</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.session.options</td>
       +           <td class="code"><div>{:path=&gt;&quot;&#x2F;&quot;, :domain=&gt;nil, :expire_after=&gt;nil, :secure=&gt;false, :httponly=&gt;true, :defer=&gt;false, :renew=&gt;false, :sidbits=&gt;128, :secure_random=&gt;SecureRandom, :secret=&gt;&quot;secret&quot;, :coder=&gt;#&lt;Rack::Session::Cookie::Base64::Marshal:0x00000003997200&gt;}</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.session.unpacked_cookie_data</td>
       +           <td class="code"><div>{&quot;session_id&quot;=&gt;&quot;5c1ec1e00bc4fb46668a4616406d71173456b60f34a028bb8de4d3fd86e8a8a7&quot;, &quot;csrf&quot;=&gt;&quot;038b4688e7b68984461b5de12b3531aa&quot;, &quot;tracking&quot;=&gt;{&quot;HTTP_USER_AGENT&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;, &quot;HTTP_ACCEPT_LANGUAGE&quot;=&gt;&quot;da39a3ee5e6b4b0d3255bfef95601890afd80709&quot;}, &quot;user_id&quot;=&gt;1}</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.test</td>
       +           <td class="code"><div>true</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.url_scheme</td>
       +           <td class="code"><div>http</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>rack.version</td>
       +           <td class="code"><div>[1, 3]</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>sinatra.accept</td>
       +           <td class="code"><div>[#&lt;Sinatra::Request::AcceptEntry:0x00000006d225e8 @entry=&quot;*&#x2F;*&quot;, @type=&quot;*&#x2F;*&quot;, @params={}, @q=1.0&gt;]</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>sinatra.error</td>
       +           <td class="code"><div>#&lt;NoMethodError: undefined method `name&#x27; for #&lt;User:0x00000006cea238&gt;&gt;</div></td>
       +         </tr>
       +         
       +         <tr>
       +           <td>sinatra.route</td>
       +           <td class="code"><div>GET &#x2F;account</div></td>
       +         </tr>
       +         
       +      </table>
       +      <div class="clear"></div>
       +    </div> <!-- /RACK ENV -->
       +
       +    <p id="explanation">You're seeing this error because you have
       +enabled the <code>show_exceptions</code> setting.</p>
       +  </div> <!-- /WRAP -->
       +  </body>
       +</html>
     # ./spec/sinatra_logging_in_and_out_spec.rb:85:in `block (3 levels) in <top (required)>'

Finished in 1.51 seconds (files took 0.8071 seconds to load)
14 examples, 1 failure

Failed examples:

rspec ./spec/sinatra_logging_in_and_out_spec.rb:78 # ApplicationController GET '/account' displays the account information if a user is logged in

