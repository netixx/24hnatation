<?php

class Application_Model_DbTable_InscriptionsEquipes extends Projet_Db_Table {
	const NAME = 'INSCRIPTIONS_EQUIPES';


	public function __construct() {
		parent::__construct(self::NAME);
	}

}
