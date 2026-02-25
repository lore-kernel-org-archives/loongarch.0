Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502003016E0
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007364; cv=none; b=YSVMecujlomeyAzD1Ur5lAr2ArD7jP7i+qfBhYRoAthMhu4csePd3xFAMBiUal9GxJFNKmDSMnfP1fq3trEwUXbz6tIDgrc0GCE9bOSM58U7yGrUl5yiRpXjAp8Ctmfow4AnVBAK19Ddr8UT5aP0R7QGsGkd63HV6mGJfpDjyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007364; c=relaxed/simple;
	bh=jrTbGDe/8wYd06o9FN/Dt7fvUCi3/MbdH8vTtfIRRl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=maamfxLNOur8sIULv573LS5qXc1TXkULF3vLh/Tf7MmvWBxApzSCzJoaaiwE7Lw8u7jHYHGvTNXo2y+lfPoIXa9dBlJlbP3XpSkrdMDNpzP3m/U0pO5ELj9GTJKsTXDOZycDo+UCbpXHI1ty46m9LgMcah+qSJ0Mf1K4vtPhf54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9s7R0vu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9s7R0vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19vaP3y5lR+93yTFpmYDfoD2vHNlJZSHy6oOHn35u4M=;
	b=B9s7R0vuJJxnKL/FX3/yV+Y9VHjA7CTcVJgtwJ69xxYai+9R8Xk5ifBv6zHvwekM2mucwl
	LFamYeWlfVICIpkC6AfmP/d3vit9dYTKlz/ZBN3IOby4ZdZnTTdbW49qlYcB0O+wwUqTvc
	0Ib3Qi8Sya+aUmIBrdcoLw41tTOnXiU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-fNbyuKNINK6CJvlLPKrBfw-1; Wed,
 25 Feb 2026 03:16:00 -0500
X-MC-Unique: fNbyuKNINK6CJvlLPKrBfw-1
X-Mimecast-MFC-AGG-ID: fNbyuKNINK6CJvlLPKrBfw_1772007358
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83A1E18004BB;
	Wed, 25 Feb 2026 08:15:58 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0B361800465;
	Wed, 25 Feb 2026 08:15:48 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 08/15] arch/loongarch: don't initialize kasan if it's disabled
Date: Wed, 25 Feb 2026 16:14:05 +0800
Message-ID: <20260225081412.76502-9-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: RdTIbtyFxL69At303sqMsI57GasOfKM1JRqX7P7fntk_1772007358
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Here, kasan is disabled if specified 'kasan=off' in kernel cmdline.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/mm/kasan_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 0fc02ca06457..047a059544e1 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -269,6 +269,9 @@ void __init kasan_init(void)
 	u64 i;
 	phys_addr_t pa_start, pa_end;
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
 	/*
 	 * If PGDIR_SIZE is too large for cpu_vabits, KASAN_SHADOW_END will
 	 * overflow UINTPTR_MAX and then looks like a user space address.
-- 
2.52.0

