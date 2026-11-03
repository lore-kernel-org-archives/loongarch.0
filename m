Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719155;
	b=K0lbpe9hZagYSq63ZFpVcfWe7Y0/PRfcGI1o3V0qt+4jLFnUWDoj9WeKhoVPU3fH+ROG
	 oEOEjXt+F4nTuLnfKzNLWuo4HIMYQHomNB/NEJpxLHLpdHcX9A1h2M1KlTyDR6+9sZXIt
	 F6mn+lkAzJdZsJMb2txKBUSQwH+LvLtIYghHe0OHjjVIFQST/hV/MBYZQpXoGDcggVYTA
	 OaxgSiVBRsgu+NXx1Fv89zDQ++hNAHernVT9Fm0P9qACr7nMBht0deru6hV5eyF9RMoW+
	 +WsXlAg4dTFiTPQkBu1Shg0rIo3yMT3BKHC55EQBTUVPAxuhxpwxa2bBkGvJoDiTNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
	b=XW6nY7jrz0Qyx7Es7sN7id4ocQnxu2mqiKouGG7R//NyUvZW1CSei8voygNs4SdFQ/1z
	 tUOlrHYQcbmlHD9a+Edj3gHfsPnZfvOZf91ougw/l9W63agnMhQQeyHD4eOIDhlRaI36K
	 +CP27B1KNIRTxfaqBIZ4eWM2AWIuJ5yF9zOTPxVmOmsG5LGBRVzoeFqAzQiD9WC8r5bJO
	 lWcPOGq81yJWrIcRtpb5XJbWo8IouvH/M2RVxnVcprGjOJVrhMsrNQVpGg3yhA1hjWn2t
	 /o5SaKq5ganJyaTLfmQKwAWNaCeq1HZ4yIQwJL5x7glgHxMJI4jiVKAmRFkayEeUFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QZjoSVR7;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACD606D2FD
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 15:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27ACD606D2FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QZjoSVR7
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e812e2b31bso25717975ad.3
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719154; x=1794323954; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=QZjoSVR7FJ/qmuMe/fl/ylXF1Cbbt27pkxZdL8HsULx/zWxi5K/c6mM4nPtpFyQjxL
         zzwcGcRmVilvvzYENhb3Lb7rTgq2S07MJ2lOliQsua2Vbl0C+8YGfbsF+W66OvunDemP
         69odEWkdDHodur7KziiqrC3DGwQk8mRwItea4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719154; x=1794323954;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=FJUQIIo7BfpX73xQie+5CCR+wkKHm0ckAJHxpMYvCm+gKByaLJuvAMXMNV9pCJztIV
         Zmkyb/RAD7DRcTu7giU/VUOTOArTM5SZhJxAlHISFjyS8+7pphokdiWgVM2BOrxFx1Eg
         DY0mOyK6bmKdryvyGvNdIo+HanO3+Whu61I2/UaxcqIDaL6TxcwHxFZWqRbzkRVwWukI
         RAYQetU8LW04lx+Mn8Lq5sOt8W8/qsSJXgFEDk1ub92/gGb7wPDDfXDB7PTBwx86OcAg
         /p6jEQtUhaYt9weI5aWfP8nhENB2TNZ2Rdq3aMnLu8OVFbgnI6gZqxxQTLGfpMtoOkCX
         6ZWg==
X-Forwarded-Encrypted: i=1; AKwUvBxvhQYXC55mTQZ8b1Z41b7iKYLwnQ/eQakHXbqZ1bHoCMTNGQrMSD8PxWSZkTJNpXLw85eZa43PM0U=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GytThr3aJ+BG/sosR7rqjKa8ArcWmmIQiPaSMC0JENU266uO4
	YRNN4mQK4Ecg+cXAntbQXB520kws1qibH3EBTa29w5EuXD1v6xjyoEVmC3Yp0mz/i98=
