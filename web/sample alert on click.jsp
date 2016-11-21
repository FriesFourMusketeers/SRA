<html>
    <head><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <style>#myTable td{padding:8px;}.btnSelect{background-color:#f44336;border:2px solid #f44336;border-radius:4px;color:white;cursor:pointer;}.btnSelect:hover{background-color:#c93326;border:2px solid #c93326;}</style>
    <body>

        <table border='1' id="myTable">
            <tr>
                <th>Id</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Moto G</td>
                <td>Moto G next generation smart phone</td>
                <td><button class="btnSelect">Select</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>Iphone SE</td>
                <td>Iphone laucnhed new phone bosy of 5s with feature of 6s</td>
                <td><button class="btnSelect">Select</button></td>
            </tr>

            <tr>
                <td>3</td>
                <td>Sony z3</td>
                <td>This is waterproof, well designed, etc</td>
                <td><button class="btnSelect">Select</button></td>
            </tr>

            <tr>
                <td>4</td>
                <td>Moto X Play</td>
                <td>Another class product from Moto G Family</td>
                <td><button class="btnSelect">Select</button></td>
            </tr>

            <tr>
                <td>5</td>
                <td>Samsung S7</td>
                <td>Best smart phone, nice UI etc.</td>
                <td><button class="btnSelect">Select</button></td>
            </tr>
        </table>

        <script>
            $(document).ready(function () {
                // code to read selected table row cell data (values).
                $(".btnSelect").on('click', function () {
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find("td:eq(0)").html();
                    var col2 = currentRow.find("td:eq(1)").html();
                    var col3 = currentRow.find("td:eq(2)").html();
                    var data = col1 + "\n" + col2 + "\n" + col3;
                    alert(data);
                });
            });
        </script>
    </body>
</html>