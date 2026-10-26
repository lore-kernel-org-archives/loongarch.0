Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013539;
	b=Xliou1s0324NJk0g5in+Uc+fGU4j9oCNJ8E0W3sVqnnS0wYuNdZmy3Kv0cRphpqLYawR
	 VS7cJbaPkPY+EB8ubwAvHTF5NKC+kWjLm1kXwfmq27dy3WCWkwmIWumJsOQ8Z4TYA1NDR
	 maSmuJuTvOEIvhbw/0yLPjM7+lAmt8Pre8zqCE/vViqVRcEnTEzbmp9EWGA/P0y+05sIo
	 YJjUofI6jGP4Z/W4+YLWUOT+ZfI/TcUcwDbdH0ZezI7CIDxhw/sc+VB5NayzAXBD56arM
	 IEpgd18/G1kMgncr1Ld5rfkktDqWkqmzN4Oh+yOnGZR5ot2Sz/hxfewIfROXRL+fWzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013539;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=UH+pNH61tGfbI/sfWK5JCj5eLjZl6kiMykE8M9E2Fnw=;
	b=azI6q4Y/h5FYb0OikdDbnvjQUp4NKPE/DWzlf4b0bh9tn4Ag0ULK7ASBdEwS2XNmlciS
	 VUFLIaXVsHJRknE1tpQzkpRKYCgJlB9LrF2E/FpzW4VZDwOoiB4NVlm4fS1jXTG7pHNx4
	 Ep4GiOkB1idYfbjDkKbLkwvCTiGm/QEP825WNeugYum/H3qZReYM0N4Ac+K4DGcEPIKJw
	 TJVlVs1X7/lhAmPJqSBl3WOEEeHCYqpeUQa7QJr+FHhyqwHR7oxYl2CPdXXXtOM191iDd
	 W84juoetZn9Fyo6a+feWZfP/tKT/PbohwTuwvdLD3J2b1n/lp2SRTJCJhoxyRW5s7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H09HMpIT;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10851606A33C
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10851606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H09HMpIT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH+pNH61tGfbI/sfWK5JCj5eLjZl6kiMykE8M9E2Fnw=;
	b=H09HMpITZFOb+Dt9KUBVqNI7CT7OXyUAYTXCCW+gnQzDidrmuS/lwtmuiF9X5QGjqhaOc1
	6S05MaibQC2aTDDwwdGN8Xwp1D93hJb+IA1gJtylipCjF/CZp+CV1QeCt9ExAIxTYpM5VT
	Dc4WrNOHQO23EeC+ELbdroyfF99jjRw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-8_xtSpd0PHWI3KD0x8CetQ-1; Mon,
 26 Oct 2026 07:18:52 -0400
X-MC-Unique: 8_xtSpd0PHWI3KD0x8CetQ-1
X-Mimecast-MFC-AGG-ID: 8_xtSpd0PHWI3KD0x8CetQ_1793013529
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3C4E1800651;
	Mon, 26 Oct 2026 11:18:48 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 770D01956087;
	Mon, 26 Oct 2026 11:18:43 +0000 (UTC)
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
Subject: [PATCH 3/7] mips: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:18 +0100
Message-ID: <20261026111822.458404-4-jmarchan@redhat.com>
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
X-Mimecast-MFC-PROC-ID: N2hqqrzp85tmniiVAvsioy7vL-mH4DQ2LufJAa4dvcA_1793013529
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
 arch/mips/include/asm/local.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 86fc240222425..c9381e5e3eff9 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -176,14 +176,4 @@ local_add_unless(local_t *l, long a, long u)
  */
 #define local_add_negative(i, l) (local_add_return(i, (l)) < 0)
 
-/* Use these for per-cpu local_t variables: on some archs they are
- * much more efficient than these naive implementations.  Note they take
- * a variable, not an address.
- */
-
-#define __local_inc(l)		((l)->a.counter++)
-#define __local_dec(l)		((l)->a.counter++)
-#define __local_add(i, l)	((l)->a.counter+=(i))
-#define __local_sub(i, l)	((l)->a.counter-=(i))
-
 #endif /* _ARCH_MIPS_LOCAL_H */
-- 
2.56.0

