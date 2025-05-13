package com.newid.newid.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.newid.newid.dto.BuscarDTO;
import com.newid.newid.dto.EmailRequestDTO;
import com.newid.newid.dto.IngresoDTO;
import com.newid.newid.dto.NewIdActividadDelDiaDTO;
import com.newid.newid.dto.NewidJovenDTO;
import com.newid.newid.dto.NewidPadreDTO;
import com.newid.newid.dto.PassesDTO;
import com.newid.newid.service.NewIdService;


@RestController
@RequestMapping("/newid")
@CrossOrigin(origins = "*")
public class NewIdController {


    @Autowired NewIdService newIdService;

    @GetMapping("/obtener")
    public ResponseEntity<?> obtenerJovenes(){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.getJovenes();
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    @PostMapping("/ingresar")
    public ResponseEntity<?> ingreso(@RequestBody IngresoDTO ingresoDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.ingreso(ingresoDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    //buscar joven (ver info de asistencias)
    @PostMapping("/buscar")
    public ResponseEntity<?> buscar(@RequestBody BuscarDTO buscarDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.buscar(buscarDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }


    //registrar asistencia
    @GetMapping("/registrarAsistencia/{telefono}")
    public ResponseEntity<?> registrarAsistencia(@PathVariable ("telefono") String telefono){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.registrarAsistencia(telefono);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    //registrar asistencia
    @GetMapping("/registrarAsistenciaPray/{telefono}")
    public ResponseEntity<?> registrarAsistenciaPray(@PathVariable ("telefono") String telefono){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.registrarAsistenciaPray(telefono);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    // registrar joven
    @PostMapping("/registrarJoven")
    public ResponseEntity<?> registrarJoven(@RequestBody NewidJovenDTO newidJovenDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.registrarJoven(newidJovenDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }



    //editar joven

    // registrar joven
    @PostMapping("/editarJoven")
    public ResponseEntity<?> editarJoven(@RequestBody NewidJovenDTO newidJovenDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.editarJoven(newidJovenDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    //Registrar padre
    @PostMapping("/registrarPadre")
    public ResponseEntity<?> registrarPadre(@RequestBody NewidPadreDTO newidPadreDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.registrarPadre(newidPadreDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    @GetMapping("/buscarPadre/{telefono}")
    public ResponseEntity<?> buscarPadre(@PathVariable ("telefono") String telefono){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.buscarPadre(telefono);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    @PostMapping("/registrarPasses")
    public ResponseEntity<?> registrarPasses(@RequestBody PassesDTO passesDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.registrarPasses(passesDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    @PostMapping("/enviarEmailSalida")
    public ResponseEntity<?> enviarEmailSalida(@RequestBody EmailRequestDTO emailRequest){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.enviarEmailSalida(emailRequest);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }
    

    //Seccion Admin

    //cambiar contrasenia
    @PostMapping("/admin/cambiarContrasenia")
    public ResponseEntity<?> cambiarContrasenia(@RequestBody IngresoDTO ingresoDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.cambiarContrasenia(ingresoDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    //Configurar actividad del día (Tipo de actividad, passes a evaluar y valor de los passes)

    @PostMapping("/admin/actividadDelDia")
    public ResponseEntity<?> actividadDelDia(@RequestBody NewIdActividadDelDiaDTO newIdActividadDelDiaDTO){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.actividadDelDia(newIdActividadDelDiaDTO);
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }

    @GetMapping("/admin/verActividad")
    public ResponseEntity<?> verActividadDelDia(){

        Map<String, Object> answer = new TreeMap<>();
        try {
            answer = newIdService.verActividadDelDia();
        } catch (Exception e) {
            answer.put("exitoso", false);
            answer.put("error", "Se ha presentado un error en el servicio");
            answer.put("e",e);
        }
        return ResponseEntity.ok().body(answer);

    }
    //Agregar actividad
    //Editar actividad
    //Eliminar actividad

    //Passes
    //Consultar redimibles
    //Editar redimibles
    //Eliminar redimibles


    //seccion joven

    //Ver passes
    //Redimir passes



    
    
}
