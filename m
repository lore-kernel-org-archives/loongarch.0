Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E49155A33
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711718935; cv=none; b=r28MKbM0SewjMUDCwar+BQULNNNsKUrdOSeY8Hy3GWbXxG02hArHtFDvOTDiqruuAZw7QePAPbnexZAe16R8R2XpvcMz4OMTxcCJACSpDGvG39dwPKnpdUukGfLMNAseZnArTE4WgT7upPlwBg7UNif9JugbmzqgdZhBVs4bTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711718935; c=relaxed/simple;
	bh=/n9PbE/BLPdNFsU6hFVFwOO3hZqxKwzUflI/r6Gm8Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=BA4ArY//LTKF+bwDnMXoDlA8KU3pd3DG3cCAnVJGbdOgf5wgaByJV7De7rECtRctzsU3yYeBcYRs/n/ndNvP14WCNyoawmB0UG+hfQSkmPj59naY9srJYKAqgDgqOdEz7x/4TOtg8Jk8GYJXQvvl54iqi6oWVocJHp6EEho1H9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bmnu0kZ9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bmnu0kZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711718933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOucn97knmz5KeV+tnCRyRHFYI4yUR4aztmQradjENc=;
	b=bmnu0kZ9jyB97/ErEeaXDCFtynK6c8UH7bFY+c1BXpIqvD2BsDgLg49qHltx57yxVHWgUs
	JHYF9vhE6fswP4x7pBtFH4n07qj67S6GMMmH0eqZAt3IzLXYWnBc2Vssh8okAT59RLHk0M
	LPSKOFFbDXyKf7oXzOLxfO3hGfLVJCM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-rntMc4ipOtGlwuHZwLZGbg-1; Fri,
 29 Mar 2024 09:28:49 -0400
X-MC-Unique: rntMc4ipOtGlwuHZwLZGbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E34C22802E30;
	Fri, 29 Mar 2024 13:28:39 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE561C06543;
	Fri, 29 Mar 2024 13:28:34 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kexec@lists.infradead.org
Cc: akpm@linux-foundation.org,
	geert@linux-m68k.org,
	chenhuacai@kernel.org,
	Baoquan He <bhe@redhat.com>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] arch/loongarch: clean up the left code and Kconfig item related to CRASH_CORE
Date: Fri, 29 Mar 2024 21:28:24 +0800
Message-ID: <20240329132825.1102459-2-bhe@redhat.com>
In-Reply-To: <20240329132825.1102459-1-bhe@redhat.com>
References: <20240329132825.1102459-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

In commit 85fcde402db1 ("kexec: split crashkernel reservation code
out from crash_core.c"), crashkernel reservation code is split out from
crash_core.c, and add CRASH_RESERVE to control it. And also rename each
ARCH's <asm/crash_core.h> to <asm/crash_reserve.h> accordingly.

But the relevant part in loongarch is missed. Do it now.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/Kconfig                                       | 2 +-
 arch/loongarch/include/asm/{crash_core.h => crash_reserve.h} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/loongarch/include/asm/{crash_core.h => crash_reserve.h} (75%)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..54ad04dacdee 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -595,7 +595,7 @@ config ARCH_SELECTS_CRASH_DUMP
 	select RELOCATABLE
 
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-	def_bool CRASH_CORE
+	def_bool CRASH_RESERVE
 
 config RELOCATABLE
 	bool "Relocatable kernel"
diff --git a/arch/loongarch/include/asm/crash_core.h b/arch/loongarch/include/asm/crash_reserve.h
similarity index 75%
rename from arch/loongarch/include/asm/crash_core.h
rename to arch/loongarch/include/asm/crash_reserve.h
index 218bdbfa527b..a1d9b84b1c7d 100644
--- a/arch/loongarch/include/asm/crash_core.h
+++ b/arch/loongarch/include/asm/crash_reserve.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _LOONGARCH_CRASH_CORE_H
-#define _LOONGARCH_CRASH_CORE_H
+#ifndef _LOONGARCH_CRASH_RESERVE_H
+#define _LOONGARCH_CRASH_RESERVE_H
 
 #define CRASH_ALIGN			SZ_2M
 
-- 
2.41.0

