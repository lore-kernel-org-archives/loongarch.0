Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719100;
	b=39RZJ212l8u2bGL9x1BmSbTNwHAH4NdJjUKBrwH88sYExAHJ3n38RlqZDV312/3Il7vf
	 CWvc/6M+3qdzdE8Xj66EB8BWTq1RollExOqDR7NUUNh49dQBxhzVSMvHNZJahqU6955mo
	 YvtMo3MGGY64x1Dpvpme1T/Qs3uroBxpfKPtORtWdAA67EurtXMbBLFEye5+t1n+igD8l
	 UEyofiH/30xL5woMaUzOZc2AsUm61NXY3zautWRaMXwxKEDwg1ikjLNJps4v3c54agwkY
	 jytufJgsoKZi8kwWwqWbIuHNWtLA+n5AVzQEaitXBCCy2mYnxmLHY5rcbBOoo6vOARA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
	b=MbObd27rmuxbgmThk2W6oEb24fWnUlpXB698enZVF+AeWnzF/enxzWVxDFU/3ZG6fDU3
	 mGIQYHWmqS4AehzIAQj2K3qrhp0+gsLyCGULYDha1wHOOoHOk6UKr/+fTCPU9bFmPZoty
	 wDPryiMIjJDi0jfx1wOD70H7TXjji0UwzHI+Tys5PymAn+9pecRgOD13IRKobzTGSrdgU
	 mMvtVyAGUJSdiGsqu37JubmZLypCkjPXc4HPJ6ypn5JAXY+i34hll8Ft2ABpVWSZL0UAa
	 CebOY/8SN+60NirR6TqH3qaoe747Ie936Gam8VKNswjxp35bNZwNHBEFjOfki8wAoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VdDOqERZ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C791606D2E0
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 15:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C791606D2E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VdDOqERZ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso832451c88.1
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719099; x=1794323899; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=VdDOqERZXDwpMh6iUhONIyrygzGpJedbtJ9giM6H30VKp82InIrZxtAHrBqJDN3ExA
         LJ4YMGtDGvep+CpPlQ2haozfLh7KmkZgNXU7JZm51lHZp6XA6chVTmtPF+vwEd0Zrqa/
         AQpxObPj6lm7iISj+kUoHjz/8vY/h91b4EmM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719099; x=1794323899;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=yLLhdqn5m2XaBmWRiwX4gcH0QhUZA1cwA3tvcLoIw/cBr53fasG4BUSJjOVcaIRxqh
         QybkGcR1bhaCPo4QH9Yy8v5/UMyWou+CjiWcA6geZqYGn+ROZIJV5czFXhQvrXcVVA53
         Kq3zrfE5Z+pgAZUPJrypBbKEBpZLe6lsR4k+GTAICx2KgtLhxlLEI5chnc+QKogt4T21
         NyqDXp9GtMLn+nGc0u9KEhidbQMRhR0SCeaVU2FzLep2tpV0+PqWjugpDxdiOv/YppiV
         syp3i15oiAe3bk4avT52alZ6TMSziF6ywe2qzwIuAx6d/xx8twHCkngu9kkDwfyWX64D
         YqhQ==
X-Forwarded-Encrypted: i=1; AKwUvByU4Gbg1k8E5AG899B9pwPNe4rHUUqk8gWD+d+JdgfgrvgsB+KvJKgoij74ETyvt8A/YDxVlyqPQKE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ppNT5d5HDOBuXfXsqKnIrJHmupyO1JSPKMcE/BXTVgh/1KOK4
	qjZx8oGMx65y3GmGr+HIGPPq2aCwfmZQLEwnOKwmpwtFtb6StFW5bzQmx697k622fyo=
