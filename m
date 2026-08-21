Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D093A0B3F
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320234; cv=none; b=c2LDPpBQ9yzqquEuxKCxKflXftvBLkfXPjquM6NgBEVlo4cIq8TPPOxLl0qEcG1RwS2d3IxLft0Nt1vygGxeQfiH5ch6njy0TzfshWqzsj4TnB1lP2P/gdQP6GeLw1S/sZ91TEoQSNuR748ESqrpWxEaDAICADPla4zWq7nwt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320234; c=relaxed/simple;
	bh=Zd3eu4CkgFeBhr/VK4WvRpDleYfM+eWkV5wG/8fEo0s=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=lytXZgFfy8O/Qt9Q8azrtEbBnwz68dv7/dDywD13nXJyU7BoyQ/ES9VQAYni78/WIN4JQLK4hCPhUfu3+yzAXkxFGGP7tznuKtxUfN2zcY6MjB6Ms2EpeZD2dhPtOOsnrdUmZaoGWVGZKdqBFAlQWqBmDs/K51D3uNvNBW1m6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0c4l/da; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0c4l/da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
	b=R0c4l/daUjecoWtS7AhHV3Hq2swb+sWlxK0O9uc5yIe4M7nVPsfeu5xQz1i9qJC5+Pa27D
	O97QTaL4HTDeubmZSheloErChqyXTewxAPvIsfzLiH4EnOP8u96MKobLzyLOp9YcT9eA4P
	tmqC5TEc3op5vk4KW/wRWnmmUQQVMTY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-bOp2TYgVOr2ciLt7bUvZCw-1; Fri, 21 Aug 2026 09:50:30 -0400
X-MC-Unique: bOp2TYgVOr2ciLt7bUvZCw-1
X-Mimecast-MFC-AGG-ID: bOp2TYgVOr2ciLt7bUvZCw_1787320229
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso1376498a91.2
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320229; x=1787925029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNohwqjvouRlAnKm9iB5tZeW1CKNRcmkGAU02I+Ttyg=;
        b=kk2DESnzOqZzdzgmCwHxObBDXiX1hI2m9GbsxdgXl5A6qIdxYNkqNKmC248sJfgh9E
         4yIYWfDgjt+aeAOlfCBxdZrki8mslMO3WO0nWSySXdzS7eMIu/mTmWi2FADrg02J8Wd6
         hhR2owJ0dYe18YE0yFiKKL8xczCrs7BLFYgCusFv1bZwOwhPUENBPd+E69ak2dHW+kQ0
         qOSi9xGxNgR7ERSMsMO6eWBLEUNmSDp595J2aYtesbn9bxoIZCooCLntalx7P+dHioQT
         Ihnzbl8HDxT42AOFMgsvE+Q3OybZdQ/ICMIIg4irW9wNjY3KSIcTP9PCGtJojJP6NNKQ
         CZNg==
X-Forwarded-Encrypted: i=1; AHgh+RoZLqMuk0nF5Go9CKjFx6iyyz5STU3KwJw3C+vVPo5egQUNqNOgglwL0WIdwFxKuJz+MAfem1pHFK0=@lists.linux.dev
X-Gm-Message-State: AFuF++kNShAHGq4ljfE3abYDJHgvZAsvHTVTFs2EoKQSaaZ7SCvAZznG
	xqsdwmuemSLDjTLk7JBGcmQB+GN5B7gusY0mPvCdZ1+RfyOk8+ZN28+QWeiUr2+hDauEtHJpNT5
	FvE8rSe7L+xV7prUo0gIYiQC0ar/gnhJ95O2F/GhqXm5p27qY7Od0XzZkftnyKg==
X-Gm-Gg: AR+sD13ZV1B56RFF4UWFiBfIwYmcTnXHme06LWPDEUfvWdoPMSBEWa85r7Bhtt5mABf
	vWoU3QBktMq/p0eo+U0wrfxnPsXWiTF0iqg1coSZZaD7tYCsDMdKa8yzE3lBOsbXCXuYGLZcvnw
	yBKlszhVnig4ymwfR94uKXLvF0j8d4VIQFBNwvWKy0/5TiGE++0Jjwksw4/A6qtj14PndtzmxhK
	VUJM+Vezo8QMAhMsYKrb98IABabb0XEgIaeMj3stDavNjGEBxaIlgVtiH5bARBIXp6ckLMsvncd
	7sBljzsRe9D5//CdTUGUyLYC2fAerMUTf56ucMncgdVBdXGLoI0cONb4/cID6iQJ1jzwRaAvLLA
	qMRbNO6+BxsbQK7KdXHmrTDUxmNtfnQcP
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13744017a91.1.1787320228676;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:55cc:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-395c334042emr13743913a91.1.1787320228164;
        Fri, 21 Aug 2026 06:50:28 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:27 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Fri, 21 Aug 2026 19:19:58 +0530
Subject: [PATCH v3 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260821-mpilaniy-v3-2-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
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
X-Mimecast-MFC-PROC-ID: K22wHlTRG058u0LGR5boshpl052C8Ub8AC0r5skdAu4_1787320229
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
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Philipp Rudo <prudo@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..c11a815e2235 100644
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
+		int err = (*fops)->probe(buf, buf_len);
+
+		if (!err) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (err != -ENOEXEC)
+			return err;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)

