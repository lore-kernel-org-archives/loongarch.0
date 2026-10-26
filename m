Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013560;
	b=hHDBtqGo0Htanj0QOBltkntt85JHgno559xMVFHeslSD1KpgTacpD+T0Is8dJyYlzRBl
	 zurvGw8/9HgmxP4cuYqMXCuxLU3tKKWvGHuxqnZox1ijJBouOzW613qM6Z6emRHiWp8in
	 h7UxXnHg3YHSuwRluRk/M1CyxKELHlsfycfR+pPRWUseqAwFu9MQuGgo5Myk+D2B3poyf
	 O+HIcqSz2mIprx0xXFAuqLn0jjsWJXgk0YKA3Zw1EvKtis73UJAFf9zpxnZfoHOD6MBk0
	 UqTBFnuSvwLloVe62fJUnrPW8oJEU/0JVWD2yivVuh0NNN0xkK1cSvjxVlfIuwE3NjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013560;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=Jsb8n2PnG62q8kRquOJFB0kDepBKTWthhPmFyD+4b2I=;
	b=jTUG00d/Z2RheaMiMaHUocOnsowX+Q0VUYqvOnzrjEE5h01hH4QXLicRjgepFWDIoTK+
	 H2BGoxP2XD1t3Qdw5TXzj360SPwngYF1YbWegKFP/HtFAdPm1whaPKzrAS4n4W2cIW6/U
	 XxOEb3ph2MsKlDDJqd8L4B+Ydc6OnUiRNPpp5Pd8+ph1nKMj01yodf4q5yKteD/6v8qWt
	 LcMW74iiOE+VpuHdGSkIcU1LGot2dc+NzFGm4+xsiTZ/t9u+WZsRwnaHHal0ZR759taqU
	 HYWTmsANfmg53ceaa9AmKzQcZqq1+17oTezAPvm79SiuRNVIs/EoorzRuYgYIP6y1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QarcFGaA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998A60A2622
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4998A60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QarcFGaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsb8n2PnG62q8kRquOJFB0kDepBKTWthhPmFyD+4b2I=;
	b=QarcFGaAPGfNnQBuSN/yTZxr0s3UzgliJYppUra4zG9WZ1r7aZZKZsMuVOXaGTZNrDfXa0
	uawITrGEnodAucvNW2zHNCu2sRH4fy/NBqNMZcs/0TUQKB08kAKEhakPdm7buUoZ8v4d25
	LSN9SwPD/plBsGpgyw7vz1Re5aISSSY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-Bu33x-t4PUy_yTIIX_4dyA-1; Mon,
 26 Oct 2026 07:19:16 -0400
X-MC-Unique: Bu33x-t4PUy_yTIIX_4dyA-1
X-Mimecast-MFC-AGG-ID: Bu33x-t4PUy_yTIIX_4dyA_1793013553
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D97671800632;
	Mon, 26 Oct 2026 11:19:12 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9ABDE1956087;
	Mon, 26 Oct 2026 11:19:07 +0000 (UTC)
From: Jerome Marchand <jmarchan@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	Jerome Marchand <jmarchan@redhat.com>
Subject: [PATCH 7/7] asm-generic: Remove the unused non-atomic local64_t functions
Date: Mon, 26 Oct 2026 12:18:22 +0100
Message-ID: <20261026111822.458404-8-jmarchan@redhat.com>
In-Reply-To: <20261026111822.458404-1-jmarchan@redhat.com>
References: <20261026111822.458404-1-jmarchan@redhat.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 2Xz_N91mncS7twtZhvUILQ-YY3oFZPjU6dcw41DDyHQ_1793013553
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While working on a fix for a tracing soft lockup, it came to my
attention that __local_dec() was broken on ppc64 and other arches (it
actually increment the value). My first instinct was to fix it but the
fact that this function was utterly broken for so long, decades for
some arches makes me thing that those functions have not been used for
a long time, if ever.

The local64_t non-atomic functions aren't used either, so remove
them too.

Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 include/asm-generic/local64.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/asm-generic/local64.h b/include/asm-generic/local64.h
index 14963a7a62538..b30ae05f42b95 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -56,13 +56,6 @@ static inline bool local64_try_cmpxchg(local64_t *l, s64 *old, s64 new)
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
 
-/* Non-atomic variants, ie. preemption disabled and won't be touched
- * in interrupt, etc.  Some archs can optimize this case well. */
-#define __local64_inc(l)	local64_set((l), local64_read(l) + 1)
-#define __local64_dec(l)	local64_set((l), local64_read(l) - 1)
-#define __local64_add(i,l)	local64_set((l), local64_read(l) + (i))
-#define __local64_sub(i,l)	local64_set((l), local64_read(l) - (i))
-
 #else /* BITS_PER_LONG != 64 */
 
 #include <linux/atomic.h>
@@ -95,13 +88,6 @@ typedef struct {
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
 
-/* Non-atomic variants, ie. preemption disabled and won't be touched
- * in interrupt, etc.  Some archs can optimize this case well. */
-#define __local64_inc(l)	local64_set((l), local64_read(l) + 1)
-#define __local64_dec(l)	local64_set((l), local64_read(l) - 1)
-#define __local64_add(i,l)	local64_set((l), local64_read(l) + (i))
-#define __local64_sub(i,l)	local64_set((l), local64_read(l) - (i))
-
 #endif /* BITS_PER_LONG != 64 */
 
 #endif /* _ASM_GENERIC_LOCAL64_H */
-- 
2.56.0

