Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013557;
	b=MTzVoz0+Rh9sBw+O5Nk/8gxDX94a6PZCpFiRf4fV/c9/fLVjw71+j146S0O8qW1Jt0hj
	 qHcca3Fk8E7LouiEA7VbyQyIzzaaODnhjD3emB/Znhc49Xm0AsZ6FVPS81risU27TiG8K
	 OfCLNCm6gzmPTvylvOUD1a7fyThDeDJxKe1mnqWJCwCLTxLndar1ZEo3ydkh+u3uWLuzV
	 aqsle8wZy9XFPeFsP07WZ0J6s/fNgexRcTcohJm3QeBXw8rJCd1V5CljxDHPp+Gt9dFwh
	 lv2MAtsP3POk9+4ha94hTexMwhQSIOwdLvHTJ3I742t/XdmQUVJ8GP65yq0C2+PcWtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013557;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=pgqF4yPUt6+sPb6RLXxveXzcp+gF7pNIQTtbH3QmlwikuinXCP6Uj5UWcDl7Pfg/Zwfi
	 pU58b9ae0kPEAT/COUruV05ySUeFDyO2Mcka3tY8Jt+lTcs2My/YCjtyC3fTXs3hrJgeH
	 42Fwong2MWNcuC+apqc7RfZL5ZHeGoS7iO+qY4CEyIj1VzBmycxRwOBrUfiopgS2fe+AN
	 OVimwzrVBk5CvjqODOzH6+DaB7NHTtZs5o5lJAd9Xzi7BiYoSfncridHrivdLPxifk1wu
	 JZFq6oyaG2fXV0Lmc5dTc6TSanCIp44ktEam7L9Z44HC/M9pCFKWFw4cAttwdvwfhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ih6n0NtQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3460A260E
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC3460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ih6n0NtQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=ih6n0NtQMDZ+NteE/8LIMLEFEY5JhaICn8x+9XpzaG0Z6vEN0orwRMoz+TNBHmAb/xKH7P
	Td0ir10aRmbfo9bjkVq0jzR//Ev7sIvHOMlowtysOtNWSmwYOTTAdSp6f7J5ngGsBlhOEA
	+cbyYN60wVdjmERhDEfDfEonGJDK30E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-CumeemOmOJOuBM2QvMTNQw-1; Mon,
 26 Oct 2026 07:19:10 -0400
X-MC-Unique: CumeemOmOJOuBM2QvMTNQw-1
X-Mimecast-MFC-AGG-ID: CumeemOmOJOuBM2QvMTNQw_1793013547
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64C1956094;
	Mon, 26 Oct 2026 11:19:07 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44ADF1956087;
	Mon, 26 Oct 2026 11:19:01 +0000 (UTC)
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
Subject: [PATCH 6/7] asm-generic: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:21 +0100
Message-ID: <20261026111822.458404-7-jmarchan@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Xmk3TLjWytacRbN4E3nTFaVdT4eAgimBK8EENkgnvzI_1793013547
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While working on a fix for a tracing soft lockup, it came to my
attention that __local_dec() was broken on ppc64 and other arches (it
actually increment the value). My first instinct was to fix it but the
fact that this function was utterly broken for so long, decades for
some arches makes me thing that those functions have not been used for
a long time, if ever.

Anyway, they're not used now, so remove them.

Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 include/asm-generic/local.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index 7f97018df66fe..4bb458b57d470 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -47,11 +47,4 @@ typedef struct
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
 
-/* Non-atomic variants, ie. preemption disabled and won't be touched
- * in interrupt, etc.  Some archs can optimize this case well. */
-#define __local_inc(l)		local_set((l), local_read(l) + 1)
-#define __local_dec(l)		local_set((l), local_read(l) - 1)
-#define __local_add(i,l)	local_set((l), local_read(l) + (i))
-#define __local_sub(i,l)	local_set((l), local_read(l) - (i))
-
 #endif /* _ASM_GENERIC_LOCAL_H */
-- 
2.56.0

