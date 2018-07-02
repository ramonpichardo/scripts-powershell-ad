$maxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days

Get-ADUser -Filter * -Properties * | Format-Table -Wrap -AutoSize -Property SamAccountName,
                    @{label='CN/FullName';expression={$_.CN}},
                    @{label='AcctEnabled';expression={$_.Enabled}},
                    @{label='AcctLockedOut';expression={$_.LockedOut}},
                    @{label='AcctExpiresTime';expression={$_.AccountExpirationDate}},
                    @{label='LastLogonTime';expression={$_.LastLogonDate}},
                    @{label='PswdCannotBeChanged';expression={$_.CannotChangePassword}},
                    @{label='PswdNotRequired';expression={$_.PasswordNotRequired}},
                    @{label='PswdNeverExpires';expression={$_.PasswordNeverExpires}},
                    @{label='PswdLastSetTime';expression={$_.PasswordLastSet}},
                    @{label="PswdExpiresTime";Expression={$_.PasswordLastSet.AddDays($maxPasswordAge)}},
                    @{label='Comment';expression={$_.Description}},
                    @{label='AccountType';expression={$_.CanonicalName}},
                    @{label='Groups';expression={$_.MemberOf}}