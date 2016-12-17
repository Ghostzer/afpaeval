<?php

namespace mpc\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use mpc\PlatformBundle\Entity\Reservation;
use mpc\PlatformBundle\Entity\Utilisateurs;

class DefaultController extends Controller {

    public function indexAction() {
        $em = $this->getDoctrine()->getManager();

        $bds = $em->getRepository('mpcPlatformBundle:Bd')->findBy([], ['date' => 'DESC']); //trie par date
        $livres = $em->getRepository('mpcPlatformBundle:Livre')->findBy([], ['date' => 'DESC']); //trie par date
        $cds = $em->getRepository('mpcPlatformBundle:Cd')->findBy([], ['date' => 'DESC']); //trie par date


        return $this->render('mpcPlatformBundle:Default:index.html.twig', array('bds' => $bds, 'livres' => $livres, 'cds' => $cds
        ));
    }

    public function ajoutReservationsAction(Request $request) {

        $em = $this->getDoctrine()->getManager();

        $id_select = $request->get('id'); // on récupère la valeur "id", par exemple le chiffre 2 et on la place dans la variable $id_select, $id_select = 2
        $datetoday = new \DateTime();
        $currentuser = $this->getUser();

        $objet = $em->getRepository('mpcPlatformBundle:Ouvrage')->find($id_select); // Il va chercher dans la table Ouvrage l'id correspondant (2 toujousr dans l'exemple) afin de l'associer

        $reservation = new Reservation; // on créer un objet vide dans la table Reservation

        $reservation->setOuvrage($objet); // on set la colonne ouvrage_id avec la variable objet, donc 2
        $reservation->SetDate($datetoday); // on set la date avec la date d'aujourd'hui
        $reservation->setUtilisateur($currentuser); // on set l'utilisateur avec celui actuellement logué

        $em->persist($reservation);

        $em->flush();


        return $this->render('mpcPlatformBundle:Default:ajout_reservations_ok.html.twig');
    }

    public function mesReservationAction() {
        $em = $this->getDoctrine()->getManager();

        $reservations = $em->getRepository('mpcPlatformBundle:Reservation')->findAll();

        return $this->render('mpcPlatformBundle:Default:mesreservations.html.twig', array('reservations' => $reservations,
        ));
    }

    public function listeReservationAction() {
        $em = $this->getDoctrine()->getManager();

        $reservations = $em->getRepository('mpcPlatformBundle:Reservation')->findAll();

        return $this->render('mpcPlatformBundle:Default:listereservations.html.twig', array('reservations' => $reservations
        ));
    }

}
