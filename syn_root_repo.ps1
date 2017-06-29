# root repository up to date.
pushd root;
write-host "`$PWD is : $PWD";
write-host git pull;
git pull;
popd;
write-host "`$PWD is : $PWD";
write-host "`n`n`n";

# check out each repository to local copy.
ls root | %{
 if ($_.Extension -ne ".md") {
  write-host $_.name;
  if (test-path leaf/$_) {
   write-host $_.name already exist, now pull to latest...;
   write-host sh github.sh pull $_;
   sh github.sh pull $_;
  } else {
   write-host $_.name not exist, now pull to local...;
   write-host sh github.sh pull $_;
   sh github.sh pull $_;
  }
  # create local clone when first pull the repository.
  if (!(test-path $_)) {
   write-host git clone leaf/$_;
   git clone leaf/$_;
  }
  # update the repository to latest.
  if (test-path $_) {
   pushd $_;
   write-host "`$PWD is : $PWD";
   write-host git pull;
   git pull;
   popd;
   write-host "`$PWD is : $PWD";
  }

  write-host "`n`n`n";
 }
}
