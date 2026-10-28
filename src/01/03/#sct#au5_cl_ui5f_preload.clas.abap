* =====================================================================
* GENERATED FILE - DO NOT EDIT (AGENTS.md rule 2)
* Embedded frontend resource, generated from app/webapp/ by
* tools/app2abap/trans2abap.js. Change the source under app/webapp/
* and run 'npm run app2abap' to regenerate; the check_app2abap CI gate
* fails any manual edit here.
* =====================================================================
CLASS /sct/au5_cl_ui5f_preload DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    " a digest of the script get( ) returns - every embedded frontend source
    " and the code around them - fixed at generation time. Part of the GET
    " shell's ETag (/sct/au5_cl_ui5_http_handler=>_get_etag)
    CONSTANTS build_hash TYPE string VALUE '034748e87a43c727'.

    " the same digest as a CSP hash source, without the quotes around it:
    " /sct/au5_cl_ui5_http_handler=>_http_get lists it in the policy's
    " script-src, so this one inline script runs without 'unsafe-inline'.
    " It is the SHA-256 of get( ) byte for byte - a script that differs by one
    " character does not run at all, which the browser e2e legs would show
    CONSTANTS script_hash TYPE string VALUE 'sha256-A0dI6HpDxydYeZHRVayOvn6NBLSXqoxa5jEWQUVl6ng='.

    " a digest of the devtools bundle get_devtools( ) returns - the files
    " of the developer tools the shell does not carry. The ETag of that
    " bundle carries it (/sct/au5_cl_ui5_http_handler=>_http_get_devtools):
    " build_hash is taken over the shell's script alone and does not change
    " with them
    CONSTANTS devtools_hash TYPE string VALUE 'db1743e39b891581'.

    CLASS-METHODS get
      RETURNING
        VALUE(result) TYPE string.

    " the same entries as a script of its own, for a page that embeds the
    " component: sap.ui.require.preload( ) and nothing else - no function
    " around it, no start (/sct/au5_cl_ui5_http_handler=>_http_get_bundle)
    CLASS-METHODS get_bundle
      RETURNING
        VALUE(result) TYPE string.

    " the developer tools as a script of the same shape: the dialog, its
    " fragment, the inspectors - everything under devtools/ the shell does
    " not carry (tools/app2abap/trans2abap.js, DEVTOOLS_EAGER). Served on
    " ?sctau5-bundle=devtools (/sct/au5_cl_ui5_http_handler=>_http_get_devtools)
    " and loaded by sctau5/devtools/DevTools.js when the tools are opened
    CLASS-METHODS get_devtools
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    " one line per embedded file of the shell - shared by get( ) and
    " get_bundle( )
    CLASS-METHODS entries
      RETURNING
        VALUE(result) TYPE string.

    " one line per file of the devtools bundle - get_devtools( )
    CLASS-METHODS entries_devtools
      RETURNING
        VALUE(result) TYPE string.

    CLASS-METHODS escape_js_literal
      IMPORTING
        val           TYPE string
      RETURNING
        VALUE(result) TYPE string.

ENDCLASS.


