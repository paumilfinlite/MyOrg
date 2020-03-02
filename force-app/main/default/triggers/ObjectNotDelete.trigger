trigger ObjectNotDelete on Account (before delete) {
	 for(Account acc : trigger.old){
        acc.adderror('Account Cannot Be Deleted');
    }
}