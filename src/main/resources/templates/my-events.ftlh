<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои событие</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новое событие
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/event/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Название событие</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <#--                <label for="price">Цена товара</label>-->
                <#--                <div class="input-group mb-3">-->
                <#--                    <input type="text" required class="form-control" id="" name="price">-->
                <#--                    <div class="input-group-append">-->
                <#--                        <span class="input-group-text">₽</span>-->
                <#--                    </div>-->
                <#--                </div>-->
            </div>
            <div class="form-group">
                <label for="searchCity">Город</label>
                <select id="searchCity" required name="city" class="form-control">
                    <option value="">Город не выбран</option>

                    <option value="">Город не выбран</option>
                    <option value="Астана">Астана</option>
                    <option value="Алматы">Алматы</option>
                    <option value="Костанай">Костанай</option>
                    <option value="Караганда">Караганда</option>
                    <option value="Актобе">Актобе</option>
                    <option value="Талдыкорган">Талдыкорган</option>
                    <option value="Семей">Семей</option>
                    <option value="Актау">Актау</option>
                    <option value="Атырау">Атырау</option>
                    <option value="Павлодар">Павлодар</option>
                    <option value="Жезказган">Жезказган</option>
                    <option value="Шымкент">Шымкент</option>

                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание событие</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография </label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография </label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография </label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="card-columns">
        <#list products as product>
            <a href="/event/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">
                    <div class="card-top">
                        <form action="/event/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>

                    </div>
                    <div class="card-footer">
                        ${product.city}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>