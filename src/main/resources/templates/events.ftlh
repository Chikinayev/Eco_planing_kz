<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск событий</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">Город</label>
                <select id="searchCity" class="form-control">
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
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по событиям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list products as product>
            <a href="/event/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <#--                        <p class="card-text">${product.price} ₽</p>-->
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