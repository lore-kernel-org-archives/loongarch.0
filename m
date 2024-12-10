Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E51B4142
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798516; cv=none; b=U0bB/TTi6OoCEDBtTCqUcqN98CeYagECx9///u+QEwIRA3EC2mqjS5EhNpLNrW+K9f1VeGCBUr5r9nIrMDMny6XRozPf3Dvwn+0ra2EyH8nfoLf8oQUTyyq0Jq/LOh+lJmq0tiXr5ELw8WGkBecj1cPHUzZEKdPyRztH7JNVTdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798516; c=relaxed/simple;
	bh=6Jv3RrScO5w/EgDCugSyRpOSSLAIZEKRuKvKOtAXhc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hNNUXpUfRExXxfR/MG3qRI+EEiSDP68eLeCFp71EsTDpoLkb52HgO4aR4iHxHavtUH/lxtYRbfX16XJgMwj4OtSoi/e6JVx6hDKuQ6TClMqrL1d2Q3IVuZPEY7ofaNOvMphJUEuGprlQG6VcplxnaGEK0+ebPantQjNobSsNnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aUnybQIb; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aUnybQIb"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725eff499c0so1234831b3a.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798512; x=1734403312; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=aUnybQIbjbkZjlfTUdGW+xZXvXAVkIUGyHWfRrSfkHiz2Ct8quNmHINf9P1OoXlnOz
         +m6JWaBRF/X4CK7WTPEg9DAPB3PPYYqdE5NyvE25OubHh2rgHZmm+1wOz43+bRBoGfXR
         cpPSoTBbDG5s7vbt5ZoGRayqro11gnsV+YUuq+48PKj/uIqM7Im4hgRaydEtLhJl9mQg
         vIFwQ96EsBV+r16ODYzxWcTr19o44HbE/m5VvowG7cHqD07Ppi5pwHyY9GmdfMJimhSe
         A5kF+fi9YFPP1bbkPp+QCJOgYIDx9E8EQcdgesNb1Jp8P6pw2miQke7j7FaZTwGAyzrK
         p7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798512; x=1734403312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=HkdQx0MSnjzgIQUWfgpTDo1i+sMSwwojpjuZrJH+Y5leBkFj00k7li/c1zGRoBeB8x
         YPeEXJmRwA9tKSs/c1BPndETG2YDIZzC4LTcg7ouvpXMccpFXX39nUF1byOt9R79EXNH
         XF+IoaP/Nld7sJUb7/Z9r38oiTsN1nSzsj/Pmui5LfpSbuRjKYkG40wFeuB0SeLupGKQ
         iX/aF6Sy69kCPw1u1A40BU7knkgA6GXpftveWs5tH9LdWTNy6BS5tWagDd1rtEYUScp9
         n+AaAw2QNx7gzVKs5JW69Notiqw9ldLsXKhdxg97NR9QFr5o1FblVRpuZn8oFn2isX/U
         OkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeYcPj0doqINn9oKQf3TVD4lbAzJ9EcgEvMrcGep5jrS2dN3Z3upkAnIzGhbPbKiAXCDJiepmyvgI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfttBm3Q3TOh6wPJCYi54i7CmD7NYWd83d7SdQuaLX57jqw3EB
	5Xe95OXDrQSsl9GLBe69t7cXwQexkPXBEfSLYAFv88rXRgzP6hwXSCz/KzAkS6jw0Yau42DFkUH
	f3t50xXpz+CWbn78thMBvYA==
X-Google-Smtp-Source: AGHT+IH+U5NNduIwURg0BoDlPsKnnOIwfCnZdS3eRXACF/uPNRGoE141bvOCCDVesMcVlUE6OG1mnMpg0Q9mT2r6sg==
X-Received: from pfu5.prod.google.com ([2002:a05:6a00:a385:b0:725:f376:f548])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3016:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-725c8eab756mr18454838b3a.14.1733798512543;
 Mon, 09 Dec 2024 18:41:52 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:18 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 16/17] mm: Fallback to generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

If an architecture doesn't provide arch_mmap_hint() fallback to
generic_mmap_hint().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e97eb8bf4889..59bf7d127aa1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -691,6 +691,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog

