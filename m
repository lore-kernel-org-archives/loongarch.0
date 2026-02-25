Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262830EF9A
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007305; cv=none; b=MW5C95gXi7Y4PQkJ72VIv+1vugtz2ByLJF/UMF9sLuuCqC4oDeMzHf0i50qz5wsaz9NZDJ6P49pBJthPntgFH3AXTAhSvtyHV6eefJY9EAebWjpLB9qXqWqchMKpAXUkq3qeHI9GBQAfzK7AlYvQqH4KO2lttAZ9/KKd+nTbig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007305; c=relaxed/simple;
	bh=3kGwy73oeGDx7dkWLCsnWcF8iqf/A7SBM4HvUGnPcCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=UJ1XVNABPm/lBhcpzwm8NbtVBn31LyWlsuDjkyJud3ZfMMq8qsl1zWXSR/sFx4rV3STSbzqFfTyMXL/D4OUfNQREfBrwK67LUGbTWSWlP7Kc76uACh2k0LBiyJLxDbU/4aFRnMl9dpMrNn3Vgn/BBsmTFmpQ0Eo+k1z9L70yz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBQ7Cu7o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBQ7Cu7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4icHQGTRNbNNPTctslHsQ21pBhC6HpCZWDHuC81RQQ=;
	b=aBQ7Cu7oIvPXDrYJy06P2ZPPWanvHEuZVoeLwrmhebJNEc/doj5sczyJN7jSRkUWzIu+cl
	mNStw2v6lGkxQMi0l5Oij/vV4T6OOQwEioX9F7CX+ACGAC+Qv1MH4vTuCkc3CD4AL0rhi3
	1+EUtw4CB0s8jofjbiuSrXHxWyLVJqk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-dIDhZlzRPtCltfWDvHZypQ-1; Wed,
 25 Feb 2026 03:15:00 -0500
X-MC-Unique: dIDhZlzRPtCltfWDvHZypQ-1
X-Mimecast-MFC-AGG-ID: dIDhZlzRPtCltfWDvHZypQ_1772007298
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1EFF180025C;
	Wed, 25 Feb 2026 08:14:57 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6EC9E1800465;
	Wed, 25 Feb 2026 08:14:49 +0000 (UTC)
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
Subject: [PATCH v5 02/15] mm/kasan: rename 'kasan_arg' to 'kasan_arg_disabled'
Date: Wed, 25 Feb 2026 16:13:59 +0800
Message-ID: <20260225081412.76502-3-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Igub7tbvlBnlx8hxteEdeGUz8foZBxFKJLf3gHaKBnw_1772007298
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

And change it to be a bool variable. This is prepared for later
usage.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/kasan/hw_tags.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index cbef5e450954..26a69f0d822c 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -22,12 +22,6 @@
 
 #include "kasan.h"
 
-enum kasan_arg {
-	KASAN_ARG_DEFAULT,
-	KASAN_ARG_OFF,
-	KASAN_ARG_ON,
-};
-
 enum kasan_arg_mode {
 	KASAN_ARG_MODE_DEFAULT,
 	KASAN_ARG_MODE_SYNC,
@@ -41,7 +35,7 @@ enum kasan_arg_vmalloc {
 	KASAN_ARG_VMALLOC_ON,
 };
 
-static enum kasan_arg kasan_arg __ro_after_init;
+bool kasan_arg_disabled __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
@@ -88,9 +82,9 @@ static int __init early_kasan_flag(char *arg)
 		return -EINVAL;
 
 	if (!strcmp(arg, "off"))
-		kasan_arg = KASAN_ARG_OFF;
+		kasan_arg_disabled = true;
 	else if (!strcmp(arg, "on"))
-		kasan_arg = KASAN_ARG_ON;
+		kasan_arg_disabled = false;
 	else
 		return -EINVAL;
 
@@ -222,7 +216,7 @@ void kasan_init_hw_tags_cpu(void)
 	 * When this function is called, kasan_flag_enabled is not yet
 	 * set by kasan_init_hw_tags(). Thus, check kasan_arg instead.
 	 */
-	if (kasan_arg == KASAN_ARG_OFF)
+	if (kasan_arg_disabled)
 		return;
 
 	/*
@@ -240,7 +234,7 @@ void __init kasan_init_hw_tags(void)
 		return;
 
 	/* If KASAN is disabled via command line, don't initialize it. */
-	if (kasan_arg == KASAN_ARG_OFF)
+	if (kasan_arg_disabled)
 		return;
 
 	switch (kasan_arg_mode) {
-- 
2.52.0

