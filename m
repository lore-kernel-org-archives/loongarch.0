Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013549;
	b=mcDhWnMxuh2X5Ti1/laxmGt7fFJ191ROoeh4DzMFPN8dnoVyH+rLDL25j2yS7PVcATmK
	 SJSkeXsLj5BtyVwjQR/1htA+dgMTsnO1E6LmmAvLZ5GxuoCDjXNU8/eI6J50vcNrv+cRI
	 Ad7QVI8/wZmJRY6yaRAbcM3jT2jE8KsQ9cmD+n6ZnF3/yjOtAbBersq6rNgydl+qnxxlQ
	 K3UxwwjedVAX7SYeNshwwcrBgHAiXWmauq7rMIVyvfiUEbtXnpfxUsCgo85j8GuKLr5Lr
	 qacs56HRU+XngT2upxWPzzix80bydNmqjTa3h0UrdrxYEKHQNShMpG7YAFiedG07l4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=J0H/xxIbCIwLmHjLOcIQ75jlbiqruovqTlxwP/qTOlU=;
	b=yIVzBfaJPHU3BgVa3XERWLKGrSY6/9BlidW9oMBLDV2HUa2jwqcvX2E2FGv+XjgsLcd8
	 rloZ82Cwl6mdftdhm2oipOiNFmSwMF7etCD3GA+59IhOP/tASFKsbEZPIhWh25s14VQHI
	 XjRFt8phwfc1WVa61hJ2Dbp1GW0dv6duhTo0yy0yQG+H/o5MXJiCGzyyNxSXu9BBfmsPE
	 7gaQ64arg0jJCREFmXvxYyWMxcWFtuQZknBdU43VhHzbwlBrQtOfkGz9LmULpltS9jBGC
	 4HgR77yGTzDRcLhyOmLNwnxBiKxJb7kj/Pv7+OoP6F+eSJL1N7LFSCH0AICyD+ucZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=guZkoMO8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD1606A321
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FD1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=guZkoMO8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0H/xxIbCIwLmHjLOcIQ75jlbiqruovqTlxwP/qTOlU=;
	b=guZkoMO8CwQHfARTRrbFDXtkNDIJNfbb2LjSM2XW4aY97IHCtuJ1Osma4Pq1NJibPC5u6d
	pZ71MR6OEDCSLFYsIS7nUeXMcv8MrFVrXH2pqPe43IxFsvw8VF0eKsMpUkiumiWmFhwFtv
	yR7MJ0wUe99DKjgy65J5i5mWg0eOo8k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-bMNloqC3PyWcCfI9gS9TKQ-1; Mon,
 26 Oct 2026 07:18:58 -0400
X-MC-Unique: bMNloqC3PyWcCfI9gS9TKQ-1
X-Mimecast-MFC-AGG-ID: bMNloqC3PyWcCfI9gS9TKQ_1793013536
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4904D195604A;
	Mon, 26 Oct 2026 11:18:55 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E458195608A;
	Mon, 26 Oct 2026 11:18:49 +0000 (UTC)
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
Subject: [PATCH 4/7] powerpc: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:19 +0100
Message-ID: <20261026111822.458404-5-jmarchan@redhat.com>
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
X-Mimecast-MFC-PROC-ID: gSaSTcwcjltk87vX3M41OnHcn3nme3Tk0kqqW_H3QsA_1793013536
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
 arch/powerpc/include/asm/local.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index 4c033526bfb0d..24ac534cf809a 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -140,16 +140,6 @@ static __inline__ bool local_add_unless(local_t *l, long a, long u)
 
 #define local_inc_not_zero(l)		local_add_unless((l), 1, 0)
 
-/* Use these for per-cpu local_t variables: on some archs they are
- * much more efficient than these naive implementations.  Note they take
- * a variable, not an address.
- */
-
-#define __local_inc(l)		((l)->v++)
-#define __local_dec(l)		((l)->v++)
-#define __local_add(i,l)	((l)->v+=(i))
-#define __local_sub(i,l)	((l)->v-=(i))
-
 #else /* CONFIG_PPC64 */
 
 #include <asm-generic/local.h>
-- 
2.56.0

