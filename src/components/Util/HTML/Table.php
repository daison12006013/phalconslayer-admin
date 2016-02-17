<?php
namespace Daison\Admin\Components\Util\HTML;

class Table
{
    public function getContent()
    {
        return <<<EOT
<table class="table">
</table>
EOT;
    }

    public function getFooter()
    {
        return <<<EOT
<script type="text/javascript" src="{{ url('vendor/daisonAdmin/bower_components/jquery-pjax/jquery.pjax.js') }}"></script>
<script type="text/javascript">
    $(function() {

        // Progress Bar on top

        $(document).on('pjax:start', function() {
            NProgress.start();
        });

        $(document).on('pjax:end', function() {
            NProgress.done();
            $("#modalDefault").modal("show");
        });


        // Applying pjax for no-refresh scene

        if ( $.support.pjax )
        {
            $(document).on("click", "a[data-pjax]", function(event) {
                $.pjax.click(event, "#pjax-container", {
                    fragment: "#pjax-container",
                    push: false,
                    timeout: 10000
                });
            });

            $(document).on("click", "#globalRefresh", function(event) {
                $.pjax.click(event, "#main-container", {
                    fragment: "#main-container",
                    push: false,
                    timeout: 10000
                });
            });
        }


        // Common, planning to move on a separate js file

        function showDeleteBtn(bool)
        {
            if ( bool === true )
            {
                $("#globalDelete").removeClass("hidden");
            }
            else
            {
                $("#globalDelete").addClass("hidden");
            }
        }

        $(document).on("change", "#mother-checkbox", function() {

            var childBoxes = $(this).closest("#table-handler").find(".child-checkbox");

            if ( $(this).is(":checked") )
            {
                childBoxes.prop("checked", true);
                showDeleteBtn(true);
            }
            else
            {
                childBoxes.prop("checked", false);
                showDeleteBtn(false);
            }
        });

        $(document).on("change", ".child-checkbox", function()
        {
            if ( $(".child-checkbox:checked").length )
            {
                showDeleteBtn(true);
            }
            else
            {
                showDeleteBtn(false);
            }
        });
    });
</script>
EOT;
    }
}