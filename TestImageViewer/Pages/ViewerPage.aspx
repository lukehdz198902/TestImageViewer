<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewerPage.aspx.cs" Inherits="TestImageViewer.Pages.ViewerPage" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Magnify Examples</title>
    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <%--<link href="../Recursos/js/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="../Recursos/js/bootstrap.min.css" rel="stylesheet" />
    <link href="../Recursos/imgviewer/dist/jquery.magnify.css" rel="stylesheet">

    <style>
        .magnify-modal {
            box-shadow: 0 0 6px 2px rgba(0, 0, 0, 0.3);
        }

        .magnify-header .magnify-toolbar {
            background-color: rgba(0, 0, 0, .5);
        }

        .magnify-stage {
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            border-width: 0;
        }

        .magnify-footer {
            bottom: 10px;
        }

            .magnify-footer .magnify-toolbar {
                background-color: rgba(0, 0, 0, .5);
                border-radius: 5px;
            }

        .magnify-loader {
            background-color: transparent;
        }

        .magnify-header,
        .magnify-footer {
            pointer-events: none;
        }

        .magnify-button {
            pointer-events: auto;
        }
    </style>
</head>

<body dir="ltr">
    <div class="container">
        <div class="image-set" style="display: none;">
            <asp:Repeater runat="server" ID="rptimgs">
                <ItemTemplate>
                    <a data-magnify="gallery" data-caption="<%# Eval("nombre") %>"
                        href="<%# Eval("url") %>">
                        <img src="<%# Eval("url") %>" alt="">
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <button class="btn btn-sm- btn-primary" id="btnVerImagenes"><i class="fa fa-search"></i>Ver Imagenes</button>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../Recursos/js/jquery.min.js"></script>
    <script src="../Recursos/js/bootstrap.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Recursos/imgviewer/dist/jquery.magnify.js"></script>
    <script>

        $(document).ready(function () {

            $('[data-magnify]').magnify({
                // Enable modal to drag
                draggable: true,
                // Enable modal to resize
                resizable: true,
                // Enable image to move
                movable: true,
                // Enable keyboard navigation
                keyboard: true,
                // Shows the title
                title: true,
                // Min width of modal
                modalWidth: 500,
                // Min height of modal
                modalHeight: 500,
                // Enable the page content fixed
                fixedContent: true,
                // Disable the image viewer maximized on init
                initMaximized: true,
                // Threshold of modal to browser window
                gapThreshold: 0.02,
                // Threshold of image ratio
                ratioThreshold: 0.1,
                // Min ratio of image when zoom out
                minRatio: 0.05,
                // Max ratio of image when zoom in
                maxRatio: 16,
                // Toolbar options in header
                headToolbar: [
                    'maximize',
                    'close'
                ],
                // Toolbar options in footer
                footToolbar: [
                    'zoomIn',
                    'zoomOut',
                    'prev',
                    'fullscreen',
                    'next',
                    'actualSize',
                    'rotateRight'
                ]
            });

            $("#btnVerImagenes").click(function () {
                if ($('[data-magnify]').length > 0) {
                    $('[data-magnify]')[0].click();
                }
                else {
                    alert('No existen imagenes');
                }
            });

        });

  </script>
</body>

</html>