CLASS /sct/au5_cl_ui5f_preload IMPLEMENTATION.

  METHOD get.

    result = |\n| &&
             |  function onInitComponent()\{\n| &&
             |    sap.ui.require.preload(\{\n| &&
             entries( ) &&
             |    \});\n| &&
             |    sap.ui.require(["sap/ui/core/ComponentSupport"], function(ComponentSupport)\{\n| &&
             |     ComponentSupport.run();\n| &&
             |    \});\n| &&
             |  \}\n|.

  ENDMETHOD.

  METHOD get_bundle.

    result = |(function () \{\n| &&
             |  var entries = \{\n| &&
             entries( ) &&
             |  \};\n| &&
             |  sap.ui.require.preload(entries);\n| &&
             |  sap.ui.require.preload(\{\n| &&
             |    "sctau5/embed/frontend/Component.js": entries["sctau5/Component.js"],\n| &&
             |    "sctau5/embed/frontend/manifest.json": entries["sctau5/manifest.json"]\n| &&
             |  \});\n| &&
             |\})();\n|.

  ENDMETHOD.

  METHOD get_devtools.

    result = |sap.ui.require.preload(\{\n| &&
             entries_devtools( ) &&
             |\});\n|.

  ENDMETHOD.

  METHOD entries.

    result = |      "sctau5/Component.js": function()\{{ /sct/au5_cl_ui5f_comp_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/CameraPicture.js": function()\{{ /sct/au5_cl_ui5f_campic_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/CameraSelector.js": function()\{{ /sct/au5_cl_ui5f_camsel_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/Dirty.js": function()\{{ /sct/au5_cl_ui5f_dirty_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/ExcelBridge.js": function()\{{ /sct/au5_cl_ui5f_excel_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/FileUploader.js": function()\{{ /sct/au5_cl_ui5f_uploader_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/Geolocation.js": function()\{{ /sct/au5_cl_ui5f_geoloc_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/InputExt.js": function()\{{ /sct/au5_cl_ui5f_inputext_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/MessageManager.js": function()\{{ /sct/au5_cl_ui5f_msgmgr_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/MultiInputExt.js": function()\{{ /sct/au5_cl_ui5f_multiinp_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/NativeBridgeScan.js": function()\{{ /sct/au5_cl_ui5f_natscan_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/SmartMultiInputExt.js": function()\{{ /sct/au5_cl_ui5f_smartinp_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/Storage.js": function()\{{ /sct/au5_cl_ui5f_storage_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/Tree.js": function()\{{ /sct/au5_cl_ui5f_tree_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/UITableExt.js": function()\{{ /sct/au5_cl_ui5f_uitable_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/UploadSetExt.js": function()\{{ /sct/au5_cl_ui5f_upldset_js=>get( ) }\},| && |\n| &&
             |      "sctau5/cc/Websocket.js": function()\{{ /sct/au5_cl_ui5f_websock_js=>get( ) }\},| && |\n| &&
             |      "sctau5/controller/App.controller.js": function()\{{ /sct/au5_cl_ui5f_app_js=>get( ) }\},| && |\n| &&
             |      "sctau5/controller/View1.controller.js": function()\{{ /sct/au5_cl_ui5f_view1_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/AppState.js": function()\{{ /sct/au5_cl_ui5f_appstate_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Context.js": function()\{{ /sct/au5_cl_ui5f_context_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Env.js": function()\{{ /sct/au5_cl_ui5f_env_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/ErrorView.js": function()\{{ /sct/au5_cl_ui5f_errview_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/FrontendAction.js": function()\{{ /sct/au5_cl_ui5f_frontact_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Lib.js": function()\{{ /sct/au5_cl_ui5f_lib_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Offline.js": function()\{{ /sct/au5_cl_ui5f_offline_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/RootSlot.js": function()\{{ /sct/au5_cl_ui5f_rootslot_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Router.js": function()\{{ /sct/au5_cl_ui5f_router_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/ScrollFocus.js": function()\{{ /sct/au5_cl_ui5f_scrfocus_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Server.js": function()\{{ /sct/au5_cl_ui5f_server_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/Session.js": function()\{{ /sct/au5_cl_ui5f_session_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/ViewSlots.js": function()\{{ /sct/au5_cl_ui5f_viewslot_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/BindingCall.js": function()\{{ /sct/au5_cl_ui5f_bindcall_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/Browser.js": function()\{{ /sct/au5_cl_ui5f_browser_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/ControlCall.js": function()\{{ /sct/au5_cl_ui5f_ctrlcall_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/Launchpad.js": function()\{{ /sct/au5_cl_ui5f_launchpd_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/Shortcuts.js": function()\{{ /sct/au5_cl_ui5f_shortcut_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/Slots.js": function()\{{ /sct/au5_cl_ui5f_slots_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/Variants.js": function()\{{ /sct/au5_cl_ui5f_variants_js=>get( ) }\},| && |\n| &&
             |      "sctau5/core/actions/ViewOps.js": function()\{{ /sct/au5_cl_ui5f_viewops_js=>get( ) }\},| && |\n| &&
             |      "sctau5/css/style.css": '{ escape_js_literal( /sct/au5_cl_ui5f_style_css=>get( ) ) }',| && |\n| &&
             |      "sctau5/devtools/Console.js": function()\{{ /sct/au5_cl_ui5f_console_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/DevTools.js": function()\{{ /sct/au5_cl_ui5f_devtools_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Diff.js": function()\{{ /sct/au5_cl_ui5f_diff_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Format.js": function()\{{ /sct/au5_cl_ui5f_dtformat_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Persist.js": function()\{{ /sct/au5_cl_ui5f_persist_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Recorder.js": function()\{{ /sct/au5_cl_ui5f_recorder_js=>get( ) }\},| && |\n| &&
             |      "sctau5/manifest.json": '{ escape_js_literal( /sct/au5_cl_ui5f_manifest=>get( ) ) }',| && |\n| &&
             |      "sctau5/model/clipboard.js": function()\{{ /sct/au5_cl_ui5f_clipbrd_js=>get( ) }\},| && |\n| &&
             |      "sctau5/model/formatter.js": function()\{{ /sct/au5_cl_ui5f_format_js=>get( ) }\},| && |\n| &&
             |      "sctau5/model/models.js": function()\{{ /sct/au5_cl_ui5f_models_js=>get( ) }\},| && |\n| &&
             |      "sctau5/view/App.view.xml": '{ escape_js_literal( /sct/au5_cl_ui5f_app_xml=>get( ) ) }',| && |\n|.

  ENDMETHOD.

  METHOD entries_devtools.

    result = |      "sctau5/devtools/AbapSource.js": function()\{{ /sct/au5_cl_ui5f_abapsrc_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Bindings.js": function()\{{ /sct/au5_cl_ui5f_bindings_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/DeveloperTools.fragment.xml": '{ escape_js_literal( /sct/au5_cl_ui5f_dtools_xml=>get( ) ) }',| && |\n| &&
             |      "sctau5/devtools/DeveloperTools.js": function()\{{ /sct/au5_cl_ui5f_dtools_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Help.js": function()\{{ /sct/au5_cl_ui5f_help_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Inspect.js": function()\{{ /sct/au5_cl_ui5f_inspect_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Journey.js": function()\{{ /sct/au5_cl_ui5f_journey_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/LiveEdit.js": function()\{{ /sct/au5_cl_ui5f_liveedit_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Log.js": function()\{{ /sct/au5_cl_ui5f_log_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Picker.js": function()\{{ /sct/au5_cl_ui5f_picker_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Report.js": function()\{{ /sct/au5_cl_ui5f_report_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/SlotXml.js": function()\{{ /sct/au5_cl_ui5f_slotxml_js=>get( ) }\},| && |\n| &&
             |      "sctau5/devtools/Tabs.js": function()\{{ /sct/au5_cl_ui5f_tabs_js=>get( ) }\},| && |\n|.

  ENDMETHOD.

  METHOD escape_js_literal.

    " Every non-.js resource in get( ) is embedded as a JavaScript
    " single-quoted string literal, inside the single <script> block that
    " defines onInitComponent (/sct/au5_cl_ui5_http_handler=>_http_get). Its content
    " is arbitrary text and does carry apostrophes - a UI5 expression binding
    " in a fragment (title="{= ${/appName} ? 'a' : 'b' }") writes them. An
    " unescaped one ends the literal early, which is a syntax error for the whole block: the browser
    " then never defines onInitComponent, the bootstrap call fails and the page
    " stays blank. Escape for the literal here instead of banning the
    " characters in the frontend sources.
    " Backslash goes first so it cannot escape the backslashes added below it.
    result = replace( val  = val
                      sub  = `\`
                      with = `\\`
                      occ  = 0 ).
    result = replace( val  = result
                      sub  = `'`
                      with = `\'`
                      occ  = 0 ).
    " a raw line break ends a JS string literal just like an apostrophe does -
    " the special files are embedded single-line, so this is defence in depth.
    " char constants come from the context class - the one place allowed to
    " reference cl_abap_char_utilities (see "Utilities" in AGENTS.md)
    result = replace( val  = result
                      sub  = /sct/au5_cl_ui5_util_context=>cv_char_util_cr_lf(1)
                      with = `\r`
                      occ  = 0 ).
    result = replace( val  = result
                      sub  = /sct/au5_cl_ui5_util_context=>cv_char_util_newline
                      with = `\n`
                      occ  = 0 ).
    " the HTML tokenizer runs BEFORE the JavaScript parser and ends the
    " script element at the first </script it meets - inside a string
    " literal or not. An XML fragment is full of <, so every one of them
    " becomes the JS escape \x3c, which the literal reads back as the same
    " character, and neither </script nor <!-- can reach the tokenizer
    result = replace( val  = result
                      sub  = `<`
                      with = `\x3c`
                      occ  = 0 ).

  ENDMETHOD.

ENDCLASS.
