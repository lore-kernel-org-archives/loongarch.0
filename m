Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719108;
	b=n95wCWW+Hvdc1fUiICg1KfzULrybFf6RYNWRn9visRshqU2ilgOtRpkwyCtzUUBPfJFH
	 VzvVPyS+DI2wMVS7ZTLctF+XmApB8p8i5AK0m+ZrX+N5V2q4h+2s033lktjWHE4z8x9tC
	 fFFqx1rHsH1FsnJEoRNY9EZG2Ka1lYeSgC8UoYX6E7Xnk8hcd6Y+AVI3TsGhDhnAN7xh3
	 uRFE3Oj126Wx9rw8FXBlOPFD/muM5jUvoFBOrJ4TiQsFkl8tZdp0etqYEGlKJEnArZQtw
	 40iwxjIJHaQeWYF+gFssXQva9IKcJLBNggEUEb8bkXtt12t5/imCJPPIYzcTz1WCZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
	b=vLRwiV0Vk+r+JlvtDLIEWP46997hK3w2/3KyRRK/riDaFmrj7rLVfq7NwH4IB0kUmeDM
	 tSRl0xLoSUEu1hgyfEITXS6vWF2q29cJCE1i4846pI7hXPpjaSp9iu6fguI7anIex2atp
	 3b1rvkXUUQl8a8XxqcaziY/kNkKxWQGd2uCc2oX+eNH3VUhzotvDJXFRwAmBx1lKe34bi
	 7A9PCtZE3i3I2ZoVyZ0htmmh0i6XIwJBBYQexRs+kFNtZeJr+RsgLrXALRpDQSxxYKp9p
	 EPLeoqDQ95GQPV7OZYJuOY6okncQa4nzqL6C8/uu8XjUluz0QDSQFebPeImtcYA2vCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ume+K52S;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC219606EE8A
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 15:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC219606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ume+K52S
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso20813035ad.0
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719107; x=1794323907; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=ume+K52Sg3NqrHAkBCxSD6hQ1nQfUE0zoH8Ckh03MxeBrMSpTH18N0Uhci6wrMQB2r
         tmYqSKjp8rpoy9KDYgsnbGLNgVi2VLWaXZjqVD1L+3A/o/5VyYoHHEajCWuFt78FTXCl
         sSF8tlJDdvoi81s6gxt5fw+sV8FGn4AeDkc3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719107; x=1794323907;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=fivwqlkcQwaxTmVdbMtSZN2dMsZIb95/HMV5bRxi4JLWZWEtxVQQbkfo9DoKOL0BSG
         mPdh4mZuIPjSfDltuEM4DQQGFIpQvE9g34cnhr9XV4rCT4wPsf6NJTLFmqBJEC4OTyQ7
         W9vYzkwsu8YDRbAfh7HzHwwIiGyXOMSOfJVi4KHfDdjOgFopIqq8SoCHMDJiKq/r+2fd
         V0VZpzq1xnE8j3nt5tIct0RIB7lANQaFmEcD7DGvH9qx9Eh0O4NyNSLak+qYdso5d1om
         +4moIVIkK9SWh+eVmTcO3S4nqkZyKMM8OzulPWEXrBAhQf1n66PqJ40AlXLhRidlxMnC
         YBLA==
X-Forwarded-Encrypted: i=1; AKwUvBwW/422SBO6Il2WIzAHi+GP4iwMM/RmGftbWENCdu+F9AGkB+lgJxDgNARc7MGGtEaZtPaR9MuBPwE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ChExfawcl9d3aznLTdLpoYFHPyN4mgYizKWU2ZFP7u8EAJBMp
	XoZJV+WaBzHvUPzcqi4R6rDdut4rakooO4GJECDaU73335G8WMJYQfvAsGpC+LV5kQw=
