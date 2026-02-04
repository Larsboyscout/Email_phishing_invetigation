# Case Study: Phishing & Account Compromise Analysis
**Project Date:** February 4, 2026  
**Analyst:** Lars Stevenson

## 1. Executive Summary
This project documents the identification, analysis, and reporting of a sophisticated phishing attempt originating from a compromised educational domain (`maricopa.edu`). By analyzing email headers and file metadata, I confirmed a **True Account Compromise (TAC)** and facilitated remediation by reporting findings to the originating institution.

## 2. Evidence Collection (IOCs)
- **Sender:** Marilyn Greenwood (`ROB2368101@maricopa.edu`)
- **Sender IP:** `209.85.216.42`
- **Subject:** "Performance Feb 4"
- **Attachment:** `26-82161805190996.docx`
- **Social Engineering Vector:** Recipient name mismatch ("Kaesha Potter") designed to induce curiosity.

## 3. Technical Analysis

### A. Header Forensics
Analysis of the raw SMTP headers revealed that the email passed all major authentication checks:
- **SPF:** Pass
- **DKIM:** Pass
- **DMARC:** Pass



**Finding:** The "Pass" status confirms the email was sent through authorized Maricopa servers. The headers also show the use of `HTTPREST` via `gmailapi.google.com`, indicating that the attacker was likely using an automated script via a compromised API token rather than a manual web login.

### B. Forensic Scripting (PowerShell)
I utilized a custom PowerShell script to calculate the file hash for cross-referencing with threat intelligence databases (VirusTotal/Talos).

```powershell
# Generate SHA256 Hash for file integrity verification
Get-FileHash -Path ".\26-82161805190996.docx" -Algorithm SHA256
## 4. Incident Response & Remediation
Following the **NIST Incident Response Lifecycle (SP 800-61)**, I moved from Detection into the **Coordination and Containment** phase. 

### A. External Communication
I drafted and submitted a formal **Security Incident Report** to the Maricopa Community College Information Security Team. This report included:
- The compromised account ID (`ROB2368101`).
- The verified Source IP (`209.85.216.42`).
- A request for token revocation based on the identified `HTTPREST` injection method.

### B. Defensive Posture
- **Local Isolation:** The malicious attachment was moved to a password-protected ZIP archive for forensic storage.
- **Verification:** I utilized PowerShell to verify that no unauthorized outbound connections were established during the analysis phase.



## 5. About the Author
**Lars Stevenson** *Cybersecurity & Infrastructure Analyst*

I am a technical professional with a focus on SOC operations and infrastructure security. My background includes formal training from the **University of Toronto's Cybersecurity Bootcamp** and a portfolio of industry certifications including **CompTIA Security+, ISC2 CC, and SSCP**.

### Public Speaking & Community Engagement
I am an active member of the security community and have previously presented at **BSides**. 
- **[Link to your BSides Presentation/Video]**
- **GitHub Portfolio:** [Link to your main GitHub page]
- **LinkedIn:** [Link to your LinkedIn Profile]
