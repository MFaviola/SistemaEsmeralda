export class Categoria{
    cate_Id?:String;
    cate_Categoria?:String;
}
export class CategoriaEnviar {
    Usua_ID?: String;
    Usua_Id?: Number;
    Cate_Id: string;
    Cate_Categoria: string;
}

export class dropCategoria{
    value?:String;
    text?:String;
}

export class Fill {
    cate_Id: string;
    cate_Categoria: string;
    usuarioCreacion: string;
    usuarioModificacion: string;
    fechaCreacion : string;
    fechaModificacion : string;
}