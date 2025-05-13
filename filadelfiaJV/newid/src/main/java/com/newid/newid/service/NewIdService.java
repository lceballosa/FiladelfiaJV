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
import com.newid.newid.dto.EmailRequestDTO;
import com.newid.newid.dto.IngresoDTO;
import com.newid.newid.dto.NewIdActividadDelDiaDTO;
import com.newid.newid.dto.NewIdAsistenciaDTO;
import com.newid.newid.dto.NewIdPassesDiaDTO;
import com.newid.newid.dto.NewidJovenDTO;
import com.newid.newid.dto.NewidPadreDTO;
import com.newid.newid.dto.PassesDTO;
import com.newid.newid.mapper.NewIdContactoMapper;
import com.newid.newid.mapper.NewIdJovenMapper;
import com.newid.newid.mapper.NewIdJovenPassesMapper;
import com.newid.newid.mapper.NewIdPadreMapper;
import com.newid.newid.mapper.NewIdPadreMapperImpl;
import com.newid.newid.mapper.NewIdPassesDiaMapper;
import com.newid.newid.models.NewIdActividadDelDia;
import com.newid.newid.models.NewIdAsistencia;
import com.newid.newid.models.NewIdAsistenciaPray;
import com.newid.newid.models.NewIdContacto;
import com.newid.newid.models.NewIdEmails;
import com.newid.newid.models.NewIdGrupoEdad;
import com.newid.newid.models.NewIdJovenPasses;
import com.newid.newid.models.NewIdPasse;
import com.newid.newid.models.NewIdPassesDia;
import com.newid.newid.models.NewIdSeguimiento;
import com.newid.newid.models.NewIdSeguridad;
import com.newid.newid.models.NewIdTipoActividades;
import com.newid.newid.models.NewidJoven;
import com.newid.newid.models.NewidMentor;
import com.newid.newid.models.NewidPadre;
import com.newid.newid.repository.NewIdActividadDelDiaRepository;
import com.newid.newid.repository.NewIdAsistenciaPrayRepository;
import com.newid.newid.repository.NewIdAsistenciaRepository;
import com.newid.newid.repository.NewIdContactoRepository;
import com.newid.newid.repository.NewIdEmailsRepository;
import com.newid.newid.repository.NewIdGrupoEdadRepository;
import com.newid.newid.repository.NewIdJovenPassesRepository;
import com.newid.newid.repository.NewIdJovenRepository;
import com.newid.newid.repository.NewIdMentorRepository;
import com.newid.newid.repository.NewIdPadreRepository;
import com.newid.newid.repository.NewIdPassesDiaRepository;
import com.newid.newid.repository.NewIdPassesRepository;
import com.newid.newid.repository.NewIdSeguimientoRepository;
import com.newid.newid.repository.NewIdSeguiridadRepository;
import com.newid.newid.repository.NewIdTipoActividadesRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


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

    @Autowired
    NewIdContactoRepository newIdContactoRepository;

    @Autowired
    NewIdPadreMapper newIdPadreMapper;

    @Autowired
    NewIdPadreRepository newIdPadreRepository;

    @Autowired
    NewIdAsistenciaPrayRepository newIdAsistenciaPrayRepository;

    @Autowired
    NewIdContactoMapper newIdContactoMapper;

    @Autowired
    NewIdJovenPassesMapper newIdJovenPassesMapper;

    @Autowired
    NewIdJovenPassesRepository newIdJovenPassesRepository;

    @Autowired
    NewIdPassesRepository newIdPassesRepository;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    NewIdEmailsRepository newIdEmailsRepository;

    @Autowired
    NewIdActividadDelDiaRepository newIdActividadDelDiaRepository;

    @Autowired
    NewIdPassesDiaRepository newIdPassesDiaRepository;

    @Autowired
    NewIdTipoActividadesRepository newIdTipoActividadesRepository;

    @Autowired
    NewIdPassesDiaMapper newIdPassesDiaMapper;

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
                newidJovenDTO.setFechaNacimientoString(fecha);
                jovenesDTO.add(newidJovenDTO);
                newidJovenDTO.setAsistencias(asistencias(newIdJoven));
                if(newIdJoven.getContacto() != null){
                    newidJovenDTO.setContacto( newIdContactoMapper.toDTO(newIdJoven.getContacto()));
                }
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

    String nombreCompleto(NewidJovenDTO newidJovenDTO){
        if(newidJovenDTO.getSegundoNombre() == null){
            newidJovenDTO.setSegundoNombre("");
        }
        String nombreCompleto = newidJovenDTO.getPrimerNombre() + " " + newidJovenDTO.getSegundoNombre() + " " + newidJovenDTO.getPrimerApellido() + " " + newidJovenDTO.getSegundoApellido();
        return nombreCompleto;
    }

    String nombreCompletoPadre(NewidPadreDTO newidPadreDTO){
        if(newidPadreDTO.getSegundoNombre() == null){
            newidPadreDTO.setSegundoNombre("");
        }
        String nombreCompleto = newidPadreDTO.getPrimerNombre() + " " + newidPadreDTO.getSegundoNombre() + " " + newidPadreDTO.getPrimerApellido() + " " + newidPadreDTO.getSegundoApellido();
        return nombreCompleto;
    }

    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Map<String, Object> registrarJoven(NewidJovenDTO newidJovenDTO) {
        Map<String, Object> answer = new TreeMap<>();

        if(newIdJovenRepository.findById(newidJovenDTO.getTelefono()).isPresent()){
            answer.put("exitoso", false);
            answer.put("data", "El joven ya ha sido registrado anteriormente");
            return answer;
        }
        NewidMentor newidMentor = newIdMentorRepository.findByAbreviatura(newidJovenDTO.getAbreviaturaMentor());

        NewidJoven newidJoven = newIdJovenMapper.jovenDTOToJoven(newidJovenDTO);

        newidJoven.setNombreCompleto(nombreCompleto(newidJovenDTO));
        newidJoven.setFechaInscripcion(new Date(System.currentTimeMillis()));

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

        NewIdContacto newIdContacto = new NewIdContacto();
        newIdContacto.setNombreContacto(newidJovenDTO.getContacto().getNombreContacto());
        newIdContacto.setTelefonoContacto(newidJovenDTO.getContacto().getTelefonoContacto());
        newIdContacto.setCorreoContacto(newidJovenDTO.getContacto().getCorreoContacto());
        newIdContacto.setParentesco(newidJovenDTO.getContacto().getParentesco());

        newIdContacto = newIdContactoRepository.save(newIdContacto);
        newidJoven.setContacto(newIdContacto);

        newIdJovenRepository.save(newidJoven);

        answer.put("exitoso", true);
        answer.put("data", "El joven ha sido registrado");

        return answer;
    }

    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Map<String, Object> editarJoven(NewidJovenDTO newidJovenDTO) {
        
        Map<String, Object> answer = new TreeMap<>();

        if(newIdJovenRepository.findById(newidJovenDTO.getTelefono()).isPresent()){
            NewidJoven newidJoven = newIdJovenRepository.findById(newidJovenDTO.getTelefono()).get();
            newidJoven.setPrimerNombre(newidJovenDTO.getPrimerNombre());
            newidJoven.setSegundoNombre(newidJovenDTO.getSegundoNombre());
            newidJoven.setPrimerApellido(newidJovenDTO.getPrimerApellido());
            newidJoven.setSegundoApellido(newidJovenDTO.getSegundoApellido());
            newidJoven.setTelefono(newidJovenDTO.getTelefono());
            newidJoven.setNombreCompleto(nombreCompleto(newidJovenDTO));
            newidJoven.setFechaNacimiento(newidJovenDTO.getFechaNacimiento());
            newidJoven.setParqueadero(newidJovenDTO.getParqueadero());
            newidJoven.setGenero(newidJovenDTO.getGenero());

            LocalDate currentDate = LocalDate.now();

            // Get years old and group
            Instant instant = newidJoven.getFechaNacimiento().toInstant();

            // Convert Instant to LocalDate using system default time zone
            
            LocalDate localdate = LocalDate.ofInstant(instant, ZoneId.systemDefault());

            int anios =  (int) ChronoUnit.YEARS.between(localdate, currentDate);
            NewIdGrupoEdad newIdGrupoEdad = newIdGrupoEdadRepository.findGroup(anios);

            newidJoven.setTelefono(newidJovenDTO.getTelefono());
            NewidMentor newidMentor = newIdMentorRepository.findByAbreviatura(newidJovenDTO.getAbreviaturaMentor());
            newidJoven.setMentor(newidMentor);
            newidJoven.setGrupoEdad(newIdGrupoEdad);
            newidJoven.setEdad((long) anios);

            if (newidJoven.getContacto() == null){
                NewIdContacto newIdContacto = new NewIdContacto();
                newIdContacto.setNombreContacto(newidJovenDTO.getContacto().getNombreContacto());
                newIdContacto.setTelefonoContacto(newidJovenDTO.getContacto().getTelefonoContacto());
                newIdContacto.setCorreoContacto(newidJovenDTO.getContacto().getCorreoContacto());
                newIdContacto.setParentesco(newidJovenDTO.getContacto().getParentesco());

                newIdContacto = newIdContactoRepository.save(newIdContacto);
                newidJoven.setContacto(newIdContacto);
            }
            newidJoven.getContacto().setNombreContacto(newidJovenDTO.getContacto().getNombreContacto());
            newidJoven.getContacto().setTelefonoContacto(newidJovenDTO.getContacto().getTelefonoContacto());
            newidJoven.getContacto().setCorreoContacto(newidJovenDTO.getContacto().getCorreoContacto());
            newidJoven.getContacto().setParentesco(newidJovenDTO.getContacto().getParentesco());

            newIdContactoRepository.save(newidJoven.getContacto());

            newIdJovenRepository.save(newidJoven);

            answer.put("exitoso", true);
            answer.put("data", "El joven ha sido editado");

        }else{
            answer.put("exitoso", false);
            answer.put("data", "El joven no existe en la base de datos");
        }
        return answer;
    }

    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Map<String, Object> registrarPadre(NewidPadreDTO newidPadreDTO) {
        
        Map<String, Object> answer = new TreeMap<>();
        NewidPadre  newidPadre = new NewidPadre();
        if(newIdPadreRepository.findById(newidPadreDTO.getTelefono()).isPresent()){
            answer.put("exitoso", true);
            answer.put("data", "El padre ya ha sido registrado anteriormente");
            return answer;
        }else{
            newidPadre = newIdPadreMapper.padreDTOToPadre(newidPadreDTO);
            newidPadre.setFechaInscripcion(new Date(System.currentTimeMillis()));
            LocalDate currentDate = LocalDate.now();

            // Get years old and group
            Instant instant = newidPadreDTO.getFechaNacimiento().toInstant();

            // Convert Instant to LocalDate using system default time zone
            
            LocalDate localdate = LocalDate.ofInstant(instant, ZoneId.systemDefault());

            int anios =  (int) ChronoUnit.YEARS.between(localdate, currentDate);
            newidPadre.setEdad((long) anios);
            newidPadre.setNombreCompleto(nombreCompletoPadre(newidPadreDTO));
            newIdPadreRepository.save(newidPadre);
            answer.put("exitoso", true);
            answer.put("data", "El padre ha sido registrado");
            return answer;
        }


    }

    public Map<String, Object> buscarPadre(String telefono) {
        Map<String, Object> answer = new TreeMap<>();
        if(newIdPadreRepository.findById(telefono).isPresent()){
            NewidPadre newidPadre = newIdPadreRepository.findById(telefono).get();
            NewidPadreDTO newidPadreDTO = newIdPadreMapper.padreToPadreDTO(newidPadre);
            answer.put("exitoso", true);
            answer.put("data", newidPadreDTO);
            return answer;
        }else{
            answer.put("exitoso", false);
            answer.put("data", "El padre no existe en la base de datos");
            return answer;
        }
    }

    public Map<String, Object> registrarAsistenciaPray(String telefono) {
        NewIdAsistenciaPray newIdAsistencia = new NewIdAsistenciaPray();
        Map<String, Object> answer = new TreeMap<>();

        if(newIdJovenRepository.findById(telefono).isPresent()){
            NewidJoven newIdJoven = newIdJovenRepository.findById(telefono).get();
            newIdAsistencia.setFecha(new Date(System.currentTimeMillis()));   
            newIdAsistencia.setJoven(newIdJoven); 
            newIdAsistenciaPrayRepository.save(newIdAsistencia);
            answer.put("exitoso", true);
            answer.put("data", "Asistencia ingresada correctamente");
           
        }else{

            answer.put("exitoso", false);
            answer.put("data", "El joven no existe en la base de datos");
        }
        return answer;
    }

    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Map<String, Object> registrarPasses(PassesDTO passesDTO) {
        NewIdPasse newIdPasse = newIdPassesRepository.findById(passesDTO.getIdPasse()).get();
        NewidJoven newIdJoven = newIdJovenRepository.findById(passesDTO.getIdJoven()).get();
        NewIdJovenPasses newIdJovenPasses = new NewIdJovenPasses();
        newIdJovenPasses.setFecha(new Date(System.currentTimeMillis()));
        newIdJovenPasses.setJoven(newIdJoven);
        newIdJovenPasses.setPasse(newIdPasse);
        newIdJovenPassesRepository.save(newIdJovenPasses);
        Map<String, Object> answer = new TreeMap<>();
        answer.put("exitoso", true);
        answer.put("data", "Passe registrado correctamente");
        return answer;
    }

    public Map<String, Object> enviarEmailSalida(EmailRequestDTO emailRequest) throws MessagingException {

        Map<String, Object> answer = new TreeMap<>();

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        NewIdEmails newIdEmails = newIdEmailsRepository.findById(1L).get();
        
    

        helper.setTo(emailRequest.getTo().toArray(new String[0]));
        helper.setSubject(newIdEmails.getAsunto());
        helper.setText(newIdEmails.getCuerpo(), true); // 'true' enables HTML content
        helper.setFrom("Prueba email Filadelfia <lau.ceballos00@gmail.com>");


        mailSender.send(message);
        answer.put("exitoso", true);
        answer.put("data", "Email enviado correctamente");
        return answer;
    }

    public Map<String, Object> cambiarContrasenia(IngresoDTO ingresoDTO) {
        Map<String, Object> answer = new TreeMap<>();

        if(newIdSeguiridadRepository.findByContrasenia(ingresoDTO.getPassword()) != null){
            NewIdSeguridad newIdSeguridad = newIdSeguiridadRepository.findByContrasenia(ingresoDTO.getPassword());
            newIdSeguridad.setContrasenia(ingresoDTO.getNewPassword());
            newIdSeguiridadRepository.save(newIdSeguridad);
            answer.put("exitoso", true);
            answer.put("data", "La contraseña ha sido cambiada");
        }else{
            answer.put("exitoso", false);
            answer.put("data", "La contraseña actual no es correcta");
        }
        return answer;
    }

    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Map<String, Object> actividadDelDia(NewIdActividadDelDiaDTO newIdActividadDelDia) {
        Map<String, Object> answer = new TreeMap<>();

        NewIdActividadDelDia newIdActividadDelDiaModel = new NewIdActividadDelDia();
        newIdActividadDelDiaModel.setFecha(new Date(System.currentTimeMillis()));
        newIdActividadDelDiaModel.setNewIdTipoActividades(newIdTipoActividadesRepository.findById(newIdActividadDelDia.getIdNewIdTipoActividades()).get());

        newIdActividadDelDiaModel = newIdActividadDelDiaRepository.save(newIdActividadDelDiaModel);

        for (NewIdPassesDiaDTO newIdPassesDiaDTO : newIdActividadDelDia.getNewidPassesDiaList()) {
            NewIdPassesDia newIdPassesDia = new NewIdPassesDia();
            newIdPassesDia.setPuntos(newIdPassesDiaDTO.getPuntos());
            newIdPassesDia.setPasse(newIdPassesRepository.findById(newIdPassesDiaDTO.getIdPasse()).get());
            newIdPassesDia.setActividadDelDia(newIdActividadDelDiaModel);
            newIdPassesDia = newIdPassesDiaRepository.save(newIdPassesDia);

        }

        
        answer.put("exitoso", true);
        answer.put("data", "Actividad del día registrada");



        return answer;
    }

    public Map<String, Object> verActividadDelDia() {

        NewIdActividadDelDiaDTO newIdActividadDelDiaDTO = new NewIdActividadDelDiaDTO();
        Map<String, Object> answer = new TreeMap<>();
        NewIdActividadDelDia newIdActividadDelDiaModel = new NewIdActividadDelDia();
        newIdActividadDelDiaModel = newIdActividadDelDiaRepository.findTopByOrderByIdDesc();

        newIdActividadDelDiaDTO.setActividadDia(newIdActividadDelDiaModel.getNewIdTipoActividades().getNombre());

        List<NewIdPassesDiaDTO> newIdPassesDiasDTO = newIdPassesDiaMapper.newIdPassesDiasToNewIDPassesDiaDTOs(newIdPassesDiaRepository.findByActividadDelDia(newIdActividadDelDiaModel)); 

        newIdActividadDelDiaDTO.setNewidPassesDiaList(newIdPassesDiasDTO);


        answer.put("exitoso", true);
        answer.put("data", newIdActividadDelDiaDTO);
        return answer;
        // TODO Auto-generated method stub
    }

    
}