X-Gm-Gg: AYBFou3qt2eALX85FJ21Cn+3aI8HZoKXim/BBZs+ZwKo4lONqpPQMnunD0vp874yNx5
	9rAc4n+P/gRMfsB8OKaYKQ6zltQCSnCQW0J0sPnHG0P5zRgJRteZpgcpRC+6kptngwc18+4W57N
	rd1KeCe1lnVKwMCJ5fkXQJXr+2rqkPmI8ibbTxK9+wH5MskIxfIUjn5zcc2wPJEquYLMTfUgLZb
	zt/KN8msvNcYCb1kl3fVkFC3rSeK19mIPifANMgLB0gFAhs7q4JVkeL1RtpKEa2x0B7twFx8ciq
	IXYo3l6p2Y3r6y78VQzBms/wmPu0/wKRg+QB+Neq+x3/Rrn0+HaSDA/XtkalEYadESjSn3RIKOf
	k9pmfiizawDj7o5yPgNw3HCj3t16irpqPnqV1mb/nZiu+W0CHqPAwJnNHN02JCoggYRcjQTZKHT
	9Arfg+k47irCS0FFU0lUtnFNxdjyWXHLWCE/qAp85UhZR1GK+kS4fwxhOZX1KfVVryL806Tn0R/
	XSAVoFbsmNbat7AM6jQbV6QQ0pwYT87e+A7C5ZAW4+2CAyazRa7oHwS/WzBgFeFy8BUKWGlDRst
	vm9Z0v1guI+KpoW6QUtiT6jbCWRyjXwPv+ogEA6AP0faOb+xTpNkRBG4YS4wCbl44oj/GBaqxWE
	Kf1HAZV/EYw+9HQka9MyAjLt/f+QQQscVAmE06VmoXGzGIyyMxm6ZcukoZpCcT4xvEDj4+9FG
X-Received: by 2002:a17:903:1b2d:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2eb36414d03mr125058495ad.7.1793719154563;
        Tue, 03 Nov 2026 07:19:14 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm42885535ad.32.2026.11.03.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:13 -0800 (PST)
Date: Tue, 3 Nov 2026 23:19:10 +0800
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
Subject: [PATCH v2 8/8] selftests/mm: Check that no_mseal_sys_mappings
 unseals system mappings
Message-ID: <053ef1ff0a6a7e5b37109d59a064a7665e087cb0.1793718940.git.chris@chrisdown.name>
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

Booting with no_mseal_sys_mappings currently makes check_sealed skip and
expect_sealed fail, so nothing checks that the parameter actually turns
sealing off.

So let's check /proc/cmdline for it, and when it's there, expect [vdso]
and the other system mappings to be unsealed rather than skipping or
failing. The vdso tests already expect munmap(), mremap() and mprotect()
to succeed when [vdso] isn't sealed, so that covers what the parameter
allows as well.

Suggested-by: Jeff Xu <jeffxu@google.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index bfa140e01d8a..158e116ca3b4 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -56,6 +56,21 @@ static bool sysmaps_sealed(void)
 	return vdso && check_vmflag_sealed(vdso);
 }
 
+static bool sysmaps_disabled(void)
+{
+	char cmdline[4096];
+	bool disabled = false;
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return false;
+	if (fgets(cmdline, sizeof(cmdline), f))
+		disabled = strstr(cmdline, "no_mseal_sys_mappings");
+	fclose(f);
+	return disabled;
+}
+
 /*
  * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
  * mappings either, so check_sealed skips if they aren't sealed. This fails
@@ -63,7 +78,7 @@ static bool sysmaps_sealed(void)
  */
 TEST(expect_sealed)
 {
-	EXPECT_TRUE(sysmaps_sealed());
+	EXPECT_EQ(!sysmaps_disabled(), sysmaps_sealed());
 }
 
 FIXTURE(basic) {
@@ -127,7 +142,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
-	if (!sysmaps_sealed())
+	bool disabled = sysmaps_disabled();
+
+	if (!disabled && !sysmaps_sealed())
 		SKIP(return, "system mappings are not sealed");
 
 	if (!has_mapping(variant->name, self->maps)) {
@@ -135,8 +152,8 @@ TEST_F(basic, check_sealed)
 			variant->name);
 	}
 
-	EXPECT_EQ(variant->sealed,
-		mapping_is_sealed(variant->name, self->maps));
+	EXPECT_EQ(variant->sealed && !disabled,
+		  mapping_is_sealed(variant->name, self->maps));
 };
 
 static void *find_vdso(struct procmap_fd *procmap, size_t *size)
-- 
2.54.0

