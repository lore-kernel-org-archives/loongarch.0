Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719078;
	b=dHieSRz7dQMxSOBNtjBusTDuhZN7Fv7TiCkRolAZ0VVG/uT2xN4hEQhDvaECigpwzRSR
	 mm8E/ECTLP2MJdubx7DU1n4cX4Q7zHEZy/4/PFGy/6tJBI8B80M+KKWOx5OqttiA3fkNO
	 McMlSx4d6f/v2pRRj0noQYbhdJzshU+fdb+HiwlD3gv14mmUiyH6dOdF+Nu6VT23Pn019
	 b5bxXFjBmsXpzjnntiWz1FnYDNdphPuWyeKQAaw9eRYoWtrvleOpht/9Nkrf2xiv+VaFB
	 YpFEjEfpNdWl/KlF1/JoI77SrTG84NUuvGw6GUpWDwNMWJRq1eFn5ZJYqv/HtVIKqcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=bbduBp3PV2PD6ZtgXv4ZkeG/rcdvbrKsRxBHo1Elyzk=;
	b=o7irrsP0YE4IpUA/LAsUaywFx366hYFRvHeRZet54vvQ1MSAPV3CXbJBIQTPH+X1arCe
	 oVNNlAPIbSraGanmEc47HYNuw8etspJMrS3Gn/BER7208gUrbGe4iDQRh6HtP//Dk50eu
	 Hgz2sYcAJqPrLh44srzak3Gnh0mTcPAk2qrfU+cGsKI3byId3eemzWddxL3F13p603XPd
	 /KgZSNQzixQdtpFg2tVaZOjHuHenaoEA4rBp6vtetd+gt75x4Ql82+5Dz22Yo09Vo8dYT
	 UMwigv3rVmgrfrKGKlC2yaHnP79nf84AbZ7FkUu5zlQivRdjioPqZCpRwEhxvHx2r+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iYQcMQzF;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214C606BA20
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 15:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6214C606BA20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iYQcMQzF
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so2064284a91.0
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719078; x=1794323878; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bbduBp3PV2PD6ZtgXv4ZkeG/rcdvbrKsRxBHo1Elyzk=;
        b=iYQcMQzFEw9Lu454YCGSdCSuVg7lybfEjbxHhajlWdWlYAyFmsisPYdfsDPoC0Jxm8
         IOjV5vJMGZtU/voYzfT1d0khwPuEPzCI5vc+XE7CxUe9gjEpttQ+TELVJqdrEcp3JsQV
         nVBz+XBhPawk4vAZk+qWSCNdeS5b4XVYUMZoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719078; x=1794323878;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbduBp3PV2PD6ZtgXv4ZkeG/rcdvbrKsRxBHo1Elyzk=;
        b=qgG0iv0/klF/YmZ/WQHievKfjLL4tvnrq3M5lcWl8Ibh00qiqO+ciDDRFZUEOJaJCs
         iOX3M8PdmqfrW86Q7WC7gEHL8CHBVNKG6COVW8t+2QOEwei742zM5dwpjgz/heYRoXwp
         JKhXKE8GckYQJFHMzX46N+Ynb4c9j5iBGzXXSDx/ZTj8GkUy+LcT5HPuQj7ybfVJxaps
         ACGrisdSvGb8HE8+EgXK7odDf/efIeprIlVN5ZJ7MGq9vZEryDlcZh0G7d2w1XQ7eIQ5
         pCqVfMxCGw7+4cdNe2aRijU/kexBDfwRIfeioqEwkT91jDJgolsanTORWGz+Z4DtoTrw
         375Q==
X-Forwarded-Encrypted: i=1; AKwUvByWenEA9laocpwvWcfWW41i5yRvp4B9rMB+ThNp6xtcjzs2B4n4f5ePrS/HbcAS3Wzc0SVySbmph2I=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VieNqg4DKS8zaiaJgxFakxJV0xN4x1eLaodaLuH2fL2wpvLIV
	JRLOe5iz5TLQXu7wLpLEpAfnRCNy/9sh2YGLQbwnqRk5Gj70vv1g+mxG4rjjtbthvak=
X-Gm-Gg: AYBFou2AXtiHTXjBLyGwAC0JoVll/Acus734W0Egnpe1Ua3S7ioc7jAQr5FwlFnhQHX
	nF5/oRyHppJVkgwPJK7F3Sd2MzBdGgVKI8ymIdXEm3QgpmY++aEDYPIHNC+US26x6XY9LZzOINt
	VOTOarbiFx/jbwVfLPKbfGfpSryvxuO1KZiqFRZwaBmd0BANTl/0PvFWFnX9tEUi4Mf7DC6mHb3
	+drKKiAwtlE+bs0cIXzdROwpcjmCqndM6+6SjzcMVoHiQiQEQVhIycF4T++0T6TFlCUDV2Sly9k
	85o/tdi/U+xLzb1DYIorUWllfSfOf6psZpjezG8pVDtzE35KL69+BXfWr9smHW70dPseruTFG3p
	PB5Kb4dq9ffewb7C7MXaqoZziGHhNNK+alkS/u6eIXLPPzEJwaWqQl1H3nMJQU1eVrQx0eS1iQ0
	6YxT42F5T+akp1cqXAoTK35jhd/VGuP5JoA8gTI1V4FVCU7d7K/Y5N7l7alVDBRMi41aZnyotVa
	tJoki11TAvzEaWCsTZfrjCf7fsqYLLU83W3kv2tIwkFw70AwL4IBZK6f/Z0N+5t46oMoXvKVbUt
	iZR5APhUx1YgycXt/Z1iNu8jwjiPZNwlOocetff7ETAURrOWqVgYEgVQ0ndQqBoKH2v8JLjxiGy
	raxT0ciAkn4fFygYe5cvxTOk/NRh6awhLnlcwGPHowA09x0ftrGsKlwmuPBtQ/U2bHeblq8S/
