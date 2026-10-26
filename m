Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013525;
	b=Jdm4Rt8U1yKYI6ST2cJIjTid+4M2fk0AsWUiUBAEw68BTqd09jo4yY5y/LQJiGC13G8M
	 XFbBt8ClEQyvuJ+Z68U2j+YIcQpeZ23VIHBWddSpn+uFwk8coIcgIJzY9npJVxj2fihcm
	 7yI4/8lWEr7dlVNc+l3xkKPuooyMw+VtBIr8Sb8w8RRx03rs6c2CXNA5EJRDpjXYA/sLj
	 b47vvy8HoAJGPNZM1gC1qBZGwdpdyglm7yMQ3p/SOVYJ6vApgafilvY9udn7QCiy9/bgD
	 qOrP9M9B7vbvYbEQ9agK/UMkEdDLdSkZHKQBTa9XA13OXYIvkW7IQ7VDQPT5nDknZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013525;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=rbE4HVimj3UAIPKUXuhAh0R5+r8HoILlRGhsY+qOMz8=;
	b=H1WILYfkVGypmJqq6c6fClmuIlP7E68n6FaG7rx/0OIonOwaAE4mTNpPilGrqNBQlfoR
	 hV6nU6eT/sPdTb3Do4gNYhHtYO4IkJmn+WpdYOhHaza8szFNbjSsFIb/Smdrnvuv+LMfH
	 QRo8SRNjgDVPIga3ba1WSZ32sRdOVfQCEFAlxiAZyaKDp0Wlvzg8BnIOgLT1q5IRVv2TZ
	 H+XoRjvyR776jhsMH26WcY4LelDGXACB0eIoct1XzddGg9GHERMDGHYmnQ6LDKbmugsgG
	 wQleAyMyTYhiaV9qeYVJpl8MhiA8c3Tdgyc1kOe5Anb+5tCyKUpGQez0UNAt4BRUB/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KyhplyaL;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDA606A31E
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DDA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KyhplyaL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbE4HVimj3UAIPKUXuhAh0R5+r8HoILlRGhsY+qOMz8=;
	b=KyhplyaL3U0qMio35n4xSym89y5yWEelV6GsY1FNg4JgjJR905qXdHlYGNBHpRv+1MJOyP
	ezcHk2+kWiZK51sMU0ZXhtl9WcGWLu2lRpKt9Fu5rx6HF59uVzwDKuAqwwWyXbiPJL1+OK
	zwVJcRtc69Tbik/OXQNp8a8uleznKcs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-NuJb4LBHN2m9x8cklxfmMQ-1; Mon,
 26 Oct 2026 07:18:40 -0400
X-MC-Unique: NuJb4LBHN2m9x8cklxfmMQ-1
X-Mimecast-MFC-AGG-ID: NuJb4LBHN2m9x8cklxfmMQ_1793013517
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F055E1955E74;
	Mon, 26 Oct 2026 11:18:36 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E78FE195608A;
	Mon, 26 Oct 2026 11:18:30 +0000 (UTC)
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
Subject: [PATCH 1/7] alpha: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:16 +0100
Message-ID: <20261026111822.458404-2-jmarchan@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Pj2IFo0sYMjtMrW7S393SKqtg9TH_Yi2W3SDTEg5AM0_1793013517
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
 arch/alpha/include/asm/local.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index 88eb398947a5b..1578c76adda62 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -100,10 +100,4 @@ local_add_unless(local_t *l, long a, long u)
 
 #define local_dec_and_test(l) (local_sub_return(1, (l)) == 0)
 
-/* Verify if faster than atomic ops */
-#define __local_inc(l)		((l)->a.counter++)
-#define __local_dec(l)		((l)->a.counter++)
-#define __local_add(i,l)	((l)->a.counter+=(i))
-#define __local_sub(i,l)	((l)->a.counter-=(i))
-
 #endif /* _ALPHA_LOCAL_H */
-- 
2.56.0

