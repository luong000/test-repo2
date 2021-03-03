<style>
  body {
    font: 16px/1.8 sans-serif;
    background: #f9f9f9;
    color: #333;
  }

  a {
    color: #6a9000;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  .wrapper {
    max-width: 800px;
    margin: 0 auto;
  }

  code {
    display: block;
    padding: 0.5rem;
    background: #eee;
    color: #222;
  }

  img {
    display: block;
    max-width: 400px;
    margin: 1rem 0;
  }

  .box {
    padding: 1rem;
    background: #eee;
    color: #222;
  }
</style>

<div class="wrapper">
  [#if cmsfn.isAuthorInstance()]
    <div class="box">This page is shown when public instance domain is acessed without any site node name specified.</div>
  [/#if]

  <h1>Public Home Page</h1>
  [#assign root = cmsfn.contentByPath('/')!]

  [#if root['jcr:primaryType']?has_content]
    [#assign sites = cmsfn.children(root, 'mgnl:page')]

    [#list sites]
      <h2>Sites on this public instance:</h2>
      <ul>
        [#items as site]
          <li><a href="/${site}">${site}</a>[#if site == 'public-home-page'] (this page)[/#if]</li>
        [/#items]
      </ul>
    [/#list]
  [/#if]

  <h2>Custom domains</h2>
  <p>A domain name is the URL or web address where visitors find your site.</p>
  <p>
    By default, any site on Magnolia Public Instance is accessible via its Magnolia subdomain and pathname based on the site node name, which has the form:
    <code>[name-of-your-public-instance].magnolia-trials.com/[node-name-of-your-site]</code>
    For example, you would access a site named <b>react-website</b> at:
    <code>https://my-public-instance.magnolia-trials.com/react-website</code>
  </p>
  <p>
    Custom domains allow you to make your sites accessible at your own, non-Magnolia domain names. For example:
    <code>www.mycustomdomain.com</code>
  </p>

  <h3>How to assign a domain to a site</h3>
  <ul>
    <li>Go to <b>Site</b> app in Author Instance.</li>
    <li>Create new content node with <b>Add content node</b> action. The node name is arbitrary.</li>
    <li>Inside created node create two content nodes: <b>domains</b> and <b>mappings</b>.</li>
    <li>In <b>domains</b> create new content node. The node name is arbitrary.</li>
    <li>Inside created node add property with <b>Add property</b> action. Name of the property has to be <b>name</b> and value has to be your domain.</li>
    <li>In <b>mappings</b> create new content node. The node name is arbitrary.</li>
    <li>Inside created node add property <b>URIPrefix</b> with empty value.</li>
    <li>Inside created node add property <b>repository</b> with value <b>website</b>.</li>
    <li>Inside created node add property <b>handlePrefix</b> with value being your site node name.</li>
  </ul>
  For example:
  <img src="${ctx.contextPath}/.resources/public-home-page/webresources/img/site-definition.png">
  You can find full documentation and more examples <a href="https://documentation.magnolia-cms.com/display/DOCS62/Multisite+example+-+Two+sites+with+different+domains">here</a>.
</div>