X-Received: by 2002:a17:90b:4e8f:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ae89806287mr10222361a91.49.1793719077568;
        Tue, 03 Nov 2026 07:17:57 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f69605sm10791677a91.2.2026.11.03.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:17:56 -0800 (PST)
Date: Tue, 3 Nov 2026 23:17:54 +0800
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
Subject: [PATCH v2 1/8] selftests/mm: Move sysmap_is_sealed into mm
Message-ID: <1e2cfbe24810f976ee6e176346598900295adc73.1793718940.git.chris@chrisdown.name>
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

System mapping sealing is an mm feature, but its test has its own
directory under tools/testing/selftests rather than living with the
other mm tests.

Let's move it into tools/testing/selftests/mm and run it with the mmap
tests. Its config now comes from mm's config fragment. The test itself
is unchanged.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/Makefile                            | 1 -
 tools/testing/selftests/mm/Makefile                         | 1 +
 tools/testing/selftests/mm/config                           | 1 +
 tools/testing/selftests/mm/run_vmtests.sh                   | 1 +
 .../{mseal_system_mappings => mm}/sysmap_is_sealed.c        | 0
 tools/testing/selftests/mseal_system_mappings/.gitignore    | 2 --
 tools/testing/selftests/mseal_system_mappings/Makefile      | 6 ------
 tools/testing/selftests/mseal_system_mappings/config        | 1 -
 8 files changed, 3 insertions(+), 10 deletions(-)
 rename tools/testing/selftests/{mseal_system_mappings => mm}/sysmap_is_sealed.c (100%)
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/.gitignore
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/Makefile
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/config

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 07c3719f8b04..94276b1310de 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -84,7 +84,6 @@ TARGETS += mount
 TARGETS += mount_setattr
 TARGETS += move_mount_set_group
 TARGETS += mqueue
-TARGETS += mseal_system_mappings
 TARGETS += nci
 TARGETS += net
 TARGETS += net/af_unix
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 675ec57d47de..94e305643c8d 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -110,6 +110,7 @@ TEST_GEN_FILES += folio_order_check
 TEST_GEN_FILES += khugepaged_sync_check
 TEST_GEN_FILES += khugepaged_race
 TEST_GEN_FILES += soft-dirty
+TEST_GEN_FILES += sysmap_is_sealed
 
 ifeq ($(ARCH),x86_64)
 CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
diff --git a/tools/testing/selftests/mm/config b/tools/testing/selftests/mm/config
index 06f78bd232e2..b93b49cd675f 100644
--- a/tools/testing/selftests/mm/config
+++ b/tools/testing/selftests/mm/config
@@ -14,3 +14,4 @@ CONFIG_UPROBES=y
 CONFIG_MEMORY_FAILURE=y
 CONFIG_HWPOISON_INJECT=m
 CONFIG_PROC_MEM_ALWAYS_FORCE=y
+CONFIG_MSEAL_SYSTEM_MAPPINGS=y
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 973cb715b326..573da5006268 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -307,6 +307,7 @@ fi
 
 CATEGORY="mmap" run_test ./map_populate
 CATEGORY="mmap" run_test ./droppable
+CATEGORY="mmap" run_test ./sysmap_is_sealed
 
 CATEGORY="mlock" run_test ./mlock-random-test
 
diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
similarity index 100%
rename from tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
rename to tools/testing/selftests/mm/sysmap_is_sealed.c
diff --git a/tools/testing/selftests/mseal_system_mappings/.gitignore b/tools/testing/selftests/mseal_system_mappings/.gitignore
deleted file mode 100644
index 319c497a595e..000000000000
--- a/tools/testing/selftests/mseal_system_mappings/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-sysmap_is_sealed
diff --git a/tools/testing/selftests/mseal_system_mappings/Makefile b/tools/testing/selftests/mseal_system_mappings/Makefile
deleted file mode 100644
index 2b4504e2f52f..000000000000
--- a/tools/testing/selftests/mseal_system_mappings/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-CFLAGS += -std=c99 -pthread -Wall $(KHDR_INCLUDES)
-
-TEST_GEN_PROGS := sysmap_is_sealed
-
-include ../lib.mk
diff --git a/tools/testing/selftests/mseal_system_mappings/config b/tools/testing/selftests/mseal_system_mappings/config
deleted file mode 100644
index 675cb9f37b86..000000000000
--- a/tools/testing/selftests/mseal_system_mappings/config
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_MSEAL_SYSTEM_MAPPINGS=y
-- 
2.54.0

