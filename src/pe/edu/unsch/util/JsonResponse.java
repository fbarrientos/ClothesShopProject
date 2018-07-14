package pe.edu.unsch.util;

import java.util.ArrayList;
import java.util.List;

public class JsonResponse {
	
	private boolean estado;
    private String paginaRedireccion;
    private List<String> mensajesRepuesta;
    public static String insertSuccess = "Se registr� correctamente.";
    public static String updateSuccess = "Se modific� correctamente.";
    public static String changeStateSuccess = "Se cambi� el estado correctamente.";
    public static String deleteSuccess = "Se elimin� correctamente.";

    public void respuestaInsertar(){
        this.estado = true;
        this.mensajesRepuesta.add(insertSuccess);
    }
    
    public void respuestaModificar(){
        this.estado = true;
        this.mensajesRepuesta.add(updateSuccess);
    }
    
    public void respuestaEliminar(){
        this.estado = true;
        this.mensajesRepuesta.add(deleteSuccess);
    }
    
    public void respuestaCambiarEstado(){
        this.estado = true;
        this.mensajesRepuesta.add(changeStateSuccess);
    }
    
    public JsonResponse(){
        estado = false;
        paginaRedireccion = "";
        mensajesRepuesta = new ArrayList<String>();
    }   
    
    public JsonResponse(boolean estado, List<String> mensajesRepuesta) {
        this.estado = estado;
        this.mensajesRepuesta = mensajesRepuesta;
        this.paginaRedireccion = "";
    }    
    
    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getPaginaRedireccion() {
        return paginaRedireccion;
    }

    public void setPaginaRedireccion(String paginaRedireccion) {
        this.paginaRedireccion = paginaRedireccion;
    }

    public List<String> getMensajesRepuesta() {
        return mensajesRepuesta;
    }

    public void setMensajesRepuesta(List<String> mensajesRepuesta) {
        this.mensajesRepuesta = mensajesRepuesta;
    }

}
