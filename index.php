<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gitpod</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown.js/0.5.0/markdown.min.js" integrity="sha256-m08q2xO2R0aeibb2C0GfTjpky+ZgvfKWzNQbj/2zJaY=" crossorigin="anonymous"></script>
</head>
<body>
    <div style="display:none" id="readme"><?= file_get_contents('./readme.md') ?></div>

    <script>
        const readmeDiv = document.querySelector('#readme');
        const readme = readmeDiv.innerText;
        const content = markdown.toHTML(readme);
        Object.assign(readmeDiv, {
            innerHTML: content,
            style: 'display: block'
        });
    </script>
</body>
</html>
