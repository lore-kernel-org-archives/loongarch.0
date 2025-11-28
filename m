Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5CE2D63F2
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764300877; cv=none; b=lzQeltYvKeZdmLaDkUF2guZ3pkecJ4VLK98iOjEpbb6mKKXStTcBVYcCUmfMP4erUGbA6JAdeUu9UIIZcR5lXGAvpa8gLgS8X7k21suVGuKvPZFKR5ToPRVpwrTdPvnkJOh2c9tKkyvoVw7iq1bfQIYRyyFF67YPDPJ6BjLUZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764300877; c=relaxed/simple;
	bh=LYPAxPfQheSOPcxHcMg5qF/UCm6JJ/RntC8aW1jl16U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=YE4o1L9Wotx/PEM/l+UIgZJgoYeuwM4U2UNIxF9iQKdAmBPJJ8QYLCzxbj+5DqjPSo0aF7wr8ro77tGAUZNFTLlY7q0dQGIoldIrVIP057bLbaxvZJVjB4njg35XxsuXHibHHAndZ6ityuxbuxOXWcONOCcbHP4meYLVvXJwWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjTh3PfN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjTh3PfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764300875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfKMAPgOw/dmuGwbVXfO4D5MkyZDnIUQ+/VwPEWi/wc=;
	b=hjTh3PfNslc8sDQdDA5Ao1fQze30GAPXaMkjObFEBm1YVJQKYF1O5SvgatGY0BiPWm++hl
	xHLuh97TIddw6SeaF2BgUUwHPH9y3SgLP1kOatVqPuvpwvRdiKhPOQhpjvArf+P2V8UE+3
	T9PkIpAcPRnUn8iEDw0G8navyUJ3bzs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-zjYbfpDXMs6rEpZfQ8z1Kw-1; Thu,
 27 Nov 2025 22:34:28 -0500
X-MC-Unique: zjYbfpDXMs6rEpZfQ8z1Kw-1
X-Mimecast-MFC-AGG-ID: zjYbfpDXMs6rEpZfQ8z1Kw_1764300866
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 256E11800473;
	Fri, 28 Nov 2025 03:34:26 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A827D19560B0;
	Fri, 28 Nov 2025 03:34:18 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: ryabinin.a.a@gmail.com,
	andreyknvl@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	elver@google.com,
	sj@kernel.org,
	lorenzo.stoakes@oracle.com,
	snovitoll@gmail.com,
	christophe.leroy@csgroup.eu,
	Baoquan He <bhe@redhat.com>,
	loongarch@lists.linux.dev
Subject: [PATCH v4 06/12] arch/loongarch: don't initialize kasan if it's disabled
Date: Fri, 28 Nov 2025 11:33:14 +0800
Message-ID: <20251128033320.1349620-7-bhe@redhat.com>
In-Reply-To: <20251128033320.1349620-1-bhe@redhat.com>
References: <20251128033320.1349620-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/mm/kasan_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 170da98ad4f5..61bce6a4b4bb 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -265,6 +265,8 @@ void __init kasan_init(void)
 	u64 i;
 	phys_addr_t pa_start, pa_end;
 
+	if (kasan_arg_disabled)
+		return;
 	/*
 	 * If PGDIR_SIZE is too large for cpu_vabits, KASAN_SHADOW_END will
 	 * overflow UINTPTR_MAX and then looks like a user space address.
-- 
2.41.0

