Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30B48A2DF
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161690; cv=none; b=akVoS+kAvpS96PcBkVRQPChRlCJYVIYi2wPh5NUmYhwOLb3+OLWqh6WUTRh/XtZ0BYSOlGNrtoUI9TJi6PhSNMukSaaxhLuO8L+sJeHTYaisPcCRnHOGSY5b3ivbHaYU4Pb7ixljj9M4q2GrYDS9pES9LGE3ctGrs7DWuOQLieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161690; c=relaxed/simple;
	bh=QOixwpyRMiksXMRiIHZJVcB3rxZj6mZk1Q6KwOIvpIQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=EedOiByH0u7BzDYeBZw6Yd8K+LsQu8h9r6JxMfh8bRYdqQbym7Js6Y8ClyqdoSu0mrkkTOJpX7AsJKIjoh0sXaiuT6NfA6Oogwqv+VsPvjptpwZQ6LMFpJYU1cZUPCNjD5ZFAZg39Vrmx/rnEete9r0h5hbTu5bwiC8hE23twno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/M6cXSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/M6cXSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
	b=T/M6cXSitjlgqRISCqhPpGVs3wEECeQVVZu8bhEWqglwH4nRE3H2gE80I/GyYH3/CAcry0
	FJf9T5vbGrsLSRgfPERKKtzz1Cvud78ngMhKy5hAtGSxXj7sqs3/DO8Zo5sbvIZu2K3wXz
	cvDmZN/d3HSXOmEF69zmzj4ADoG53RQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-bJ3mkUwLNjeMej8F9GiLiA-1; Wed, 19 Aug 2026 13:47:53 -0400
X-MC-Unique: bJ3mkUwLNjeMej8F9GiLiA-1
X-Mimecast-MFC-AGG-ID: bJ3mkUwLNjeMej8F9GiLiA_1787161671
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1771889a91.1
        for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161671; x=1787766471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
        b=qvFGTtwAvSC7i3/YaUFYx8MpUWOV2S/sSVfzew7J8D0j4H26onBXCby5toJCXdmpha
         QBL0xoKl5a4LUZSSjh9DeShBVZ6nl24ea+JqACVhkFYFUXT26egoU+yg744l3p3L9kGs
         7wOGHhj4znbOdiuYY7ewPgpgMpJLg5ldjCW46cbwxamR6WKtf/wp0/6VBOgbp31WHe18
         k7LHWlGmMw+wwU/wIBFUX56RnF0r9ERmOa9VOyvZ0AlE+XwKx8ZJyoL5X3fVBcUutcl5
         aFDvCk7sg9z6+90FTSlYI1puwe/2gvwM+jek71J6dZcUFgmrJqJjgwl7C2e0g+KXgrJ1
         9DeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrBppiUeCCkhZAyAgSZjraLC31DYQ6iRzQinvj4IxPacdM1qNtHmMd17RIbpFaX8MjAfSJ2FSzTDU=@lists.linux.dev
X-Gm-Message-State: AFuF++mW56Mybx8rKluMrjHtRXOB0Tfte29qx+CIi+Aj1JRe4V4TysHJ
	NFYqGSZZ55cCKj60dg1ZPT5ul6e8VvX9iH3SrqO3oAp5acJRnuQHZcfgCH+Xd9seLN6La2j+ah6
	eGeC2iduKqcAmZUVbapUuXguR2yPn5eX0e18mmaSFJQT7vEPlG0zl5s47nqgmmA==
X-Gm-Gg: AR+sD12+joLoLf65F3KnDkB/l2R4Z/uMeQ9mFv3s6gsI0640vm2de5ZPyAZrr8J8HE8
	dVhH9UEmYyLtRXwXvMCl92Ze1EmoE97GoXTWvkouc4M5bYhDhW8zHkqC4RxRTTeWEabMmk9lbLy
	uI3fwuQ5GnPN7DtoM3qKDgFP9x9Cy0aOEP/T7sIHJnwHohXV8AYv976yXNZwP0hZRcLY0Mqx7jM
	3RCIsFwoUS9RaZ3d2wbGRjB8ybiHi1p31JTwAJmrka2/lkhnukQ0s9Kr98yYLDFUr4VxLUtn/ZB
	XwpMDMMmLHa6+cRLzcK7mBiXiEsrFuXLQjninA2BA0QSbBxplE0K8Oi6XhREULIR+/8D6EsnkLX
	1sWQdCoUAsNg2qfKepQg9pZ+i0uZUmyhB
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374223a91.15.1787161671160;
        Wed, 19 Aug 2026 10:47:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374130a91.15.1787161670669;
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Wed, 19 Aug 2026 23:17:23 +0530
Subject: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
In-Reply-To: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SNB4qUOMiMmhM7Qkxu2RQ3gZUywZPlKlri3LNKfZmiA_1787161671
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

kexec_image_probe_default() overwrites ret with each loader's probe
return value and returns whatever the last loader returned when no
probe matches.  The error code reaching userspace depends on whichever
loader happens to be last in kexec_file_loaders[].

Only continue to the next loader when a probe returns -ENOEXEC.
Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
only when all loaders have been tried and none matched.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..b3060e984ef3 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
 
 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
-		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		int ret = (*fops)->probe(buf, buf_len);
+
+		if (ret == 0) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (ret != -ENOEXEC)
+			return ret;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)

