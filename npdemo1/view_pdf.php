<?php
if(isset($_GET['pdf'])) {
    $pdf_file = $_GET['pdf'];
    $pdf_path = "pdfs/" . $pdf_file;

    if(file_exists($pdf_path)) {
        header('Content-type: application/pdf');
        header('Content-Disposition: inline; filename="' . $pdf_file . '"');
        header('Content-Transfer-Encoding: binary');
        header('Accept-Ranges: bytes');
        @readfile($pdf_path);
    } else {
        echo "PDF file not found.";
    }
} else {
    echo "PDF file not specified.";
}
?>
