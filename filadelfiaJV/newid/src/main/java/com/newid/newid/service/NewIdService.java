package com.newid.newid.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.time.*;
import java.time.temporal.ChronoUnit;

import org.apache.tomcat.util.buf.B2CConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.newid.newid.dto.BuscarDTO;
import com.newid.newid.dto.IngresoDTO;
import com.newid.newid.dto.NewIdAsistenciaDTO;
import com.newid.newid.dto.NewidJovenDTO;
import com.newid.newid.mapper.NewIdJovenMapper;
import com.newid.newid.models.NewIdAsistencia;
import com.newid.newid.models.NewIdGrupoEdad;
import com.newid.newid.models.NewIdSeguimiento;
import com.newid.newid.models.NewIdSeguridad;
import com.newid.newid.models.NewidJoven;
import com.newid.newid.models.NewidMentor;
import com.newid.newid.repository.NewIdAsistenciaRepository;
import com.newid.newid.repository.NewIdGrupoEdadRepository;
import com.newid.newid.repository.NewIdJovenRepository;
import com.newid.newid.repository.NewIdMentorRepository;
import com.newid.newid.repository.NewIdSeguimientoRepository;
import com.newid.newid.repository.NewIdSeguiridadRepository;


@Service
public class NewIdService {

    @Autowired
    NewIdAsistenciaRepository newIdAsistenciaRepository;

    @Autowired
    NewIdGrupoEdadRepository newIdGrupoEdadRepository;

    @Autowired
    NewIdJovenRepository newIdJovenRepository;

    @Autowired
    NewIdMentorRepository newIdMentorRepository;

    @Autowired
    NewIdSeguimientoRepository newIdSeguimientoRepository;

    @Autowired
    NewIdSeguiridadRepository newIdSeguiridadRepository;

    @Autowired
    NewIdJovenMapper newIdJovenMapper;

    public Map<String, Object> getJovenes() {
        Map<String, Object> answer = new TreeMap<>();
        
        List<NewidJovenDTO> jovenes =  newIdJovenMapper.jovenesToJovenesDTO(newIdJovenRepository.findAll()) ;

        answer.put("exitoso", true);
        answer.put("data", jovenes);

        return answer;
    }

    public Map<String, Object> ingreso(IngresoDTO ingresoDTO) {
        Map<String, Object> answer = new TreeMap<>();

        if(newIdSeguiridadRepository.findByContrasenia(ingresoDTO.getPassword()) != null){
            answer.put("exitoso", true);

        }else{
            answer.put("exitoso", false);
        }        
        return answer;
    }

    public Map<String, Object> buscar(BuscarDTO buscarDTO) {
        Map<String, Object> answer = new TreeMap<>();

        List<NewidJovenDTO> jovenesDTO = new ArrayList<>();

        if(buscarDTO.getTelefono() != null){
            if(newIdJovenRepository.findById(buscarDTO.getTelefono()).isPresent()){
                NewidJoven newIdJoven = newIdJovenRepository.findById(buscarDTO.getTelefono()).get();
                NewidJovenDTO newidJovenDTO = newIdJovenMapper.jovenToJovenDTO(newIdJoven);
                String fecha = newidJovenDTO.getFechaNacimiento().toString().substring(0, 10);
                System.out.println(fecha);
                newidJovenDTO.setFechaNacimientoString(fecha);
                jovenesDTO.add(newidJovenDTO);
                newidJovenDTO.setAsistencias(asistencias(newIdJoven));
                answer.put("exitoso", true);
                answer.put("data",jovenesDTO);

            }else{

                answer.put("exitoso", true);
                answer.put("data", jovenesDTO);

            }
            return answer;

        }else if(buscarDTO.getNombre() != null){
            List<NewidJoven> jovenes =  newIdJovenRepository.findJoven(buscarDTO.getNombre());
            if(jovenes != null || !jovenes.isEmpty()){
                jovenesDTO = new ArrayList<>();
                for (NewidJoven newidJoven : jovenes) {
                    NewidJovenDTO jovenDTO = newIdJovenMapper.jovenToJovenDTO(newidJoven);
                    String fecha = jovenDTO.getFechaNacimiento().toString().substring(0, 10);
                    System.out.println(fecha);
                    jovenDTO.setFechaNacimientoString(fecha);
                    jovenDTO.setAsistencias(asistencias(newidJoven));
                    jovenesDTO.add(jovenDTO);                    
                }
                answer.put("exitoso", true);
                answer.put("data", jovenesDTO);

            }else{

                answer.put("exitoso", true);
                answer.put("data", jovenesDTO);

            }
            return answer;
            
        }else{
            answer.put("exitoso", false);
            answer.put("data", "No se ingresaron datos");
        }
        return answer;

    }

    public Map<String, Object> registrarAsistencia(String telefono) {
        NewIdAsistencia newIdAsistencia = new NewIdAsistencia();
        Map<String, Object> answer = new TreeMap<>();

        if(newIdJovenRepository.findById(telefono).isPresent()){
            NewidJoven newIdJoven = newIdJovenRepository.findById(telefono).get();
            newIdAsistencia.setFecha(new Date(System.currentTimeMillis()));   
            newIdAsistencia.setJoven(newIdJoven); 
            newIdAsistenciaRepository.save(newIdAsistencia);
            answer.put("exitoso", true);
            answer.put("data", "Asistencia ingresada correctamente");
           
        }else{

            answer.put("exitoso", false);
            answer.put("data", "El joven no existe en la base de datos");
        }
        return answer;
    }


    Long asistencias(NewidJoven joven){
        Long asistencias = (long) newIdAsistenciaRepository.findByJoven(joven).size();
        return asistencias;
    }

    public Map<String, Object> registrarJoven(NewidJovenDTO newidJovenDTO) {
        Map<String, Object> answer = new TreeMap<>();

        if(newIdJovenRepository.findById(newidJovenDTO.getTelefono()).isPresent()){
            answer.put("exitoso", false);
            answer.put("data", "El joven ya ha sido registrado anteriormente");
            return answer;
        }
        NewidMentor newidMentor = newIdMentorRepository.findByAbreviatura(newidJovenDTO.getAbreviaturaMentor());

        NewidJoven newidJoven = newIdJovenMapper.jovenDTOToJoven(newidJovenDTO);

        LocalDate currentDate = LocalDate.now();

        // Get years old and group
        Instant instant = newidJoven.getFechaNacimiento().toInstant();

        // Convert Instant to LocalDate using system default time zone
        
        LocalDate localdate = LocalDate.ofInstant(instant, ZoneId.systemDefault());

        int anios =  (int) ChronoUnit.YEARS.between(localdate, currentDate);

        NewIdGrupoEdad newIdGrupoEdad = newIdGrupoEdadRepository.findGroup(anios);

        newidJoven.setMentor(newidMentor);
        newidJoven.setGrupoEdad(newIdGrupoEdad);
        newidJoven.setEdad((long) anios);

        newIdJovenRepository.save(newidJoven);

        answer.put("exitoso", true);
        answer.put("data", "El joven ha sido registrado");

        return answer;
    }


    
}
