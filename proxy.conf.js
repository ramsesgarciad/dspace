const PROXY_CONFIG = {
  '/server': {
    target: 'http://38.242.211.195:8080',
    secure: false,
    logLevel: 'debug',
    changeOrigin: true,
    cookieDomainRewrite: 'localhost',
    onProxyRes: function(proxyRes, req, res) {
      // Obtener el origen de la solicitud
      const origin = req.headers.origin || req.headers.referer || 'http://localhost:4000';
      
      // Modificar las cabeceras CORS para permitir credenciales
      proxyRes.headers['access-control-allow-origin'] = origin;
      proxyRes.headers['access-control-allow-credentials'] = 'true';
      proxyRes.headers['access-control-allow-methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS';
      proxyRes.headers['access-control-allow-headers'] = 'Content-Type, Authorization, X-XSRF-TOKEN, DSPACE-XSRF-TOKEN';
      proxyRes.headers['access-control-expose-headers'] = 'Authorization, DSPACE-XSRF-TOKEN, Location, WWW-Authenticate';
      
      console.log('[PROXY] Response from backend:', req.method, req.url);
    },
    onProxyReq: function(proxyReq, req, res) {
      // Log de solicitudes proxy
      console.log('[PROXY] Request to backend:', req.method, req.url);
      
      // Asegurar que las cookies se reescriban correctamente
      if (req.headers.cookie) {
        proxyReq.setHeader('Cookie', req.headers.cookie);
      }
    }
  }
};

module.exports = PROXY_CONFIG;
