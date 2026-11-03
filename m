Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719070;
	b=sDK4Zyz0nSqLwadXVMaa7fkC/fKa8PjCEAwgHH6Xtq71TZX0xqfg2AsVXrOrXCoFYXos
	 EO0Ktk9Bj8ayedMwE5Gch/oeENxr7XEeYz51xfC9VjcIGmENRerj1/pReRWfpQjsR153p
	 2RdhMNI07LxffhhqAyihehsgtaVeTb+q76C8IfugZiTzlmHsGbXmx/R7cdux0ZefMLA5K
	 rYyQkSTfLNL093yFtIDD1SjTI7AlUIENBvpP3JST3odn40PWZ/xCivWbi6aXByGqqeMou
	 YZhi6x1/ZOTYXXVJKR9flMu9ALHkoIMdvgAtCU1fKC5NKG24dtiUz90lvkMGUN6ifLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
	b=QnzooCLweLd5uQrjn1qCUp+zEJ4Hcvgka7gxDmJRdv1rMruOjycYUj1IQ+Er2Z1+nY+a
	 iiJWrGkD/62kGB/VFe0zpULXL1a/yASORjcj9INkUMaVve4jNUfqPUDKOXpXwux1Tor6u
	 NNCY4+OVdjbd4OatlRCVS8/ShJDbg4kRHEUv0y/P/7lAc8lrZQoBUugokvtIhPwixrGRP
	 kvZ8+svj5qO/uvRj351UXjIG9GiZswl3IDMmdQIhYb7Tklj/n2EeuAYKv8zxCZfgPQqfG
	 1sb5hmpjC3jyIlVxwMmCYthB40AQnyJiMqkJzN4fPdt4b+6gFQ2ZXpfz8gF7uX5MIQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JnlPEf6B;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63717606A786
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 15:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63717606A786
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JnlPEf6B
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so2068633a91.3
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719069; x=1794323869; darn=lists.linux.dev;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=JnlPEf6BHoXl6cwMVhvhbW3/WTu3vh1A3PHeVP3LdKVQ6P8noYUvctth0ub1VO9xND
         LyWMW+vFoRfi/+wgU6RXVb8CLpilQw4S5UnL05DJg0zwgGI6uD66Xv2UVQ6UZM1mldTo
         19NQjw/36auDHfkjm5r5O8pmMmi8rGG5gWDa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719069; x=1794323869;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=W3PrjjwRFGs5b8e3Gk0IVYhUwUd6zAVst6oTi7v3yZX8WLDPYjtuj1fOTsm2NNiFRk
         29cwpPrqDMEnB43Lgc7dFbblr8HYCB0qYaMDFLvTAxzU0qAtr4T0aZcTkzeUsJKHC8OR
         ICXO6nq1CyroYNsFH8mWrmvS8b7y8xfkoY/IRcdkcFYtT9MiLnTn5BRTcbIcvR12cemJ
         Ld4Lrrv8goM+ZNoNlghk7que5s2zEVttCfv3fQC0CDmjkZMmyBal0wxNBckA8FZYkOG6
         EU77cM8EtAhbQMcOqc1FKn21jJX/JInIv/Wk9tIPPfjlMpAcQdYX8YZ6NDlM5eH2ik6s
         ZPPA==
X-Forwarded-Encrypted: i=1; AKwUvByvZR85uL/6lHm2hTdUwhc7vze7jN8vVUFdiRSdqEvNicuz9G/06YTHBiW0Vs5TE6Ulmz2aXD8kuqc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/5vi24zyULJYcLJqJA1wNIOUJz7Rusi1FGgOc1D0D1uy80Lrdq
	DGvFpeLbqZUHIT2a5aKsmh5azPjiARCSZoy8nXtfg+8doo9LWHyb5wcW1h5xcFMZu4k=
X-Gm-Gg: AYBFou0ijoVE/dGia4mdQAPGL84JsY+/LSlLUi4jpI/XiwE6vJPyMfWmWiwabzv6vZn
	mpJefOcDWkFACQPRHRi5p3TBF6BbkGBIZ3Xap/lnaq4VAh/e/s2reLdvkmKlLHa2E6m9GeNyjdn
	20CIKvpeMCW6l8j93cbJG4i36Ou8T0iNM6XbMQPax6hEBPYCsIdd19ji9iTQ6m0K3WKKLF+JDAA
	UWsivg76+UCLSAu4h837+AOYzS+Qvh4suYBlRSUqXezP0yERACF1MWGWpgmW3LyaFs7CIi9QhJ9
	LgFfNvxhT0hzocbm3MdExfZCLLKCtWFre1POERiU4tK/lMG/3cR04JIh+P3Pi/8d6szXicay348
	N9nRowiinv5dLVxWUD/egV3SXBg94c06dNEZkZd851kWTvOhO3ivX0pjAAXVkgEMkPpqwzCB7qN
	e0zP7LG+pzoNuFeaiV5i0QTqr2e+0avRr6VclSPfm81/VN5+pMt5TaMZkyUVCAMiq1x7G4kL24u
	BR5oNKsE/inwA5ay0u2fnrBnc/h9pO0+I1Zz+RcRkHftjGirPmRTj53JgLmnv2oGEPRXgJizSR+
	+noet/E3sEo/RyP5G8SWn2d6VcACmseBYstMJA742im56kZyD3km1vkLHIop9IVQ2T0RGGmZ6Kq
	PJGR5aqgB/G41I1xzpGRe9AaiNDSJTeNu8qRJjBJN8d9c8qb4349uAKBIAn3505rUPlp4qwiAWw
	X8TVJDX1b9+AU8o2SOZw==
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr10813768a91.11.1793719068633;
        Tue, 03 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c62984bsm4849760a91.9.2026.11.03.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:17:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:17:43 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793718940.git.chris@chrisdown.name>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

