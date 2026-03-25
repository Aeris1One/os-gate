<script>
    $(document).ready(function () {
        mapDataToFormUI({'frm_GeneralSettings': "/api/gate/settings/get"}).done(function () {
            formatTokenizersUI();
            $('.selectpicker').selectpicker('refresh');
        });

        $("#grid-routes").UIBootgrid({
            search: '/api/gate/settings/searchRoute',
            get: '/api/gate/settings/getRoute',
            set: '/api/gate/settings/setRoute',
            add: '/api/gate/settings/addRoute',
            del: '/api/gate/settings/delRoute',
            toggle: '/api/gate/settings/toggleRoute'
        });

        $("#saveAct").click(function () {
            saveFormToEndpoint("/api/gate/settings/set", 'frm_GeneralSettings', function () {
                $("#saveAct_progress").addClass("fa fa-spinner fa-pulse");
                ajaxCall("/api/gate/service/reconfigure", {}, function (data, status) {
                    $("#saveAct_progress").removeClass("fa fa-spinner fa-pulse");
                });
            });
        });

        updateServiceControlUI('gate');
    });
</script>

<div class="content-box" style="padding-bottom: 1.5em;">
    {{ partial("layout_partials/base_form", ['fields': generalForm, 'id': 'frm_GeneralSettings']) }}

    <div class="col-md-12">
        <hr/>
        <button class="btn btn-primary" id="saveAct" type="button">
            <b>{{ lang._('Save') }}</b> <i id="saveAct_progress"></i>
        </button>
    </div>
</div>

<div class="content-box" style="padding-bottom: 1.5em;">
    <table id="grid-routes" class="table table-condensed table-hover table-striped"
           data-editDialog="DialogRoute"
           data-editAlert="GateChangeMessage">
        <thead>
            <tr>
                <th data-column-id="uuid" data-type="string" data-identifier="true" data-visible="false">{{ lang._('ID') }}</th>
                <th data-column-id="enabled" data-width="6em" data-type="string" data-formatter="rowtoggle">{{ lang._('Enabled') }}</th>
                <th data-column-id="host" data-type="string">{{ lang._('Host') }}</th>
                <th data-column-id="backend" data-type="string">{{ lang._('Backend') }}</th>
                <th data-column-id="strategy" data-type="string">{{ lang._('Strategy') }}</th>
                <th data-column-id="commands" data-width="7em" data-formatter="commands" data-sortable="false">{{ lang._('Commands') }}</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
            <tr>
                <td></td>
                <td>
                    <button data-action="add" type="button" class="btn btn-xs btn-primary">
                        <span class="fa fa-fw fa-plus"></span>
                    </button>
                    <button data-action="deleteSelected" type="button" class="btn btn-xs btn-default">
                        <span class="fa fa-fw fa-trash-o"></span>
                    </button>
                </td>
            </tr>
        </tfoot>
    </table>
</div>

{{ partial("layout_partials/base_dialog", ['fields': routeForm, 'id': 'DialogRoute', 'label': lang._('Edit Route')]) }}