X-Gm-Gg: AYBFou0LqnmhSxyyfOhdmceEf+D+yvlY7WMt4Q1nweIfkNw+riLMcjL0hVL8b/OWwY9
	oo/7sKRfFTumCoP8oPV40AKhG7gtzwIYAAi7imB9Eo/4rgi3k/L+BpeLuPcF6SY4zbT13s2rjlI
	M7Gn3AZCxipXcPAO4rbSNWPV7+7J51yf9M9xmAFTGBh4qo9DhLfXZkX1Rn0VicgwFkuYvoJmcJJ
	gMVgEvulNgNAWBOwhVmv/KvTEpUi1MVHTBCzv1b7rFRxc9ds1ouqq7WxqlbkrRHcNkklw9rNJZb
	frbXlq4/KPX5SyXBjho4fNuskkt+oReLaAK+l1UKZimBESTJC9wMJs169DYrme03Z00zfNMWU1r
	7LKQW/771y5vDHOxhgY42X2zj1lYJo6H8qlTUJmI4E9vPPqiIow+NIIMYi+t2ZpKoDhBn6wCliH
	5N5rFJVmGCxRra1XyhiEss3lOcpuK7nvV8Ev/5n2LOlTew+c8m3FPpQPMSy3z1okKsChgGxc8a2
	9x7YEntSmSU8KZl9Eg6qbAV1AzUKDkEkYaInQC3XmzJx9OYH2TB6civf9uTakvUiWO4XLKU5J+S
	t5VpBMqKFMOIp/ITUjBaFt8BumT9nr7xSCSpXNExDMJAUg7ouo9l1tADdTAr3ebVh2aDe/vPHwP
	/H69MefTT+SBvjephteWmRIpKkE2BYoq0EvPFC5eFQ4O2YWYZ4PCNjo0KKcnRGAs91vn6lQHZ7k
	K5D3f//8EvUckARSXwHQ==
X-Received: by 2002:a05:7022:b903:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1ac5ac4f0aemr16822717c88.12.1793719098430;
        Tue, 03 Nov 2026 07:18:18 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm42657488c88.14.2026.11.03.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:17 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:15 +0800
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
Subject: [PATCH v2 3/8] selftests/mm: Test that the seal on system mappings
 is enforced
Message-ID: <cff8df45bfedfe7dbd3aca9416923c27be2a4a3e.1793718940.git.chris@chrisdown.name>
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

sysmap_is_sealed checks that system mappings are marked as sealed in
smaps, but not that the seal is actually enforced. The rest of this
series changes how system mappings get sealed, so let's make sure that
is covered first.

Add tests that munmap(), mremap() and mprotect() of [vdso] fail with
EPERM when it's sealed, and succeed when it isn't.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index d5ab2b0d8ca7..bfa140e01d8a 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <stdbool.h>
 #include <sys/auxv.h>
+#include <sys/mman.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
@@ -138,4 +139,104 @@ TEST_F(basic, check_sealed)
 		mapping_is_sealed(variant->name, self->maps));
 };
 
+static void *find_vdso(struct procmap_fd *procmap, size_t *size)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	if (!vdso || !find_vma_procmap(procmap, vdso))
+		return NULL;
+	*size = procmap->query.vma_end - procmap->query.vma_start;
+	return (void *)(uintptr_t)procmap->query.vma_start;
+}
+
+/*
+ * When [vdso] isn't sealed, these leave libc with a vDSO which it can't use,
+ * which is fine since each test runs in its own child. Skip if AT_SYSINFO
+ * is set, since libc may also use the vDSO for syscalls.
+ */
+TEST(vdso_munmap)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = munmap(vdso, size);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mremap)
+{
+	struct procmap_fd procmap;
+	void *vdso, *dst, *ret;
+	bool sealed;
+	size_t size;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap(vdso, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mprotect)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = mprotect(vdso, size, PROT_READ | PROT_WRITE);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	ASSERT_TRUE(find_vma_procmap(&procmap, vdso));
+	EXPECT_EQ(sealed,
+		  !(procmap.query.vma_flags & PROCMAP_QUERY_VMA_WRITABLE));
+	close_procmap(&procmap);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

