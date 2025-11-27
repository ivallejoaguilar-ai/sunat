# 🚀 Guía de Despliegue en Railway

## Pasos para desplegar

### 1. Crear cuenta en Railway
1. Ve a [railway.app](https://railway.app)
2. Regístrate con GitHub
3. Verifica tu email

### 2. Crear nuevo proyecto
1. Click en "New Project"
2. Selecciona "Deploy from GitHub repo"
3. Conecta tu repositorio: `api-facturacion-sunat-laravel`
4. Railway detectará automáticamente que es Laravel

### 3. Agregar base de datos MySQL
1. En tu proyecto, click en "+ New"
2. Selecciona "Database" > "Add MySQL"
3. Railway creará automáticamente las variables de entorno

### 4. Configurar variables de entorno
Ve a tu servicio Laravel > Settings > Variables y agrega:

```bash
APP_NAME="API Facturación SUNAT"
APP_ENV=production
APP_DEBUG=false
APP_TIMEZONE=America/Lima
APP_KEY=base64:GENERA_CON_php_artisan_key:generate

# SUNAT
SUNAT_USER_SOL=20123456789MODDATOS
SUNAT_PASS_SOL=C4mb14m3@
CERTIFICADO_PASSWORD=C4mb14m3@

# Otras (Railway auto-configura DB)
QUEUE_CONNECTION=database
CACHE_STORE=database
SESSION_DRIVER=database
LOG_CHANNEL=stack
```

### 5. Generar APP_KEY
En tu terminal local:
```bash
php artisan key:generate --show
```
Copia el resultado y agrégalo a Railway como `APP_KEY`

### 6. Subir certificado
Después del primer deploy:
1. Usa Railway CLI o API para subir el certificado
2. O configúralo vía endpoint de tu API

### 7. Deploy
Railway desplegará automáticamente cuando hagas push a GitHub

### 8. Verificar
1. Ve a Settings > Domains para ver tu URL
2. Prueba: `https://tu-app.up.railway.app/api/system/info`

## 📝 Comandos útiles

### Ver logs
```bash
railway logs
```

### Ejecutar migraciones manualmente
```bash
railway run php artisan migrate --force
```

### Conectar a la base de datos
```bash
railway connect
```

## ⚠️ Notas importantes

1. **Certificado**: Debes subir el certificado .pem después del deploy
2. **Migraciones**: Se ejecutan automáticamente en cada deploy
3. **Storage**: Railway tiene almacenamiento efímero, usa S3 para archivos permanentes
4. **Costo**: ~$5/mes de crédito gratis, suficiente para desarrollo

## 🔗 Enlaces útiles

- [Railway Docs](https://docs.railway.app)
- [Railway CLI](https://docs.railway.app/develop/cli)
- [Soporte](https://railway.app/help)
