Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013531;
	b=WUyzveGzrJVt2ACCALbJaYqUQ81vL1uPcdquQT0MMrM0i+tntZPMPgAw033osaUI4cbm
	 WCJt7ExDpntKIW/HHzk+JjD1Ao9Oi3c592HlaK894MMhOF152HihaXJvOLHffEU8Tls+c
	 rg8OROFi8tcnZ0RxrqQpBiipl64nltm1z4naIWuIIXjH3gdu7a2HK6IzbTrHJMeL3IzmX
	 R+dvAFqFeL+m/Ef3DOYnxzIqNTs+pbMZQ6DC1VOHCsE/klIlsqNV4S4+J/PYuTU3o2gJo
	 9IsC9QQYDPoOhWj2syy2c8ETTL/KRNdtGgyLEQFxwHiyN3LbyyUJIPzYVj++yzMSzxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013531;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=WoLSU0BjIbmp7+7g1f+xo2mz3fVrgAdefYVwWYlLpDI=;
	b=GqaZQHaU2OfYwryx8ZgSb32KElPTQPDWVCJHYD8MxShEyztym4GizGLVpfNYlKIHZ+jU
	 LPUOk7CAj+W+Pxf6wBsUFSToaH9LjWSXhhUcsHKh5BJbIt46NG3i3vRDDiNQd3Tx1SNrY
	 3TJ67htQgrugNONC+SImauG7dzAR4o8TB+bbiPOAIGHZtzao3tTqbr72QQ+s4+xHxd/QX
	 QRBfdGG5273HP8O716TpTGAXxA7JZbP4Ssfu9d+aY24EvSvUOkWBRuEbPfZOZZXiknB6/
	 s3asmseXCGIieqgABCn+qCRwyDs/U2JvQIujFDva3UaMGq2Jrps+03UYP9KEfoEmLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eljdp3gb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48308606A31A
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 11:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48308606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eljdp3gb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoLSU0BjIbmp7+7g1f+xo2mz3fVrgAdefYVwWYlLpDI=;
	b=Eljdp3gbJyqqdNsh06hosug203+7lA2pDAtzEpsWBXrDJc/s3WBu0+HEsCqB+UKViaFjzN
	Y29LyEys/XJLKFoONehG32PBwurqmir4ueAvMvTDVD6fnAjaeUDNp4ZuDQr6+203l1gkDy
	0+JGwZU3mfeDadyfpJWwuDPkZSRn/80=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-DPmm086NN1yVCgZEC1vTsQ-1; Mon,
 26 Oct 2026 07:18:46 -0400
X-MC-Unique: DPmm086NN1yVCgZEC1vTsQ-1
X-Mimecast-MFC-AGG-ID: DPmm086NN1yVCgZEC1vTsQ_1793013523
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BB43180059F;
	Mon, 26 Oct 2026 11:18:43 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B64E1956087;
	Mon, 26 Oct 2026 11:18:37 +0000 (UTC)
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
Subject: [PATCH 2/7] loongarch: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:17 +0100
Message-ID: <20261026111822.458404-3-jmarchan@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 6n5pedqboms2yCDhCMr8_MM16IPwWIYj7qVofWfcKoQ_1793013523
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
 arch/loongarch/include/asm/local.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 2d118b1a060e4..d649b9867ba25 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -175,14 +175,4 @@ local_add_unless(local_t *l, long a, long u)
  */
 #define local_add_negative(i, l) (local_add_return(i, (l)) < 0)
 
-/* Use these for per-cpu local_t variables: on some archs they are
- * much more efficient than these naive implementations.  Note they take
- * a variable, not an address.
- */
-
-#define __local_inc(l)		((l)->a.counter++)
-#define __local_dec(l)		((l)->a.counter++)
-#define __local_add(i, l)	((l)->a.counter += (i))
-#define __local_sub(i, l)	((l)->a.counter -= (i))
-
 #endif /* _ARCH_LOONGARCH_LOCAL_H */
-- 
2.56.0

