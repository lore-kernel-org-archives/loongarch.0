Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796923E00B3
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967944; cv=none; b=pmC8Nd0taQZUhJ8qlDeQwkN20jN5FiNNTS13HpOvUouXh4nlV2ezxGD2HNGWT8kN1p46Pto7cuNSj7XKZkNie3UFaJzOm4xT8JCt0ZCkpjthx0EB9BJgNuvEi982LTs7cSoJGhFgQg/bivDY+dkXseT+S6VG6XcrT70NAiQIf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967944; c=relaxed/simple;
	bh=pPYiH65+N685rGNJJ16GtG0J6xDm4OpdInIOSAG6ZqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzCkr6FMsQQC+8vsmHat4O/jQicDGWfwL7nSG9o427mQhr8wk/1PE1HWcsvlmS/vqB8mbsqP0HtELZ9OcxicYTyYBfXmPB21E6bp7StvPCsOnhiOwFcSniohb/z8Q9q7pyILzHtdGhE9bdlRlsMNu+GMR6pZiESN7z3WtGG5iZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVn1qN6K; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVn1qN6K"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0c45c580so19731721cf.0
        for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967942; x=1787572742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeJCLg2QU4dj3yR0M1UHRgHzRf38a6+0JGJIT48x0Gg=;
        b=ZVn1qN6KBxUI92fSzfXyQV7nfTE12xIwAeOjdMaOItP6mT8XT468QYKHEJRWKwP+QM
         Xl5fwzPtETHUA4jt7+BKBTBU3uV7KYHvGtAw+xxAq0FcTVf/w4EcEsslnSbhdBW4GL6p
         fQqJ4N2lp5U59MfVkETHuDStdoCtN4VzFj2qbDOJagFHI50yfI/ElfL2an7wtaW81clW
         z8YCbbD5cpyFDwU4Vpugq1DGJNvpa2c5XX6XNxzWeDudRf1tk8UrOez9hNPzgFA6Z/LS
         37R4g7aIdFw7/VaP4Vgf9PbxHjGEN4/SOmGnVxhaqaUiM0L+fFnPBjbdtvdzhCFQXLR6
         n1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967942; x=1787572742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeJCLg2QU4dj3yR0M1UHRgHzRf38a6+0JGJIT48x0Gg=;
        b=ZzD6lwiR9Ehu+Bh0Dz0qTCh9O9sPY6v8QA4RtVzVvoTAy74sQAtYbkPkXjHd0hZaX0
         /vHRdoHtj+ZU3iwJSkts8b3m0fZLN/GZXSvM/0I5B/VYiDhuZnFm3AEH/aBHJoH2xFtB
         MQ1spVqmlJBIMadbVcNppJefM7irPycfTUHw1N2h0wXPBk9bys/2z00A4fL5yCGbDY83
         e2kRkIpQbCkz9wJ7sT0g93I55JHFDtfRQN5We8DqdTdkBMjSjwHEuXmeYY4KARw0VPcZ
         GzOIPnCoNL7uYiJp/Y4eztdfUnzDOZ9bspGj6AG6vys3/ND9CgHQywIJf+dZUeKIL6aM
         t0LQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWjApu1PA4UtVbOtiv6iTGD7X6Uhoa31P9u1PSfIOMkWNsi7uS8TnH1lTeaL8Vm5QbNwFtU1pLPuM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4BUFaEQyLs2j9X0u0NDglr1or4NlVS61EbDp3peByl8+GVKg+
	OY/00sS3kzjKvgyFYT9+7HbxFuhqvMjMC1nU2Q/mGURu33sWZXajqTyL
X-Gm-Gg: AR+sD12psmpTIM6kKuVbAwhHrVF/NP1QbGI8GG1Dp9sndWYD4RUGBzrMUVeOM1NDvIW
	viwEZGCP6TnM8Gu9s+pukSNsEvojOyh1GR70E884iEC53cIm76Yg4GLXU0nNAZ+EVLLMEOryyvz
	TcaNoI7tFcu9yS86rFX3J9jjtly1K10d3XCYxFVGwFVTh7TxJp5c3SMn7V1Mrrc/CCLBoVqfIbh
	804/awx8oBYZxy1JZmQN94p0eaeyhkY2L07c4HbS/13/+wTJLDzbchFFNYwHd+6Zxlgu6Y1Euvv
	ocTLRPZu4AHGmIanA1Z8aY3jWizVYI+lPVmlO+48nVuT3QEY0oBdFlm21uJLxqoRFbyO2N5MxBx
	iyTtq2lGK+J6nTWsVI37hly3yqg+SWsPCO3zm1wtpDwpbQ8mW8ByMfwCmAE6Rixbmzl6PIAFkDU
	AUIHkc0vH5o/F5ubawpxRH+JK56sbhTKhJrvFErLzOYZ9CX+yHxMhXqkKUYwwtGbgEZe441vb+P
	w==
X-Received: by 2002:ac8:7e93:0:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d85584629mr242449191cf.43.1786967942289;
        Mon, 17 Aug 2026 04:59:02 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6239ea7sm12681721cf.21.2026.08.17.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:59:02 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	lixianglai@loongson.cn,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH] LoongArch: KVM: Fix memory leak in kvm_loongarch_env_init() error path
Date: Mon, 17 Aug 2026 11:58:47 +0000
Message-ID: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_loongarch_env_init() allocates the per-CPU kvm_context (vmcs) and
kvm_loongarch_ops, and registers the perf callbacks, before registering
the IPI/EIOINTC/PCH-PIC/DMSINTC KVM devices. If any of those device
registrations fails, the function returned the error directly without
freeing vmcs and kvm_loongarch_ops or unregistering the perf callbacks.
kvm_loongarch_init() propagates the error without calling
kvm_loongarch_env_exit(), so these resources are leaked.

Unwind the already-acquired resources on the error path, mirroring
kvm_loongarch_env_exit().

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/main.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 3e1005526f4b..685d334cf957 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -385,22 +385,33 @@ static int kvm_loongarch_env_init(void)
 	/* Register LoongArch IPI interrupt controller interface. */
 	ret = kvm_loongarch_register_ipi_device();
 	if (ret)
-		return ret;
+		goto err;
 
 	/* Register LoongArch EIOINTC interrupt controller interface. */
 	ret = kvm_loongarch_register_eiointc_device();
 	if (ret)
-		return ret;
+		goto err;
 
 	/* Register LoongArch PCH-PIC interrupt controller interface. */
 	ret = kvm_loongarch_register_pch_pic_device();
 	if (ret)
-		return ret;
+		goto err;
 
 	/* Register LoongArch DMSINTC interrupt contrroller interface */
-	if (cpu_has_msgint)
+	if (cpu_has_msgint) {
 		ret = kvm_loongarch_register_dmsintc_device();
+		if (ret)
+			goto err;
+	}
 
+	return 0;
+
+err:
+	kvm_unregister_perf_callbacks();
+	kfree(kvm_loongarch_ops);
+	kvm_loongarch_ops = NULL;
+	free_percpu(vmcs);
+	vmcs = NULL;
 	return ret;
 }
 
-- 
2.43.0

