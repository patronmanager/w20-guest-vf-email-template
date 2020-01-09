List<PermissionSet> permSets = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Sites'];
List<User> users = [SELECT Id FROM User WHERE UserType = 'Guest'];



insert new PermissionSetAssignment(
        PermissionSetId = permSets.get(0).Id,
        AssigneeId = users.get(0).Id
);
