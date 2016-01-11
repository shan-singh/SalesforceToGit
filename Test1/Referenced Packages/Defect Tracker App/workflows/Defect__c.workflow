<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Defect_has_been_assigned_it_to_you</fullName>
        <description>Defect has been assigned it to you</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_it_to_email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/When_Defect_is_created</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_When_Status_is_Closed_to_everyone</fullName>
        <description>Send Email When Status is Closed to everyone</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_By_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Assigned_it_to_email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>shan.singh40@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/Defect_is_Closed_1</template>
    </alerts>
    <alerts>
        <fullName>Send_Notification_to_Assigned_User_and_Raised_By_User_and_manager</fullName>
        <description>Send Notification to Assigned User and Raised By User and manager</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_By_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Assigned_it_to_email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/When_defect_status_is_Changed</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_user_for_mass_assignment</fullName>
        <description>Send email to user for mass assignment</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_it_to_email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/Mass_Assignment_to_Assigned_to</template>
    </alerts>
    <alerts>
        <fullName>send_mail_to_assignee_when_assigned_by_is_filled</fullName>
        <description>send mail to assignee when assigned by is filled</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_By_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/send_mail_to_assignee</template>
    </alerts>
    <alerts>
        <fullName>when_defect_is_created_it_will_send_mail_to_the_user_who_has_created_the_defect</fullName>
        <description>when defect is created it will send mail to the user who has created the defect</description>
        <protected>false</protected>
        <recipients>
            <recipient>shan.singh40@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Defect_Templates/Defect_Created_1</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_assigned_by_email_field</fullName>
        <field>Assigned_By_Email__c</field>
        <formula>Assigned_By__r.Email__c</formula>
        <name>Update assigned by email field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_email_field_and_defect</fullName>
        <field>Assigned_it_to_email__c</field>
        <formula>Assigned_To__r.Email__c</formula>
        <name>Update email field and defect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Actual_close_date</fullName>
        <field>Actual_Closer_Date__c</field>
        <formula>TODAY()</formula>
        <name>update Actual close date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>when_field_assigned_to_is_filled</fullName>
        <description>it should send email to the particular user</description>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>when field assigned to is filled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Defect search action</fullName>
        <actions>
            <name>Send_email_to_user_for_mass_assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Defect__c.Massassignflag__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>When defect is created</fullName>
        <actions>
            <name>when_defect_is_created_it_will_send_mail_to_the_user_who_has_created_the_defect</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>When status is closed</fullName>
        <actions>
            <name>Send_Email_When_Status_is_Closed_to_everyone</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL( Status__c , &apos;Closed&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>When status is closed populate actual closer date</fullName>
        <actions>
            <name>update_Actual_close_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Defect__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>When user fills assigned by</fullName>
        <actions>
            <name>send_mail_to_assignee_when_assigned_by_is_filled</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_assigned_by_email_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR((NOT(ISBLANK(Assigned_By_Email__c)) &amp;&amp; ISCHANGED( Assigned_By_Email__c)), isNew())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>when Defect Status changed Inform the User</fullName>
        <actions>
            <name>Send_Notification_to_Assigned_User_and_Raised_By_User_and_manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>when sender fills assigned to</fullName>
        <actions>
            <name>Defect_has_been_assigned_it_to_you</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_email_field_and_defect</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>when_field_assigned_to_is_filled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR((NOT(ISBLANK(Assigned_it_to_email__c )) &amp;&amp;  ISCHANGED(   Assigned_it_to_email__c)), isNew())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>when sender fills assigned to email</fullName>
        <actions>
            <name>Update_email_field_and_defect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK(  Assigned_To__c  )) &amp;&amp;  ISCHANGED(  Assigned_To__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