X-Gm-Gg: AYBFou0S/jx5Kkeb6R5L/C8FgjMmpsjZICljBoEfiBnjOEcKjOZ74uPl4Skh8uf8uFI
	PLjwmuBnLnqK7zV8FhUApRRjB/UbNiuiiQRL0+eR4etA3a4VE7CssNtwwHUZocg1PfPeMqeJOLr
	sqBaabcqIarWH8qHTj+nqtV/RM3x8VaX/GAOF0XF7B+VeBZacYENwhyn1luQRt4FBijexZlCt0p
	4EmeyCq2djP6sEbXyy0PXiF+E91aYrf8aa4vdkiGtiw2QSZXcsKMGBOOwmqbqGcmlPDlgrpJkkO
	iooX7rEacLifdqtBl1PIhA4GfGK+lJokuGc7bkcul967Kac9hS4U4BDpDkB+J5iN9WIdeFecr16
	BlcRt7KZN0B2TpE6HhG6Kind1+Btm3nuwbky6bIgK8g0euHAZhnbE/IkH2gEYeQoqgzLGOLefjc
	2u0GDVclddiGQsF+vVLAI2eB0jvi/uc95BvUGOpAoxKmvuo6YnHgtkNTMod6RUT4ss82vjvQdEh
	P3figs9CskrwZfmjMWR7Hbe5hI3zm+FsNCWDDFAzHAaOz1ACxGgnsgfBVHgZvcgvfAYbrpqBxJv
	/HF3V+3Vhq6tJ6WZ6XuM2vUx9t7rjMq4MGjcXP4RhtPuvS0Bb6NGwhbDWDddEAjxUKnoT+hiBmu
	ZUrAu5qRqklj52uMMijA/zJYqhTejOxFnEP/iHZHufDsFmz50nkMOfWHEjNTIVNY+vtfT0lGMYj
	U0rEMT1//bpDgR4BmYN80=
X-Received: by 2002:a17:903:1aef:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2eb364bc076mr131151785ad.39.1793719107092;
        Tue, 03 Nov 2026 07:18:27 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392613bbsm43426035ad.37.2026.11.03.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:25 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:23 +0800
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
Subject: [PATCH v2 4/8] mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
Message-ID: <6d72b96fdd36c8870393d8d6e67a811a9bce9e4f.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

MSEAL_SYSTEM_MAPPINGS is in security/Kconfig, but it's an mm feature,
it's implemented in mm, and changes to it need to go past mm.

Let's move it to mm/Kconfig, next to the other VMA features. No
functional change.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig       | 21 +++++++++++++++++++++
 security/Kconfig | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..40172787dfa7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1355,6 +1355,27 @@ config ANON_VMA_NAME
 	  area from being merged with adjacent virtual memory areas due to the
 	  difference in their name.
 
+config MSEAL_SYSTEM_MAPPINGS
+	bool "mseal system mappings"
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
+	depends on !CHECKPOINT_RESTORE
+	help
+	  Apply mseal on system mappings.
+	  The system mappings includes vdso, vvar, vvar_vclock,
+	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
+
+	  A 64-bit kernel is required for the memory sealing feature.
+	  No specific hardware features from the CPU are needed.
+
+	  WARNING: This feature breaks programs which rely on relocating
+	  or unmapping system mappings. Known broken software at the time
+	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
+	  this config can't be enabled universally.
+
+	  For complete descriptions of memory sealing, please see
+	  Documentation/userspace-api/mseal.rst
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/security/Kconfig b/security/Kconfig
index f7bf6cdc6229..1679e8d009c3 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -49,27 +49,6 @@ config PROC_MEM_NO_FORCE
 
 endchoice
 
-config MSEAL_SYSTEM_MAPPINGS
-	bool "mseal system mappings"
-	depends on 64BIT
-	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
-	help
-	  Apply mseal on system mappings.
-	  The system mappings includes vdso, vvar, vvar_vclock,
-	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
-
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
-	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
-
-	  For complete descriptions of memory sealing, please see
-	  Documentation/userspace-api/mseal.rst
-
 config SECURITY
 	bool "Enable different security models"
 	depends on SYSFS
-- 
2.54.0

