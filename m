Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304C4534B7
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520095; cv=none; b=Qq08tNC1qOdUjbBVCREXbB/RuS0zVa58iiVIpAlR/6LB3QRCNoxyV0bkNanf2NreaXgXMfbJkAQrlYUgvBftE+C+2A8AMUunyxMts6aYCdyct22ytM3MmFmbB4hglipbMrc9P0COxsXVBvbnt9cJLJ04jeZH1OkeOlgR2aYoj84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520095; c=relaxed/simple;
	bh=DkzE9Zhj3AmmXoslombEp/LUwxK1tb+nQOXGv18vgVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVDu0qCPrAA8iVrcEhOcNWLNS44ctcLLf4NgmGFBfN22hLwhQCcJE5QDV9f6YLqc/BQ4Ntvw9J6UIFyCVCswvtLR5zZZbPutFkQug8bLLkwsiCQshoEeZlKvWhOq4LIerSmRwGg2p/RTk8MmWcsbGih+ccpaNy2QV68HkpsxGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd4aas+z; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd4aas+z"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1ab6d7239so699486eaf.1
        for <loongarch@lists.linux.dev>; Fri, 04 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520093; x=1789124893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tzK12s+ScbQKSnKvOMv3ENEdIPF4yikkwENb01BXx0=;
        b=kd4aas+zSiP/TXSouFQKoeo+c4MXR1Wmi5HwVyL41TQK3sfDs/5pykD2eWUfB6PXQK
         0xJosY0mSeV8jt+3E/aTjuhIqSTsx/iyaSpBbltVsMfdbZoprkgmPxTilc3xTVAE+rLp
         gF7YnElzV/jcTBo0zeodMBdEmt7gORecbCNVCGPAp6K+mUd7YrW5taluNMPGNfEn+AHp
         18fTBtbs/cFOyH0N2mvNzcxjzPGuaq/X7wbFFUD8xGW/T3bRG5aXjMiKeUKB5zRN+K+j
         eYeBfIJONjKXJVqTrU6TPb3/6HbAh2EDPusuk5zUEjGBCq2lxwwjUXRhELSfMsp8Nw8q
         eyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520093; x=1789124893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tzK12s+ScbQKSnKvOMv3ENEdIPF4yikkwENb01BXx0=;
        b=PepXJ5YC+NepamuPtGnsPrYE9ceFVhTqFWN905ckAqKXsxKGEw/17/Yhu1DuMDzsC0
         6DkWMKCgwYZZwZc0rlc2XilgFsg9ZvMBcU0kply9m9ZlK0uNIlpLo1DdY3p4OF5V2D2K
         43LI4gRHxcbN4KYPGFjiSUbmaCu9Y80fKoSQZsgG4m+7g4YB1q9f7XrtguRcUUBN58DL
         gSX8ME2FVUjHE9EfAleP+IT9voJX8GJzVTmbv8jt/Y2eTan31RAOaXJG8CE4CqhsqLJI
         kUvFyRDzixez7y9tjKwcK6w+wRd7e1+/ywOL/NqScssfcpK5+NhN+dN4Pd/ID6mFYsZo
         rHVA==
X-Forwarded-Encrypted: i=1; AKwUvBzIpplKwdBsXcAiOt5FeCwmvN+Gzymo+yLuWe3pBUfv9MlKgDyHtfbkrgWvIJ+bae8uLxtOnUnVNUw=@lists.linux.dev
X-Gm-Message-State: AFuF++mn5NvQs3FE8kppKdT87/z0K8k/JzfUskTvA2rKEC3wEiICPYU9
	7XuTfakYDRPI9xXHXvUrD8YlH98Yjna1NYMAk1Xs899P0WKGJ3/9UvAg
X-Gm-Gg: AYBFou31YVgNksGxcwRyv1n01YjrSFXcOykwWpYwOpXGCaDr+7/7c9s4NYdF34+S3g3
	3Q5MNkIl7/LP5SOu256nQTtbQ1Uml2emiU+cmouelb2OR/6LiAIEMt8CoTUZA+k7H2EXn4DUGxf
	10F2LOgqoASwIdP6bKAns+ybWfNPuT7aAWTQ0aMZIXA3x0MjvI0W9og01tGX/eRVHP7nL81ID86
	asDH1V3oZKL/Rn7bfCA+Xg5gqRIAsmk68n7bD5Sd3Ui9fxakNX0C3I4DTrxJXGQ/SPdJ8FOqsTP
	KUhl49/iJ+FxtDhABl2mdlRYKsKt5/LFYQXTVDfI2oAyhrzN4dMK2ZMoeUboidgOGAp8sdb2J66
	/io6bbYJdIZtmw7/jtPeGXttX9O+u6vsZKJQ08f32JLbsgriy74AqYG7Vs9opG/f+GuWndcp7mE
	YkMKq4KwEAYD3QPBgT0xnMbF1nEZUzPa27+Svber72FbSQkckCoXWAHnWDB5hgjP+zyRO4sfcp/
	osA0cNl2cKOYts=
X-Received: by 2002:a4a:edce:0:b0:6b1:d123:f7d5 with SMTP id 006d021491bc7-6b6fcbe63bcmr3772432eaf.20.1788520092685;
        Fri, 04 Sep 2026 04:08:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5125566eec.29.2026.09.04.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:08:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: fix typo "avaliable" in comment
Date: Fri,  4 Sep 2026 16:38:06 +0530
Message-ID: <20260904110807.19508-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "avaliable" to "available", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/loongarch/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
index 840d944c2f73..ce097e25881f 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -23,7 +23,7 @@
 #include "image-vars.h"
 
 /*
- * Max avaliable Page Size is 64K, so we set SectionAlignment
+ * Max available Page Size is 64K, so we set SectionAlignment
  * field of EFI application to 64K.
  */
 PECOFF_FILE_ALIGN = 0x200;
-- 
2.48.1

