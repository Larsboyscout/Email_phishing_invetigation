# Case Study: Phishing & Account Compromise Forensic Analysis
**Project Date:** February 4, 2026  
**Analyst:** Lars Stevenson

---

## 1. Executive Summary
This project documents the identification, analysis, and reporting of a sophisticated phishing attempt originating from a compromised educational domain (`maricopa.edu`). By analyzing raw SMTP headers and file metadata, I confirmed a **True Account Compromise (TAC)**. This case study demonstrates the full lifecycle of an incident, from initial detection to external stakeholder notification and remediation.

## 2. Evidence Collection (IOCs)
* **Sender:** Marilyn Greenwood (`ROB2368101@maricopa.edu`)
* **Recipient Name (Mismatched):** Kaesha Potter
* **Target Email:** `larsstevenson@outlook.com`
* **Sender IP:** `209.85.216.42` (Authorized Google/Maricopa Infrastructure)
* **Subject:** "Performance Feb 4"
* **Attachment:** `26-82161805190996.docx` (85 KB)

## 3. Technical Analysis

### A. Header Forensics & Authentication
Analysis of the raw SMTP headers revealed that the email successfully bypassed security filters by leveraging a compromised internal account:
* **SPF/DKIM/DMARC:** All reports returned **PASS**, confirming the email was sent through authorized servers.
* **Delivery Method:** The headers indicate the message was injected via `gmailapi.google.com` (HTTPREST), suggesting automated "blast" phishing using compromised API tokens.
* **Social Engineering:** The use of a mismatched recipient name ("Kaesha Potter") was identified as a "curiosity bait" tactic designed to induce the user to open the attachment.



### B. Forensic Scripting (PowerShell)
To inspect the file without risk of execution, I utilized PowerShell to generate a cryptographic hash for reputation checking and to inspect file streams for hidden data.

```powershell
# Generate SHA256 Hash for file integrity verification
Get-FileHash -Path ".\26-82161805190996.docx" -Algorithm SHA256

# Check for Alternative Data Streams (ADS) used to hide malicious payloads
Get-Item -Path ".\26-82161805190996.docx" -Stream *
````



## 4. Incident Response & Remediation
Following the NIST Incident Response Lifecycle (SP 800-61), I moved from Detection into the Coordination and Containment phase.

### A. External Stakeholder Notification
I submitted a formal Security Incident Report to the Maricopa Community College Information Security Team. Key data provided included the verified source IP and the specific account ID to facilitate token revocation and account lockout.

### B. Defensive Posture
Local Isolation: The malicious attachment was quarantined in a password-protected archive.

Environment Verification: PowerShell was used to ensure no unauthorized persistence or outbound connections were established.

## 5. About the Author
Lars Stevenson | Cybersecurity & Infrastructure Analyst

I am a technical professional focused on SOC operations and infrastructure security. My background includes formal training from the University of Toronto's Cybersecurity Bootcamp and a portfolio of industry certifications including CompTIA Security+