v2:

- Skip destructive vDSO tests on unsealed 32-bit x86 mappings
- Move the sysmap tests into selftests/mm (Lorenzo)
- Use shared vm_util helpers in the sysmap tests (Lorenzo)
- Use PROCMAP_QUERY for the vDSO lookup (Lorenzo)
- Keep test changes in separate patches (Lorenzo)
- Put the enforcement tests before the kernel changes (Lorenzo)
- Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig (Lorenzo)
- Remove VM_SEALED_SYSMAP (Lorenzo)
- Seal mappings in __install_special_mapping() (Lorenzo)
- Leave a sealed uprobe trampoline mapped if optimisation fails
- Replace the boolean parameter with no_mseal_sys_mappings (Lorenzo)
- Drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON (Lorenzo)
- Drop the CHECKPOINT_RESTORE dependency (Lorenzo)
- Document the software which sealing breaks (Lorenzo)
- Keep Kconfig default-n regardless of CHECKPOINT_RESTORE (Andrei)
- Retain sealing by default when built in, with no_mseal_sys_mappings as
  the boot-time opt-out (Lorenzo)
- Explain the security rationale (Lorenzo)
- Describe the Meta/Reverie use case (Lorenzo)
- Skip general checks on unsealed kernels (Lorenzo)
- Add expect_sealed for strict CI checks (Jeff)
- Use the existing -T filter to exclude strict checks when needed (Jeff)
- Test that no_mseal_sys_mappings leaves mappings unsealed (Jeff)
- Add the vDSO mprotect() enforcement test (Jeff)

v1: https://lore.kernel.org/r/cover.1793094611.git.chris@chrisdown.name

Chris Down (8):
  selftests/mm: Move sysmap_is_sealed into mm
  selftests/mm: Skip sysmap_is_sealed when system mappings aren't sealed
  selftests/mm: Test that the seal on system mappings is enforced
  mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
  uprobes/x86: Leave sealed trampolines in place on optimisation failure
  mm/mseal: Seal system mappings in __install_special_mapping()
  mm/mseal: Add no_mseal_sys_mappings boot parameter
  selftests/mm: Check that no_mseal_sys_mappings unseals system mappings

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |  12 +-
 arch/arm64/kernel/vdso.c                      |   9 +-
 arch/loongarch/kernel/vdso.c                  |   3 +-
 arch/riscv/kernel/vdso.c                      |   2 +-
 arch/s390/kernel/vdso.c                       |   2 +-
 arch/x86/entry/vdso/vma.c                     |   5 +-
 arch/x86/kernel/uprobes.c                     |   2 +-
 include/linux/mm.h                            |   6 -
 init/Kconfig                                  |   5 +-
 kernel/events/uprobes.c                       |   2 +-
 lib/vdso/datastore.c                          |   2 +-
 mm/Kconfig                                    |  23 ++
 mm/mseal.c                                    |  12 +
 mm/vma.c                                      |   2 +
 mm/vma.h                                      |   8 +
 security/Kconfig                              |  21 --
 tools/testing/selftests/Makefile              |   1 -
 tools/testing/selftests/mm/Makefile           |   1 +
 tools/testing/selftests/mm/config             |   1 +
 tools/testing/selftests/mm/run_vmtests.sh     |   6 +
 tools/testing/selftests/mm/sysmap_is_sealed.c | 259 ++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |   5 +
 tools/testing/selftests/mm/vm_util.h          |   1 +
 .../mseal_system_mappings/.gitignore          |   2 -
 .../selftests/mseal_system_mappings/Makefile  |   6 -
 .../selftests/mseal_system_mappings/config    |   1 -
 .../mseal_system_mappings/sysmap_is_sealed.c  | 119 --------
 28 files changed, 345 insertions(+), 180 deletions(-)
 create mode 100644 tools/testing/selftests/mm/sysmap_is_sealed.c
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/.gitignore
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/Makefile
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/config
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c


base-commit: 734a9da61a5bc5d82b496a86bacc097d11dc6871
-- 
2.54.0

